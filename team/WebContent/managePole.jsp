<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonIOException"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="Model.tiltVO"%>
<%@page import="Model.tiltDAO"%>
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
<title>전주 상세정보</title>
<link rel="stylesheet" href="css/pole.css">

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>


</head>

<body>
	<div id="nav">
		<nav>
			<!-- if login : LoginMain, else : Main -->
			<button>
				<a href="Main.jsp" style="text-decoration: none">HOME</a>
			</button>
			<button id="modal_pole">전주 등록</button>
			<button id="modal_emp">사용자 등록</button>

			<!-- href="assignEmp.jsp" -->
			<a href="LogoutService">로그아웃</a>
		</nav>
	</div>


	<header>
		<div id="header">
			<div class="header_img">
				<img src="./images/upoplogo.PNG" width="100px" height="100px"
					id="logo">
			</div>
			<div class="header_h1">
				<h1>전주 통합 관리 시스템</h1>
				<h4>POLE MANAGEMENT SYSTEM</h4>
			</div>
		</div>

		<div id="cameraMove">
			<input type="button" value="카메라 화면 이동">

		</div>
	</header>
	<%
	request.setCharacterEncoding("utf-8");
	String pole_code = request.getParameter("pole_code");
	poleDAO pdao = new poleDAO();
	poleVO pvo = pdao.pole_selectONE(pole_code);
	String comment = pvo.getPole_comment();

	%>
	<section>
		<!------------------------------------ 모달 --------------------------------------->
		<div id="modal">


			<div id="cameraView">
			<img src="http://172.30.1.45:80/video_feed">
			</div>

			<input type="button" name="rol" value="뒤로" id="uncheck" class="rol">
			<input type="button" name="buzzer" value="부저 작동" id="buzzer" class="rol"
			onclick="location.href='http://172.30.1.45/buzzer'">
			<div class="modal_layer"></div>

		</div>
		<!------------------------------------ 모달 --------------------------------------->
		<div class="tb_name">

			<p style="font-size: 25px; padding: 20px">
				<b>- <%=pvo.getPole_code()%>번 전주 상세정보
				</b>
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
			<input type="button" id="modal_update" value="수정">
			<!-------------------전주 수정 모달 ----------------------------->
				<%@ include file="/UpdatePole.jsp"%>
		</div>
	</section>

	<aside>
		<%-- <div id="curve_chart" style="width: 100%; height: 350px"></div>
		<p style="font-size: 20px; padding: 20px">
			<b>&nbsp;- 특이사항 기록</b>
		</p>
		
			<div class="text_area">
				<%=comment.replace("-","<br>")%>
			</div>
			<div class="text_save">
				<button type="button" id="Memo_modal_open">기록</button>
			</div> --%>
			
			<!-- ----------------------------메모 모달--------------------------------- -->
			<div id="Memo_modal">
				<form action="pole_Memo" method="post">
					<div class="Memo_area">
						<input type="text" name="pole_memo" class = "Memo_area"></div>
						<input type="hidden" name="pole_code" value="<%=pole_code%>">
						<input type="hidden" name="pole_comment" value="<%=pvo.getPole_comment()%>">
					<div class="Memo_btn">
						<input type="button" name="rol" value="취소" id="uncheck2" class="rol">
						<input type="submit" name="save2" value="저장" class="suc" id="check2">
					</div>
				</form>
				<div class="modal_layer"></div>

			</div>
			<!-- ----------------------------메모 모달--------------------------------- -->

	</aside>


	<!-- <div id = "footer"> -->
	<div id="footer">
		<p style="color: black; font-size: 20px; text-align: center;">
			<b>전주 사진</b>
		</p>
	</div>


	<div class="slideshow-container">

		<div class="mySlides fade">
			<img src="./images/poleimg.png" width="500px" height="450px">
		</div>

		<div class="mySlides fade">
			<img src="./images/poleimg.png" width="500px" height="450px">
		</div>

		<div class="mySlides fade">
			<img src="./images/poleimg.png" width="500px" height="450px">
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
	<!--fonts-->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	

	<script>

		$("#cameraMove").click(function() {
			$("#modal").fadeIn();
		});
		$("#uncheck").click(function() {
			$("#modal").fadeOut();
		});
		
		/* Memo_modal */
		$("#Memo_modal_open").click(function() {
			$("#Memo_modal").fadeIn();
		});
		$("#uncheck2").click(function() {
			$("#Memo_modal").fadeOut();
		});
		
		/* UpdatePole_modal */
		$("#modal_update").click(function() {
			$("#modal3").fadeIn();
		});
		$("#uncheck3").click(function() {
			$("#modal3").fadeOut();
		});
	</script>
		
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		// ajax 이용해서 페이지 열릴때, 바로 함수실행
		
		$.ajax({
			
			url : 'AjaxTest',
			type : 'get',
			data : {'pole_code' : '<%=pole_code%>'},
			dataType : 'json',
			success : function(res){
				dataArray = new Array();
				dataArray.push(['month', 'tilt'])
				for(let i = 0;i<Object.keys(res).length;i++){
					data = [res[i].tilt_date,res[i].tilt_value]
					dataArray.push(data)
				}				
				chart(dataArray)
			},
			error : function(){
				alert('차트 로딩 실패');
			}
			
		})
	
	</script>

	<!-- 기울기 변화 그래프 소스 ----------------------------------------------------------------------- -->

	<script type="text/javascript">
	
	function chart(dataArray) {

		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			var data = google.visualization.arrayToDataTable(dataArray);

			var options = {
				title : '기울기 변화 그래프',
				curveType : 'function',
				legend : {
					position : 'bottom'
				}
			};

			var chart = new google.visualization.LineChart(document
					.getElementById('curve_chart'));


			chart.draw(data, options);
			}
		}

	</script>
	<!-- 기울기 변화 그래프 소스 ------------------------------------------------------------------------->
</body>
</html>

