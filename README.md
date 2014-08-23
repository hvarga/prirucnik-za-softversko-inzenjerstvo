# Software Engineering Manual

The goal is to write a book which will help you to learn the basic methodologies, processes and technics about the software development in general.

The book is acctually oriented on the Java technology but nevertheless, it can be applied to any programming language.

Book is at its initial stage of writing and it is available only in a Croatian language.

# How to Generate a PDF

To be able to generate a PDF yourself you have to have quite a large collection of tools.

## Download and Install TeX Live

Go to https://www.tug.org/texlive/acquire-netinstall.html and follow directions.

## Download the Source Materials

First you need to download the source materials for the Software Engineering Manual. This can be acomplished using the Git to clone the repository or to download the source materials directlly using your web browser.

If you want to use the Git than you need to have it installed on your system. So, one more tool to install. There is just one minor difference between using Git or downloading the source materials directlly using your web browser. The generated PDF will lack the version statement if you choose to download the source materials directlly using your web browser.

**Git**

Go to http://git-scm.com/downloads and choose your operating system and foolow directions.

Now that you installed the Git it is time to clone the Software Engineering Manual repository.

Open up your terminal and enter the following:
```
git clone https://github.com/hvarga/software-engineering-manual.git
```

Git will do its magic and you will have the source materials.

**Web browser**

Go to the https://github.com/hvarga/software-engineering-manual/archive/master.zip to download the source materials.

Web browser will download the source materials contained in a ZIP archive. Extract this archive somewher on your disk.

## Generate PDF

If you are using GNU/Linux then it is recommended to install `make` package. The installation method depends on the distribution. This means that you need to find the installation instructions for your distribution.

For CentOS, open up your terminal and type:

```
sudo yum install make
```

**GNU/Linux**

In the root folder of the source materials type:

```
make
```

**Other**

In the root folder of the source materials type:

```
latexmk -r book/latexmkrc -verbose -time -latexoption='-halt-on-error -synctex=1' -pdf -cd book/main.tex
```

Using `make` or `latexmk` directlly will finally generate the PDF document. PDF will be stored in the `book` folder. Enjoy reading!

# License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.
