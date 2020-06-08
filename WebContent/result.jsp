<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<html>
<head>
<title></title>
</head>
<body>
	<br>

	<%

		String status = (String) request.getAttribute("status");
	%>

	<br>
	<br>
	<%=status%>
	<br>
	<br>
	<p>ここはresult.jspです</p>
	<a href="./index.jsp">トップページに戻る</a>


</body>
</html>
