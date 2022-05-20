<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String recNum = request.getParameter("recNum");
%>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("구매 완료되었습니다. 감사합니다.");
			location.href = "buyAfter.jsp?recNum=${recNum }";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("구매 실패");
			history.go(-1);
		</script>
	</c:if>

</body>
</html>