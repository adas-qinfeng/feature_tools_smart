workpath = pwd;
filenames = ls;
[row,~] = size(filenames);
fid = fopen('unique id list.txt','w');
for ii = 1:(row-2)
    foldername = filenames(ii+2,:);
    if isfolder(foldername)
        subpath = [workpath,'\',foldername];
        cd(subpath);
        files = ls;
        temp = files(end,:);
        uiID = temp(28:40);
        fprintf(fid,[uiID,'\n']);
    end
    cd(workpath);
end
fclose(fid);
