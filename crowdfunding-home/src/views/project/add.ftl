<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>项目添加</title>
		<#include "../common/head-link.ftl"/>
        <link rel="stylesheet" href="/home/layui/css/layui.css">
        <script src="/home/layui/layui.all.js" type="text/javascript"></script>
        <script src="/home/js/jquery.min.js" type="text/javascript"></script>
        <script src="/home/js/msg.js" type="text/javascript"></script>
		<style>
			.box-container
			{
				width: 960px;
				height: auto;
				margin: 15px auto;
			}

			.upload-images
			{
                width: 100px;
				height: 100px;
                margin-left: 4px;
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
			p
			{
				color: black;
			}

			dd
			{
                color: black;
			}
		</style>
	</head>
	<body>
	    <#include "../common/top-menu.ftl"/>
		<div class="box-container layui-form">
			<div class="layui-form-item">
				<h3>发布项目</h3>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">封面图:</label>
				<div class="layui-input-block">
					<div class="form-controls">
						<div class="layui-upload-drag" id="upload_headPic">
							<i class="layui-icon layui-icon-upload"></i>
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
				<label class="layui-form-label">标题:</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input" lay-verify="required" placeholder="请输入标题" id="caption"/>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">目标金额:</label>
				<div class="layui-input-block">
					<input type="number" min="0" lay-verify="required|number" class="layui-input" placeholder="请输入目标金额" id="targetPrice"/>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">开始时间:</label>
				<div class="layui-input-block">
					 <input type="text" class="layui-input" lay-verify="required" id="date" readonly="" placeholder="yyyy-MM-dd">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">项目标签:</label>
				<div class="layui-input-block">
					<select class="layui-select" id="projectCategoryId" lay-verify="select" lay-search="">
						<option value="">--请选择</option>
						<#list categorys as item>
							<option value="${item.id}">${item.name}</option>
						</#list>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">项目类型:</label>
				<div class="layui-input-block">
					<select class="layui-select" id="type" lay-verify="select">
                        <option value="">--请选择</option>
						<option value="0">公益</option>
						<option value="1">非公益</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">详情:</label>
				<div class="layui-input-block">
					 <textarea class="layui-textarea" id="content" style="display: none"></textarea>
				</div>
			</div>
            <div class="layui-form-item" style="text-align: right">
				<input type="button"  lay-filter="sendProject" lay-submit class="layui-btn" value="发布" onclick=""/>
				<input type="button" class="layui-btn layui-btn-primary" value="返回" onclick="javascript:history.back(-1);return false;"/>
			</div>
		</div>
		<#include "../common/foot.ftl"/>
		<#include "../common/foot-js.ftl"/>
	</body>
	<script>
		var M = {};
		M.image = ""; //图片
		M.start = "";
		M.end = "";
		
		layui.use(['upload','laydate', 'form', 'layedit'],function()
		{
			var laydate = layui.laydate;
			var form = layui.form;
			var upload = layui.upload;
			var layedit = layui.layedit;
			
			
			laydate.render({
				elem: '#date'
				,trigger: 'click'
				,btns: ['confirm']
				,range:true
				,min:0
				,done: function(value, date1, date2){
					M.start = date1.year + "-" + date1.month + "-" + date1.date;
					M.end = date2.year + "-" + date2.month + "-" + date2.date;

					if(date1.year == null || date2.year == null)
					{
						M.start = null;
						M.end = null;
					}
				}
			});

			
			form.render();

            //自定义验证规则
            form.verify({
                title: function(value){
                    if(value.length < 5){
                        return '标题至少得5个字符啊';
                    }
                }
                ,pass: [
                    /^[\S]{6,12}$/
                    ,'密码必须6到12位，且不能出现空格'
                ]
                ,content: function(value){
                    layedit.sync(editIndex);
                },
				select:function(value)
				{
                    if(msg.isEmpty(value)){
                        return '请选择下拉内容';
                    }
				}
            });
			
			//文件上传
			upload.render({
				elem: '#upload_headPic',
				url: '/upload/home_upload_photo', //改成您自己的上传接口,
				size: 1024 * 1,
				accept: 'images',
				done: function (res) {
					M.image = res.data;
					layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', "/photo/view?filename="+ res.data);
				},
				before:function()
				{
					M.image = "";
				}
			});
			
			layedit.set({
				uploadImage: {
					url: '/upload/editor_upload'
				}
			});
			
			  //自定义工具栏
			var index = layedit.build('content', {height: 300});

            form.on('submit(sendProject)', function(data) {
                var content = layedit.getContent(index);
                M.save(content);
            });
		});

        M.save = function(content)
		{
		    if(msg.isEmpty(content))
			{
			    errorMsg("请输入项目详情");
			    return ;
			}

			if(msg.isEmpty(M.image))
			{
			    errorMsg("请上传图片");
			    return ;
			}

			if(msg.isEmpty(M.start) || msg.isEmpty(M.end))
			{
			    errorMsg("请选择开始结束时间");
			    return;
			}


			var caption = $("#caption").val().trim();
		    var targetPriceStr = $("#targetPrice").val().trim();
		    var projectCategoryId = $("#projectCategoryId").val().trim();
		    var type = $("#type").val();

		    var targetPrice = Number(targetPriceStr);
		    if(targetPrice < 1)
			{
			    errorMsg("目标金额请输入正整数");
			    return;
			}

		    if(targetPrice > 10000000)
			{
				errorMsg("你输入的金额不能超过1千万");
				return ;
			}

            $.ajax({
                url:"add",
                type:'POST',
                data:{caption:caption, headPic:M.image, targetPrice:targetPrice,
                    start:M.start, end:M.end, projectCategoryId: projectCategoryId,
				type: type, content:content},
                dataType:'json',
                success:function(data){
                    if(data.code == 0){
                        successMsg("添加成功");
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
	</script>
</html>
