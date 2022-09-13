//统一ajax请求
function ajaxRequest(url,requestType,data,callback){
    $.ajax({
        url:url,
        type:requestType,
        data:data,
        dataType:'json',
        success:function(rst){
            if(rst.code == 0){
                callback(rst);
            }else{
                layer.msg(rst.msg);
            }
        },
        error:function(data){
            alert('网络错误!');
        }
    });
}

//表单验证公用方法，传表单form的id进来即可
function checkHomeForm(formId){
    var flag = true;
    $("#"+formId).find(".required").each(function(i,e){
        if($(e).val() == ''){
            layer.msg($(e).attr('tips'));
            flag = false;
            return false;
        }
    });
    return flag;
}
