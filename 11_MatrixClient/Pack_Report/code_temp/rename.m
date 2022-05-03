filenames = ls;
[row,~] = size(filenames);
for ii = 1:(row-2)
    foldername = filenames(ii+2,:);
    if isfolder(foldername)
        command = ['ren ',pwd,'\',foldername,' VRU_STOP_',foldername];
        dos(command);
    end
end