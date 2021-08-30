

fluidPage(title="GS Skew PlotR",
  titlePanel(title=h4("Bacterial GC Skew\nAnalysis by Gene Orientation", align="center")),
  sidebarPanel(
    selectizeInput("species","Bacterial Species", list("M.tuberculosis", "B.subtilis", "E.coli", "M.gallisepticum")),
    selectizeInput("codon","GC Skew Calculation Method", list("WholeGene", "CP1", "CP2", "CP3"))),
  mainPanel(tabsetPanel(type = "tabs", 
            tabPanel(title="Hypothesis",includeHTML("./www/hypothesis.html")),
            tabPanel(title="Plots", fluidRow(br(), h4("GC Skew values binned by gene orientation:", align="center"),
                                             br(),tabPanelBody("Graphs", plotOutput("plot1"), br(), h4("GC Skew values", align="center"),
                                             h4("sorted by whole-gene values,", align="center"), h4("binned by gene orientation", align="center"),
                                             (plotOutput("plot2"))))),
            tabPanel(title="Conclusions", includeHTML("./www/conclusions.html")))))