clc;
warning off;
fid = fopen('errorlist.txt','w');
workpath = pwd;
pack_report_path = [pwd,'\Pack_Report'];
pack_struct = dir('**\*.pack');
pack_cell = struct2cell(pack_struct);
if ~isempty(pack_struct)
    [~,coml] = size(pack_cell);
    for ii = 1:coml
        packname = pack_cell{1,ii};
        packpath = pack_cell{2,ii};
        mininame = packname(1:end-7);
        pack_1 = [mininame,'_1.pack'];
        pack_5 = [mininame,'_5.pack'];  
        logic_value = cellfun(@(x) strcmp(x,pack_1),pack_cell,'UniformOutput',false);
        logic_value = cell2mat(logic_value);
        num_pack1 = find(logic_value==true);
        if isempty(num_pack1)
            fprintf(fid ,[pack_1,'数据不存在\n']);
        end
        logic_value = cellfun(@(x) strcmp(x,pack_5),pack_cell,'UniformOutput',false);
        logic_value = cell2mat(logic_value);
        num_pack5 = find(logic_value==true);
        if isempty(num_pack5)
            fprintf(fid ,[pack_5,'数据不存在\n']);
        end
        try
            movefile([packpath,'\',pack_1],pack_report_path);
            movefile([packpath,'\',pack_5],pack_report_path);
        catch
            
        end
    end
end
sucess_count =0;
if ~isempty(pack_struct)
    cd(pack_report_path);
    [~,coml] = size(pack_cell);
    mininame_last = ' ';
    for ii = 1:coml
        packname = pack_cell{1,ii};
        packpath = pack_cell{2,ii};
        mininame = packname(1:end-7);
        if mininame_last == mininame
            continue;
        else
            pack_name = [mininame,'.pack'];
            pack_1 = [mininame,'_1.pack'];
            pack_5 = [mininame,'_5.pack'];
            command = ['pack-report.exe ',mininame,'_1.pack -combine -Image ',mininame,'_5.pack  ',mininame,'.pack'];
            try
                m = dos(command);
                delete(pack_1);
                delete(pack_5);
                movefile(pack_name,packpath);
                handle = helpdlg([pack_name,'转换成功!!!']);
                pause(1);
                close(handle);
                disp([pack_name,'转换成功!!!']);
                sucess_count = sucess_count + 1 ;
            catch
                fprintf(fid ,[pack_name,'转换失败\n']);
                disp([pack_name,'转换失败!!!！！！']);
            end
            mininame_last = mininame;
        end
    end
end
cd(workpath);
fclose(fid);
