<!DOCTYPE html>
<html lang="zh">
<head>
    <title>众筹中的项目</title>
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
                  <td>${item.caption}</td>
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
                      <button class="layui-btn layui-btn-sm" onclick="location.href='/home/project/detail?id=${item.id}'">
                          <i class="layui-icon layui-icon-screen-full"></i>查看项目
                      </button>
                      <button class="layui-btn layui-btn-primary layui-btn-sm" onclick="M.sendProgress(${item.id})">
                          <i class="layui-icon layui-icon-release"></i>发布进展
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
                    location.href="published?currentPage="+obj.curr;
                }
            }
        });
    });

    //发布进度
    M.sendProgress = function( id )
    {
        location.href = "/home/progress/index?id=" + id;
    }
</script>
</html>