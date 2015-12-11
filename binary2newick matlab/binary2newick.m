function output = binary2newick(inputPath, varargin)

% This script reads a binary tree matrix from an excel file and converts
% it into the newick format. The excel file must not contain anything but the matrix.
% The first argument specifys the input path. If
% no other arguments are used, the script writes the result to the standard
% output (newick output.txt) and overwrites, if the file already exists. To
% change the output directory, use a second argument to specify the output
% directory and a third argument to set the writing mode ('w': overwrite,
% 'at': append to existing file).

outputPath = 'newick output.txt';
mode = 'w';
if ~isempty(varargin)
    outputPath = varargin{1};
    mode = varargin{2};
end

    [num,txt,raw] = xlsread(inputPath);
    for i = 1:size(num, 1)
        subTrees{i} = 'e';
    end
    
    IndexStart = 1;
    
    for i = 1:size(num, 2)
        buffer = {};
        bufferIndex = 1;
        check = true;
        for j = 1:size(num, 1)
            if num(j, i) == 1
                if check
                    IndexStart = j;
                    check = false;
                end
                if ~strcmp(subTrees{j}, 'e') && ~strcmp('x', subTrees{j})
                    buffer(bufferIndex) = subTrees(j);
                    bufferIndex = bufferIndex+1;
                    subTrees(j) = cellstr('x');
                elseif strcmp(subTrees{j}, 'e')
                    buffer(bufferIndex) = cellstr(strrep(txt{j}, ' ', '_'));
                    bufferIndex = bufferIndex+1;
                    subTrees(j) = cellstr('x');
                end
            end
        end
        subTrees(IndexStart) = cellstr(createClade(buffer));
    end
    subTrees(1) = cellstr(strcat(subTrees{1}, ';'));
    output = subTrees(1);
    fid  = fopen(outputPath,mode);
    fprintf(fid, '%s\n', subTrees{1});
    fclose(fid);
    
end


%This function takes a cell arresultray of subtree strings and returns them as
%concatinated string in format of a newick clade.
function output = createClade(input)
    output = strcat('(', input{1});
    for i=2:1:size(input, 2)
        output = strcat(output, ',', input{i});
    end
    output = strcat(output, ')');
end