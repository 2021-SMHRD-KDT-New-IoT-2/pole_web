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
<title>POLE OF PISA ���ְ��� �ý���</title>
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
			<button id="modal_pole">���� ���</button>
			<button id="modal_emp">����� ���</button>

			<!-- href="assignEmp.jsp" -->
			<a href="LogoutService">�α׾ƿ�</a> <a href=""><img
				src="./images/bell.png" class="img" width="30px" height="30px"
				style="margin-top: 1%;"></a>
		</nav>
	</div>


	<header>
		<div id="header">
			<div class="header_img">
				<img src="./images/upoplogo.PNG" width="100px" height="100px"
					id="logo">
			</div>
			<div class="header_h1">
				<h1>���� ���� ���� �ý���</h1>
				<h4>POLE MANAGEMENT SYSTEM</h4>
			</div>
		</div>

		<div id="cameraMove">
			<input type="button" value="ī�޶� ȭ�� �̵�">

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
		<!------------------------------------ ��� --------------------------------------->
		<div id="modal">


			<div id="cameraView">
			<img src="http://172.30.1.45:80/video_feed">
			</div>

			<input type="button" name="rol" value="�ڷ�" id="uncheck" class="rol">
			<input type="button" name="buzzer" value="���� �۵�" id="buzzer" class="rol"
			onclick="location.href='http://172.30.1.45/buzzer'">
			<div class="modal_layer"></div>

		</div>
		<!------------------------------------ ��� --------------------------------------->
		<div class="tb_name">

			<p style="font-size: 25px; padding: 20px">
				<b>- <%=pvo.getPole_code()%>�� ���� ������
				</b>
			</p>
		</div>
		<div class="tb_body">
			<form action="Main.jsp" name="pole_tb" class="fom_tb" method="post">
				<table id="pole_tb">
					<tr>
						<th>���� ��ȣ</th>
						<th>���� ����</th>
						<th>���� �ּ�</th>
						<th>��ġ ����</th>
						<th>���� ����</th>
						<th>��м� ����</th>
						<th>���м� ����</th>
						<th>��ż� ����</th>
						<th>���б� ����</th>
						<th>�������</th>
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
			<input type="button" class="btn1" value="����"> 
			<input type="button" id="modal_update" value="����">
			
		<center>

		</div>
	</section>

	<aside>
		<div id="curve_chart" style="width: 100%; height: 350px"></div>
		<p style="font-size: 20px; padding: 20px">
			<b>&nbsp;- Ư�̻��� ���</b>
		</p>

		<form action="pole_Memo" method="post">
			<div class="text_area">
				<textarea name="pole_memo"></textarea>
			</div>
			<div class="text_save">
				<input type="hidden" name="pole_code" value="<%=pole_code%>">
				<input type="hidden" name="pole_comment"
					value="<%=pvo.getPole_comment()%>">
				<button type="button" id="Memo_modal_open">���</button>
			</div>
			
			<!-- ----------------------------�޸� ���--------------------------------- -->
			<div id="Memo_modal">
				<div class="Memo_area"><input type="text" class = "Memo_area"></div>
				<div class="Memo_btn">
					<input type="button" name="rol" value="���" id="uncheck2"
						class="rol"> <input type="submit" name="save2" value="����"
						class="suc" id="check2">
				</div>
				<div class="modal_layer"></div>

			</div>
			<!-- ----------------------------�޸� ���--------------------------------- -->
		</form>

	</aside>


	<!-- <div id = "footer"> -->
	<div id="footer">
		<p style="color: black; font-size: 20px; text-align: center;">
			<b>���� ����</b>
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
			<input type="button" value="���� �ٲٱ�">
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
		
		/* Memo_modal
		*/
		$("#Memo_modal_open").click(function() {
			$("#Memo_modal").fadeIn();
		});
		$("#uncheck2").click(function() {
			$("#Memo_modal").fadeOut();
		});
	</script>

	<!-- ���� ��ȭ �׷��� �ҽ� ----------------------------------------------------------------------- -->
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			var data = google.visualization.arrayToDataTable([ [ 'M', '����' ],
					[ '8��', 90 ], [ '9��', 88 ], [ '10��', 85.5 ],
					[ '11��', 84.5 ], [ '12��', 81.2 ] ]);

			var options = {
				title : '���� ��ȭ �׷���',
				curveType : 'function',
				legend : {
					position : 'bottom'
				}
			};

			var chart = new google.visualization.LineChart(document
					.getElementById('curve_chart'));


			chart.draw(data, options);
		}

	</script>
	<!-- ���� ��ȭ �׷��� �ҽ� ----------------------------------------------------------------------- -->
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-IoT-2/pole_web.git
</body>
</html>

