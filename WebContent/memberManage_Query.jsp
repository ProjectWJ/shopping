<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>  
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="memberDB.jsp" %> <!-- 등록된 모든 회원 리스틀르 불러오는 곳. memberManage.jsp로 이동 -->
	<%
		Statement stat = null;
		ResultSet rs = null;
		
		ArrayList<User> list = new ArrayList<>(); // User 객체 형태로 arraylist에 저장
		
		String sql = "select * from user";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		while (rs.next()) {
			User user = new User();
			user.setUserNum(rs.getString(1));
			user.setUserID(rs.getString(2));
			user.setUserPassword(rs.getString(3));
			user.setUserName(rs.getString(4));
			user.setUserAddress(rs.getString(5));
			user.setUserPhone(rs.getString(6));
			user.setUserGrade(rs.getString(7));
			list.add(user);
		}
		
		request.setAttribute("list", list);
		
		rs.close(); 
		stat.close();
		conn.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("memberManage.jsp");
		rd.forward(request, response);
	%>
</body>
</html>