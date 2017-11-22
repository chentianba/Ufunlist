$(function () {
    var curPageNum=1;
    function updateSubCategory(index) {
        var subCategoryName = [
            ["本科生","研究生","博士生", "全部"],
            ["校内通知","院系通知","社团活动","全部"],
            ["卖物","求购","全部"],
            ["男生","女生","全部"],
            ["重要证件","较大价值","普通物件","全部"],
            ["全职","兼职","全部"],
            ["全部"]
        ];
        var subCategoryBtn=$('#subCategory');
        subCategoryBtn.empty();
        for(var i=0;i<subCategoryName[index].length;++i)
        {
            //subCategoryBtn.append($('<option value='+index+'>'+subCategoryName[index][i]+'</option>'));
            $('<option value='+i+'>'+subCategoryName[index][i]+'</option>').appendTo(subCategoryBtn);
           // console.log('<option value='+i+'>'+subCategoryName[index][i]+'</option>');
        }
    }
    $('#topCategory').change(function () {
        $('#searchInput').val('');
        var i=$(this).val();
        updateSubCategory(i);

        $('#subCategory').trigger('change');
    });
    function disablePageBtn(curPage, totalPage) {
        if(curPage==1)
            $('#prevPage').parent().addClass('disabled');
        else
            $('#prevPage').parent().removeClass('disabled');

        if(curPage==totalPage)
            $('#nextPage').parent().addClass('disabled');
        else
            $('#nextPage').parent().removeClass('disabled');
    }
    function getDataAndShow(url,info) {
        //return json format:
        // {
        //   pageNum: 1,
        //   totalPage: 10,
        //   postList:[
        //     {title: 'abc', hasPic:  0, extraInfo: '月薪5000', popularity: 200, url: #, show_popularity:true},
        //     {title: ....},...
        //   ]
        // }
        $.post(url,info,function (data) {
            console.log(data)
            var pageNum=data.pageNum;
            var totalPageNum=data.totalPage;
            var listGroup=$('#postListGroup');
            curPageNum=pageNum;
            $('#pageNum').text(pageNum+' / '+totalPageNum);
            disablePageBtn(pageNum,totalPageNum);
            /*if(pageNum==1)
                $('#prevPage').parent().addClass('disabled');
            else
                $('#prevPage').parent().removeClass('disabled');
            if(pageNum==totalPageNum)
                $('#nextPage').parent().addClass('disabled');
            else
                $('#nextPage').parent().removeClass('disabled');*/

            listGroup.empty();
            for(i in data.postList)
            {
                var picStr='';
                if(data.postList[i].hasPic)
                    picStr='<i class="fa fa-image ml-1"></i>';
                if(data.postList[i].show_popularity){
                    listGroup.append($('<a href="'+data.postList[i].url+'" class="list-group-item list-group-item-action no-background border-bottom rounded-0 p-2 \
                                               d-flex flex-row align-items-center break-word">' + data.postList[i].title + picStr+
                                '<span class="badge badge-info mx-1">'+data.postList[i].extraInfo+'</span> \
                                <span class="badge-pill badge-secondary font-small ml-auto">'+data.postList[i].popularity+'</span> \
                            </a>)'));
                } else {
                    listGroup.append($('<a href="'+data.postList[i].url+'" class="list-group-item list-group-item-action no-background border-bottom rounded-0 p-2 \
                                               d-flex flex-row align-items-center break-word">' + data.postList[i].title + picStr+
                                '<span class="badge badge-info ml-1">'+data.postList[i].extraInfo+'</span> \
                            </a>)'));
                }
            }
            $('#refreshIcon').removeClass('fa-spin');
        },'json');
    }
    $('#subCategory').change(function () {
        //var topCtgr=$('#topCategory').val();
        //var subCtgr=$(this).val();
        var info=$('#topCategory, #subCategory, #curUniId, #searchForm').serialize()+'&pageNum=1';
        // alert(info);
        getDataAndShow('/search/getpage/',info);
    });
    $('#searchForm').submit(function () {
        event.preventDefault();
        var info=$('#searchForm, #topCategory ,#subCategory, #curUniId').serialize()+'&pageNum=1';
       // console.log(info);
        getDataAndShow('/search/getpage/',info);
    });
    $('#prevPage').click(function () {
        var info=$('#searchForm, #topCategory ,#subCategory, #curUniId').serialize()+'&pageNum='+(curPageNum-1);
         //alert(info);
        getDataAndShow('/search/getpage/',info);
    });
    $('#nextPage').click(function () {
        var info=$('#searchForm, #topCategory ,#subCategory, #curUniId').serialize()+'&pageNum='+(curPageNum+1);
        // alert(info);
        console.log(info);
        getDataAndShow('/search/getpage/',info);
    });
    $('#refreshBtn').click(function () {
        //console.log('nihao');
        $('#refreshIcon').addClass('fa-spin');
        $('#subCategory').trigger('change');
    });
    // $('#topCategory').trigger('change');
    // var pageStr=$('#pageNum').text();
    // var pageList=pageStr.split(' / ');
    //console.log(pageList);
    // disablePageBtn(pageList[0],pageList[1]);
});
