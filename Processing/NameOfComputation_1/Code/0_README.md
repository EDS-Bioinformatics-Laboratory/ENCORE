### CODE



<u>*Explanation*</u>:

*This directory contains the code you use (and developed) as part of this project.*



***Software Engineering***

*Over the past two decades, an increasing number of researchers have become involved in computational research. Many of these researchers have never received formal training in software engineering. Software engineering is a discipline in its own and includes the design, implementation, documentation, testing and deployment of software.* 

*The lack of good software engineering practices can negatively affect the reliability and transparency of software, and consequently, its transparency and  reproducibility. Poorly designed and documented software can be difficult for peers to understand, use, modify, and debug.*

*Additionally, inadequate software engineering practices can lead to a situation where there is no way to verify if the code used to generate computational results is functioning as the researcher intends.*

*It is important to recognize that there is a vast field dedicated to software engineering, encompassing a wide range of tools and best practices that can be utilized to enhance software development.*

*Below we very briefly provide a few pointers to improve your software engineering practices.*



***Coding***

*Following best practices for scripting, functional programming, or objective-oriented programming may significantly improve the quality of the code but requires training and experience.* 



*<u>Clean code</u>* 

*Write programs for people, not computers (code should be easily read and understood). Adopting clean code practices helps to standardize and organize software code in order to enhance readability. This allows developers to concentrate on core functionality and reduce errors.* *Readability helps reproducibility and transparency*. 

*A few general rules:*

