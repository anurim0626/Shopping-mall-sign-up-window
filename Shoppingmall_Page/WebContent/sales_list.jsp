<%@ page import="test.DBconnect"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql="select mb.custno, mb.custname, case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end grade, sum(mo.price) price from member_tbl_02 mb, money_tbl_02 mo where mb.custno = mo.custno and mo.price is not null group by mb.custno, mb.custname, mb.grade order by sum(mo.price) desc";

	Connection conn = DBconnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>쇼핑몰 회원관리</title>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<div class="section">
		<h3 class="title">회원매출조회</h3>
		<table class="table_line">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
				while(rs.next()) {
			%>
			<tr class="center">
				<td><%= rs.getString("custno")%></td>
				<td><%= rs.getString("custname") %></td>
				<td><%= rs.getString("grade") %></td>
				<td><%= rs.getString("price") %></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>