<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> <!-- 상품등록 액션 -->
</head>
<body>

	<%
	
		// String test = request.getSession().getServletContext().getRealPath("/images");
		// MultipartRequest multi = new MultipartRequest(request, test, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\tlrhd\\eclipse-workspace_2\\SWproject_2\\WebContent\\images", 10*1024*1024, "utf-8", new DefaultFileRenamePolicy());

		// 이거 상대경로로 못하나..
		
		Enumeration files = multi.getFileNames();
		
		String inputImageDetail = (String)files.nextElement();
		String itemImageDetail = multi.getFilesystemName(inputImageDetail);
		
		String inputImage = (String)files.nextElement(); // input에 지정한 이름을 가져옴
		String itemImage = multi.getFilesystemName(inputImage); // 파일명 중복 정책 처리가 완료된 파일 이름
	%>

	<%@ include file="itemDB.jsp" %>
	<%
		// 날짜 저장을 위해 date 사용
		Date nowTime = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		PreparedStatement pstmt = null;
		String sql = "insert into item values (?,?,?,?,?,?,?,?,?); insert into iteminfo (itemName) VALUE (?);";
		
		int result = 0;

		
		String itemPrice_p = (multi.getParameter("itemPrice")).replace(",", ""); // , 제거 작업
		
		// insert할 데이터 정리
		request.setCharacterEncoding("utf-8"); // 번호, 카테고리, 이름, 가격, 재고, 요약정보, 날짜, 이미지, 상세이미지

		String itemNum = multi.getParameter("itemNum");
		String itemCategory = multi.getParameter("itemCategory");
		String itemName = multi.getParameter("itemName");
		int itemPrice = Integer.parseInt(itemPrice_p);
		int itemVolume = Integer.parseInt(multi.getParameter("itemVolume"));
		String itemInformation = multi.getParameter("itemInformation");
		String itemDate = simpleDateFormat.format(nowTime);
		// String itemImage = multi.getParameter("itemImage");
		// String itemImageDetail = multi.getParameter("itemImageDetail");
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, itemNum);
		pstmt.setString(2, itemCategory);
		pstmt.setString(3, itemName);
		pstmt.setInt(4, itemPrice);
		pstmt.setInt(5, itemVolume);
		pstmt.setString(6, itemInformation);
		pstmt.setString(7, itemDate);
		pstmt.setString(8, itemImage);
		pstmt.setString(9, itemImageDetail);
		pstmt.setString(10, itemName);
		
		result = pstmt.executeUpdate();
		
		request.setAttribute("result", result);
		
		pstmt.close();
		conn.close();
	%>
	<jsp:forward page="itemManage_RegistResult.jsp"></jsp:forward>
</body>
</html>