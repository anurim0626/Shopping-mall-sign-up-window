<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>join</title>

<script type="text/javascript">
	function checkValue2() {
		if(!document.data1.in_custno.value) {
			alert("회원번호를 입력하세요.");
			data.in_custno.focus();
			return false;
		} 		
		return true;
	}
</script>

</head>
<body>
<header id="header"> 쇼핑몰  ver 1.0 </header>

<nav id="nav"> 
   <ul>
			<li><a href="join.jsp">회원등록</a></li>
			<li><a href="member_list.jsp">회원목록조회/수정</a></li>
			<li><a href="member_search.jsp">회원정보조회</a></li>
			<li><a href="sales_list.jsp">회원매출조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
   </ul>
</nav>
<section id="section">
  <h2>홈쇼핑 회원 등록</h2><br>

<form name="data1" action="member_search_list.jsp" method="post" onsubmit="return checkValue2()">
			<table class="table_line">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="in_custno"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="취소" onclick="location.href='member_list.jsp'">
						<input type="submit" value="조회" >
				</tr>
			</table>
		</form>		
		
		
</section>
<footer id="footer">
HRDKOREA Copyrightⓒ2015 All rights reserved. Human Resources Development Service of Korea
</footer>
</body>
</html>