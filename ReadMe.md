# [The GC Skew PlotR](https://the1stmartian.shinyapps.io/NYCDA-Shiny/) on ShinyApps.io.


## Overview

In recent years I became interested in investigating the evolutionary history of bacterial genes. Specifically, I was curious how frequently genes switch their orientation as lagging strand encoding can lead to head-on replication-transcription conflicts:

![conflicts](https://github.com/The1stMartian/RShiny_GCskew/blob/master/www/conflicts.png)

The details of these fascinating interactions are discussed in detail in a number of studies including:

[Rocha and Danchin](https://pubmed.ncbi.nlm.nih.gov/14602916/)

Primary research by [Lang et. al](https://pubmed.ncbi.nlm.nih.gov/28802046/)

[A review](https://pubmed.ncbi.nlm.nih.gov/29856930/) by the Merrikh lab 

[Andres Aguilera's lab](https://pubmed.ncbi.nlm.nih.gov/15775982/)


# The problem of inversion detection

It was not immediately clear how one could go about identifying the evolutionary history of genes and their orientation. We can certainly compare orthologous genes in a given species and its evolutionary ancestor, but that is simply a snapshot of evolutionary history. Genes can conceivably change orientation, then change back. What if we missed the change and return by examining the states just before and after the flip-flop? Or what if we didn't look far enough back into evolutionary time to see the change? Alternatively, what if both the ancestral and descendant species both independently flipped the same gene after diverging? Possibilities such as these made it clear that it might not be easy to identify the evolutionary history of gene inversions. 

# The GC Skew as a tool for studying gene inversions

Eventually though I came a cross a possible answer: I noticed that genes on the lagging strand tend to have a particular sequence pattern - a negative GC skew. Here this is illustrated in the <i>C. jejuni</i> genome where a selection of lagging strand genes are depicted in dark blue (lower) and leading strand genes are in light blue (top). The local GC skew values are shown in gray as a moving average, or over whole gene regions (black boxes).   

![GC skew inversion](https://github.com/The1stMartian/RShiny_GCskew/blob/master/www/GCskew.png)

Because this violates the broad trend observed across the chromosome, I considered the possibility that this might be an indication that these lagging strand genes were originally encoded on the opposing strand (the leading strand).

![GC Skew in Mtb](https://github.com/The1stMartian/RShiny_GCskew/blob/master/www/GCskewDiagram.png)

This led us to discover a great deal of evidence that nearly all genes were encoded on the leading strand of the replication fork for nearly all of evolutionary history. It's only recently that genes were added to the lagging strand, likely through random recombination events. As these genes are likely to disrupt replication, selective pressure should drive their return to the leading strand as part of a dynamic equilibrium. However, in some cases it appears that lagging strand encoding can be beneficial:

[Gene inversion potentiates bacterial evolvability and virulence](https://pubmed.ncbi.nlm.nih.gov/30405125/)

# A challenge to our interpretation of the GC Skew

This interpretation has been quite controversial, prompting us to investigate the possibility that our interpretation of GC skew values is incorrect. Therefore we investigated the idea that a positive GC skew is not guaranteed for any gene. In other words, some genes may gain a negative GC skew without inverting. As part of this investigation, we examined GC skew values of 1st, 2nd, or 3rd position nucleotides with the expectation that these three skew values would reveal if mutational pressure drives a positive GC skew in all genes, or if mutations can drive a negative GC skew in some instances. The data strongly suggest that DNA replication is the predominant force affecting the GC skew, and that it drives all (more or less) genes toward a positive GC skew. This suggests that indeed, our interpretations were accurate. 

# Identification of the GC Skew mutational pressure

This can be visualized directly by comparing the GC skew of codon position 3 nucleotides (which should rapidly change and reveal the direction of the mutational pressure), versus codon position 1 nucleotides which should retain their sequence due to selection pressure. For example in <i>M. tuberculosis</i>

![Codon Position 1](https://github.com/The1stMartian/RShiny_GCskew/blob/master/www/Graph1.png)
![Codon Position 3](https://github.com/The1stMartian/RShiny_GCskew/blob/master/www/CP3.png)

# GCskewPlotR
To make it easy to see these differences, I developed GC Skew PlottR, a small R/Shiny based app for displaying the GC skew values of bacterial genes. The values are calculated using all nucleotides or only nucleotides in the 1st, 2nd or 3rd codon positions. We hypothesized that 3rd codon position GC skew values should reveal the direction of mutagenesis - in other words if the GC skew is driven in the positive or negative direction for all genes relative to the leading strand. It appears that this is the case. Therefore, the net negative GC skew values of most genes is likely due to a recent inversion. As such, we concluded that our recent manuscript was accurate. 
 
 # An ongoing debate
 
[A challenge to our manuscript](https://www.biorxiv.org/content/10.1101/2020.01.14.906818v1) claiming that GC skew comparisons cannot be used to identify gene inversions, and arguing that DNA replication is only one of many drivers of the GC skew.

[Our response](https://www.biorxiv.org/content/10.1101/2020.05.26.117366v2.full.pdf) demonstrates that the challenger's data actually supports the validity and accuracy of our own, showing that the GC skew is a high-fidelity means of identifying gene inversions. The discussion also led us to assess a long standing debate about whether DNA replication is truly the main driver of the GC skew profiles visible in bacterial chromosomes. Our work, supported by the codon position 1 versus codon position 3 GC skew comparison suggests that this hypothesis is correct. 
