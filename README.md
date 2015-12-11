# binary2newick
This script reads the binaray matrix for a phylogenetic tree from an excel file and converts it into newick format.
The first argument specifys the input directory. The second and third argument is optional and define the output directory
and the writing mode (use "w" in the third argument to overwrite and "a" to append to existing file).

Arguments: "inputDir" <"outputDir"> <"mode">

Requires the Openpyxl module to be installed: https://openpyxl.readthedocs.org/
