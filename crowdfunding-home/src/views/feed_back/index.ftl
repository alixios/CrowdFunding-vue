<!DOCTYPE html>
<html lang="zh">
<head>
    <title>回馈管理</title>
    <link rel="stylesheet" href="/home/layui/css/layui.css">
    <script src="/home/layui/layui.all.js" type="text/javascript"></script>
    <script src="/home/js/jquery.min.js" type="text/javascript"></script>
    <script src="/home/js/msg.js" type="text/javascript"></script>
    <#include "../common/head-link.ftl"/>
<style>
td{
	vertical-align:middle;
}

.box-container
{
    width: 90%;
    height: auto;
    margin: 15px auto;
    min-height: 600px;
    padding: 20px;
}
</style>
</head>
  
<body>
    <#include "../common/top-menu.ftl"/>
    <div class="box-container layui-form">
        <div class="layui-form-item">
            <button class="layui-btn layui-btn-primary layui-btn-sm" type="button" onclick="M.add()">
                <i class="layui-icon layui-icon-add-circle"></i>
                添加
            </button>
        </div>
        <div class="layui-form-item">
            <table class="layui-table">
            <tr>
                <th>项目标题</th>
                <th>标题</th>
                <th>图片</th>
                <th>金额</th>
                <th>份数</th>
                <th>预计发放日期</th>
                <th>操作</th>
            </tr>
            <#if feedBacks?size gt 0>
                <#list feedBacks as item>
                      <tr>
                          <td>${item.project.caption}</td>
                          <td>${item.caption}</td>
                          <td>
                            <#list item.images as img>
                                <img width="60" height="60" src="${img}"/>
                            </#list>
                          </td>
                          <td >${item.price}</td>
                          <td >${item.count}</td>
                          <td >${item.grantDate?string('yyyy-MM-dd')}</td>
                          <td>
                              <button type="button" class="layui-btn layui-btn-sm" onclick="M.edit(${item.id})">
                                  <i class="layui-icon layui-icon-edit"></i>编辑
                              </button>
                              <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" onclick="M.delete(${item.id})">
                                  <i class="layui-icon layui-icon-delete"></i>删除
                              </button>
                          </td>
                      </tr>
                </#list>
            <#else>
                <tr align="center"><td colspan="10">这里空空如也！</td></tr>
            </#if>
            </table>
        </div>
    </div>
    <#include "../common/foot.ftl"/>
	<#include "../common/foot-js.ftl"/>
</body>
<script>
    var M = {};
    M.id = ${id}; //项目ID
    M.add = function()
    {
        location.href = "add?id=" + M.id;
    }

    M.delete = function( id )
    {
        msg.confirm("是否删除", function(index, layero){
            $.ajax({
                url:"delete",
                type:'POST',
                data:{id:id, projectId:M.id},
                dataType:'json',
                success:function(data){
                    if(data.code == 0){
                        successMsg("删除成功");
                        setInterval(function()
                        {
                            location.href = "index?id=" + M.id;
                        }, 1000);
                    }else{
                        errorMsg(data.msg);
                    }
                },
                error:function(data){
                    errorMsg("网络错误")
                }
            });
        });
    }

    M.edit = function( id )
    {
        location.href = "edit?id=" + id;
    }
</script>
</html>