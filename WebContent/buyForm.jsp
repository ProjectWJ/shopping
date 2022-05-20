<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="item.Item" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>자급자폰</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/shop-homepage.css" rel="stylesheet">
</head>

<body>

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%>
	
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="main.jsp">자급자폰</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        <%
			if(userID == null){		// 미로그인 상태
		%>
          <li class="nav-item active">
            <a class="nav-link" href="main.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Compare.jsp">Phone Compare</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="login.jsp">Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="basketList.jsp?userID=${userID }">Shopping Basket</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="inquiry.jsp">Order Inquiry</a>
          </li>
  		<% 
			} else if (userID != null && !userID.equals("admin")){ // 일반 유저 로그인일 경우
		%>
			<li class="nav-item active">
            <a class="nav-link" href="main.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Compare.jsp">Phone Compare</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout.jsp">Logout</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="basketList.jsp?userID=${userID }">Shopping Basket</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="inquiry.jsp">Order Inquiry</a>
          </li>
          	<%
				} else if (userID != null && userID.equals("admin")){ // 관리자 로그인일 경우
			%>
			<li class="nav-item active">
            <a class="nav-link" href="main.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Compare.jsp">Phone Compare</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout.jsp">Logout</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="memberManage_Query.jsp">Member</a> <!-- 회원 관리 -->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="itemManage_Query.jsp">Item</a> <!-- 상품 관리 -->
          </li>
			<%
				}
            %>
        </ul>
      </div>
    </div>
  </nav>

<!-- 여기부터 상품 정보 구간 -->

<script type="text/javascript">
	function check() {
		if (!frm.userName.value){
			alert("이름을 입력하세요.");
			frm.userName.focus();
			return false;
		}
		if (!frm.userPhone.value){
			alert("연락처를 입력하세요.");
			frm.userPhone.focus();
			return false;
		}
		if (!frm.userAddress.value){
			alert("상품재고를 입력하세요..");
			frm.userAddress.focus();
			return false;
		}
		return true;
	}
</script><br><br>
<%@ include file="itemDB.jsp" %> <!-- 영수증 번호 생성 -->
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select sum(recNum)+1 as r1 from receipt";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
	String recNum = rs.getString("r1");
	rs.close();
	pstmt.close();
	conn.close();
%>
<div style="width:80%; margin:0 auto;">
	<h2>주문결제</h2><hr>
	<form method="post" action="buyAction.jsp" name="frm" onsubmit="return check()">
		<input type="hidden" name="recNum" value="<%=recNum %>">
		<div style="width:40%; margin:0 auto;">
			<h5>주문자 정보</h5><hr>
			<div class="form-group">
				이름<input type="text" class="form-control" placeholder="이름 입력"
					name="userName" maxlength="50" value="${userName }">
			</div><br>
			<div class="form-group">
				연락처<input type="text" class="form-control" placeholder="상품명 입력"
					name="userPhone" maxlength="50" value="${userPhone }">
			</div><br>
			<div class="form-group">
				배송지<input type="text" class="form-control" placeholder="배송지 입력"
					name="userAddress" maxlength="500" value="${userAddress }">
			</div><br>
			</div>
			<div style="width:40%; margin:0 auto;">
			<br><h5>주문상품 정보</h5><br>
			<table class="table">
				<thead>
				  <tr>
				    <th scope="col" style="text-align:center">상품명</th>
				    <th scope="col" style="text-align:center">가격</th>
				  </tr>
				<c:forEach var="basList" items="${basList }">
					<tr>
						<td style="text-align:center">${basList.getBasItemName() }</td>
						<td style="text-align:center"><fmt:formatNumber value="${basList.getBasItemPrice() }" pattern="#,###"/>원</td>
					</tr>
				</c:forEach>
				</thead>
			</table><br>
			<input type="submit" class="btn btn-primary btn-lg" style="float:right"
				value="결제하기">
			
			</div>
	</form>
	<br><br><br><br>
</div>
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container" >
      <p class="m-0 text-center text-white">Copyright &copy; 201844085 양우진 SW프로젝트 </p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
