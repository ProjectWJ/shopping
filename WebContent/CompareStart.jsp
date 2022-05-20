<%@ page import="itemInfo.ItemInfo" %>
<%@ page import="java.util.ArrayList" %>
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
<!-- 메인 비교 -->
<br><br>
<div style="width:80%; margin:0 auto;">
	<h2>휴대폰 스펙 비교</h2><hr>
	<div class="form-group">
		<br>
		<form method="post" action="CompareAction.jsp">
			<div style="width:40%; margin:0 auto; float:left;">
				<select class="form-control" name="itemName1">
					<c:forEach var="List" items="${list }">
						<option value="${List.getItemName() }">${List.getItemName() }</option>
					</c:forEach>
			  	</select>
			 </div>
			<div style="width:40%; margin-left:5%; float:left;">
				<select class="form-control" name="itemName2">
					<c:forEach var="List" items="${list }">
						<option value="${List.getItemName() }">${List.getItemName() }</option>
					</c:forEach>
			  	</select>
			 </div>
			 <div style="width:10%; margin-left:5%; float:left;">
				<input type="submit" class="btn btn-primary form-control" value="비교">
			 </div>
		 </form>
	</div><br><br>
	<div class="form-group">
		<c:forEach var="list1" items="${list1 }">
		<c:forEach var="list2" items="${list2 }">
		<table class="table">
			<tr>
			  <th scope="col">이름</th>
			  <td>${list1.getItemName()}</td>
			  <td>${list2.getItemName()}</td>
			</tr>
			<tr>
			  <th scope="col">프로세서</th>
			  <td>${list1.getItemInfoProcesser() }</td>
			  <td>${list2.getItemInfoProcesser() }</td>
			</tr>
			<tr>
			  <th scope="col">메모리</th>
			  <td>${list1.getItemInfoMemory() }</td>
			  <td>${list2.getItemInfoMemory() }</td>
			</tr>
			<tr>
			  <th scope="col">디스플레이</th>
			  <td>${list1.getItemInfoDisplay() }</td>
			  <td>${list2.getItemInfoDisplay() }</td>
			</tr>
			<tr>
			  <th scope="col">네트워크</th>
			  <td>${list1.getItemInfoNetwork() }</td>
			  <td>${list2.getItemInfoNetwork() }</td>
			</tr>
			<tr>
			  <th scope="col">근접통신</th>
			  <td>${list1.getItemInfoWiFi() }</td>
			  <td>${list2.getItemInfoWiFi() }</td>
			</tr>
			<tr>
			  <th scope="col">카메라</th>
			  <td>${list1.getItemInfoCamera() }</td>
			  <td>${list2.getItemInfoCamera() }</td>
			</tr>
			<tr>
			  <th scope="col">배터리</th>
			  <td>${list1.getItemInfoBattery() }</td>
			  <td>${list2.getItemInfoBattery() }</td>
			</tr>
			<tr>
			  <th scope="col">운영체제</th>
			  <td>${list1.getItemInfoOperate() }</td>
			  <td>${list2.getItemInfoOperate() }</td>
			</tr>
			<tr>
			  <th scope="col">규격</th>
			  <td>${list1.getItemInfoSize() }</td>
			  <td>${list2.getItemInfoSize() }</td>
			</tr>
			<tr>
			  <th scope="col">단자정보</th>
			  <td>${list1.getItemInfoUSB() }</td>
			  <td>${list2.getItemInfoUSB() }</td>
			</tr>
			<tr>
			  <th scope="col">생체인식</th>
			  <td>${list1.getItemInfoSecure() }</td>
			  <td>${list2.getItemInfoSecure() }</td>
			</tr>
			<tr>
			  <th scope="col">기타</th>
			  <td>${list1.getItemInfoAnother() }</td>
			  <td>${list2.getItemInfoAnother() }</td>
			</tr>
		</table>
		</c:forEach>
		</c:forEach>
	</div>


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