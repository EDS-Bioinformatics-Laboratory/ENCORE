### Software Environment





<u>*Explanation*</u>:

*One challenge that is only partially addressed by ENCORE concerns the preservation of the full computing environment. This environment is defined by (interdependencies of) the operating system, software tools, versions and dependencies, programming language libraries, etc. Gruning and co-workers proposed a software stack of interconnected technologies to preserve the computing environment (Gruning, Chilton, et al., 2018). This stack comprises (Bio)Conda (Anaconda Software Distribution, 2020; Gruning, Dale, et al., 2018) to provide virtual execution environments addressing software versions and dependencies, container platforms such as Docker (Nust et al., 2020) to preserve other aspects of the runtime environment, and virtual machines using cloud systems or dedicated applications such as VMware, to overcome the dependencies on the operating system and hardware. We are currently investigating how to best approach this within the ENCORE environment.* 



*At this moment ENCORE requires that you specify your computing environment by describing it as far as possible and/or to export software package versions and interdependencies from e.g., Anaconda. Anaconda allows to import these exported environments to ensure peers use the same software versions.*



*This directory contains general and project-specific information about the used computing environments (e.g., used hardware, operating system, programming languages, integrated development environments, package managers).*



*The sub-directories provide basic information about different environments (e.g., R/Rstudio, Python/PyCharm, Anaconda) for peers not familiar with the used computing environment. In addition, you may find other files such as cheat sheets, tutorials, and exports of (Anaconda) environments.*



*<u>Instructions</u>:* 

* *Remove all Instructions and the Explanation once you have completed the template.*

* *Level of detail: Information provided should be sufficient for someone who was not involved in the project and/or has limited knowledge about the topic,  to understand and reproduce the project.* 

  

* *Environments that are not used can be removed.* 
* *If you use a different environment then add a new subdirectory.*
* *Export your compute environment(s) (e.g., listing the different versions of Python, R, libraries/packages, library dependencies, etc) used for your computations. This can, for example, be done with Anaconda (R and Python), or saving your sessionInfo() (R).* 



* Provide project specific information about your computer environment

  * *For example,* 
* *Specific tools that were used*
    * *Used hardware (e.g., laptop, cluster, GPU)*
    
* Operating system
  
* *Package versions and dependencies.*
  
* *Note: if you have multiple computations, organized in different \NameOfComputation directories, that use different package version, dependencies, etc then it might be more logical to store this information in the specific \NameOfComputation directory.* 



====== TEMPLATE STARTS HERE ======

**Is the project specific information stored in this directory or did you move it to the \NameOfComputation directory?**



**Hardware specification:** 



**Operating system:**



**Did you export the execution environment?** [yes/no]



**Export your environment(s)** (e.g., listing the different versions of Python, R, libraries/packages, library dependencies, etc) used for your computations.: [Filename/description]



**Other information about the computing environment:**



