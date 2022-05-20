<%@page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*" %>
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

<br><br>
<div style="width:80%; margin:0 auto;">
	<h2>상품 상세정보 수정
	</h2><hr>
	<form method="post" action="itemManage_DetailUpdateAction.jsp"> <!-- 에러메시지가 여기 있을수도 있음 -->
		<div class="col-lg-4">
					<div class="form-group">
						상품명<input type="text" class="form-control" placeholder="상품명"
							name="itemName" maxlength="50" value="${itemName }" readonly>
					</div><br>
					<div class="form-group">
						프로세서<input type="text" class="form-control" placeholder="프로세서 입력"
							name="itemInfoProcesser" maxlength="50" value="${itemInfoProcesser }"> <!--  onkeyup="inputNumberAutoComma(this);" -->
					</div><br>
					<div class="form-group">
						메모리<input type="text" class="form-control" placeholder="메모리 입력"
							name="itemInfoMemory" maxlength="100" value="${itemInfoMemory }">
					</div><br>
					<div class="form-group">
						디스플레이<input type="text" class="form-control" placeholder="디스플레이 입력"
							name="itemInfoDisplay" maxlength="50" value="${itemInfoDisplay }">
					</div><br>
					<div class="form-group">
						네트워크<input type="text" class="form-control" placeholder="네트워크 입력"
							name="itemInfoNetwork" maxlength="50" value="${itemInfoNetwork }">
					</div><br>
					<div class="form-group">
						근접통신<input type="text" class="form-control" placeholder="근접통신 입력"
							name="itemInfoWiFi" maxlength="50" value="${itemInfoWiFi }">
					</div><br>
					<div class="form-group">
						카메라<input type="text" class="form-control" placeholder="카메라 입력"
							name="itemInfoCamera" maxlength="50" value="${itemInfoCamera }">
					</div><br>
					<div class="form-group">
						배터리<input type="text" class="form-control" placeholder="배터리 입력"
							name="itemInfoBattery" maxlength="50" value="${itemInfoBattery }">
					</div><br>
					<div class="form-group">
						운영체제<input type="text" class="form-control" placeholder="운영체제 입력"
							name="itemInfoOperate" maxlength="50" value="${itemInfoOperate }">
					</div><br>
					<div class="form-group">
						규격<input type="text" class="form-control" placeholder="규격 입력"
							name="itemInfoSize" maxlength="50" value="${itemInfoSize }">
					</div><br>
					<div class="form-group">
						단자<input type="text" class="form-control" placeholder="단자 입력"
							name="itemInfoUSB" maxlength="50" value="${itemInfoUSB }">
					</div><br>
					<div class="form-group">
						생체인식<input type="text" class="form-control" placeholder="생체인식 입력"
							name="itemInfoSecure" maxlength="50" value="${itemInfoSecure }">
					</div><br>
					<div class="form-group">
						기타<input type="text" class="form-control" placeholder="기타사항 입력"
							name="itemInfoAnother" maxlength="50" value="${itemInfoAnother }">
					</div><br>
					<input type="submit" class="btn btn-primary"
						value="수정" style="float:right">
					<br><br><br><br>
		</div>
	</form>
</div>
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
