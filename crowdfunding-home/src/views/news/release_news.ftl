<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>新闻发布</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#include "../common/head-link.ftl"/>
    <link rel="stylesheet" href="/home/layui/css/layui.css" media="all">
    <style>
        .layui-input.news-input {
            width: 30%;
        !important;
        }

        .layui-form-label {
            width: 100px;
        }

        .nice-select {
            display: none;
        !important;
        }
    </style>
</head>

<body>
    <#include "../common/top-menu.ftl"/>
<blockquote class="layui-elem-quote layui-text">
    发布一个自己喜欢的新闻
</blockquote>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>新闻发布</legend>
</fieldset>
<form class="layui-form" id="news-add-form">
    <div class="layui-form-item">
        <span class="layui-form-label">封面图片</span>
        <div class="layui-upload-drag" id="picture" style="margin-left: 10px;">
            <div id="icon-image">
                <i class="layui-icon layui-icon-upload-drag"></i>
                <p>点击上传，或将文件拖拽到此处</p>
            </div>
            <div class="layui-hide" id="uploadDemoView">
                <hr>
                <img src="" alt="上传的图片" width="200" height="200" style="object-fit: cover">
            </div>
            <input type="hidden" name="picture" id="add-picture"  autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <span class="layui-form-label">新闻标题</span>
        <div class="layui-input-block">
            <input type="text" id="caption" name="caption" lay-verify="required|caption" autocomplete="off" placeholder="请输入标题"
                   class="layui-input news-input">
        </div>
    </div>
    <div class="layui-inline" style="margin-bottom: 20px;">
        <span class="layui-form-label">新闻分类</span>
        <div class="layui-input-inline" style="margin-left: 10px;">
            <select name="newsType.id">
                <option value="-1">--请选择新闻分类--</option>
                <#list newsTypeList as newsType>
                      <option value="${newsType.id}">${newsType.name}</option>
                </#list>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <span class="layui-form-label">新闻内容</span>
        <div style="margin-left: 110px;">
            <textarea id="content" style="display: none;"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="button" class="layui-btn"  id="news-add-submit" lay-filter="news-add">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>有时间常发新闻哦！我会想你的</legend>
</fieldset>
    <#include "../common/foot.ftl"/>
    <#include "../common/foot-js.ftl"/>
<script type="text/javascript" src="/home/layui/layui.all.js"></script>
<script type="text/javascript" src="/home/layui/layui.js"></script>

<script>

    layui.use(['layer','form', 'upload', 'layedit'], function () {
        var form = layui.form;
        var $ = layui.jquery
                ,
                //上传图片
                upload = layui.upload;
        upload.render({
            elem: '#picture'
            , url: '/upload/home_upload_photo' //改成您自己的上传接口
            , done: function (res) {
                var filePath = res.data;
                $("#add-picture").val(filePath);
                layer.msg('上传成功');
                layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', "/photo/view?filename=" + filePath);
                $("#icon-image").hide();
            }
        });
        //编辑器
        var layedit = layui.layedit;
        layedit.set({
            uploadImage: {
                url: '/upload/editor_upload' //接口url
                , type: 'post' //默认post
            }
        });
       var index=layedit.build('content'); //建立编辑器
        $($(".layui-unselect.layui-form-select")[1]).remove();

        $("#news-add-submit").click(function () {
            if($("#add-picture").val()==""){
                layer.msg("请上传封面图片!");
                return;
            }
            if($("#caption").val()==""||$("#caption").val()==null){
                layer.msg("请填写标题！");
                return;
            }
            var editContent=layedit.getContent(index);
            if(editContent==""||editContent==null){
                layer.msg("请填写新闻内容！");
                return;
            }
            var data=$("#news-add-form").serialize()+"&content="+editContent;
            $.ajax({
                url:'add',
                type:'POST',
                data:data,
                dataType:'json',
                success:function(rst){
                    if(rst.code == 0){
                        layer.msg("发布成功!");
                        window.location.href="/home/news/list";
                    }else{
                        layer.msg(rst.msg);
                    }
                },
                error:function(data){
                    alert('网络错误!');
                }
            })
        });
    });


</script>
</body>

</html>