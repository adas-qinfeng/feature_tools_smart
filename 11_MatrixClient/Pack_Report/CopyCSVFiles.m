csvname = dir('*.csv');
name = csvname.name;
filenames = ls;
[row,~] = size(filenames);
for ii = 1:(row-2)
    foldername = filenames(ii+2,:)
    if isfolder(foldername)
        copyflag = copyfile(name,foldername,'f');
        if copyflag
            handle = helpdlg([foldername,'Copy成功!']);
            pause(0.5);
            close(handle);
        end
    end
end