### Created by Justin Freels
### email: jfreels@gmail.com
### twitter: https://twitter.com/jfreels4
### github: https://github.com/jfreels


shinyUI(pageWithSidebar(
  headerPanel("Time Series Data: Import, Manipulation, and Export"),
  sidebarPanel(
    radioButtons(inputId="upload",label="Would you like to use an uploaded dataset?",choices=c("Yes","No"),selected="No"),
    conditionalPanel(
      condition="input.upload=='Yes'",
      helpText("Import data from a CSV file in the format of the \"Example\" tab."),
      helpText("The \"date\" column should be formatted yyyy/mm/dd."),
      fileInput(inputId="csv", label="Select CSV file:")
    ),
    uiOutput("example_choose_fund"),
    uiOutput("upload_choose_fund"),
    # how to format the data?
    radioButtons(inputId="data_subset",label="Common Timeframe or Full Track Record?",choices=c("Common","Full"),selected="Common"),
    radioButtons(inputId="data_format",label="Wide Data or Long Data?",choices=c("Wide","Long"),selected="Wide"),
    uiOutput("data_start_date"),
    uiOutput("data_end_date"),
    # download button
    textInput(inputId="exportName",label="File name of exported data:"),
    downloadButton(outputId="exportData",label="Export Data"),
    # contact info
    helpText(HTML("<br>*Created by: <a href = \"https://twitter.com/jfreels4\">@jfreels4</a>
                  <br>*github <a href = \"https://github.com/jfreels/fund_import_export\">code</a>
                  ")
    )
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Data Preview",
        verbatimTextOutput("data_export_str"),
        verbatimTextOutput("data_export_summary")
      ),
      tabPanel("Example",
        tableOutput("example")
      )
    )
  )
))