<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="Model.poleDAO"%>
<%@page import="Model.poleVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html id="html" style="position: relative; display: grid;">
<head>
<meta charset="EUC-KR">
<link rel="shorcut icon" type="image/x-icon"
	href="./images/upoplogo.PNG" type="text/css">
<title>POLE OF PISA 전주관리 시스템</title>
<link rel="stylesheet" href="css/pole.css">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<!-- 기울기 변화 그래프 소스 ----------------------------------------------------------------------- -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', '기울기'],
          ['8월',  90],
          ['9월',  92],
          ['10월',  95],
          ['11월',  97],
          ['12월',  93]
        ]);

        var options = {
          title: '기울기 변화 그래프',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
<!-- 기울기 변화 그래프 소스 ----------------------------------------------------------------------- -->


</head>
<style>
* {
	font-family: 'Nanum Gothic', sans-serif;
}

textarea {
	resize: none;
	width: 100%;
	height: 100%;
}

.tb_name {
	margin-left: 10px;
}
</style>
<body>
	<div id="nav">
		<nav>
			<!-- if login : LoginMain, else : Main -->
			<button><a href="Main.jsp" style="text-decoration:none">HOME</a></button>
			<button id="modal_pole">전주 등록</button>
			<button id="modal_emp">사용자 등록</button>

			<!-- href="assignEmp.jsp" -->
			<a href="LogoutService">로그아웃</a> <a href=""><img
				src="./images/bell.png" class="img" width="30px" height="30px"
				style="margin-top: 1%;"></a>
		</nav>
	</div>


	<header>
		<div class="logo">
			<img src="./images/upoplogo.PNG" width="60px" height="60px">
		</div>
		<div class="logo_name">
			<h2>Utility Pole Of Pisa</h2>
			<h3>전주관리 시스템</h3>
		</div>
		<div id="cameraMove">
			<input type="button" value="카메라 화면 이동">
		</div>
	</header>
	<%
request.setCharacterEncoding("utf-8");
String pole_code = request.getParameter("pole_code");
String pole_comment = request.getParameter("pole_comment");
poleDAO pdao = new poleDAO();	
poleVO pvo = pdao.pole_selectONE(pole_code);
%>

	<section>
	<!------------------------------------ 모달 --------------------------------------->
		<div id="modal">


			<div id="cameraView">
			</div>

			<input type="button" name="rol" value="뒤로" id="uncheck" class="rol">


			<div class="modal_layer"></div>

		</div>
<!------------------------------------ 모달 --------------------------------------->
		<div class="tb_name">

			<p style="font-size: 20px; padding: 20px" >
				<strong><%=pvo.getPole_code() %>번 전주 상세정보</strong>
			</p>
		</div>
		<div class="tb_body">
			<form action="Main.jsp" name="pole_tb" class="fom_tb" method="post">
				<table id="pole_tb">
					<tr>
						<th>전주 번호</th>
						<th>전주 높이</th>
						<th>전주 주소</th>
						<th>설치 일자</th>
						<th>관할 지구</th>
						<th>고압선 유무</th>
						<th>저압선 유무</th>
						<th>통신선 유무</th>
						<th>변압기 유무</th>
						<th>관리등급</th>
					</tr>

					<tr>
						<td><%=pvo.getPole_code()%></td>
						<td><%=pvo.getPole_height()%></td>
						<td><%=pvo.getPole_addr()%></td>
						<td><%=pvo.getPole_date()%></td>
						<td><%=pvo.getPole_office()%></td>
						<td><%=pvo.getPole_high()%></td>
						<td><%=pvo.getPole_down()%></td>
						<td><%=pvo.getPole_com()%></td>
						<td><%=pvo.getTransformer_yn()%></td>
						<td><%=pvo.getPole_level()%></td>
					</tr>


				</table>
			</form>
		</div>
		<div class="tb_nav">
			<input type="button" class="btn1" value="이전"> <input
				type="submit" class="sub1" value="수정">
		</div>
	</section>


	<aside>
		<div id="curve_chart" style="width: 100%; height: 310px"></div>
		<p style="font-size: 20px; padding: 20px">
			<b>&nbsp;&nbsp;특이사항 기록</b>
		</p>

		<form action="pole_Memo?pole_code=<%=pole_code %>" method="post">
			<div class="text_area">
				<textarea name="pole_coment">

            
            </textarea>
			</div>
			<div class="text_save">
				<input type="submit" name="save2" value="저장">
			</div>
		</form>

	</aside>


	<!-- <div id = "footer"> -->
	<div id="footer">
		<p style="color: black; font-size: 20px; padding: 20px">
			<b>사진</b>
		</p>
	</div>


	<div class="slideshow-container">

		<div class="mySlides fade">
			<img src="./images/poleimg.png" width="450px" height="450px">
		</div>

		<div class="mySlides fade">
			<img src="./images/poleimg.png" width="450px" height="450px">
		</div>

		<div class="mySlides fade">
			<img src="./images/poleimg.png" width="450px" height="450px">
		</div>


		<div class="dots" style="text-align: center">
			<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
				onclick="currentSlide(2)"></span> <span class="dot"
				onclick="currentSlide(3)"></span>
		</div>
		<div class="img_save">
			<input type="button" value="사진 바꾸기">
		</div>
	</div>

	<script src="./js/jquery-3.6.0.min.js"></script>


	<script src="./js/managePole.js"></script>

	<!--fonts-->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
		rel="stylesheet">

	<script>
        $("#cameraMove").click(function () {
            $("#modal").fadeIn();
        });
        $("#uncheck").click(function () {
            $("#modal").fadeOut();
        });
    </script>

</body>
</html>