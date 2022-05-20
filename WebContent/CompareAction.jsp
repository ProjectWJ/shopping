<%@ page import="itemInfo.ItemInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="itemDB.jsp" %> <!-- itemNum 생성 -->
	<%
		request.setCharacterEncoding("utf-8");
		String itemName1 = request.getParameter("itemName1"); // 왼쪽 휴대폰
		String itemName2 = request.getParameter("itemName2"); // 오른쪽 휴대폰
		
		Statement stat = null;
		ResultSet rs = null;
		
		ArrayList<ItemInfo> list1 = new ArrayList<>(); // ItemInfo 객체 형태로 arraylist에 저장
		ArrayList<ItemInfo> list2 = new ArrayList<>();
		
		String sql = "select * from iteminfo where itemName='" + itemName1 + "'";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		try{
			while (rs.next()) {
				ItemInfo p = new ItemInfo();
				p.setItemName(rs.getString(1));
				p.setItemInfoProcesser(rs.getString(2));
				p.setItemInfoMemory(rs.getString(3));
				p.setItemInfoDisplay(rs.getString(4));
				p.setItemInfoNetwork(rs.getString(5));
				p.setItemInfoWiFi(rs.getString(6));
				p.setItemInfoCamera(rs.getString(7));
				p.setItemInfoBattery(rs.getString(8));
				p.setItemInfoOperate(rs.getString(9));
				p.setItemInfoSize(rs.getString(10));
				p.setItemInfoUSB(rs.getString(11));
				p.setItemInfoSecure(rs.getString(12));
				p.setItemInfoAnother(rs.getString(13));
				list1.add(p);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		
		
		sql = "select * from iteminfo where itemName='" + itemName2 + "'";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		try{
			while (rs.next()) {
				ItemInfo p = new ItemInfo();
				p.setItemName(rs.getString(1));
				p.setItemInfoProcesser(rs.getString(2));
				p.setItemInfoMemory(rs.getString(3));
				p.setItemInfoDisplay(rs.getString(4));
				p.setItemInfoNetwork(rs.getString(5));
				p.setItemInfoWiFi(rs.getString(6));
				p.setItemInfoCamera(rs.getString(7));
				p.setItemInfoBattery(rs.getString(8));
				p.setItemInfoOperate(rs.getString(9));
				p.setItemInfoSize(rs.getString(10));
				p.setItemInfoUSB(rs.getString(11));
				p.setItemInfoSecure(rs.getString(12));
				p.setItemInfoAnother(rs.getString(13));
				list2.add(p);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		
		rs.close();
		stat.close();
		conn.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("CompareStart.jsp");
		rd.forward(request, response);
	%>
</body>
</html>