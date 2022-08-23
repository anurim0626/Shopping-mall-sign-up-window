<%@ page import="test.DBconnect"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql="select max(custno) from member_tbl_02";

	Connection conn = DBconnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	int num = rs.getInt(1)+1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
	function checkValue() {
		if(!document.data.custname.value) {
			alert("회원성명을 입력하세요.");
			document.data.custname.focus();
			return false;
		} else if(!document.data.phone.value) {
			alert("전화번호를 입력하세요.");
			document.data.phone.focus();
			return false;
		} else if (!document.data.address.value) {
			alert("주소를 입력하세요.");
			document.data.address.focus();
			return false;
		} else if (!document.data.joindate.value) {
			alert("가입일자를 입력하세요.");
			document.data.joindate.focus();
			return false;
		} else if (!document.data.grade.value) {
			alert("고객등급을 입력하세요.");
			document.data.grade.focus();
			return false;
		}  else if (!document.data.city.value) {
			alert("도시코드를 입력하세요.");
			document.data.city.focus();
			return false;
		}
	}
</script>
<title>쇼핑몰 회원관리</title>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<div class="section">
		<h3 class="title">회원등록</h3>
		<form name="data" action="join_p.jsp" method="post" onsubmit="return checkValue()">
			<table class="table_line">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%= num %>" size="10" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" size="10"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" size="15"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" size="25"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" size="10"></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="grade" size="10"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" size="10"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="등록">
						<!-- <input type="button" value="취소" onclick="window.location.reload()"> -->
						<input type="button" value="취소" onclick="location.href='join.jsp'">
						<input type="button" value="조회" onclick="location.href='member_list.jsp'">
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>