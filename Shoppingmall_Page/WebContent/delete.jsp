<%@ page import="test.DBconnect"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int d_custno = Integer.parseInt(request.getParameter("d_custno"));
	
	String sql="delete from member_tbl_02 WHERE custno="+d_custno;

	Connection conn = DBconnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쇼핑몰 회원관리</title>
</head>
<body>
	<jsp:forward page="member_list.jsp" />
</body>
</html>