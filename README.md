# Shopping-mall-sign-up-window
## 쇼핑몰 페이지

### - 페이지 설명 -
쇼핑몰 회원 관리 페이지로, 회원 가입 및 회원정보 수정이 가능 

## 1. 페이지 레이아웃 - HTML, 자바스크립트(유효성 검사 함수)
### -css-
![image](https://user-images.githubusercontent.com/102803326/186083067-a263c6e8-78ce-4927-bb10-df3929f71af1.png)
### -jsp-
![image](https://user-images.githubusercontent.com/102803326/186083129-842c0a3a-eaff-4e79-9dab-d002fe8e8665.png)
![image](https://user-images.githubusercontent.com/102803326/186083232-890b7324-9a99-4685-8499-7cbfe7360107.png)
![image](https://user-images.githubusercontent.com/102803326/186083273-8453fbb7-369f-4ee0-83c8-33d9d06ad97d.png)
![image](https://user-images.githubusercontent.com/102803326/186083299-4ab9532e-19e2-4af8-b39f-6dd43fa235b5.png)
## -실행화면-

![image](https://user-images.githubusercontent.com/102803326/186063771-b324ea20-67a1-42f6-9ffe-99dc1c96e1b7.png)

## 2. DB연결 자바 파일 만들기
![image](https://user-images.githubusercontent.com/102803326/186083470-eac027a2-a3f6-4139-b1bd-69aaf61c76c9.png)

## 3.오라클에 필요한 테이블과 데이터 생성
![image](https://user-images.githubusercontent.com/102803326/186083807-5f9111d4-1fbf-449a-ba79-ecbc39a9dba5.png)

## 4. 자바와 쿼리문을 이용하여 회원번호 mex 값 불러들여서 회원번호 자동발생

## 5. form 태그에 지정된 action 페이지(join_p) 제작
![image](https://user-images.githubusercontent.com/102803326/186084273-5c4f75ab-f240-4469-b226-51c39957db5d.png)

## 6. join_P페이지는 사용자가 입력한 데이터를 오라클로 전달

### 실행 코드


```jsp
<%@ page import="DB.DBConnect"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql="select max(custno) from member_tbl_02";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	int num = rs.getInt(1)+1;
%>  
```
### --스트링 형태로 데이터 베이스를 연결 



```jap
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css?abc">
<title>join</title>

<script type="text/javascript">
	function checkValue() {
		if(!document.data.custname.value) {
			alert("회원성명을 입력하세요.");
			data.custname.focus();
			return false;
		} 
		else if(!document.data.phone.value) {
			alert("전화번호를 입력하세요.");
			data.phone.focus();
			return false;
		} 
		else if (!document.data.address.value) {
			alert("주소를 입력하세요.");
			data.address.focus();
			return false;
		} 
		else if (!document.data.joindate.value) {
			alert("가입일자를 입력하세요.");
			data.joindate.focus();
			return false;
		} 
		else if (!document.data.grade.value) {
			alert("고객등급을 입력하세요.");
			data.grade.focus();
			return false;
		}  
		else if (!document.data.city.value) {
			alert("도시코드를 입력하세요.");
			data.city.focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body>
<header>
	  <jsp:include page="layout/header.jsp"></jsp:include>
 </header>

 <nav>
   	 <jsp:include page="layout/nav.jsp"></jsp:include>
 </nav>
		
 <section class="section">
   	 <h2>홈쇼핑 회원 등록</h2><br>

<form name="data" action="join_p.jsp" method="post" onsubmit="return checkValue()">
			<table class="table_line">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%= num %>"  readonly ></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" ></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" ></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" ></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" ></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="grade" ></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" ></td>
				</tr>
				<tr class="center">
					<td  colspan="2" >
						<input type="submit" value="등록">
						<input type="button" value="취소" onclick="location.href='join.jsp'">
						<input type="button" value="조회" onclick="location.href='member_list.jsp'">
				</tr>
			</table>
		</form>	
   	
 </section>
		
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>

</body>
</html>
```
## -실행화면-

![image](https://user-images.githubusercontent.com/102803326/186063834-6304ea9a-79bd-4e72-8090-ed281d42bed8.png)

### -실행코드-

```jsp
<%
	String sql="select custno, custname, phone, address, "
	          +"to_char(joindate,'yyyy-mm-dd') joindate, "
			  +"case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end grade, "
			  +"city from member_tbl_02 order by custno asc";
 ```
-회원 정보를 검색하기 위한 쿼리문을 적성합니다.


```jsp
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>    
```
-쿼리문을 실행시키기 위한 객체변수를 먼들어 줍니다.-
-"Connection conn = DBConnect.getConnection(); 디비 연결을 해줍니다 *중요*
- "pstmt" 이곳에 쿼리문이 들어갑니다. 실행결과는 Rs로 들어가게 됩니다. 
```jsp
<title>member_list</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<header>
	  <jsp:include page="layout/header.jsp"></jsp:include>
 </header>

 <nav>
   	 <jsp:include page="layout/nav.jsp"></jsp:include>
 </nav>
		
 <section class="section">
   	 <h2>홈쇼핑 회원 명단</h2><br>
  
	<table class="table_line">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주지역</th>
					
				</tr>
				<%
					while(rs.next()) {
				%>
				<tr class="center">
					<td><%= rs.getString("custno")%></td>
					<td><%= rs.getString("custname") %></td>
					<td><%= rs.getString("phone") %></td>
					<td><%= rs.getString("address") %></td>
					<td><%= rs.getString("joindate") %></td>
					<td><%= rs.getString("grade") %></td>
					<td><%= rs.getString("city") %></td>
					<td>
						
						<input type="button" value="수정" >
						<input type="button" value="삭제" ></td>
				</tr>
				<%
					}
				%>
			</table>	
```
-"while"dms "Rs"에 들어긴 입력값 만큼만 반복합니다.입력값이 없을경우 반복하지 않고 실행이 끝나게 됩니다.

## 실행화면

![image](https://user-images.githubusercontent.com/102803326/186580019-0fb4b1d4-35fc-4007-80dd-871d57712ad0.png)





