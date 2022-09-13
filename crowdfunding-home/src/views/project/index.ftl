<!DOCTYPE html>
<html lang="zh">
<head>
    <title>未提交项目管理</title>
    <meta charset="utf-8">
  	<#include "../common/head-link.ftl"/>
    <link rel="stylesheet" href="/home/layui/css/layui.css">
    <script src="/home/layui/layui.all.js" type="text/javascript"></script>
    <script src="/home/js/jquery.min.js" type="text/javascript"></script>
    <script src="/home/js/msg.js" type="text/javascript"></script>
    <style>
    td{
        vertical-align:middle;
    }

    .box-container
    {
        width: 90%;
        height: auto;
        margin: 15px auto;
        min-height: 800px;
        padding: 20px;
    }
    </style>

</head>
<body>
    <#include "../common/top-menu.ftl"/>
    <div class="box-container">
       <table class="layui-table">
           <tr>
               <th>标题</th>
               <th>封面图</th>
               <th>状态</th>
               <th>目标金额</th>
               <th>开始时间</th>
               <th>结束时间</th>
               <th>发布人</th>
               <th>项目标签</th>
               <th>是否公益</th>
               <th>操作</th>
           </tr>
            <#if pageBean.content?size gt 0>
              <#list pageBean.content as item>
              <tr>
                  <td>
                      <#if item.caption?length gt 15>
                          ${item.caption?substring(0,15)} ...
                      <#else>
                          ${item.caption}
                      </#if>

                  </td>
                  <td>
                    <#if item.headPic??>
                        <#if item.headPic?length gt 0>
                            <img src="/photo/view?filename=${item.headPic}" width="60px" height="60px">
                        <#else>
                            <img src="/admin/images/default-head.jpg" width="60px" height="60px">
                        </#if>
                    <#else>
                         <img src="/admin/images/default-head.jpg" width="60px" height="60px">
                    </#if>
                  </td>
                  <td style="vertical-align:middle;" align="center">
                      <#if item.status == 0>
                          <font style="color:red;">未提交</font>
                      <#elseif  item.status == 1>
                         <font style="color:yellow;">审核</font>
                      <#elseif  item.status == 2>
                         <font style="color:green;">通过</font>
                      <#elseif  item.status == 3>
                         <font style="color:red;">未通过</font>
                      <#elseif  item.status == 4>
                         <font style="color:green;">募款</font>
                      <#elseif  item.status == 5>
                         <font style="color:gray;">结束</font>
                      </#if>
                  </td>
                  <td>${item.targetPrice}</td>
                  <td>${item.start?string('yyyy-MM-dd')}</td>
                  <td>${item.end?string('yyyy-MM-dd')}</td>
                  <td>${item.homeUser.name}</td>
                  <td>${item.projectCategory.name}</td>
                  <td>
                      <#if item.type == 0>
                          <font style="color: green">公益</font>
                      <#else>
                          <font style="color: red">非公益</font>
                      </#if>
                  </td>
                  <td>
                      <button class="layui-btn layui-btn-primary layui-btn-sm" onclick="M.submitAudit(${item.id})">
                          <i class="layui-icon layui-icon-flag"></i>提交审核
                      </button>
                      <button class="layui-btn layui-btn-normal layui-btn-sm" type="button" onclick="M.edit(${item.id})">
                          <i class="layui-icon layui-icon-edit"></i>编辑
                      </button>
                      <#if item.type == 1>
                            <button class="layui-btn layui-btn-primary layui-btn-sm" onclick="M.addFeedBack( ${item.id} )">
                                <i class="layui-icon layui-icon-note"></i>添加回馈
                            </button>
                      <#else>
                            <button class="layui-btn layui-btn-primary layui-disabled layui-btn-sm" disabled>
                                <i class="layui-icon layui-icon-note"></i>添加回馈
                            </button>
                      </#if>
                      <#if item.status == 3>
                           <button class="layui-btn layui-btn-sm" onclick="layer.alert('项目未通过原因:${item.notPassReason!""}')">
                               <i class="layui-icon layui-icon-screen-full"></i>打回信息
                           </button>
                      <#else>
                           <button class="layui-btn layui-disabled layui-btn-sm" disabled>
                               <i class="layui-icon layui-icon-screen-full"></i>打回信息
                           </button>
                      </#if>

                      <button class="layui-btn layui-btn-danger layui-btn-sm" type="button" onclick=" M.delete(${item.id})">
                          <i class="layui-icon layui-icon-delete"></i>删除
                      </button>
                  </td>
              </tr>
              </#list>
          <#else>
            <tr align="center"><td colspan="20">这里空空如也！</td></tr>
          </#if>
        </table>
        <div id="page">

        </div>
   </div>
    <#include "../common/foot.ftl"/>
    <#include "../common/foot-js.ftl"/>
</body>
<script>
    var M = {};
    M.count = ${pageBean.total};
    M.pageSize = ${pageBean.pageSize};
    M.curr = ${pageBean.currentPage};

    layui.use(['laypage'],function()
    {
        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: M.count //数据总数，从服务端得到
            ,limit:M.pageSize
            ,curr:M.curr
            ,jump: function(obj, first){
                //首次不执行
                if(!first){
                    M.curr = obj.curr;
                    location.href="index?attrCurr="+obj.curr;
                }
            }
        });
    });

    M.delete = function( id )
    {

        msg.confirm("是否删除", function(index, layero){
            $.ajax({
                url:"delete",
                type:'POST',
                data:{id:id},
                dataType:'json',
                success:function(data){
                    if(data.code == 0){
                        successMsg("删除成功");
                        setInterval(function()
                        {
                            location.href = "index";
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

    M.submitAudit = function( id )
    {
        $.ajax({
            url:"submit_audit",
            type:'POST',
            data:{id:id},
            dataType:'json',
            success:function(data){
                if(data.code == 0){
                    successMsg("提交审核成功");
                    setInterval(function()
                    {
                        location.href = "index";
                    }, 1000);
                }else{
                    errorMsg(data.msg);
                }
            },
            error:function(data){
                errorMsg("网络错误")
            }
        });
    }

    M.addFeedBack = function( id )
    {
        location.href = "/home/feed_back/index?id=" + id;
    }
</script>
</html>