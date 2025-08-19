# [The GC Skew PlotR](https://the1stmartian.shinyapps.io/NYCDA-Shiny/) on ShinyApps.io.


## Overview

I have an interest in the evolutionary history of bacterial genes - specifically, how frequently genes switch their orientation. Considering that lagging strand encoding can lead to disasterous head-on replication-transcription conflicts, the common creation of new lagging strand genes is a surprising phenomenon.

![conflicts](https://github.com/The1stMartian/RShiny_GCskew/blob/master/www/conflicts.png)

The details of these interactions are discussed in detail in a number of studies including:

[Rocha and Danchin](https://pubmed.ncbi.nlm.nih.gov/14602916/)

Primary research by [Lang et. al](https://pubmed.ncbi.nlm.nih.gov/28802046/)

[A review](https://pubmed.ncbi.nlm.nih.gov/29856930/) by the Merrikh lab 

[Andres Aguilera's lab](https://pubmed.ncbi.nlm.nih.gov/15775982/)


# The problem of inversion detection

Identifying the evolutionary history of genes in terms of their orientation was challenging. We could certainly compare orthologous genes in a given species to those in an evolutionary ancestor, but that only provides an isolated snapshot of evolutionary history.  Over any arbitrary time period a given gene might be arranged in an atypical orientation. Therefore, new methods are needed. 

# The GC Skew as a tool for studying gene inversions

One possibility was investigating a particular sequence pattern that appeared almost exclusively in lagging strand - a negative GC skew. Here this is illustrated in the <i>C. jejuni</i> genome where several lagging strand genes are depicted in dark blue (lower) and leading strand genes are in light blue (top). The local GC skew values are shown in gray as a moving average, or over whole gene regions (black boxes).   

![GC skew inversion](https://github.com/The1stMartian/RShiny_GCskew/blob/master/www/GCskew.png)

Because negative GC skew values violate the broad trend observed across the chromosome, they might be an indication that these lagging strand genes were originally encoded on the opposing strand (the leading strand). A flipping event would fully explain the both the magnitude and negative sign.

![GC Skew in Mtb](https://github.com/The1stMartian/RShiny_GCskew/blob/master/www/GCskewDiagram.png)

Our further investigations revealed a wide array of evidence, strongly suggesting that nearly all bacterial genes, in species across the evolutionatry tree, were encoded on the leading strand throughout evolutionary history. It's only recently that most laggign strand genes were created via inversion, likely through random recombination events. As these lagging strand genes are likely to disrupt replication, selective pressure should drive their return to the leading strand as part of a dynamic equilibrium. However, lagging strand genes have a higher rate of apparently beneficial mutations. This could be conferred the higher rate of mutagenesis caused by head-on replication-transcription conflicts. As such, it appears that lagging strand encoding can be beneficial in some cases: by increasing mutation rates in genes that under selection a beneficial mutation can be found faster. Thus we proposed that the lagging strand orientation can be retained as a hitchiker after a beneficial mutation is found. But if a gene is repeatedly under selection for different mutations, the lagging strand orientation might be maintained as a beneficial feature, despite the negative effects on replication.

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

[Our response](https://www.biorxiv.org/content/10.1101/2020.05.26.117366v2.full.pdf) demonstrates that the challenger's data actually supports the validity and accuracy of our analyses, showing that the GC skew is a high-fidelity means of identifying gene inversions. The discussion also led us to assess a long standing debate about whether DNA replication is truly the main driver of the GC skew profiles visible in bacterial chromosomes. Our work, now supported by a comparison of GC skew values in codon positions 1 versus 3, suggests that our original hypotheses and analyses are correct. 
