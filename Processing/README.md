### Processing



<u>*Explanation*</u>:

*This file contains basic project information and is shown by default in the FSS Navigator.*



*<u>Instructions</u>:* 

* *Remove all Instructions and the Explanation once you have completed the template.*

* *Level of detail: Information provided should be sufficient for someone who was not involved in the project and/or has limited knowledge about the topic,  to understand and reproduce the project.* 

  

* *Subdirectories*
  * ***0_SoftwareEnvironment**.  General and project-specific information about the used computing environments (programming languages, integrated development environments, package managers).*
  * ***Data**. Raw, meta, and pre-processed data*
  * ***NameOfComputation**.  Contains all items (e.g., code, documentation, results) belonging to a specific computational analysis. Change 'NameOfComputation' to a more descriptive name. Make, additional \NameOfComputation sub-directories if required.*
    * *Different parts of the computational work should be placed in different \NameOfComputation directories to keep the \Processing modular.* 
    * *You may add any prefix (e.g., number, date) to order these directories.*



*<u>README.md</u>*

* *This is the default GitHub README.md file. Do not change its name.*
* *This file may duplicate (parts of) the 0_PROJECT.md file but, more importantly, should provide a short but clear description of all \NameOfComputation directories. In particular, it should make the dependencies (if any) clear, and should provide instructions of how to execute the code.* 
  * *Since the FSS is the entry point of a project and because the FSS will be shared with peers (not the GitHub repository), it is not necessary (but allowed) to provide a project description in this README file*



*GitHub*

*The Processing directory should be synchronized to the corresponding GitHub repository **without data and results** because we do not have sufficient storage space on GitHub to accommodate this.  Moreover, data and results already reside in the FSS (see Step-by-Step-ENCORE-Guide for instructions).*

* *To exclude specific subdirectories and files from the GitHub repository you should make the appropriate changes to **gitignore-FSS-template** and copy it to **.gitignore**.* 
* *The \Processing directory contains several other gitignore templates for specific languages. To use any of these templates, simply merge its content to the gitignore-FSS-template.txt and rename to .gitignore.  It is considered good practice to keep a single gitignore in the top-level directory and not in individual subdirectories, which would make debugging more troublesome.*

* *The \Processing directory should contain a <u>github.txt</u> file with the name of  the associated GitHub repository (URL). This file is used by the FSS Navigator*



====== TEMPLATE STARTS HERE ======

**Short title + project description:** [optional]

**Main contact:** [optional]

**Team:** [optional]



**NameOfComputation_1**:  [Short description]

**NameOfComputation_2**:  [Short description]

**NameOfComputation_3**:  [Short description]



**Dependencies:** [describe dependencies between the different computation sub-directories. For example, is there a specific order of execution]



**How to execute the code:**

[For example, command line instructions, parameter values, other settings]
