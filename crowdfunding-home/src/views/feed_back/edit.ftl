<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <title>编辑回馈</title>
        <link rel="stylesheet" href="/home/layui/css/layui.css">
        <script src="/home/layui/layui.all.js" type="text/javascript"></script>
        <script src="/home/js/jquery.min.js" type="text/javascript"></script>
        <script src="/home/js/msg.js" type="text/javascript"></script>
    	<#include "../common/head-link.ftl"/>
		<style>
            .box-container
            {
                width: 960px;
                height: auto;
                margin: 15px auto;
                min-height: 600px;
                padding: 20px;
            }

            .layui-form-label
            {
                color: black;
                width: auto;
            }

            .nice-select
            {
                display: none;
            }

			#images img
			{
				margin-left: 10px;
                width: 100px;
                height: 100px;
			}
		</style>
	</head>
	<body>
		<#include "../common/top-menu.ftl"/>
		<div class="box-container layui-form">
			<div class="layui-form-item">
				<h2>编辑反馈</h2>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">图片:</label>
				<div class="layui-input-block">
					<div class="form-controls">
						<div class="layui-upload-drag" id="upload_headPic">
							<i class="layui-icon layui-icon-upload-drag"></i>
							<p>点击上传，或将文件拖拽到此处</p>
							<div class="layui-hide" id="uploadDemoView">
								<hr>
								<img src="" alt="上传成功后渲染" style="max-width: 196px">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
                <label class="layui-form-label"></label>
                <div class="layui-input-block" id="images">
					<#list feedBack.images as img>
                        <img src='${img}' />
					</#list>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">标题:</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input" lay-verify="required" id="caption" value="${feedBack.caption}" placeholder="请输入标题"/>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">金额:</label>
				<div class="layui-input-block">
					<input type="number" min="0" max="10000000" class="layui-input" lay-verify="required" id="price" placeholder="请输入金额" value="${feedBack.price}"/>
				</div>
			</div>

            <div class="layui-form-item">
                <label class="layui-form-label">份数:</label>
                <div class="layui-input-block">
                    <input type="number" min="0" max="10000000" lay-verify="required" class="layui-input" id="count" placeholder="请输入份数" value="${feedBack.count}"/>
                </div>
            </div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">预计发放:</label>
				<div class="layui-input-block">
					 <input type="text" class="layui-input" id="grantDate" readonly="" placeholder="yyyy-MM-dd" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">介绍:</label>
				<div class="layui-input-block">
					 <textarea class="layui-textarea" id="content" lay-verify="required">${feedBack.content}</textarea>
				</div>
			</div>
            <div class="layui-form-item" style="text-align: right">
                <input type="button"  lay-filter="addFeedBack" lay-submit class="layui-btn" value="保存" onclick=""/>
                <input type="button" class="layui-btn layui-btn-primary" value="返回" onclick="javascript:history.back(-1);return false;"/>
            </div>
		</div>
	  	<#include "../common/foot.ftl"/>
		<#include "../common/foot-js.ftl"/>
	</body>
	
	<script>
		var M = {};
		M.id = ${feedBack.id};
		M.projectId = ${feedBack.project.id};
		M.images = JSON.parse('${feedBack.headPic}');
		M.grantDate = null;
		
		layui.use(['upload','laydate', 'form', 'layedit'],function()
		{
			var laydate = layui.laydate;
			var form = layui.form;
			var upload = layui.upload;
			var layedit = layui.layedit;
			
			
			laydate.render({
				elem: '#grantDate'
				,trigger: 'click'
				,btns: ['confirm']
				,min:0
				,done: function(value, date){
					M.grantDate = date.year + "-" + date.month + "-" + date.date;
					if(date.year == null)
					{
						M.grantDate = null;
					}
				}
			});

			form.render();
			
			//文件上传
			upload.render({
				elem: '#upload_headPic',
				url: '/upload/home_upload_photo', //改成您自己的上传接口,
				size: 1024 * 1,
				accept: 'images',
				multiple:true,
				done: function (res) {
					M.images.push(res.data);
					layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', "/photo/view?filename="+ res.data);
				},
				before:function()
				{
					M.images = [];
				},
				allDone:function()
				{
					//显示图片
					var view = $("#images");
					view.html('');
		
					for(var item of M.images)
					{
						var image = "<img src='/photo/view?filename="+item+"' />";
						view.append(image);
					}
				}
			});


            form.on('submit(addFeedBack)', function(data) {
                var content = $("#content").val().trim();
                M.save(content);
            });
		});

		M.save = function(content)
		{
		    if(msg.isEmpty(content))
			{
			    errorMsg("请输入介绍");
			    return ;
			}

			if(msg.isEmpty(M.grantDate))
			{
			    errorMsg("请选择发放时间");
                return ;
			}

			var caption = $("#caption").val().trim();
			var price = $("#price").val().trim();
			if(Number(price) < 1)
			{
			    errorMsg("请输入正整数金额");
			    return;
			}

			var count = $("#count").val().trim();
            if(Number(count) < 1)
            {
                errorMsg("请输入正整数份数");
                return;
            }

			if(Number(count) > 10000000)
			{
				errorMsg("你输入的份数小于1千万");
				return ;
			}

			if(Number(price) > 10000000)
			{
				errorMsg("你输入的金额小于1千万");
				return ;
			}

            $.ajax({
                url:"edit",
                type:'POST',
                data:{id:M.id, headPic:JSON.stringify(M.images), caption:caption
				,price:price, count:count, grantDate:M.grantDate,content:content},
                dataType:'json',
                success:function(data){
                    if(data.code == 0){
                        successMsg("编辑成功");
                        setInterval(function()
                        {
                            location.href = "index?id=" + M.projectId;
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
	</script>
</html>
