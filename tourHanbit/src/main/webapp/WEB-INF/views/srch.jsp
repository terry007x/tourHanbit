<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
    border-collapse: collapse;
}

th, td {
    text-align: left;
    padding: 5px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    color:#fff;background-color:#337ab7;border-color:#2e6da4;
}
</style>
</head>
<body>

		
	<h3 align="center"><b>[</b>${srch}<b>]</b> 에 대한 검색 결과</h3>
	
	<table border="1" align="center"     width="65%">
	<tr>
    <th colspan="2">상품번호</th>
    <th colspan="6">여행사진</th>
    <th colspan="10">상품설명</th>
  </tr>
	<c:forEach var="b" items="${list }">
		<tr align="center">
			<td colspan="2">${b.item_key }</td>
			<td colspan="6" ><a href="detail.do?item_key=${b.item_key }"><img src="resources/img/${b.image01}" align="center" style="height:300px;width:500px;"></td>
			<td colspan="10"><font color="blue"><b>${b.item_name }</b></font><br></font><br> 출발일 : <font color='red'><b>${b.d_date}</b></font><br>${b.intro_text }</a></td>
			
		</tr>
	</c:forEach>
	</table>
</body>
</html>