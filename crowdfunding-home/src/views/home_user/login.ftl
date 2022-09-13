<!DOCTYPE html>
<html lang="en">
	<head>
		<title>登录</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
		<link rel="stylesheet" href="/home/css/login.css"/>
		<link rel="stylesheet" href="/home/layui/css/layui.css" />
        <link rel="icon" href="/home/images/icon.png" type="image/x-icon"/>
		<script type="text/javascript" src="/home/js/jquery.min.js"></script>
		<script type="text/javascript" src="/home/js/three.min.js"></script>
		<script type="text/javascript" src="/home/js/login.js"></script>
		<script type="text/javascript" src="/home/layui/layui.all.js"></script>
		<script type="text/javascript" src="/home/layui/layui.js"></script>
		<script type="text/javascript" src="/home/js/msg.js"></script>

		<style>
			#logincaptcha
			{
				width: 100%;
				height: 38px;
			}
			
			.layui-form-label
			{
				color: black;
			}

			.layui-layer-dialog .layui-layer-padding {
				padding: 20px 20px 20px 55px;
				text-align: left;
				color: #000;
			}
		</style>
	</head>
	<body>
		<div class="logo" style="color: #FFF; font-size:2.0em;">
			猿来入此
		</div>
		<div class="main">
			<div class="login">
				<div class="log-con layui-form">
					<span>登录</span>
					<div class="layui-form-item" style="padding: 7px 45px;">
						<input type="text" class="layui-input" id="email" name="email" placeholder="请输入邮箱"/>
					</div>
					<div class="layui-form-item" style="padding: 7px 45px;">
						<input type="password" class="layui-input" id="password" name="password" placeholder="请输入密码"/>
					</div>
					<div class="layui-form-item layui-row layui-col-space15" style="padding: 7px 45px;">
						<div class="layui-col-md8">
							<input type="text" class="layui-input" id="code" name="code" placeholder="请输入验证码" maxlength="4"/>
						</div>
						<div class="layui-col-md4">
							<img src="/cpacha/generate_cpacha?vl=4&fs=25&w=128&h=40&method=ylrc_home_login_code"
							     class="pull-right" id="logincaptcha" style="cursor: pointer;"
							     onclick="this.src=this.src+'&d='+Math.random();">
						</div>
					</div>
					<div class="layui-form-item" style="padding: 7px 45px;">
						<input type="button" value="登录" class="layui-btn layui-btn-normal" onclick="login()" style="width: 100%;"/>
					</div>
					<div class="layui-form-item" style="padding:0px 45px;">
						<input type="button" value="忘记密码" class="layui-btn layui-btn-normal" style="width: 100%;" onclick="openDialog()"/>
					</div>
					<div class="layui-form-item" style="text-align: center;">
						<a style="color: #FFF;" href="/home/homeUser/register">注册</a>
						<a style="color: #FFF;" href="/home/index/index">首页</a>
						<a style="color: #FFF;" href="/system/login">前往后台</a>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright">
			<a>&copy; 猿来入此</a>
		</div>
		
		<div class='simple_dlg_define' style='display:none' >

					<div class='pane' style='padding:16px'>
	
						<div class="layui-form-item">
							<label class="layui-form-label">邮箱</label>
							<div class="layui-input-block">
								<input class='layui-input email' type='email'  placeholder="请输入邮箱">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">密码:</label>
							<div class="layui-input-block">
								<input class='layui-input password' type='password'  placeholder="请输入密码">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">确认密码:</label>
							<div class="layui-input-block">
								<input class='layui-input password2' type='password' placeholder="请确认密码">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">验证码:</label>
							<div class="layui-input-block">
									<div class="layui-col-md8">
										<input class='layui-input code' maxlength="4" type='text' placeholder="请输入验证码">
									</div>
									<div class="layui-col-md4" style="text-align: right">
										<input type="button" value="发送" class="layui-btn layui-btn-normal send-code-btn"/>
										<input type="button" value="重新发送" style="display: none;" class="layui-btn layui-btn-normal layui-btn-disabled code-btn" disabled/>
									</div>
								</div>
							</div>
						</div>
					</div>

			</div>
		<script>

			$(function () {
				init();		//初始化
				animate();	//动画效果
			});
			
			function login() {
				var email = $("#email").val().trim().toLowerCase();
				var password = $("#password").val().trim();
				var code = $("#code").val().trim();

				if(msg.isEmpty(email)){
					errorMsg("邮箱不能为空");
					return;
				}
				if(!msg.isEmail(email)){
					errorMsg("邮箱格式错误");
					return;
				}

				if(msg.isEmpty(password)){
					errorMsg("密码不能为空");
					return;
				}

				if(msg.isEmpty(code)){
					errorMsg("验证码不能为空");
					return;
				}

				$.ajax({
					url:'login',
					type:'post',
					data:{
						email:email,
						password:password,
						code:code
					},
					dataType:'json',
					success:function (data) {
						if(data.code == 0){
							successMsg('登录成功！');
							location.href = "/home/index/index";
						}else{
							errorMsg(data.msg)
						}
					},
					error:function (data) {
						alert("网络错误");
					}
				})
			}

			var flag = false;

			function openDialog()
			{
				var dlgContent = $('.simple_dlg_define').html(); // 窗口内容
	
				layer.open({
					type: 1,
					title: '忘记密码',
					area: ['420px', 'auto'],
					content: dlgContent,
					btn:['修改','取消'] ,
	
					btn1: function(index,layero){
						var password = $('.password', layero).val().trim();
						var password2 = $('.password2', layero).val().trim();
						var email = $(".email", layero).val().trim();
						var code = $(".code", layero).val().trim();
						updatePassword(password, password2,index, email,code);
	
					},
					btn2 : function(index,layero){
						layer.close(index)
					},
					success:function(layero, index)
					{
						$(".send-code-btn").click(function()
						{
							var email = $('.email', layero).val().trim();
							if(msg.isEmpty(email))
							{
								errorMsg("邮箱为空");
								return ;
							}

							if(!msg.isEmail(email))
							{
								errorMsg("邮箱格式错误");
								return ;
							}

							var type = 2;
							$.ajax({
								url:'send_email_code',
								type:'post',
								data:{
									email:email,
									type:type
								},
								dataType:'json',
								success:function (data) {
									if(data.code == 0){
										successMsg('已发送验证码，请注意接收！');
										flag = true;
										setButton()
									}else{
										errorMsg(data.msg)
									}
								},
								error:function (data) {
									errorMsg("邮箱不存在");
								}
							})
						});
					}
				});
			}

			function updatePassword(password, confirmPassword, index, email,code)
			{
				if(msg.isEmpty(email))
				{
					errorMsg("邮箱不能为空");
					return ;
				}

				if(msg.isEmpty(password))
				{
					errorMsg("密码不能为空");
					return ;
				}

				if(msg.isEmpty(confirmPassword))
				{
					errorMsg("新密码不能为空");
					return ;
				}
				if(!flag){
					errorMsg("请发送验证码");
					return;
				}
				if(msg.isEmpty(code))
				{
					errorMsg("验证码不能为空");
					return ;
				}

				if(password != confirmPassword)
				{
					errorMsg("密码不一致");
					return ;
				}

				if(!msg.isEmail(email))
				{
					errorMsg("邮箱格式错误");
					return ;
				}

				$.ajax({
					url:'forget_password',
					type:'POST',
					data:{email:email,password:password,code:code},
					dataType:'json',
					success:function(data){
						if(data.code == 0){
							successMsg('忘记密码成功!');
							layer.close(index);
						}else{
							errorMsg(data.msg);
						}
					},
					error:function(data){
						errorMsg('网络错误!');
					}
				});
			}

			//按钮不能连续点击
			countdown = 60;  // 时长
			function setButton()
			{
				$(".send-code-btn").hide();
				$(".code-btn").show();
				var timer = setInterval(function () {
					if (countdown == 0) {
						clearInterval(timer);
						$(".send-code-btn").show();
						$(".code-btn").hide();
						countdown = 60;
					}
					$(".code-btn").val('('+(countdown-1)+'秒)');
					countdown --;
				}, 1000);
			}
		</script>
	</body>
</html>