- *Reduce complexity. Decompose programs into functions and modules (instead of making very long scripts).*
- *Limit number of function arguments and length of functions.*
- *Be ruthless about eliminating duplication (use functions).*
- *Always search for well-maintained software libraries that do what you need, and test these libraries  before relying on them.*
- *Do not comment and  uncomment sections of code to control a program's behaviour. This is a recipe for making your software irreproducible.* 
- *Choose a style guide—And stick with it (see for example, https://peps.python.org/pep-0008/, https://style.tidyverse.org/, https://web.stanford.edu/class/cs109l/unrestricted/resources/google-style.html)*
- *Give functions and variables meaningful names.*
- *Make dependencies and requirements explicit*
- *Refactor as needed (process of restructuring your code without changing its interface).*

- *Write error messages that provide solutions or point to your documentation.*



**Code versioning**

*ENCORE is based on Git/GitHub for versioning of code and code documentation. It may be worthwhile to dive into the Git/GitHub world at greater detail. For example:*

* *[Understanding the Staging Area](https://www.developernation.net/blog/git-internals-part-3-understanding-the-staging-area-in-git/)*
* *[Git branching strategies](https://tilburgsciencehub.com/topics/automation/version-control/advanced-git/git-branching-strategies/#:~:text=A%20Git%20branching%20strategy%20allows,set%20of%20advantages%20and%20disadvantages.)*
* *Perez-Riverol, Y., Gatto, L., Wang, R., Sachsenberg, T., Uszkoreit, J., Leprevost Fda, V., Fufezan, C., Ternent, T., Eglen, S. J., Katz, D. S., Pollard, T. J., Konovalov, A., Flight, R. M., Blin, K., & Vizcaino, J. A. (2016). [Ten Simple Rules for Taking Advantage of Git and GitHub](https://doi.org/10.1371/journal.pcbi.1004947). PLoS Comput Biol, 12(7), e1004947.* 
* *[Comprehensive Guide to Version Control](https://medium.com/@liberatoreanita/mastering-git-a-comprehensive-guide-to-version-control-7624dbb88a94)*



***Code testing***

*Interrogate specific and isolated coding behaviour to reduce coding errors and ensure intended functionality, especially as code increases in complexity. Describe if software tests have been performed and how to re-run these tests.* 

*From [IBM](https://www.ibm.com/topics/software-testing): There are many different types of software tests, each with specific objectives and strategies:*

- ***Acceptance testing:** Verifying whether the whole system works as intended.*
- ***Code review:** Confirming that new and modified software is following an organization’s coding standards and adheres to its best practices.*
- ***Integration testing:** Ensuring that software components or functions operate together.*
- ***[Unit testing](https://en.wikipedia.org/wiki/Unit_testing):** Validating that each software unit runs as expected. A unit is the smallest testable component of an application.*
- ***Functional testing:** Checking functions by emulating business scenarios, based on functional requirements.* 
- ***Performance testing:** Testing how the software runs under different workloads. Load testing, for example, is used to evaluate performance under real-life load conditions.*
- ***Regression testing:** Checking whether new features break or degrade functionality. Sanity testing can be used to verify menus, functions and commands at the surface level, when there is no time for a full regression test.*
- ***Security testing:** Validating that your software is not open to hackers or other malicious types of vulnerabilities that might be exploited to deny access to your services or cause them to perform incorrectly.*
- ***Stress testing:** Testing how much strain the system can take before it fails. Stress testing is considered to be a type of non-functional testing.*
- ***Usability testing:** Validating how well a customer can use a system or web application to complete a task.*

*Not all of these tests are equally important when it comes to scientific software.*



***Code documentation***

*Write comments as you code (not afterwards). Modern IDEs can assist in to automatically generate documentation strings as you write code, which removes the burden of having to remember to write comments. (e.g., PyCharm, DataSpell from [JetBrains](https://www.jetbrains.com/)).*

*Be aware of guidelines and tools to (automatically) generate documentation such as [Sphinx](https://www.sphinx-doc.org) using Python [docstrings](https://www.geeksforgeeks.org/python-docstrings/), and r2readthedocs, and [roxygen2](https://cran.r-project.org/web/packages/roxygen2/index.html) for R, will also help to improve reproducibility. We used Sphinx for the documentation of the sFSS Navigator.*

*There are different types of documentation:*

- *Requirements Specification*

- *Software Design*

- ***(External) source code documentation***
  - *Place a brief explanatory comment at the start of every program.*

  - *Document the input and output of your script/functions.*
  - *Describe what the code is doing and why.*

- *Testing Requirements*
- ***End-User Instructions (including a quick-start guide)***
  - *How to install and configure the software.*
  - *Where to find its full documentation.*
  - *Examples of how to execute the code to produce certain output. Provide a simple example or test dataset.*
  - *Under what license it’s released.*
- *Include a help command for command line interfaces*

In bold the documentation that should be provided at a minimum in the context of ENCORE.



***Integrated development environment** (IDE)*

*Integrated Development Environments help to improve software. Consider using an IDE, e.g., [Visual Studio Code](https://code.visualstudio.com/), PyCharm and DataSpell from JetBrains (https://www.jetbrains.com/), RStudio (https://www.rstudio.com/).*

*IDEs offer a various advantages:* 

* *Build in compilation and build tools*
* *Code editing features (e.g., syntax highlighting, code completion, code refactoring)*
* *Code debugging and testing*
* *Code documentation*
* *Integration with versioning systems*
* *Integration with AI-based tools such as Copilot*
* *Extensibility (plugins) and Customization (workflow)*



***AI-based tools***

*Large Language Models (LLMs) increasingly play a role in software development, testing, and documentation (e.g., Copilot, ChatGPT). Copilot is also integrated with GitHub Codespaces. It is worthwhile to try out these new tools.* 



**Preserve your computing environment**

*See [0_README.md](../../0_SoftwareEnvironment/0_README.md) in [0_SoftwareEnvironment](../../0_SoftwareEnvironment)*



*<u>Instructions</u>:* 

* *Remove all Instructions and the Explanation once you have completed the template.*
* *Level of detail: Information provided should be sufficient for someone who was not involved in the project and/or has limited knowledge about the topic,  to understand and reproduce the project.* 



***Software documentation***

*Ensure that you have properly documented your code.* *Not all types of software documentation of the list above need to be written for a single research or support project but a combination of several should be selected depending on the nature of the project. Whether more or less documentation is needed for your project will depend on its scale and complexity. For a research project you need at least to write (external) source code documentation and user documentation.*



====== TEMPLATE STARTS HERE ======



**What (external) documentation is available?**



**Documentation files**: [filename; short description of content]



**How did you test the code:**



**Script 1:** [description]

**Script 2:** [description]



**Description of manual steps**:



**Relation between the scripts, and user instructions for execution:**
