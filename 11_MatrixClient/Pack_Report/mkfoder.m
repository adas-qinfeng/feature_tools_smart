pack_struct = dir('*.pack');
mp4_struct = dir('*.mp4');
jpg_struct = dir('*.jpg');
asc_struct = dir('*.asc');
mp4_cell = struct2cell(mp4_struct);
jpg_cell = struct2cell(jpg_struct);
asc_cell = struct2cell(asc_struct);
pack_cell = struct2cell(pack_struct);
try
    dir = fcn_mkfoder(mp4_cell);
end
try
    dir = fcn_mkfoder(jpg_cell);
end
try
    dir = fcn_mkfoder(asc_cell);
end
fcn_mkfoder_pack(pack_cell,dir);

function mininame = fcn_mkfoder(cell)
    [~,coml] = size(cell);
    name = cell{1,1};
    mininame = name(1:end-6);
    mkdir(mininame);
    for ii = 1:coml
        filename = cell{1,ii};
        movefile(filename,mininame)
    end
end
function fcn_mkfoder_pack(cell,path)
    [~,coml] = size(cell);
    for ii = 1:coml
        filename = cell{1,ii};
        movefile(filename,path)
    end
end