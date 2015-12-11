# binary2newick
Providing scripts to use in python and matlab.
The script reads the binaray matrix for a phylogenetic tree from an excel file and converts it into newick format.
The first argument specifys the input directory. The second and third argument is optional and define the output directory
and the writing mode (use "w" in the third argument to overwrite and "a"(in python) or "at" (in matlab) to append to existing file).

Arguments: "inputDir" <"outputDir"> <"mode">

Notice:
The python script requires the Openpyxl module: https://openpyxl.readthedocs.org/
