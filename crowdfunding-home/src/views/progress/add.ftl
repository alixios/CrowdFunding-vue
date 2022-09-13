<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>项目进度添加</title>
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
				<h2>添加项目进展</h2>
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
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">标题:</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input" lay-verify="required" id="caption" placeholder="请输入标题"/>
				</div>
			</div>
            <div class="layui-form-item">
                <label class="layui-form-label">简介:</label>
                <div class="layui-input-block">
                    <textarea type="text" class="layui-textarea" lay-verify="required" id="info" placeholder="请输入简介"></textarea>
                </div>
            </div>
			<div class="layui-form-item">
				<label class="layui-form-label">内容:</label>
				<div class="layui-input-block">
					 <textarea class="layui-textarea" id="content" style="display: none"></textarea>
				</div>
			</div>
            <div class="layui-form-item" style="text-align: right">
                <input type="button"  lay-filter="addFeedBack" lay-submit class="layui-btn" value="发布" onclick=""/>
                <input type="button" class="layui-btn layui-btn-primary" value="返回" onclick="javascript:history.back(-1);return false;"/>
            </div>
		</div>
	  	<#include "../common/foot.ftl"/>
		<#include "../common/foot-js.ftl"/>
	</body>
	
	<script>
		var M = {};
		M.projectId = ${project.id};
		M.images = [];
		M.grantDate = "";
		
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
						M.start = null;
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
			
			layedit.set({
				uploadImage: {
					url: '/upload/editor_upload'
				}
			});
			
			  //自定义工具栏
			var index = layedit.build('content', {height: 300});

            form.on('submit(addFeedBack)', function(data) {
                var content = layedit.getContent(index);
                M.save(content);
            });
		});

		M.save = function(content)
		{
		    if(msg.isEmpty(content))
			{
			    errorMsg("请输入内容");
			    return ;
			}

			var caption = $("#caption").val().trim();
		    var info = $("#info").val().trim();


            $.ajax({
                url:"add",
                type:'POST',
                data:{projectId:M.projectId, headPic:JSON.stringify(M.images),
					caption:caption,content:content, info:info},
                dataType:'json',
                success:function(data){
                    if(data.code == 0){
                        successMsg("添加成功");
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
