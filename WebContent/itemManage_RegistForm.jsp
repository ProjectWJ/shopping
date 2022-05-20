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

<script type="text/javascript">
function inputNumberAutoComma(obj) { // 숫자 입력 시 자동으로 ,찍어주는 함수
    // 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
    var deleteComma = obj.value.replace(/\,/g, "");
    // 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
    if(isFinite(deleteComma) == false) {
        alert("문자는 입력하실 수 없습니다.");
        obj.value = "";
        return false;
    }
    // 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
    obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
}
// 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
function inputNumberWithComma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
}
// 콤마( , )가 들어간 값에 콤마를 제거하는 함수
function inputNumberRemoveComma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, "");
}
</script>
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
		if (!frm.itemName.value){
			alert("상품명을 입력하세요.");
			frm.itemName.focus();
			return false;
		}
		if (!frm.itemPrice.value){
			alert("상품가격을 입력하세요.");
			frm.itemPrice.focus();
			return false;
		}
		if (!frm.itemVolume.value){
			alert("상품재고를 입력하세요..");
			frm.itemVolume.focus();
			return false;
		}
		if (!frm.itemInformation.value){
			alert("상품 요약정보를 입력하세요.");
			frm.itemInformation.focus();
			return false;
		}
		return true;
	}
</script><br><br>
<%@ include file="itemDB.jsp" %> <!-- itemNum 생성 -->
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select sum(itemNum)+1 as i1 from item";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
	String itemNum = rs.getString("i1");
%>
<div style="width:80%; margin:0 auto;">
	<h2>상품 등록</h2><hr>
	<form method="post" action="itemManage_RegistAction.jsp" enctype="multipart/form-data" name="frm" onsubmit="return check()">
		<input type="hidden" name="itemNum" value="<%=itemNum %>">
		<div class="col-lg-4">
					<div class="form-group">
						상품 카테고리<br>
						<select class="form-control" name="itemCategory">
					      <option value="Galaxy Z">Galaxy Z</option>
					      <option value="Galaxy S">Galaxy S</option>
					      <option value="Galaxy A">Galaxy A</option>
					      <option value="iPhone 13">iPhone 13</option>
					      <option value="iPhone 12">iPhone 12</option>
					      <option value="Another">Another</option>
					  </select>
					</div><br>
					<div class="form-group">
						상품명<input type="text" class="form-control" placeholder="상품명 입력"
							name="itemName" maxlength="50">
					</div><br>
					<div class="form-group">
						상품 가격<input type="text" class="form-control" placeholder="가격 입력"
							name="itemPrice" maxlength="50" onkeyup="inputNumberAutoComma(this);"> <!--  onkeyup="inputNumberAutoComma(this);" -->
					</div><br>
					<div class="form-group">
						상품 초기재고<input type="text" class="form-control" placeholder="초기재고 입력"
							name="itemVolume" maxlength="100">
					</div><br>
					<div class="form-group">
						상품 요약정보<input type="text" class="form-control" placeholder="요약정보 입력"
							name="itemInformation" maxlength="50">
					</div><br>
					<div class="form-group">
						상품 메인 이미지<input class="form-control" type="file" id="formFile"
							name="itemImage">
					</div><br>
					<div class="form-group">
						상품 상세 이미지<input class="form-control" type="file" id="formFile2"
							name="itemImageDetail">
					</div><br>
					<input type="submit" class="btn btn-primary" style="float:right"
						value="등록">
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
