<!DOCTYPE html>
<html lang="en">
	<head>
		<title>注册</title>
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
			/*#logincaptcha
			{
				width: 100%;
				height: 38px;
			}*/
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
			<div class="login" style="height: auto;">
				<div class="log-con layui-form" style="height: auto;">
					<span>注册</span>
					<div class="layui-form-item" style="padding: 7px 45px;">
						<input type="text" name="name" id="name" class="layui-input" autocomplete="off" placeholder="请输入用户名"/>
					</div>
					<div class="layui-form-item" style="padding: 7px 45px;">
						<input type="text" name="mobile" id="mobile" autofocus="autofocus" class="layui-input" maxlength="11" autocomplete="off" placeholder="请输入手机号"/>
					</div>
					<div class="layui-form-item" style="padding: 7px 45px;">
						<input type="text" name="email" id="email" class="layui-input" placeholder="请输入邮箱"/>
					</div>
					<div class="layui-form-item" style="padding: 7px 45px;">
						<input type="text" maxlength="18" autocomplete="off" name="idNumber" id="idNumber" class="layui-input"  placeholder="请输入身份证号"/>
					</div>
					<div class="layui-form-item" style="padding: 7px 45px;">
						<input type="password" name="password" id="password" class="layui-input" placeholder="请输入密码"/>
					</div>
					<div class="layui-form-item" style="padding: 7px 45px;">
						<input type="password" name="confirmPassword" id="confirmPassword" class="layui-input" placeholder="请确认密码"/>
					</div>
					<div class="layui-form-item layui-row layui-col-space15" style="padding: 7px 45px;">
						<div class="layui-col-md8">
							<input type="text" name="code" id="code" class="layui-input" placeholder="请输入验证码" maxlength="4"/>
						</div>
						<div class="layui-col-md4">
							<input type="button" value="发送验证码" class="layui-btn layui-btn-normal" id="send-code-btn" onclick="sendCode()"/>
							<input type="button" value="重新发送" style="display: none" class="layui-btn layui-btn-normal layui-disabled" id="send-btn" disabled/>
						</div>
					</div>
					<div class="layui-form-item" style="padding: 7px 45px;">
						<input type="button" value="注册" class="layui-btn layui-btn-normal" onclick="homeUserRegister()" style="width: 100%;" id="register-btn"/>
					</div>
					<div class="layui-form-item" style="text-align: center;">
						<a style="color: #FFF;" href="/home/homeUser/login">登录</a>
					</div>

				</div>
			</div>
		</div>
		<div class="copyright">
			<a>&copy; 猿来入此</a>
		</div>
		
	
<script>
	$(function () {
		init();		//初始化
		animate();	//动画效果
	});

	var flag = false;

	function homeUserRegister() {
		var name = $("#name").val().trim();
		var idNumber = $("#idNumber").val().trim(); //身份证号码
		var mobile = $("#mobile").val().trim();
		var email = $("#email").val().trim().toLowerCase();
		var password = $("#password").val().trim();
		var confirmPassword = $("#confirmPassword").val().trim();
		var code = $("#code").val().trim();

		if(msg.isEmpty(name)){
			errorMsg("用户名不能为空");
			return;
		}

		if(!flag){
			errorMsg("请发送验证码");
			return;
		}

		if(msg.isEmpty(idNumber)){
			errorMsg("身份证号不能为空");
			return;
		}
		if(!msg.isCard(idNumber)){
			errorMsg("身份证号格式错误");
			return;
		}

		if(msg.isEmpty(mobile)){
			errorMsg("手机号不能为空");
			return;
		}
		if(!msg.isPhone(mobile)){
			errorMsg("手机号格式错误");
			return;
		}

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

		if(msg.isEmpty(confirmPassword)){
			errorMsg("确认密码不能为空");
			return;
		}

		if(msg.isEmpty(code)){
			errorMsg("验证码不能为空");
			return;
		}

		if(password != confirmPassword){
			errorMsg("密码不一致");
			return;
		}

		$.ajax({
			url:'register',
			type:'post',
			data:{
				name:name,
				idNumber:idNumber,
				mobile:mobile,
				email:email,
				password:password,
				code:code
			},
			dataType:'json',
			success:function (data) {
				if(data.code == 0){
					successMsg('注册成功！');
					location.href = "login";
				}else{
					errorMsg(data.msg)
				}
			},
			error:function (data) {
				errorMsg("邮箱不存在");
			}
		})
	}

	function sendCode() {
		var email = $("#email").val().trim().toLowerCase();
		if(msg.isEmpty(email)){
			errorMsg("请输入邮箱");
			return;
		}

		if(!msg.isEmail(email)){
			errorMsg("邮箱格式错误");
			return;
		}

		var type = 1;
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
					setButton();
				}else{
					errorMsg(data.msg)
				}
			},
			error:function (data) {
				errorMsg("邮箱不存在");
			}
		})
	}

	//按钮不能连续点击
	var countdown = 60;  // 时长
	function setButton(){
		$("#send-code-btn").hide();
		$("#send-btn").show();
		var timer = setInterval(function () {
			if (countdown == 0) {
				clearInterval(timer);
				$("#send-code-btn").show();
				$("#send-btn").hide();
				countdown = 60;
			}
			$("#send-btn").val('重新发送('+(countdown-1)+'秒)');
			countdown --;
		}, 1000);
	}
</script>
</body>
</html>
