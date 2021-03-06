<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户注册 巴巴运动网</title>
<link href="/shop/css/global/header.css"rel="stylesheet" type="text/css"/>
<link href="/shop/css/global/reg.css" rel="stylesheet" type="text/css"/>
<script language="javascript" src="/shop/js/FoshanRen.js"></script>
<script language="javascript" src="/shop/js/xmlhttp.js"/></script> 
<script language="javascript">
	function checkForm() {
		var form = document.forms[0];
		if (form.username.value == "" || form.username.value.length < 6) {
			alert("请输入长度6位以上的用户名");
			return false;
		}
		if (form.password.value == "" || form.password.value.length < 6) {
			alert("请输入长度6位以上的密码");
			return false;
		}
		if (form.password.value != form.repassword.value) {
			alert("两次输入的密码不正确");
			return false;
		}
		if (/[\W]/g.test(form.username.value)) {
			alert("用户名中不能含有中文");
			return false;
		}
		return true;
	}
	
	function checkUsername() {
		var form = document.forms[0];
		var username = form.username.value;
		var viewobj = document.getElementById("checkResult");
		viewobj.innerHTML = "正在检测中...";
		send_request(function(value){ viewobj.innerHTML = value ;},'/shop/user/reg/isUserExist.do?username='+ username, true);
	}
</script>

</head>
<body>
<jsp:include page="/WEB-INF/page/share/simpleHead.jsp" />
<!-- 检证用户是否存在表单 end -->
<table cellSpacing=0 cellPadding=0 width=770 align=center border=0>
	<tbody>
		<tr>
			<td style="background-image: url(/shop/images/login/login_03.jpg)">&nbsp;</td>
		</tr>
		<tr>
			<td height=15>&nbsp;</td>
		</tr>
		<tr>
			<td height=30><img src="/shop/images/login/zc.gif"    width="128" height="31" /></td>
		</tr>
	</tbody>
</table>

<div id="errorinfo" style="display: none">
<table cellspacing=1 cellpadding=8 width="78%" align="center"
	bgcolor="#dd9988" border=0>
	<tbody>
		<tr>
			<td bgcolor="#ffffd5" align="left">
			<img height="17"  src="/shop/images/buy/exclamation-error-red.gif" width="17"/> 
			 <font color="#990000"><strong><span class="font14">错误提示<br/></span></strong></font>
			<div id="errorMessage"></div></td>
		</tr>
	</tbody>
</table>
</div>

<div id="Content">
<form action="/shop/user/reg.do" method="post" onsubmit="javascript:return checkForm();">
 <input type="hidden" name="directUrl" value="${directUrl}"/>

<div id="Main">
<ul id="FormRegStep1_Account" class="RegForm">
	<li class="Title">以下<span class="STYLE1">均为</span>必填项</li>
	<li>
	<div class="Hint">会员名：</div>
	<div class="Input">
	 <input name="username" type="text" size="24"  tabindex="1" maxlength="20"
		onkeyup="value=value.replace(/[\W]/g,'')" /> <br />
	<input type="button" name="check_username" value="检查会员名是否可用"
		onclick="javascript:checkUsername();" onmouseover="this.style.cursor='hand';" />
	</div>
	<div class="Info">
	<div id="username_info">5-20个字符(包括小写字母、数字、下划线)，一旦注册成功会员名不能修改。</div>
	<br/>
	<div id="checkResult"></div>
	<br/>
	</div>
	<div class="HackBox"></div>
	</li>

	<li>
	<div class="Hint">密码：</div>
	<div class="Input">
	 <input name="password" value="" id="password" type="password" size="24" maxlength="16" tabindex="2" /></div>
	<div class="Info">
	<div id="password_info">密码由6-16个字符组成，请使用英文字母加数字或符号的组合密码</div>
	<br/>
	</div>
	<div class="HackBox"></div>
	</li>

	<li>
	<div class="Hint">再输入一遍密码：</div>
	<div class="Input"><input name="repassword" value=""
		id="repassword" type="password" size="24" maxlength="16" tabindex="3" />
	</div>
	<div class="Info">
	<div id="confirm_password_info">请再输入一遍您上面输入的密码。</div>
	<br/>
	</div>
	<div class="HackBox"></div>
	</li>
	<li>
	<div class="Hint">电子邮件：</div>
	<div class="Input"><input name="email" value="" id="email"
		type="text" size="28" maxlength="45" tabindex="3" /></div>
	<div class="Info">
	<div id="email_info">没有电子邮件？推荐使用<a
		href="https://reg.cn.yahoo.com/cnreg/cnreg_first?id=78001"
		target="_blank">雅虎3.5G免费超大邮箱</a>、<a
		href="http://mail.sogou.com/register.jsp" target="_blank">搜狐邮箱</a>和<a
		href="http://reg.126.com/reg1.jsp" target="_blank">网易邮箱</a>。<br/>
	</div>
	</div>
	<div class="HackBox"></div>
	</li>
</ul>
<p class="SubmitBox"><input type="submit" name="Submit"
	value="提交注册信息" tabindex="8" /></p>
</div>
</form>
</div>
<jsp:include page="/WEB-INF/page/share/Foot.jsp" />
</body>
</html>