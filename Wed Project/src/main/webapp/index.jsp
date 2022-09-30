<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Insert title here</title>
	    <link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	
	<body>
        <header id="header">
	        <jsp:include page="layout/header.jsp"></jsp:include>
	    </header>
	    <nav id="nav">
   		    <jsp:include page="layout/nav.jsp"></jsp:include>
    	</nav>
		
	    <section class="section">
   		    <jsp:include page="layout/section.jsp"></jsp:include>
	    </section>
		
	    <footer id="footer">
		    <jsp:include page="layout/footer.jsp"></jsp:include>
	    </footer>		
	</body>
</html>
