# 1. Use File | New Project... to create a new R project file a directory on your computer. 
##
#    If you have a directory already on your computer for this course, you can 
#    use that directory as the location of the new R project file. 
##
#    If you do not have a directory for this course, create a new directory on 
#    your computer and use that as the location of the new R project file.
# 2. Open your R session in the course folder on your computer. 
##
# 3. Confirm your R session is currently in you expected course folder using getwd():
getwd()
# 4. Run the code below to create new folders in your directory to store your
#    course files:
#    a. exercise
#    b. exercise-solutions
#    c. exercise-data
#    d. slides-code
#    e. slides-pdf
dir.create("exercise")
dir.create("exercise-solution")
dir.create("exercise-data")
dir.create("slides-code")
dir.create("slides-data")
dir.create("slides-pdf")
#  5. Run the following code to download the slided code on GitHub to your computer.
x <- c("01_intro.R", "02_basics1.R", "03_basics2.R", "04_plot1.R", "05_plot2.R", "06_plot3.R")
for(i in x){
  u <- paste0("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/slides-code/", i)
  f <- paste0("./slides-code/", i)
  download.file(url = u, destfile = f, mode = "wb")
}
# 6. Tidy up your project directory by moving other files to the appropriate 
#    folders. For example, move the exercise files already on your computer to 
#    the "exercise" folder, and the slides PDF files (from Moodle) to the 
#    "slides-pdf" folder. 
#
#    You can do this manually or by adapting the code above.
