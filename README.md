# NYC Schools Perceptions

In this guided project, you'll incorporate some additional data into your analysis: Responses to surveys designed to gauge parent, student, and teacher perceptions of the quality of New York City schools. In this guided project, we'll guide you through investigating the following questions:

    Do student, teacher, and parent perceptions of NYC school quality appear to be related to demographic and academic success metrics?

    Do students, teachers, and parents have similar perceptions of NYC school quality?

You can download the data here. The .zip folder contains five files:

    Survey Data Dictionary.xls
    masterfile11_gened_final.xlsx
    masterfile11_gened_final.txt
    masterfile11_d75_final.xlsx
    masterfile11_d75_final.txt

The first file, Survey Data Dictionary.xls, contains metadata that will be useful as you decide how to clean and prepare the survey data for analysis.

The next two files, masterfile11_gened_final.xlsx and masterfile11_gened_final.txt, contain survey data for "general education" schools — those that do not specifically serve populations with special needs.

The files masterfile11_d75_final.xlsx and masterfile11_d75_final.txt contain survey data for District 75 schools, which provide special education support for children with special needs such as learning or physical disabilities.

Why are there duplicate files with different extensions for general education and District 75 schools? The data are presented in formats that can be opened using Microsoft Excel (the .xlxs files) and as unformatted text (the .txt files). Either format can be imported into R, but we recommend working with the .txt files, since you can do so using readr. So far, you've used the read_csv() function in the readr package to import files into R since we've worked with .csv (comma separated value) files.

What happens if you try to read the .txt files into R using read_csv()? You'll get an error message, since values in the .txt files are not separated by commas. If you open the file in the text editor, you'll see that the values appear to be separated by tabs.

Consulting the readr documentation suggests that read_tsv() function, for tab separated values, would be a better choice for importing these data.

Sometimes there's a bit of trial and error involved in figuring out the best function for importing a data file into R. When in doubt, don't hesitate to consult the readr documentation and try a few different options.

Now, it's time for you to download the school survey data and the NYC school data you've already cleaned. Import the files into R as data frames, and use the metadata to make sure you understand the data.

Instructions

    Download the "combined.csv" file here, import it into R, and save it as a data frame.

    Download the zip file containing the school survey data and corresponding data dictionary here.

    Read through the data dictionary, keeping the following questions in mind:
        Do you have any thoughts on which variables will be important for your analysis?
        Can any variables be excluded from the analysis?
        Is there a variable you can use as a key to join the survey data to the combined data set you've already prepared for analysis?

    Import the survey data .txt files (masterfile11_gened_final.txt and masterfile11_d75_final.xlsx) into R using read_tsv() and save them as data frames.

    Remember to load the packages, like readr, that you'll need for your analysis.

    Add text to your R notebook to explain where you downloaded the data from, the packages you've loaded, how you imported the data, and what you learned from the data dictionary.
