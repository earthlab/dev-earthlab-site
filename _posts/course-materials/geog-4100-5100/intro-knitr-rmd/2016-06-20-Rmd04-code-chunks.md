---
layout: single
title: "Code Chunks in R Markdown"
excerpt: 'This tutorial cover how to create an R Markdown file in R and then
render it to html using knitr.'
authors: [Leah Wasser, NEON Data Skills]
category: [course-materials]
class-lesson: ['intro-rmarkdown-knitr']
permalink: /course-materials/intro-rmarkdown-code-chunks
nav-title: 'Code Chunks'
sidebar:
  nav:
author_profile: false
comments: false
order: 4
---


## Getting Started
This tutorial will introduce you to working with R markdown files in `R` and
`R Studio`. We will create an R Markdown file and render it to html using the
`knitr` package.

<div class='notice--success' markdown="1">

# Learning Objectives
At the end of this activity, you will:

*

## Things You’ll Need To Complete This Tutorial

You will need the most current version of R and, preferably, RStudio loaded on
your computer to complete this tutorial.

### Install R Packages

* **knitr:** `install.packages("knitr")`
* **rmarkdown:** `install.packages("rmarkdown")`
* **raster:** `install.packages("raster")`
* **rgdal:** `install.packages("rgdal")`

### Download Data

Download the data below and place it in a directory: `~/Documents/data/earth-analytics`

{% include/dataSubsets/_data_Data-Institute-16-TEAK.html %}

</div>

We have we have already learned that an RMD document contains three parts

1. A YAML header
2. Text chunks in markdown syntax that describe your processing workflow or are the text for your report.
3. Code chunks that process, visualize and/or analyze your data.

In this tutorial, we cover code chunks in `.Rmd` files.


<a class="btn btn-info" href="http://rmarkdown.rstudio.com/authoring_basics.html" target="_blank"> Learn More - RStudio Markdown Overview</a>



<i class="fa fa-star"></i> **Data Tip**: You can add code output or an R object
name to markdown segments of an RMD. For more, view this
<a href="http://rmarkdown.rstudio.com/authoring_quick_tour.html#inline_r_code" target="_blank"> R Markdown documentation</a>.
{: .notice}

## Code chunks

Code chunks are the segments of your markdown document where you place  your `R`
code. All code chunks start and end with<code>```</code>  -- three backticks or
graves. On your keyboard, the backticks can be found on the same key as the
tilde (~). Graves are not the same as an apostrophe!

The initial line of a code chunk must appear as:

<pre><code>
```{r chunk-name-with-no-spaces}
# code goes here
 ```
 </code></pre>

The `r` part of the chunk header specifies the code language being used. Specifying
the language is mandartory. Next to the `{r}`, there is a chunk name. The chunk
name is not required for however, it is good practice to give each
chunk a unique name as it is required for more advanced knitting approaches.

<div class="notice" markdown="1">

## Activity: Add Code Chunks to Your R Markdown File

Continue working on your document. Below the last section that you've just added,
create a code chunk that loads the packages required to work with raster data
in R, and sets the working directory.

<pre><code>```{r setup-read-data }
   library(rgdal)
   library(raster)

   # set working directory to ensure R can find the file we wish to import
   setwd("~/Documents/data/NEONDI-2016/")

 ```</code></pre>

# Do we want to have a lesson like this?
(For help setting the working directory, see the NEON Data Skills tutorial
<a href="http://neondataskills.org/R/Set-Working-Directory" target="_blank">*Set A Working Directory in R*</a>.)

Then, add another chunk that loads the `TEAK_lidarDSM` raster file.

<pre><code>```{r load-dsm-raster }

   # import dsm
   teak_dsm <- raster("NEONdata/D17-California/TEAK/2013/lidar/TEAK_lidarDSM.tif")

 ```</code></pre>

Now run the code in this chunk.

You can run code chunks:

* **Line-by-line:** with cursor on current line, Ctrl + Enter (Windows/Linux) or
Command + Enter (Mac OS X).
* **By chunk:** You can run the entire chunk (or multiple chunks) by
clicking on the `Chunks` dropdown button in the upper right corner of the script
environment and choosing the appropriate option. Keyboard shortcuts are
available for these options.

</div>

## Code chunk options

You can also add arguments or options to each code chunk. These arguments allow
you to customize how or if you want code to be
processed or appear on the output HTML document. Code chunk arguments are added on
the first line of a code
chunk after the name, within the curly brackets.

The example below, is a code chunk that will not be "run", or evaluated, by R.
The code within the chunk will appear on the output document, however there
will be no outputs from the code.

<pre><code>```{r intro-option, eval=FALSE}
# the code here will not be processed by R
# but it will appear on your output document
1+2
 ```</code></pre>

We use `eval=FALSE` often when the chunk is exporting an file that we don't
need to re-export but we want to document the code used to export the file.

Three common code chunk options are:

* `eval = FALSE`: Do not **eval**uate (or run) this code chunk when
knitting the RMD document. The code in this chunk will still render in our knitted
HTML output, however it will not be evaluated or run by `R`.
* `echo=FALSE`: Hide the code in the output. The code is
evaluated when the RMD file is knit, however only the output is rendered on the
output document.
* `results=hide`: The code chunk will be evaluated but the results or the code
will not be rendered on the output document. This is useful if you are viewing the
structure of a large object (e.g. outputs of a large `data.frame`).

Multiple code chunk options can be used for the same chunk. For more on code
chunk options, read
<a href="http://rmarkdown.rstudio.com/authoring_rcodechunks.html" target="_blank"> the RStudio documentation</a>
or the
<a href="http://yihui.name/knitr/demo/output/" target="_blank"> knitr documentation</a>.

<div id="challenge" markdown="1">
## Activity: Add More Code to Your R Markdown

Update your RMD file as follows:

* Add a **new code chunk** that plots the `TEAK_lidarDSM` raster object that you imported above.
Experiment with plot colors and be sure to add a plot title.
* Run the code chunk that you just added to your RMD document in R (e.g. run in console, not
knitting). Does it create a plot with a title?
* In another new code chunk, import and plot another raster file from the NEON data subset
that you downloaded. The `TEAK_lidarCHM` is a good raster to plot.
* Finally, create histograms for both rasters that you've imported into R.
* Be sure to document your steps as you go using both **code comments** and
**markdown syntax** in between the code chunks.

For help opening and plotting raster data in `R`, see the NEON Data Skills tutorial
<a href="http://neondataskills.org/R/Plot-Rasters-In-R/" target="_blank">*Plot Raster Data in R*</a>.

We will knit this document to HTML in the next tutorial.
</div>

Now continue on to the
[next tutorial]({{site.baseurl}}/tutorial-series/pre-institute3/rmd03)
to learn how to knit this document into a HTML file.

## Answers to the Default Text Markdown Syntax Questions

* Are any words in bold? - Yes, “Knit” on line 10
* Are any words in italics? - No
* Are any words highlighted as code? - Yes, “echo = FALSE” on line 22
