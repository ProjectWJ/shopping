<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>자급자폰 상세정보</title>
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
  
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("상품정보가 존재하지 않습니다.");
		history.go(-2);
	</script>
</c:if>

<c:if test="${result == 1 }">
<br><br>
<div style="width:80%; margin:0 auto;">
	<h2>${itemName }</h2><hr>
	<div style="width:40%; float:left; margin-right:100px;"> <!-- 이미지 -->
			<img class="card-img-top" src="images/${itemImage}" alt="상품정보.png" style="text-align:center;">
	</div>
	<div style="width:40%; float:left; margin-left:100px;">
		등록일시 <h4>${itemDate }</h4><br>
		판매가  <h3><fmt:formatNumber value="${itemPrice }" pattern="#,###"/>원</h3><br>
		혜택 <h5>최대 6개월 무이자</h5><br>
		<div> <!-- 구매버튼 -->
			<button onclick="location='buy_One.jsp?itemNum=${itemNum }&userID=${userID }'" class="btn btn-primary form-control" style="width:200px; height:50px; float:left">구    매</button>
			<form action="basketQuery.jsp" method="post">
				<input type="hidden" name="itemNum" value="${itemNum }">
				<input type="hidden" name="userID" value="${userID }">
				<input type="submit" value="장바구니" class="btn btn-light form-control" style="width:200px; height:50px; margin-left:5%">
			</form>
		</div>
	</div><div style="clear:both"></div> <!-- 딸려 올라가는거 막기1 -->
	<!-- 제품 상세이미지 -->
	<hr>
	<img class="card-img-top" src="images/${itemImageDetail}" alt="상품상세이미지.png" style="text-align:center;">
</div>
</c:if>


<br><br>
<!-- Footer -->
<footer class="py-5 bg-dark">
  <div class="container" style="clear:both"> <!-- 딸려 올라가는거 막기2 -->
    <p class="m-0 text-center text-white">Copyright &copy; 201844085 양우진 SW프로젝트 </p>
  </div>
  <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>