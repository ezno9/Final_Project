<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.edu.mvc.model.dto.MemberDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID Result</title>
</head>
<body onbeforeunload="closeAll();">
	<h3>고객님께서 가입하신 아이디는 ${memberid }입니다.</h3>
	<div onclick="closeAll();"
		style="border-radius:1px; cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
		class="closeModal">
		<span class ="pop_bt modalCloseBtn" style="font-size: 13pt;">닫기</span>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		function closeAll() {
			self.close();
			/* $('.closeModal',opener.document).click(); */
		}
	</script>
</body>
</html>