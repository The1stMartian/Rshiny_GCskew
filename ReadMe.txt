The GC Skew PlottR app is  [hosted](https://the1stmartian.shinyapps.io/NYCDA-Shiny/) on ShinyApps.io.

## Overview
Over recent year I became interested in investigating the evolutionary history of bacterial genes. Specifically, I was curious how frequently genes switch their orientation as lagging strand encoding can lead to head-on replication-transcription conflicts. This concept is discussed in detail in a number of studies including:

- Rocha EPC, Danchin A. Gene essentiality determines chromosome organisation in bacteria. Nucleic Acids Res. 2003;31:6570–6577. doi: 10.1093/nar/gkg859.
- Lang KS, et al. Replication-transcription conflicts generate R-loops that orchestrate bacterial stress survival and pathogenesis. Cell. 2017;170:787.e18–799.e18. doi: 10.1016/j.cell.2017.07.044.
- Merrikh CN, Brewer BJ, Merrikh H. The B. subtilis accessory helicase PcrA facilitates DNA replication through transcription units. PLoS Genet. 2015;11:e1005289.
- Lin YL, Pasero P. Interference between DNA replication and transcription as a cause of genomic instability. Curr. Genomics. 2012;13:65–73. doi: 10.2174/138920212799034767.
- Prado F, Aguilera A. Impairment of replication fork progression mediates RNA polII transcription-associated recombination. EMBO J. 2005;24:1267–1276. doi: 10.1038/sj.emboj.7600602.

![conflicts](https://github.com/The1stMartian/RShiny_GCskew/blob/master/www/conflicts.png)

# The problem of inversion detection

It was not immediately clear how one could go about identifying the evolutionary history of genes and their orientation. We can certainly compare orthologous genes in a given species and its evolutionary ancestor, but that is simply a snapshot of evolutionary history. Genes can conceivably change orientation, then change back. What if we missed the change and return by examining the states just before and after the flip-flop? Or what if we didn't look far enough back into evolutionary time to see the change? Alternatively, what if both the ancestral and descendant species both independently flipped the same gene after diverging? Possibilities such as these made it clear that it might not be easy to identify the evolutionary history of gene inversions. 

# The GC Skew as a tool for studying gene inversions

Eventually though I came a cross a possible answer: I noticed that genes on the lagging strand tend to have a particular sequence pattern - a negative GC skew. Here this is illustrated in the <i>C. jejuni</i> genome where a selection of lagging strand genes are depicted in dark blue (lower) and leading strand genes are in light blue (top). The local GC skew values are shown in gray as a moving average, or over whole gene regions (black boxes).   

![GC skew inversion](https://github.com/The1stMartian/NYCDA-Shiny/blob/master/www/GCskew.png)

Because this violates the broad trend observed across the chromosome, I considered the possibility that this might be an indication that these lagging strand genes were originally encoded on the opposing strand (the leading strand).

![GC Skew in Mtb](https://github.com/The1stMartian/RShiny_GCskew/blob/master/www/GCskewDiagram.png)

This led us to discover a great deal of evidence that nearly all genes were encoded on the leading strand of the replication fork for nearly all of evolutionary history. It's only recently that genes were added to the lagging strand, likely through random recombination events. As these genes are likely to disrupt replication, selective pressure should drive their return to the leading strand as part of a dynamic equilibrium. However, in some cases it appears that lagging strand encoding can be beneficial:

[Gene inversion potentiates bacterial evolvability and virulence](https://pubmed.ncbi.nlm.nih.gov/30405125/)

# A challenge to our interpretation of the GC Skew

This interpretation has been quite controversial, prompting us to investigate the possibility that our interpretation of GC skew values is incorrect. Therefore we investigated the idea that a positive GC skew is not guaranteed for any gene. In other words, some genes may gain a negative GC skew without inverting. As part of this investigation, we examined GC skew values of 1st, 2nd, or 3rd position nucleotides with the expectation that these three skew values would reveal if mutational pressure drives a positive GC skew in all genes, or if mutations can drive a negative GC skew in some instances. The data strongly suggest that DNA replication drives all genes to gain a positive GC skew. This suggests that indeed, our interpretations were accurate. 

The GC Skew PlottR is a small R/Shiny based app for displaying the GC skew values of bacterial genes. The values are calculated using all nucleotides or only nucleotides in the 1st, 2nd or 3rd codon positions. We hypothesized that 3rd codon position GC skew values should reveal the direction of mutagenesis - in other words if the GC skew is driven in the positive or negative direction for all genes relative to the leading strand. It appears that this is the case. Therefore, the net negative GC skew values of most genes is likely due to a recent inversion. As such, we concluded that our recent manuscript was accurate. 

[A challenge to our manuscript](https://www.biorxiv.org/content/10.1101/2020.01.14.906818v1)

[Our response](https://www.biorxiv.org/content/10.1101/2020.05.26.117366v2.full.pdf)
