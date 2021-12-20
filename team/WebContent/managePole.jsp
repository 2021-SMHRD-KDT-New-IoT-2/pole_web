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

<!-- ���� ��ȭ �׷��� �ҽ� ----------------------------------------------------------------------- -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', '����'],
          ['8��',  90],
          ['9��',  92],
          ['10��',  95],
          ['11��',  97],
          ['12��',  93]
        ]);

        var options = {
          title: '���� ��ȭ �׷���',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
<!-- ���� ��ȭ �׷��� �ҽ� ----------------------------------------------------------------------- -->


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
			<button id="modal_pole">���� ���</button>
			<button id="modal_emp">����� ���</button>

			<!-- href="assignEmp.jsp" -->
			<a href="LogoutService">�α׾ƿ�</a> <a href=""><img
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
			<h3>���ְ��� �ý���</h3>
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
			</div>

			<input type="button" name="rol" value="�ڷ�" id="uncheck" class="rol">


			<div class="modal_layer"></div>

		</div>
<!------------------------------------ ��� --------------------------------------->
		<div class="tb_name">

			<p style="font-size: 20px; padding: 20px" >
				<strong><%=pvo.getPole_code() %>�� ���� ������</strong>
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
			<input type="button" class="btn1" value="����"> <input
				type="submit" class="sub1" value="����">
		</div>
	</section>


	<aside>
		<div id="curve_chart" style="width: 100%; height: 310px"></div>
		<p style="font-size: 20px; padding: 20px">
			<b>&nbsp;&nbsp;Ư�̻��� ���</b>
		</p>

		<form action="pole_Memo?pole_code=<%=pole_code %>" method="post">
			<div class="text_area">
				<textarea name="pole_coment">

            
            </textarea>
			</div>
			<div class="text_save">
				<input type="submit" name="save2" value="����">
			</div>
		</form>

	</aside>


	<!-- <div id = "footer"> -->
	<div id="footer">
		<p style="color: black; font-size: 20px; padding: 20px">
			<b>����</b>
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
			<input type="button" value="���� �ٲٱ�">
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