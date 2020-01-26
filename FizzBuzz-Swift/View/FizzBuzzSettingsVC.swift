//
//  FizzBuzzSettingsVC.swift
//  FizzBuzz-Swift
//
//  Created by Parth on 26/01/20.
//  Copyright © 2020 Parth. All rights reserved.
//

import UIKit
import RxSwift

class FizzBuzzSettingsVC: UIViewController {
        
    @IBOutlet var tableViewConfigurations: UITableView!

    var viewModel = FizzBuzzSettingsViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    private func initialSetUp() {
        self.title = "Settings"
        self.navigationItem.setHidesBackButton(true, animated: false)
        let btnAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        let btnDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        navigationItem.rightBarButtonItems = [btnDone, btnAdd]
        tableViewConfigurations.register(FizzBuzzSettingsCell.self, forCellReuseIdentifier: FizzBuzzSettingsCell.cellIdentifier)
    }

    // MARK: - Actions/Events
    @objc func addTapped() {
        showAlertWithKeyPairTextFields(title: "Add/Update Key/Value Pair", callback: { (intKey, value) in
            self.viewModel.updateConfigDict(intKey, value)
            self.tableViewConfigurations.reloadData()
        })
    }
    
    @objc func doneTapped() {
        let configModel = FizzBuzzConfigModel(configDict: viewModel.configurationDict)
        viewModel.fizzBuzzConfigObject.onNext(configModel)
        UIView.transition(with: (self.navigationController?.view)!, duration: 0.75, options: .transitionFlipFromLeft, animations: {
            _ = self.navigationController?.popViewController(animated: false)
        })
    }
}

extension FizzBuzzSettingsVC: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.configDictKeysArray.count
    }
    
    //No order will be preserved because dictionary(configurationDict) is being used as data source here...
    //If sorting or ordering needed, we can get converted array in future for display purpose..
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FizzBuzzSettingsCell.cellIdentifier, for: indexPath)
        let key   = viewModel.configDictKeysArray[indexPath.row]
        let value = viewModel.configurationDict[key]
        cell.textLabel?.numberOfLines = 1
        cell.detailTextLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(key)"
        if let val = value {
            cell.detailTextLabel?.text = val
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let key   = viewModel.configDictKeysArray[indexPath.row]
        let value = viewModel.configurationDict[key]
        
        if let val = value {
            showAlertWithKeyPairTextFields(title: "Edit Key/Value Pair", key: String(key), value: val, callback: { (intKey, value) in
                self.viewModel.configurationDict.removeValue(forKey: key)
                self.viewModel.updateConfigDict(intKey, value)
                self.tableViewConfigurations.reloadData()
            })
        }
    }
}
