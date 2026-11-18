# 0. Preparation
#    a) Confirm your R session is currently in you expected course folder using getwd():
getwd()
#    b) Check that the following folders exist in your course folder:
dir.exists("exercise")
#    c) If the "exercise" folder does not exist, uncomment and run the code
#       below to create it:
# dir.create("exercise")
#    d) Save the provided "ex141_uk_migration.qmd" in your exercise folder.
download.file(url = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise/ex141_uk_migration.qmd", 
              destfile = "./exericise/ex141_uk_migration.qmd")

# 1. YAML Configuration
#    a) Open "ex141_uk_migration.qmd".
file.show("./exercise/ex141_uk_migration.qmd")
#    b) In the YAML header (between the --- lines), add the title: "UK Net Migration: 1950-2023".
#    c) Add your name as the author.
#    d) Set the format to html.
#    e) Under execute, set echo, warning, and message to false so the overall report is clean.

# 2. Markdown Formatting
#    a) In the Introduction, make the phrase "net migration" bold.
#    b) In the Introduction, make the phrase "United Kingdom" italicised.
#    c) In the Introduction, turn the text "United Nations World Population Prospects" 
#       into a hyperlink pointing to: https://population.un.org/wpp/
#    d) Create Level 1 headings (using #) for all five section titles (e.g., Introduction, 
#       Post-War Dynamics, etc.).

# 3. Code Chunk Options
#    a) In the first code chunk (label: setup), add the `include: false` option 
#       so that the data loading process is completely hidden from the report.
#    b) Scroll to the final section ("Methodology: Plotting the Time Series"). 
#       We want this specific chunk to show the code and be a different size.
#    c) Add the chunk option `echo: true` to override your global YAML settings.
#    d) Add the chunk options `fig-width: 10` and `fig-height: 4` to make the plot wider.

# 4. Rendering
#    a) Save the "uk_migration.qmd" file.
#    b) Click the "Render" button at the top of the RStudio editor to generate 
#       the HTML report. Inspect the output.
#    c) To generate a Word document, click the small dropdown arrow next to the 
#       Render button and select "Render MS Word".