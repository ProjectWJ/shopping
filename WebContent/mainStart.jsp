<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">${itemCategory }</h1> <!-- 여기는 카테고리 -->
        <div class="list-group">
          <a href="main.jsp" class="list-group-item">갤럭시 Z</a>
          <a href="main.jsp?itemCategory=Galaxy S" class="list-group-item">갤럭시 S</a>
          <a href="main.jsp?itemCategory=Galaxy A" class="list-group-item">갤럭시 A</a>
        </div>
        <br>
		<div class="list-group">
          <a href="main.jsp?itemCategory=iPhone 13" class="list-group-item">아이폰 13</a>
          <a href="main.jsp?itemCategory=iPhone 12" class="list-group-item">아이폰 12</a>
        </div>
        <br>
        <div class="list-group">
          <a href="main.jsp?itemCategory=Another" class="list-group-item">기타</a>
        </div>
      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox"> <!-- 여기는 스크롤 광고판 -->
            <div class="carousel-item active">
              <a href="item_Query.jsp?itemNum=1"><img class="d-block img-fluid" src="images/z플립.png" alt="First slide"></a>
            </div>
            <div class="carousel-item">
              <a href="item_Query.jsp?itemNum=2"><img class="d-block img-fluid" src="images/s21.png" alt="Second slide"></a>
            </div>
            <div class="carousel-item">
              <a href="item_Query.jsp?itemNum=4"><img class="d-block img-fluid" src="images/ip13pro.png" alt="Third slide"></a>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>


	<%
	response.setContentType("text/html;charset=utf8");
	request.setCharacterEncoding("utf-8");
	
	ArrayList<Item> item = (ArrayList<Item>)request.getAttribute("list");
	%>


        <div class="row"> <!-- 아이템 표시는 여기부터 -->

	<c:forEach var="List" items="${list }"> <!-- 여기부터 해야 레이아웃이 예쁘게 돌아간다. -->
          <div class="col-lg-4 col-md-6 mb-4" style="text-align:center;">
            <div class="card h-100">
              <a href="item_Query.jsp?itemNum=${List.getItemNum() }"><img class="card-img-top" src="images/${List.getItemImage() }" alt="" width="400px" height="300px"></a> <!-- 아이템의 이미지 -->
              <div class="card-body">
                <h4 class="card-title">
                  <a href="item_Query.jsp?itemNum=${List.getItemNum() }">${List.getItemName()}</a> <!-- 아이템의 이름 -->
                </h4>
                <h5><fmt:formatNumber value="${List.getItemPrice() }" pattern="#,###"/>원</h5> <!-- 아이템의 가격. 3자리마다 ,찍어주기 -->
                <p class="card-text" style="font-size:small;">${List.getItemInformation() }</p> <!-- 아이템의 요약 정보 -->
              </div>
              <div class="card-footer">
                <button type="button" class="btn btn-outline-primary btn-block" onclick = "location.href = 'item_Query.jsp?itemNum=${List.getItemNum() }'">상세보기</button> <!-- 상세보기 링크 -->
              </div>
            </div>
          </div>
	</c:forEach>
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

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
