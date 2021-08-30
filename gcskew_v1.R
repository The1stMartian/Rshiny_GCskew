#rm(list = ls())
library(shiny)
library(ggplot2)
library(dplyr)

#Load the data
mtb = data.frame(read.csv("./www/mtb.csv"))
bsu = data.frame(read.csv("./www/jh642.csv"))
eco = data.frame(read.csv("./www/eco.csv"))
mga = data.frame(read.csv("./www/mgal.csv"))
# Place the data in order by Whole Gene GC skew column values
M.tuberculosis = mtb %>%  group_by(ori) %>% arrange(desc(WholeGene)) %>% mutate(position=row_number())
B.subtilis = bsu %>%  group_by(ori) %>% arrange(desc(WholeGene)) %>% mutate(position=row_number())
E.coli = eco %>%  group_by(ori) %>% arrange(desc(WholeGene)) %>% mutate(position=row_number())
M.gallisepticum = mga %>%  group_by(ori) %>% arrange(desc(WholeGene)) %>% mutate(position=row_number())

plotHist = function(inputDF, species, GCScolumn, GCSmethod){
  inputDF %>% ggplot(., aes(x = get(GCScolumn, inputDF))) +
    geom_area(stat="bin", binwidth = 0.01, aes(fill = ori, alpha = 0.5, guide = "None"), position = "dodge") +
    guides(alpha=FALSE) +
    scale_fill_brewer(palette = "Set1", name = "Gene\nOrientation") +
    geom_freqpoly(aes(fill = ori), binwidth = 0.01) +
    xlab("GC Skew Value") +
    ylab("Number of Genes") +
    ggtitle(paste(species,"\n",GCSmethod)) +
    theme(plot.title = element_text(hjust = 0.5)) + 
    coord_cartesian(xlim=c(-1, 1))}

# Plots GCS data by column
plotCol = function(inputDF, species, GCScolumn){
  inputDF %>% ggplot(aes(x = position, y = get(GCScolumn, inputDF))) + 
    geom_col(aes(color = ori), position = "dodge") +
    xlab("Each Gene") +
    ylab("GC Skew Value") +
    scale_color_brewer(palette = "Set1", name = "Gene\nOrientation") +
    theme(plot.title = element_text(hjust = 0.5))}

ui <- fluidPage(
  titlePanel(title=h4("Bacterial GC Skew\nAnalysis by Gene Orientation", align="center")),
  sidebarPanel( 
    selectizeInput("species","Select Item to Display", list("M.tuberculosis", "B.subtilis", "E.coli", "M.gallisepticum")),
    selectizeInput("codon","Select Item to Display", list("WholeGene", "CP1", "CP2", "CP3"))),
  mainPanel(fluidRow(
    plotOutput("plot1")), (plotOutput("plot2"))))

server <- function(input,output){
    output$plot1<-renderPlot({plotHist(eval(parse(text=input$species)), toString(input$species), input$codon, input$codon)},height = 400,width = 600)
    output$plot2<-renderPlot({plotCol(eval(parse(text=input$species)), toString(input$species), input$codon)},height = 400,width = 600)}
  
shinyApp(ui, server)