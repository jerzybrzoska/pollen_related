#!/usr/local/bin/julia-1.5.1/bin/julia

#=The following code extracts text from .docx files and saves it in .html.pmd text files used in 
Pollen markdown. If you prefer another extension modifiy the relevant line in the function definition of docxToMarkdown, e.g. 
"outputFile = replace(file, ".docx" => ".txt")" would convert your .docx files to .txt files
Subsequently, the script deletes .docx files that it has already converted. 
If you would like to keep the original .docx file just comment out or delete the "rm(file)" line 
in the function definition of docxToMarkdown.=#

using Glob, Taro

wd = pwd() #its type is String

function docxToMarkdown(file::String)
 outputFile = replace(file, ".docx" => ".html.pmd")
 meta, text = Taro.extract(file)
 open(outputFile, "w") do f
    write(f, text)
 end
 rm(file)
end

Taro.init()

pattern = "*.docx"

for i::Int8 in 1:127 #The maximal directory depth that Int8 allows us to use
 listOfFiles::Array{String,1} = glob(pattern, wd) 
 for file::String in listOfFiles
   docxToMarkdown(file)
 end
 global pattern = "**/" * pattern
end

#= The following resources 
https://github.com/rofinn/FilePaths.jl
https://github.com/rofinn/FilePathsBase.jl
https://github.com/vtjnash/Glob.jl
https://stackoverflow.com/questions/20484581/search-for-files-in-a-folder
https://rosettacode.org/wiki/Walk_a_directory/Recursively#Julia
https://github.com/bmc/Eglob.jl ] add Eglob gives me The following package names could not be resolved:
 * Eglob (not found in project, manifest or registry). My inability to install eglob was the primary 
 reason for writing a loop that concatenates "**/" with the variable pattern.
=#
