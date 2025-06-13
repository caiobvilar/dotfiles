# TDD for Embedded C

## TDD MicroCycle

1. Add a small test;
2. Run all the tests and see the new one fail, maybe not even compile;
3. Make the small changes needed to pass the test;
4. Run all the tests and see the new one pass;
5. Refactor to remove duplication and improve expressiveness.

## TDD Benefits

* **Fewer bugs**
	* Small and large logic errors, which can have grave consequencesin the field, are found quickly during TDD. Defects are prevented.
* **Less debug time**
	* Having fewer bugs means less debug time. That’s only logical, Mr.Spock.
* **Fewer side effect defects**
	* Tests capture assumptions, constraints, and illustrate represen-tative usage. When new code violates a constraint or assumption,the tests holler.
* **Documentation that does not lie**
	* Well-structured tests become a form of executable and unambigu-ous documentation. A working example is worth 1,000 words.
* **Peace of mind**
	* Having thoroughly tested code with a comprehensive regressiontest suite gives confidence. TDD developers report better sleep patterns and fewer interrupted weekends.
* **Improved design**
	* A good design is a testable design. Long functions, tight coupling, and complex conditionals all lead to more complex and lesstestable code. The developer gets an early warning of design problems if tests cannot be written for the envisioned code change.TDD is a code-rot radar.
* **Progress monitor**
	* The tests keep track of exactly what is working and how muchwork is done. It gives you another thing to estimate and a gooddefinition of done.
* **Fun and rewarding**
	* TDD is instant gratification for developers. Every time you code,you get something done, and you know it works.

## TDD Benefits for Embedded

* Reduce risk by verifying production code, independent of hardware, before hardware is ready or when hardware is expensiveand scarce.
* Reduce the number of long target compile, link, and upload cycles that are executed by removing bugs on the development system.
* Reduce debug time on the target hardware where problems are more difficult to find and fix
* Isolate hardware/software interaction issues by modeling hardware interactions in the tests.
* Improve software design through the decoupling of modules from each other and the hardware. Testable code is, by necessity, modular.

