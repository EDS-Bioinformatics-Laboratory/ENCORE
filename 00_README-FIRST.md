**ENCORE. Enhancing Computational Reproducibility** 



Notes:

* The Standardized File System Structure (FSS) contains multiple markdown files (*.md) these can be edited with any text editor but are better visualized in a Markdown viewer such as Typora (www.typora.io; Windows, Mac) or Notepad++ (Windows; install the MarkdownViewer plugin).

* Researchers that aim to reproduce the project: start by opening **Navigate.html** in your browser.



**Content of FSS root directory**

The following files need to be updated by the project owner

* **0_PROJECT.md**. Short description of project, contact person, and project team

* **0_GETTINGSTARTED.txt**. Template document (plain text format). Copy this file to your favourite word processor to add content.
* Examples:
  
  * **0_GETTINGSTARTED.docx**. Template document (Microsoft Word format to show how to include links). The docx file can be saved as html (make sure you use utf-8 encoding).
  
  * **0_GETTINGSTARTED.tex**. Template document (LaTex format to show how to include links). The LaTex file can be converted with [Pandoc](https://pandoc.org/index.html) to html.
  
  * **0_GETTINGSTARTED.html**. Example of exported html file used by the FSS navigator.




Help files

* **1_Step-by-Step-ENCORE-Guide.{pdf, docx}**. User guide to use ENCORE (the File System Structure (FSS) and setting up a corresponding GitHub repository).



General

* **00_README-FIRST.{md,txt}**. This file.

* **2_CITATION.{md,txt}**. How to cite ENCORE.
* **.FSSignore**. Currently not used.



FSS Navigator

* **Navigate.html**. Open in your browser to navigate the standardized file system.
* **Navigate.py**. Standalone Python 3 script to generate Navigate.html to navigate the FSS. Can be run from the command line (Navigate.py -h)
* **Navigate_U.sh**. Shell script to run Navigate on Unix/Linux systems. Change the first line (#!/usr/bin/Python) if necessary. Make executable using chmod +x
* There are also executables available for Windows and Mac OS. These are not available from GitHub but   are found at Zenodo (DOI: https://doi.org/10.5281/zenodo.7985655; https://zenodo.org/record/7985655)):
  * **Navigate_W.exe**. Windows executable if you don't have Python installed (Navigate.exe -h).
  * **Navigate_M**. MacOS executable (macOS 13.3.1 (Ventura), Apple M1)
  * **Navigate_MacIntel**. MacOS executable (macOS 10.13.6 (High Sierra), Intel Core i5 )

* **Test_Navigate_Module.py**. Python script to show how to use Navigate.py as module in other Python scripts. This may help to keep Navigate.html up-to-date without manually executing Navigate.py.
* **Navigate.conf**. Configuration file for Navigate.



Directories

* **\.navigate**. System directory used by Navigate. Do not remove.
* **Data**. Data used in the project. Note that data can also be located in the Processing (sub)directories depending on your needs.
* **Manuscript**. (Final) manuscript of project
* **Processing**. Software, documentation, and results. Also contains some general information about software environments.
* **ProjectDocumentation**. General information about project.
* **Sharing**. Restructured and/or selected FSS files shared with third-parties.

