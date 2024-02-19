### Data description  



<u>*Explanation*</u>:



*The \Data directory includes:*

* ***Raw data***

  * *Unprocessed data that come from the physical measurement device* 

  * *This includes unprocessed data obtained obtained from collaborators or public databases.* 

  * For example, fastq for NGS, 'raw' for metabolomics, 'cel' for Affymetrix*

    

* ***Meta data** (data description)*

  * *(Open-Access) license*

  * *Description of the data*

    * *Description of samples (e.g., sample sheets)*

    * *Experimental design*

    * *Who created the data*

    * *Content and format of the data files*

    * *Why the data were generated*

    * *How the data were generated (measurement platform)* 

    * *........*

  * *The meta-data can also be placed in the \Raw and/or \Processed sub-directory if that is more convenient or logical, or if the amount of meta-data is limited.*

    

* ***Processed data***

  * *Data obtained from collaborators or public databases and, consequently, not produced as part of your computational analyses. If the data (pre)processing is part of your computational analyses then, preferentially, it should be placed in the \Results directory within \Processing. However, you can take the flexibility to store your own processed data in the /Data/Processed directory. In this case make sure that this is clearly documented in this README file.*  
  * *Processed data includes, for example, results from pre-processing steps such as sequence alignment, normalization, summarization, and imputation (e.g., BAM for NGS, peak tables for metabolomics).* 



*FAIR and other standards*

*It is not the aim of ENCORE to FAIRify (raw, processed, meta) data obtained from collaborators or (public) databases. Nor does this data have to comply with minimum information standards, or be described using vocabularies/ontologies. In the context of ENCORE  (computational analyses) we use the data as received.* 

* *FAIR data that complies with minimum information standards (e.g., experimental design, sample descriptions, experimental protocol) will, however, often be necessary to correctly design and perform the computational analysis.* *Generally, the description the data  should be provided by the research who  performed the experiments, or should be downloaded from the public repository*.

* *If  data (pre)processing is part of the computational analyses then the processing procedures should be described in detail in the \NameOfComputation directory such that it can be part of a FAIR dataset at a later stage.*



*<u>Instructions</u>:* 

* *Remove all Instructions and the Explanation once you have completed the template.*
* *Level of detail: Information provided should be sufficient for someone who was not involved in the project and/or has limited knowledge about the topic,  to understand and reproduce the project.* 



* *The \Data directory is also found in the \Processing directory, and in the specific analysis directories (i.e., currently \NameOfComputation). You can use either one or all of these directories based on what you find convenient for the project. Remove the Data directories that you do not use.* 
  * *If you use multiple \Data directories then clearly describe how they relate.* 

* *Rename 'NameOfDataset_1' to a descriptive name.* 
* *Make additional 'NameOfDataset' directories if you have multiple datasets.*
* *In case you have only one dataset, you can remove the 'NameOfDataset_1' directory and store your raw, meta, and processed data directory in \Data.*



* *Public data*
  * *If public data is used then specify sufficient information such as Database name, version, URL, description of the data.* 

* *External data*
  * *If, for any reason, it is impossible to store the data within the FSS then specify the location of the data, the license, and how the data can be obtained.*

* *Controlled access data*
  * *Controlled access data obtained from specific data providers (e.g., TCGA, dbGAP) should be stored  together with the complete license agreement. However, in most cases, controlled access cannot be shared with peers as part of the sFSS.*

* *Licenses*
  * *For all data that is obtained from collaborators and public databases a data usage license should be stored with the data.*





====== TEMPLATE STARTS HERE ======



**Do you also use one of the other \Data directories?** [yes/no]

**How do these \Data directories relate:** [brief description]



<u>Datasets </u>

**Dataset 1:** [short description + Name of data owner + License]



**Dataset 2:** [short description + Name of data owner + License]



<u>External datasets</u>

**Dataset.**

* Short description:

* Reason for not including the data in this \Data directory:

* How to obtain the data:

* How should the data be used with the software in the \Processing directory (e.g., is pre-processing necessary)?



 





 

