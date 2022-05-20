<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 
<!-- 메인 -->
<%
	String recNum = request.getParameter("recNum");
%>
<br><br><br><br>
<div style="width:80%; margin:0 auto; text-align:center">
	<h1>구매해 주셔서 감사합니다.</h1>
	<h2>주문번호는 <%=recNum %> 입니다.</h2>
</div>

<br><br><br><br>
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; 201844085 양우진 SW프로젝트 </p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
