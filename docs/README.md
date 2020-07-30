# Introduction to Scientific Programming with Python

This repository contains source code and Jupyter notebooks for the book ["Introduction to scientific programming with Python"](https://www.springer.com/gp/book/9783030503550), published as part of the Simula SpringerBriefs on Computing, 2020.

![Book cover](figs/cover.jpg)

The book gives a brief introduction to Python programming for scientific and computational applications, and is based on ["A Primer on Scientific Programming with Python"](https://link.springer.com/book/10.1007/978-3-662-49887-3). It was written for the introductory programming course "IN1900 – Introduction to Programming with Scientific Applications" at the University of Oslo.

## Source code for code examples
Most of the code examples are available for download as regular .py files:
* Click [here](./src.zip) to download all the code examples as a single zip-file
* Or browse the chapters and download individual .py-files [here](https://github.com/sundnes/python_intro/tree/master/docs/src)
Some of the code examples have been altered slightly from the book, to fix minor bugs
and give more sensible output when running the files.

## Jupyter notebooks for all book chapters
All the chapters of the book are available as Jupyter notebooks.
* Click [here](./ipynb.zip) to download all the notebooks in a  single zip file.
* Or browse the individual chapter files [here](https://github.com/sundnes/python_intro/tree/master/docs/ipynb).
  The ipynb files will render nicely when you view them on github, but to run the
  embedded Python code and make full use of the notebook format you need to
  download the files and run them locally using jupyter-notebook.
It should be noted that the notebooks have been automatically generated from the book
source files and may contain minor bugs and inconsistencies. Be particularly aware
of the following:
* The order of the notebook code cells is not always correct, since they were written
  for a static book-style and not intended to be live code. Most of the cells will
  run nicely if all previous cells have been run, but some will have problems with
  undefined variables and functions.
* Some code cells have unintentionally been converted to markdown cells. Most of these
  should run if the cell type is changed.
* The user input examples of Chapter 5 do not make sense in a notebook format. Some
  of the cells have been altered to make the code run, but not all of them will work
  as intended. The notebook format is not ideal for presenting these tools and techniques,
  since they are really only relevant when running regular .py-files. 
