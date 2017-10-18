## An Introduction to Topic Modelling via Gibbs sampling: Code and Tutorial

by Stephen Hansen, stephen.hansen@economics.ox.ac.uk

Associate Professor of Economics, University of Oxford

***

Thanks to Eric Hardy at Columbia University for collating data on speeches.

***

If you use this software in research or educational projects, please cite:

Hansen, Stephen, Michael McMahon, and Andrea Prat (2014), “Transparency and Deliberation on the FOMC: A Computational Linguistics Approach,” CEPR Discussion Paper 9994.  

***


### INTRODUCTION

This project introduces Latent Dirichlet Allocation (LDA) to those who do not necessarily have a background in computer science or programming.  There are many implementations of LDA available online in a variety of languages, many of which are more memory and/or computationally efficient than this one.  What is much rarer than optimized code, however, is documentation and examples that allow complete novices to practice implementing topic models for themselves.  The goal of this project is to provide these, thereby reducing the startup costs involved in using topic models.

The contents of the tutorial folder are as follows:

1. topicmodels: Python/Cython code for cleaning text and estimating LDA via collapsed Gibbs sampling as in Griffiths and Steyvers (2004).
2. speech_data_extend.txt: Data on State of the Union Addresses.
3. tutorial_notebook.ipynb: iPython notebook for the tutorial.
4. tutorial.py: Python code with the key commands for the tutorial.
5. setup.py: File for compiling Cython code into C library.

### BUILDING
## PREREQUISITES
In order to build this project you need to install [Docker](https://www.docker.com/)
## RUNNING NOTEBOOKS
To run a Jupyter Notebook with `topicmodels` installed please run
```bash
$ make run-notebook
```

### PERFORMANCE

While primarily written as an introduction, the code for the project should also be suitable for analysis on datasets with at least several million words, which includes many of interest to social scientists.  For very large datasets, a more scalable solution is likely best (note that even when fully optimized, Gibbs sampling tends to be slow compared to other inference algorithms).

In terms of memory, one should keep in mind that each sample has an associated document-topic and term-topic matrix stored in the background.  For large datasets, this may become an issue when trying to store many samples concurrently.

### FEEDBACK

Comments, bug reports, and ideas are more than welcome, particularly from those using topic modelling in economics and social science research.
