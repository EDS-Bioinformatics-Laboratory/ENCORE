### NameOfComputation



<u>*Explanation*</u>:



*Subdirectories*

* ***Code**. Contains the (in-house developed) software used for the computational analysis.*
* ***CodeDocumentation**. Any external documentation that is available about the software such as requirement specifications, software design, source code documentation, testing requirements, and end-user instructions. Alternatively, part of this documentation can be placed in the code itself, or in the code 0_README.md file.*
* ***Data**. Raw, meta, and pre-processed data.*
* ***Notebooks**. Contains interactive notebooks (e.g, R or Jupyter notebooks), which may include data and results. Minimize the size of the Notebook prior to pushing to GitHub.*
* ***Results**. (Intermediate) results such as figures and tables from the computational analysis. Additional sub-directories within \Results, to organize the results, are allowed.* 
* ***Settings.*** 
  * *Contains any file with input parameters for e.g., statistical analysis and computational simulations. If only few parameters or parameter files are required then these might also be placed in the \Code directory or directly in the code itself.*



*<u>Instructions</u>:* 

* *Remove all Instructions and the Explanation once you have completed the template.*
* *Level of detail: Information provided should be sufficient for someone who was not involved in the project and/or has limited knowledge about the topic,  to understand and reproduce the project.* 



<u>*Conceptual description of methodology to improve transparency.*</u>

* *Brief description of used pre-existing methods (version) including specification of the mathematical/statistical model, parameters, variables, references, etc.*
* *If a new method is developed that this method should be described in full detail.* 
* *Describe why the selected or developed computational approach is valid for your research question.*
  * *This allows your peers to make their own judgement about the approach and results.* 
  * *Considered alternatives?*
* *Detailed description of all data filtering, reduction, normalization, etc steps that are performed prior to the downstream analysis.*
* *Avenues of exploration examined throughout development, including information about negative findings.*
* *.......*



*<u>Manual steps</u>*

***Avoid** manual data manipulation steps. Instead of manually changing data (e.g., format conversion, filtering), aim to make use of small custom scripts. Manual steps are a main cause for irreproducible results.*  

* *It is strongly recommended to implement an executable description of the sequence of steps taken helps to reproduce results (e.g., Snakemake, https://snakemake.github.io; pytask, https://github.com/pytask-dev/pytask; any other workflow system)*



*<u>Intermediate results and hierarchical output</u>*

*Record intermediate results (preferable in a standardized format). Generate hierarchical analysis output, allowing layers of increasing detail to be inspected. This can reveal discrepancies toward what is assumed, and can in this way uncover bugs or faulty interpretation that are not apparent in the final results. It also allows any inconsistency to be tracked to the step where the problem occurs.  It also allows critical examination of the full process behind a result. Clearly document the intermediate/final results and the imposed hierarchy.*



====== TEMPLATE STARTS HERE ======



**Software environment** (alternatively can be specified in \Processing\0_SoftwareEnvironment)

* **Operating System(s) / version(s) used during development (and testing):**

* **Specific hardware requirements:**

* **Software environment (e.g., programming language + version):** 





**Conceptual description of methodology** 



**Random seed**: [if used]



**Description of manual steps**:



