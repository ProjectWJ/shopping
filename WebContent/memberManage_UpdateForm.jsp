<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script type="text/javascript">
	function check() {
		if (!frm.userPassword.value){
			alert("비밀번호를 입력하세요.");
			frm.userPassword.focus();
			return false;
		}
		if (!frm.userName.value){
			alert("이름을 입력하세요.");
			frm.userName.focus();
			return false;
		}
		if (!frm.userAddress.value){
			alert("주소를 입력하세요.");
			frm.userAddress.focus();
			return false;
		}
		if (!frm.userPhone.value){
			alert("휴대폰번호를 입력하세요.");
			frm.userPhone.focus();
			return false;
		}
		return true;
	}
</script><br><br>
<div style="width:80%; margin:0 auto;">
	<h2>회원 정보 수정</h2><hr>
	<form action="memberManage_UpdateQuery.jsp" name="frm" onsubmit="return check()">
		<c:if test="${result == 1 }"> <!-- 회원정보를 성공적으로 불러오면 실행 -->
			<div class="container">
		<div class="col-lg-4" style="margin: 0 auto; width:50%;">
			<div class="jumbotron" style="padding-top: 20px; background-color:white;">
				<!-- 로그인 정보를 숨기면서 전송post -->
				<input type="hidden" name="userNum" value="${userNum }">
					<div class="form-group">
						아이디(수정 불가)<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20" value="${userID }" readonly/>
					</div><br>
					<div class="form-group">
						비밀번호<input type="password" class="form-control" placeholder="새 비밀번호"
							name="userPassword" maxlength="20" value="${userPassword }">
					</div><br>
					<div class="form-group">
						이름<input type="text" class="form-control" placeholder="이름"
							name="userName" maxlength="20" value="${userName }">
					</div><br>
					<div class="form-group">
						주소<input type="text" class="form-control" placeholder="주소"
							name="userAddress" maxlength="100" value="${userAddress }">
					</div><br>
					<div class="form-group">
						휴대폰 번호<input type="tel" class="form-control" placeholder="휴대폰 번호"
							name="userPhone" maxlength="50" value="${userPhone }">
					</div><br><br>
					<input type="submit" class="btn btn-primary form-control"
						value="수정">
					<br><br><br><br>
					<a onclick="return confirm('정말로 탈퇴시겠습니까? 탈퇴 후에는 되돌릴 수 없습니다.')" href="memberManage_Delete.jsp?userID=${userID }" class="btn btn-danger form-control"style="float:left">탈퇴</a>
			</div>
		</div>
	</div>
		</c:if>
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
