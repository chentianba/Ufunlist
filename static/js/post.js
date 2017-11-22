$(function () {

    $('[data-toggle="tooltip"]').tooltip();

    function validFileType(file) {
        var fileTypes = [
            'image/jpeg',
            'image/pjpeg',
            'image/png'
        ];
        for(var i = 0; i < fileTypes.length; i++) {
            if(file.type === fileTypes[i]) {
                return true;
            }
        }
        return false;
    }

    function updateImageDisplay() {
        //console.log('nihao');
        var fileinput=$("#file");
        var preview=$("#preview");
        preview.empty();
        var curFiles=fileinput.prop('files');
        if(curFiles.length==0)
        {
            var para=$('<li class="list-inline-item px-1 text-secondary">未选择任何图片</li>');
            preview.append(para);
        }
        else
        {
            //console.log('add file');
            var hasValidFile=false;
            for(var i=0;i<curFiles.length;++i)
            {
                if(validFileType(curFiles[i]))
                {
                    var listItem=$('<li class="list-inline-item bg-info text-white px-1 rounded my-1">'+curFiles[i].name+'</li>');
                    preview.append(listItem);
                }
                else
                    hasValidFile=true;
            }
            if(hasValidFile)
            {
                $('#fileModal').modal();
            }
        }
    }

    $("#file").on("change",updateImageDisplay);

    $("#contactWay").change(function () {
        var contactName = [
            "phone","email","qq","wechat"
        ];
        var inputType= [ "tel","email","text","text" ];
        var i=$(this).val();
        var contactInput=$('#contactInputList');
        contactInput.removeAttr('pattern');
        contactInput.attr('list',contactName[i]);
        contactInput.attr('type',inputType[i]);
        if(i==0)
        {
           contactInput.attr('pattern','\\d{11}');
        }
        else if(i==2)
        {
            contactInput.attr('pattern','[^0]\\d{4,9}');
        }
    });
    function updateSubCategory(index) {
        var subCategoryName = [
            ["本科生","研究生","博士生"],
            ["校内通知", "院系通知", "社团活动"],
            ["卖物","求购"],
            ["男生","女生"],
            ["重要证件","较大价值","普通物件"],
            ["全职","兼职"]
        ];
        var subCategoryBtn=$('#subCategory');
        subCategoryBtn.empty();
        var i=(index==1?2:0);
        for(;i<subCategoryName[index].length;++i)
        {
            //subCategoryBtn.append($('<option value='+index+'>'+subCategoryName[index][i]+'</option>'));
            $('<option value='+i+'>'+subCategoryName[index][i]+'</option>').appendTo(subCategoryBtn);
        }
    }
    $('#topCategory').change(function () {
        var i=$(this).val();
        updateSubCategory(i);

        $('#activeTimeGroup').removeAttr('hidden');
        $('#contactInputGroup').removeAttr('hidden');
        $('#fileInputRow').removeAttr('hidden');

        $('#contactInputList').attr('type','text');
        $('#activeTime').attr('type','number');
        $('#file').attr('type','file');

        if(i==2)
        {
            $('#titleCol').removeClass("col-sm-12").addClass("col-sm-9");
            $('#extraInfoName').html('价格');
            $('#extraInfoGroup').removeAttr('hidden');
            $('#subtitle').attr('type','number');
        }
        else if(i==5)
        {
            $('#titleCol').removeClass("col-sm-12").addClass("col-sm-9");
            $('#extraInfoName').html('月薪');
            $('#extraInfoGroup').removeAttr('hidden');
            $('#subtitle').attr('type','number');
        }
        else
        {
            $('#subtitle').attr('type','hidden');
            $('#extraInfoGroup').attr('hidden','');
            $('#titleCol').removeClass("col-sm-9").addClass("col-sm-12");
            if(i==0)
            {
                $('#activeTimeGroup').attr('hidden','');
                $('#contactInputGroup').attr('hidden','');
                $('#fileInputRow').attr('hidden','');

                $('#activeTime').attr('type','hidden');
                $('#contactInputList').attr('type','hidden');
                $('#file').attr('type','hidden');
                $('#fileInputRow').attr('hidden','');
            }
        }
    });
    $('#postForm').submit(function () {
        //alert($('#postForm').serialize());
        $('#postBtn').html('<i class="fa fa-spinner fa-spin fa-1x fa-fw"></i> 正在提交');
    });
    $('#topCategory').trigger('change');
    //console.log('nihao');
});