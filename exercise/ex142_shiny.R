# 0. Preparation
#    a) Confirm your R session is currently in your expected course folder using getwd().
getwd()
#    b) Check that the following folders exist in your course folder:
dir.exists("exercise")
#    c) If the "exercise" folder does not exist, uncomment and run the code
#       below to create it:
# dir.create("exercise")
#    d) Run the code below to create a new folder called "ex142_shiny" in 
#       your current working directory.
dir.create("./exercise/ex142_shiny", recursive = TRUE)
#    d) Run the code below to download the app.R template from GitHub directly 
#       into your new folder.
download.file(
  url = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise/ex142_shiny/app.R",
  destfile = "./exercise/ex142_shiny/app.R", 
  mode = "wb"
)
#    e) If you haven't already, install the 'arrow' and `shiny` package by running 
# install.packages("shiny")
# install.packages("arrow") 

# 1. Open the App Template
#    a) Run the code below to open the newly downloaded "app.R" file located inside 
#       the "ex142_shiny" folder.
system2(command = 'open', args = "./exercise/ex142_shiny/app.R")
#    b) Run lines 1 to 12 to check the data can be read into your computer.
#    c) Run the line below to check you have the country_choices object created
country_choices

# 2. Complete the User Interface (UI)
#    a) Add a selectInput() for the country, using the grouped 'country_choices'.
#    b) Add a plotOutput() in the main panel and assign it the ID "pyramid".

# 3. Complete the Server Logic
#    a) Finish the 'country_max_pop' reactive expression to find the maximum 
#       population (male or female) for the selected country across ALL years. 
#       This ensures the x-axis remains fixed during animation.
#    b) Finish the 'pyramid_data' reactive expression by filtering for both the 
#       selected country and year.
#    c) Complete the renderPlot() code by setting the limits in scale_x_continuous() 
#       using your 'country_max_pop' reactive, and labelling the x-axis.

# 4. Run the Application
#    Click the "Run App" button in the top right of the script editor to test your code.

# 5. Publish to Posit Connect Cloud
#    a) With your app running successfully, click the blue "Publish" button in the 
#       top right corner of the app window.
#    b) Select "Posit Connect Cloud" from the options.
#    c) If you do not already have an account, follow the web prompts to create a 
#       free account.
#    d) Follow the instructions to link your RStudio session to your new account.
#    e) Deploy the app. Once finished, it will open in your web browser. Share the URL!
