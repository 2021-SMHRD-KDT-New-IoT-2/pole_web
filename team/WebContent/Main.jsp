<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="Model.poleDAO"%>
<%@page import="Model.tiltDAO"%>
<%@page import="Model.cameraDAO"%>
<%@page import="Model.impactDAO"%>
<%@page import="Model.poleVO"%>
<%@page import="Model.tiltVO"%>
<%@page import="Model.impactVO"%>
<%@page import="Model.cameraVO"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html>
<head>
<link rel="shorcut icon" type="image/x-icon" href="./images/upoplogo.PNG" type="text/css">
<title>POLE OF PISA 전주관리 시스템</title>
<link rel="stylesheet" href="css/Maincss.css">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<style>
@font-face {
	font-family: 'neon';
	src: url('./fonts/SF-Pro.ttf') format('truetype');
}

* {
	font-family: neon;
	}

#btnimpt, #btnmtn, #btntt {
	border-radius: 10px;
	width: 31.5%;
	height: 16%;
	font-size: 15px;
	border: #ccc solid 1px;
	padding: 10px;
	color: wheat;
    background: #000000bd;
	-webkit-transition: all 0.1s ease;
}
#btnimpt:hover, #btnmtn:hover, #btntt:hover {
	background: #000000d6;
	color : white;
}

#select_line {
	margin-left: 5%;
	margin-bottom : 2%;
}

#footer {
	margin-top: 40%;
}

</style>
<body>

	<%
	request.setCharacterEncoding("utf-8");
	poleVO pvo = (poleVO) session.getAttribute("pole");

	poleDAO pdao = new poleDAO();
	ArrayList<poleVO> arrpVO = pdao.pole_selectAll();

	tiltDAO tdao = new tiltDAO();
	impactDAO idao = new impactDAO();
	cameraDAO cdao = new cameraDAO();

	String pole_code = request.getParameter("pole_code");
	String pole_height = request.getParameter("pole_height");
	String pole_date = request.getParameter("pole_date");
	String emp_id = request.getParameter("emp_id");
	String transformer_yn = request.getParameter("transformer_yn");
	String pole_office = request.getParameter("pole_office");
	String pole_high = request.getParameter("pole_high");
	String pole_down = request.getParameter("pole_down");
	String pole_com = request.getParameter("pole_com");
	String camera_date = request.getParameter("camera_date");
	String impact_date = request.getParameter("impact_date");
	String tilt_date = request.getParameter("tilt_date");
	String mac_code = request.getParameter("mac_code");
	String pole_level = request.getParameter("pole_level");
	
	ArrayList<poleVO> filter = pdao.filter(pole_height, pole_date, emp_id, transformer_yn, pole_office, pole_high, pole_down, pole_com, pole_code);
	ArrayList<tiltVO> t_alarm = tdao.tiltvalue();
	ArrayList<cameraVO> c_alarm = cdao.cameravalue();
	ArrayList<impactVO> i_alarm = idao.impactvalue();
	%>

