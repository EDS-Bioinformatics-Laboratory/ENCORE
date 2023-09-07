# Anaconda & 

# Python and Jupyter Notebooks



See also the information about **Phyton**   



**Development and run environment**

Python Notebooks in the Processing directory are developed and executed within the Anaconda environment on a Windows 10 (or higher) computer.   



**Anaconda**

The Python Notebooks were developed within the Anaconda environment. Anaconda is a distribution of the Python and R programming languages for scientific computing (data science, machine learning applications, large-scale data processing, predictive analytics, etc.), that aims to simplify package management and deployment.  https://www.anaconda.com/

See also

* Anaconda-Starter-Guide.pdf
* Conda-cheatsheet.pdf



**How Does Conda Compare To Pip, Virtualenv, Venv & Pyenv**
Conda provides many of the features found in pip, virtualenv, venv and pyenv. However it is a completely separate tool that will manage Python dependencies differently, and only works in Conda environments.

Conda analyzes each package for compatible dependencies, and how to install them without conflict. If there is a conflict, Conda will let you know that the installation cannot be completed. By comparison, Pip installs all package dependencies regardless of whether they conflict with other packages already installed. To avoid dependency conflicts, use tools such as virtualenv, venv or pyenv to create isolated Anaconda environments.



**Starting a Notebook**

* Start the Anaconda Prompt (anaconda3) :

  \> cd [directory containing the notebook]

  \> activate [environment]   (if any) 
  
  \> jupyter lab [notebook.ipynb]
  
  
  
* alternatively:  

  \> jupyter notebook [notebook.ipynb] 

  Note that JupyterLab is the next generation of the Jupyter Notebook

  

* In case of message: Notebook is not trusted: 

  \>jupyter trust notebookName.ipynb

  



**Update Anaconda**

\> conda update --prefix C:\Users\[username]\anaconda3 anaconda

or

\> conda update -all



**List of available environments**

\> conda env list  (shows the active environment)

\> conda list (shows pacakges in active environment)



**Prepare new jupyter lab environment**

In case that the Jupyter notebooks do not execute, the following might solve the problem. 

 \>jupyter --version

\>conda install jupyter

\>conda install jupyterlab  #probably not required since is installed by previous command

 

**Check versions and environment**

\> conda -V  (check Anaconda Version)

\> python -V (check Python Version)



**Anaconda environment Export**

To export and environment (e.g., ODE) such that others can re-initiate it do the following:

* I created an environment ("ODE") that contains all packages I need for a specific project

* This conda environment was written to the file ODE-env.txt using:

  \> conda list --explicit > ODE-env.txt  

  This environment can be recreated with

  \> conda env create --file ODE-env.txt

* The environment can also be recreated from scratch (see below)

  

 **PyCharm and DataSpell**

To complement anaconda one may also use the PyCharm Python IDE from JetBrains (https://www.jetbrains.com/pycharm/). The free version of PyCharm does not run Notebooks, for one needs either PyCharm Pro or DataSpell (https://www.jetbrains.com/dataspell/). DataSpell and other applications are free for lecturers and students.





