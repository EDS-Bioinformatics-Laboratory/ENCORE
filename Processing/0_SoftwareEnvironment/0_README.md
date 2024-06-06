### Computing Environment



<u>*Explanation*</u>

*This directory contains general and project-specific information about the used computing environments (e.g., used hardware, operating system, programming languages, integrated development environments, package managers).*

*The sub-directories provide basic information about different environments (e.g., R/Rstudio, Python/PyCharm, Anaconda) for peers not familiar with the used computing environment. In addition, you may find other files such as cheat sheets, tutorials, and exports of (Anaconda) environments.*



*<u>Computing environment</u>*

*One challenge that is only partially addressed by ENCORE concerns the preservation of the full **computing environment**. This environment is defined by (interdependencies of) the operating system, software tools, versions and dependencies, programming language libraries, etc. It is very important that the computing environment is preserved as much as possible.*



*One approach is proposed by Gruning and co-workers [(Gruning, 2018)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11070151/). They proposed a software stack of interconnected technologies to preserve the computing environment (**Figure 1**). This stack comprises*

1. ***Conda** to manage software packages and dependencies (https://docs.conda.io/en/latest/). Conda provides a virtual execution environment. With conda you can manage R packages but **renv** is good alternative (https://rstudio.github.io/renv/index.html).* 
2. *Containers such as **Docker** (https://www.docker.com/) or **Singularity** (https://docs.sylabs.io/guides/3.5/user-guide/introduction.html) to provide an isolated environment for the software. That is, a container has no knowledge of the operating system and contains everything required to run the software.*
3. *Virtual Machines (VM) for hardware virtualization to achieve complete isolation and reproducibility. Virtualization can be achieved via (commercial) clouds or, on a local computer, using for example Workstation Player from **VMware** (https://www.vmware.com/) or **VirtualBox** from Oracle (https://www.virtualbox.org/)*



*Gruning, B., Chilton, J., Koster, J., Dale, R., Soranzo, N., van den Beek, M., Goecks, J., Backofen, R., Nekrutenko, A., & Taylor, J. (2018). Practical Computational Reproducibility in the Life Sciences. Cell Syst, 6(6), 631-635. https://doi.org/10.1016/j.cels.2018.03.014* 





![ReproducibilityStack](F:\Cloud\Dropbox\BioLab\FSS Projects\ENCORE\Processing\0_SoftwareEnvironment\ReproducibilityStack.png)

***Figure 1**. Software stack of interconnected technologies that Enables Computational Reproducibility. For R projects, renv might be used as an alternative for conda. Docker or Singularity may be used for the containerization. Copied and modified from Gruning (2018).*



<u>*Brief explanation of the stack*</u>

*Since Conda packages are frequently updated, if a Conda virtual environment is created by specifying only the top-level tools and versions, recreating it at a later point in time using the same specifications may easily result in slightly different dependencies being installed. Therefore, containerization is need to provide a next level of isolation. Containers (e.g., Docker, Singularity) are run directly on the host operating system’s kernel but encapsulate every other aspect of the runtime environment. Note, that Docker still has security concerns while Singularity provides better security for multi-user systems and can run Docker images. Containers provide isolated and reproducible compute environments, but still depend on the operating system kernel version and underlying hardware. An even greater isolation can be achieved through virtualization, which runs analysis within an emulated virtual machine (VM) with precisely defined hardware specifications. Virtualization, which provides the third layer of our reproducibility stack* 



<u>*Conda vs pip*</u>

*Conda and pip are serving completely different use cases despite having similar features. Conda is a **system** package manager while pip (https://pypi.org/project/pip/) is a **Python** package manager.*

*Conda is a packaging tool and installer that aims to do more than what pip does; handle library dependencies outside of the Python packages as well as the Python packages themselves. Conda also creates a virtual environment, like virtualenv does.*

*With **conda** you can install much more than just Python libraries. You can install entire software stacks such as Python + Django + Celery + PostgreSQL + nginx. You can install R, R libraries, Node.js, Java programs, C and C++ programs and libraries, Perl programs, etc. conda has an env system that allows you to have all of these installed across multiple different environments. Also, conda is able to do all these software and package installations in an isolated, userspace manner. This is critical because it means that you can install complex software stacks on a system without needing root privileges. In a lot of ways, conda serves as a lightweight userspace alternative to Docker for isolating software stacks.* 

*On the other hand, **pip** can only install Python packages, and it quite often screws up the installations on multi-user systems, breaking global system dependencies and/or the user's dependency stacks. This is why people who rely only on pip MUST use virtualenv, but even then pip sometimes misbehaves and installs to the wrong places. In general, pip is dangerous and a mess to use. Easy to screw up your user Python library stack or even the entire server's installation. Tread carefully any time you use the globally available system-installed pip.*

*The thing that a lot of people do not understand is that conda and pip are NOT mutually exclusive. In fact, you are supposed to use them together. The intended usage is this;*

- *first you install and/or set up conda for your project (including conda env as needed) and install all packages you need first from conda channels*
- *second, and with conda activated, you use the version of pip included with conda to install and required pip dependencies into your project's conda env*

*This is an important distinction. When you install conda, it brings its own version of pip (and Python) that will automatically become available when you activate conda (conda activate myenv), and will automatically install packages into your currently activated conda env.* *See also https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html.*

```
conda install -n myenv pip
conda activate myenv
pip <pip_subcommand>
```

*Issues may arise when using pip and conda together. When combining conda and pip, it is best to use an isolated conda environment. Only after conda has been used to install as many packages as possible should pip be used to install any remaining software. If modifications are needed to the environment, it is best to create a new environment rather than running conda after pip. When appropriate, conda and pip requirements should be stored in text files.*



*And as always, make sure to save the installation commands with version-locked dependencies for both conda and pip for every project where they are used.*



<u>*Use in ENCORE*</u>

*Since software versions and dependencies are a main obstacle for reproducibility, it is required to use a package manager of some sort (e.g., conda, renv) and to ensure that Compendium Recipients can reproduce the software environment. For example, conda allows to export the environment using 'conda list --explicit > myenv.txt', which can be imported by the Compendium Recipient.* 

*Preferably, also provide a file with  versions of all software (including packages, libraries) used in the project.  For example, in R one can use 'installed.packages()', while in conda one can use 'conda list --explicit > myenv.txt'.* 

*In the context of ENCORE, we are still working on best practices for using containers and/or VMs.* 



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



**Did you use conda or renv?**



**Did you export the software environment (i.e. software/package/library versions)?** [yes/no]



**Filename(s) of exported environment:**



**Did you use containerization or virtualization? If so, provide all relevant details.**



**Other information about the computing environment:**