<!-- 네비게이션  -->
   <div id="nav" style="height: 60px;">
      <nav>
      <p style="float:left; color:wheat; font-size:20px; margin: 0.8% 0% 0% 6%;">Utility Pole Of Pisa</p>
         <button>
            <a href="Main.jsp" style="color: wheat; text-decoration: none;"> HOME</a>
         </button>
         <button id="modal_pole">전주 등록</button>
         <button id="modal_emp">사용자 등록</button>
         <a href="LogoutService" style="margin-right: 11%;">로그아웃</a>
      </nav>
      	<div class="nav_img">
      	<img src="./images/bar.png" width="100%" height="60px">		
		</div>
   </div>

	<!-- 헤더 -->
	<div id="header">
		<div class="header_img">
			<img src="./images/upoplogo.PNG" width="100px" height="100px"
				id="logo">
		</div>
		<div class="header_h1">
			<b style="font-size: 40px; margin-left : -60%;">전주 통합 관리 시스템</b>
			<br>
			<p style="font-size: 30px; margin-left : -60%;">POLE MANAGEMENT SYSTEM</p>
		</div>
	</div>
	
	<!-- 사용자등록, 전주등록 modal include -->
	<%@ include file="/modal_assignEmp.jsp"%>
	<%@ include file="/modal_assignPole.jsp"%>

	<!-- 검색창 필터링  -->
   <div id="searchBar">
      <div id="field_area">
         <form action="Main.jsp" method="get">
            <fieldset>
            <div class="fieldset_head" style="width:100%; height : 40px; background:#000000bd; color:white; border-radius : 10px;">
               <p style="text-align: center; line-height : 2.5; color:wheat;">광주광역시</p>
               </div>

               <label>&nbsp;&nbsp;&nbsp;담당 사업소</label> <select name="pole_office">
                  <option value="">선택</option>
                  <option value="동구">동구</option>
                  <option value="서구">서구</option>
                  <option value="남구">남구</option>
                  <option value="북구">북구</option>
                  <option value="광산구">광산구</option>
               </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>관리자</label> <input
                  type="text" name="emp_id"
                  style="width: 100px; height: 40px; margin-right: 4%; font-size: 15px;">&nbsp;&nbsp;&nbsp;
               <label>설치 일자</label> <input type="text" name="pole_date"
                  id="searchtext">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

               <label>높이</label> <input type="text" name="pole_height"
                  id="searchtext"> <br> <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;변압기</label>
               <select name="transformer_yn" id="searchtext">


                  <option value="">선택</option>
                  <option value="Y">Y</option>
                  <option value="N">N</option>
               </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> 고압선 </label> <select
                  name="pole_high">
                  <option value="">선택</option>
                  <option value="Y">Y</option>
                  <option value="N">N</option>
               </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> 저압선</label> <select
                  name="pole_down">
                  <option value="">선택</option>
                  <option value="Y">Y</option>
                  <option value="N">N</option>
               </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
                  통신선</label> <select name="pole_com">
                  <option value="">선택</option>
                  <option value="Y">Y</option>
                  <option value="N">N</option>
               </select>&nbsp;&nbsp;&nbsp; <input type="text" name="pole_code"
                  class="filter" placeholder="전주 번호 검색" style="height: 40px; float:left; width:120px; margin-left: 70%; margin-top: 2.5%; text-align:center;"> <input
                  type="submit" name="pole_code" value="검색" class="filter_search"
                  style="float: right; color: black; background-color: white; border: 1px solid #ccc; margin-right: 4.7%; width: 100px; ">
            </fieldset>
         </form>
      </div>


		<!-- 알림메세지  -->
		<div id="alarm">
			<button id="btnimpt">충격감지 <div><img src="./images/thunder.png" width="20px" height="20px" style="float:right; margin-right:13%; margin-top:-14%"></div></button>
			<button id="btnmtn">모션감지<div><img src="./images/photo.png" width="20px" height="20px" style="float:right; margin-right:13%; margin-top:-14%"></div></button>
			<button id="btntt">기울기감지<div><img src="./images/bell.png" width="20px" height="20px" style="float:right; margin-right:8%; margin-top:-14%"></div></button>


			<div id="impactdiv">
				<%
					for (int i = 0; i < i_alarm.size(); i++) {
				%>
				<div id="alarmback">
					<img src="./images/thunder.png" width="30px" height="30px"
						style="float: left; margin-top: -1%">
					<div id="alarm_msg">
						<%=i_alarm.get(i).getImpact_date()%>에 <b><a
							href="managePole.jsp?pole_code=<%=i_alarm.get(i).getMac_code()%>"><%=i_alarm.get(i).getMac_code()%></a></b>에서
						충격이 감지 됨 <br>
					</div>
				</div>
				<%
					}
				%>
			</div>


			<div id="motiondiv">
				<%
					for (int i = 0; i < c_alarm.size(); i++) {
				%>
				<div id="alarmback">
					<img src="./images/photo.png" width="30px" height="30px"
						style="float: left; margin-top: -1%">
					<div id="alarm_msg">
						<%=c_alarm.get(i).getCamera_date()%>에 <b><a
							href="managePole.jsp?pole_code=<%=c_alarm.get(i).getMac_code()%>"><%=c_alarm.get(i).getMac_code()%></a></b>에서
						모션이 감지 됨 <br>
					</div>
				</div>
				<%
					}
				%>
			</div>

			<div id="tiltdiv">
				<%
					for (int i = 0; i < t_alarm.size(); i++) {
				%>
				<div id="alarmback">
					<img src="./images/bell.png" width="30px" height="30px"
						style="float: left; margin-top: -1%">
					<div id="alarm_msg">
						<%=t_alarm.get(i).getTilt_date()%>에 <b><a
							href="managePole.jsp?pole_code=<%=t_alarm.get(i).getMac_code()%>"><%=t_alarm.get(i).getMac_code()%></a></b>에서
						기울기 변화가 감지 됨 <br> <b>(현재 기울기 : <%=t_alarm.get(i).getTilt_value()%>)
						</b>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>

	</div>
	<!-- 알림메세지 끝 -->


	<!-- 검색 전 pole_info 전체결과 -->
	<%
		if (pole_height == null) {
	%>
	<div id="wrapper">
		<div class="search_container" style="text-align: center;">
			<table id="poletable" style="text-align: center; margin: auto;">
				<tr>
					<th>위험도</th>
					<th>전주번호</th>
					<th>관리자</th>
					<th>담당 사업소</th>
					<th>설치일자</th>
					<th>높이</th>
					<th>변압기</th>
					<th>고압선</th>
					<th>저압선</th>
					<th>통신선</th>
					<th>현재 기울기</th>


				</tr>
				<%
					for (int i = 0; i < arrpVO.size(); i++) {
				%>
				
				<% if(arrpVO.get(i).getNow_tilt()<79) { %>
				
				<tr style="background: wheat;">
					<%
						if (arrpVO.get(i).getNow_tilt()>80 && arrpVO.get(i).getNow_tilt()<85 ) {
					%>
					<td><img src="./images/middlesign.png" width="35px"
						height="35px"></td>

					<%
						} else if (arrpVO.get(i).getNow_tilt()<79 ) {
					%>
					<td><img src="./images/high.png" width="40px" height="40px"></td>
					<%
						} else if (arrpVO.get(i).getNow_tilt()>=86 || arrpVO.get(i).getNow_tilt()<=90) {
					%>
					<td><img src="./images/checked.png" width="30px" height="30px"></td>
					<%
						}
					%>
					<td><a
						href="managePole.jsp?pole_code=<%=arrpVO.get(i).getPole_code()%>"><%=arrpVO.get(i).getPole_code()%></a></td>
					<td><%=arrpVO.get(i).getEmp_id()%></td>
					<td><%=arrpVO.get(i).getPole_office()%></td>
					<td><%=arrpVO.get(i).getPole_date()%></td>
					<td><%=arrpVO.get(i).getPole_height()%></td>
					<td><%=arrpVO.get(i).getTransformer_yn()%></td>
					<td><%=arrpVO.get(i).getPole_high()%></td>
					<td><%=arrpVO.get(i).getPole_down()%></td>
					<td><%=arrpVO.get(i).getPole_com()%></td>
					<td><%=arrpVO.get(i).getNow_tilt()%></td>
				</tr>
				
				<%
				}else{
				%>
				<tr>
					<%
						if (arrpVO.get(i).getNow_tilt()>80 && arrpVO.get(i).getNow_tilt()<85 ) {
					%>
					<td><img src="./images/middlesign.png" width="35px"
						height="35px"></td>

					<%
						} else if (arrpVO.get(i).getNow_tilt()<79 ) {
					%>
					<td><img src="./images/high.png" width="40px" height="40px"></td>
					<%
						} else if (arrpVO.get(i).getNow_tilt()>=86 || arrpVO.get(i).getNow_tilt()<=90) {
					%>
					<td><img src="./images/checked.png" width="30px" height="30px"></td>
					<%
						}
					%>
					<td><a
						href="managePole.jsp?pole_code=<%=arrpVO.get(i).getPole_code()%>"><%=arrpVO.get(i).getPole_code()%></a></td>
					<td><%=arrpVO.get(i).getEmp_id()%></td>
					<td><%=arrpVO.get(i).getPole_office()%></td>
					<td><%=arrpVO.get(i).getPole_date()%></td>
					<td><%=arrpVO.get(i).getPole_height()%></td>
					<td><%=arrpVO.get(i).getTransformer_yn()%></td>
					<td><%=arrpVO.get(i).getPole_high()%></td>
					<td><%=arrpVO.get(i).getPole_down()%></td>
					<td><%=arrpVO.get(i).getPole_com()%></td>
					<td><%=arrpVO.get(i).getNow_tilt()%></td>
				</tr>
			<%} %>
	<%} %>
			</table>
		</div>
	</div>


	<!-- 검색 후 전주정보 -->
	<%
		} else {
	%>

	<div id="min_wrapper">

		<div class="search_container" style="text-align: center;">
			<table id="poletable"
				style="text-align: center; margin: auto; margin-top: 4%;">
				<tr>
					<th>위험도</th>
					<th>전주번호</th>
					<th>관리자</th>
					<th>담당 사업소</th>
					<th>설치일자</th>
					<th>높이</th>
					<th>변압기</th>
					<th>고압선</th>
					<th>저압선</th>
					<th>통신선</th>
					<th>현재 기울기</th>
				</tr>
				<%
					for (int i = 0; i < filter.size(); i++) {
				%>
				<tr>
					<%
						if (filter.get(i).getNow_tilt()>80 && filter.get(i).getNow_tilt()<85 ) {
					%>
					<td><img src="./images/middlesign.png" width="35px"
						height="35px"></td>

					<%
						} else if (filter.get(i).getNow_tilt()<79 ) {
					%>
					<td><img src="./images/high.png" width="40px" height="40px"></td>
					<%
						} else if (filter.get(i).getNow_tilt()>=86 || arrpVO.get(i).getNow_tilt()<=90) {
					%>
					<td><img src="./images/checked.png" width="30px" height="30px"></td>
					<%
						}
					%>
					<td><a
						href="managePole.jsp?pole_code=<%=filter.get(i).getPole_code()%>"><%=filter.get(i).getPole_code()%></a></td>
					<td><%=filter.get(i).getEmp_id()%></td>
					<td><%=filter.get(i).getPole_office()%></td>
					<td><%=filter.get(i).getPole_date()%></td>
					<td><%=filter.get(i).getPole_height()%></td>
					<td><%=filter.get(i).getTransformer_yn()%></td>
					<td><%=filter.get(i).getPole_high()%></td>
					<td><%=filter.get(i).getPole_down()%></td>
					<td><%=filter.get(i).getPole_com()%></td>
					<td><%=filter.get(i).getNow_tilt()%></td>
				</tr>
				<%
					}
				%>
			<%} %>
			</table>
		</div>
	</div>


	<!-- footer -->
	<div id="footer">
		<div class="copyright" style="text-align: center;">
			<h3 style="color: rgba(202, 202, 202, 0.733)">관리자를 위한 시스템으로서 인가된
				분만 사용 할 수 있습니다.</h3>
			<p style="color: rgba(202, 202, 202, 0.733)">Copyright 2021, Pole
				Of Pisa, LTD. All right Reserved.</p>
		</div>
	</div>


	<!-- 사용자 등록 모달 -->

	<script>
		$("#modal_emp").click(function() {
			$("#modal").fadeIn();
		});
		$("#uncheck").click(function() {
			$("#modal").fadeOut();
		});
	</script>
	<script>
		// 전주 등록 모달
		$("#modal_pole").click(function() {
			$("#modal2").fadeIn();
		});
		$("#uncheck").click(function() {
			$("#modal2").fadeOut();
		});
	</script>
	<!-- Scripts -->
	<!-- modal.js -->
	<script src="js/modal.js"></script>

	<!-- alarm.js -->
	<script>
		$(document).ready(function() {
			$('#impactdiv').show();
			$('#motiondiv').hide();
			$('#tiltdiv').hide();

			$('#btnimpt').click(function() {
				$('#motiondiv').hide();
				$('#tiltdiv').hide();
				$('#impactdiv').show();
				return false;
			});

			$('#btnmtn').click(function() {
				$('#impactdiv').hide();
				$('#tiltdiv').hide();
				$('#motiondiv').show();
				return false;
			});

			$('#btntt').click(function() {
				$('#motiondiv').hide();
				$('#impactdiv').hide();
				$('#tiltdiv').show();
				return false;
			});
		});
	</script>
</body>
</html>