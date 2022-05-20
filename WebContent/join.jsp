<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/shop-homepage.css" rel="stylesheet">
<title>자급자폰 회원가입</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	
	String dbURL = "jdbc:mariadb://localhost:3307/SW2";
	String dbID = "root";
	String dbPassword = "123456";
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	
	sql = "select max(userNum)+1 as m1 from user";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
	String userNum = rs.getString("m1");
%>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">자급자폰</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
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
        </ul>
      </div>
    </div>
  </nav>
	
	<!-- 회원가입 양식 -->
	<div class="container">
		<div class="col-lg-4" style="margin: 0 auto; width:50%;">
			<div class="jumbotron" style="padding-top: 20px; background-color:white;">
				<!-- 로그인 정보를 숨기면서 전송post -->
				<form method="post" action="joinAction.jsp"><br>
					<h3 style="text-align: center;">회원가입</h3><br><br>
					<input type="hidden" name="userNum" value=<%=userNum%>/> <!-- 회원번호 -->
					<input type="hidden" name="userGrade" value="0">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20">
					</div><br>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div><br>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="userName" maxlength="20">
					</div><br>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="주소"
							name="userAddress" maxlength="100">
					</div><br>
					<div class="form-group">
						<input type="tel" class="form-control" placeholder="휴대폰 번호"
							name="userPhone" maxlength="50">
					</div><br><br>
					<input type="submit" class="btn btn-primary form-control"
						value="회원가입">
				</form>
			</div>
		</div>
	</div>
	
<!-- Footer -->
<footer class="py-5 bg-dark">
  <div class="container">
    <p class="m-0 text-center text-white">Copyright &copy; 201844085 양우진 SW프로젝트</p>
  </div>
  <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
