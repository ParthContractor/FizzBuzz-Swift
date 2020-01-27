# FizzBuzz-Swift
Fizz Buzz Demo App with dynamic configuration within app


<---Overview--->
* Programming paradigm
  * Combination of OOP and Reactive Programming(Using RxSwift)
* Application Architecture
  * Combination of Modular and MVVM
* Included efforts to adhere to Engineering best practices
  * SOLID principles
  * Testable code writing
  * Test case writing and code coverage gathering
  * Clean,Testable, Scalable, Reusable and Maintainable code writing
* Dependency
  * RXSwift via Swift Package Manager(https://github.com/ReactiveX/RxSwift) 
* Supported devices: iPad and iPhone(Portrait)
* Xcode  version used: 11.3
* Assumptions
  * Offline storage(Configuration persistence) not required for the demo
  * It is ok to live with simple UI for demo purpose.
  * User input must be restricted.For demo purpose the range for number is 0 to 10000(Can be changed from application constants)
  * Default config within app constants: [3 : "Fizzy", 5 : "Buzzy", 7 : "Foo", 9 : "Bar"]
  * Above mentioned config can be changed and new config can be added in settings to reflect change dynamically.
* User Interface and Application Demo link
  * Youtube link: https://youtu.be/bRmTl0Gsdz0
* Limitations/known issues
  * Settings Icon/assets not properly sliced because of sample code/demo code 
* Future scalability/requirements/features possibility/Scope of improvements
  * Delete and edit note option for user's own landmark remarks(back-end and required helper methods already in place; only UI could be added/modified if we need to add this functionality)
  * Display all records of landmark remarks in list view with possible differentiation of user's notes vs othe in seperate screen
  * Rather than relying upon third party BAAS, In-house backend development/server setup and possible/efficient web services development(including proper pagination) provided application scales in future with more users and landmark remark registration in application.
* Approach overview
  * Stick to MVP first with possibility of scaling slowly/periodically.
  * Write modular and maintainable code with proper architecture, standard practices and documentation.
  * Have basic code coverage and write more test cases and have automated test suite ready before deployment(considering timeline and priority including sense of business impact/urgency).






