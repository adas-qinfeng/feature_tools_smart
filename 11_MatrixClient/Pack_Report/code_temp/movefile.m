warning off;
txtfilename = 'list_filenames.txt';  %读写的txt 
destination = 'CBNA';
mkdir(destination);
file_cell = textread(txtfilename,'%s');
for ii = 1:length(file_cell)
    [foldername,filename,ext] = fileparts(file_cell{ii});
    try
    movefile(foldername,destination,'f');
    catch
        disp('move failed');
    end
end

