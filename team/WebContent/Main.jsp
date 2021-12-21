<%@page import="java.sql.Date"%>
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
<%@page import="com.mysql.cj.xdevapi.Result"%>ㄴ
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html>
<head>
<link rel="shorcut icon" type="image/x-icon"
	href="./images/upoplogo.PNG" type="text/css">
<title>POLE OF PISA 전주관리 시스템</title>
<link rel="stylesheet" href="css/Maincss.css">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<style>
#Toggle {
	width: 400px;
	height: 100%;
	float: right;
	z-index: 1;
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

	String mac_code = request.getParameter("mac_code");

	ArrayList<poleVO> filter = pdao.filter(pole_height, pole_date, emp_id, transformer_yn, pole_office);

%>
	<!-- 네비게이션  -->
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
			<a href="javascript:;" id="togglebtn"><img src="./images/bell.png" class="img" width="30px" height="30px" style="margin-top: 1%;"></a>
		</nav>
			<div id="Toggle">

	</div>
	<!-- 네비게이션 끝 -->

	<!-- 헤더 -->
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

	<!-- 사용자등록, 전주등록 modal include -->
	<%@ include file="/modal_assignEmp.jsp"%>
	<%@ include file="/modal_assignPole.jsp"%>

	<!-- 검색창 필터링  -->
	<div id="searchBar">
		<div id="field_area">
			<form>
				<fieldset>
					<h2>광주광역시</h2>
					
					<label>&nbsp;&nbsp;&nbsp;담당 사업소</label>
					<select name="pole_office">
						<option value="">선택</option>
						<option value="동구">동구</option>
						<option value="서구">서구</option>
						<option value="남구">남구</option>
						<option value="북구">북구</option>
						<option value="광산구">광산구</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
				 <label>관리자</label>
					<input type="text" name="emp_id"
						style="width: 100px; height: 40px; margin-right: 4%; font-size: 15px;">&nbsp;&nbsp;&nbsp;

					<label>설치 일자</label> <input type="text" name="pole_date"
						id="searchtext">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<label>높이</label> <input type="text" name="pole_height"  id="searchtext"> <br>
						
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;변압기</label>
						<select name="transformer_yn" id="searchtext"> <br>
						<option value="">선택</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
						
						<label> 고압선 </label> 
						<select name="pole_high">
						<option value="">선택</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


					<label> 저압선</label>
					 <select name="pole_down">
						<option value="">선택</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					 <label> 통신선</label> <select name="pole_com">
						<option value="">선택</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>&nbsp;&nbsp;&nbsp; 
					
					<input type="submit" name="filter" value="검색"
						class="filter_search" style="float: right; background-color: white; border: 1px solid #ccc;">

				</fieldset>
			</form>
		</div>
		
		
		<!-- 알림메세지  -->
		<div id="alarm">
			<h3>알림메세지</h3>
			<div>알림 내용</div>
		</div>
		
	</div>
	<!-- 필터 끝  -->
	
	
	<!-- 검색 전 pole_info 전체결과 -->
	<%
		if (pole_height == null) {
	%>
	<div id="wrapper">
		<div id="img">
			<img src="./images/search.png" width="40px" height="40px">
		</div>
		<div>
			<input onkeyup="filter()" type="text" id="value"
				placeholder="전주 번호 입력" class="filter">
		</div>

		<div class="search_container" style="text-align: center;">
			<table id="poletable" style="text-align: center; margin: auto; border: 1px solid #ccc;">
				<tr>
					<th>전주번호</th>
					<th>관리자</th>
					<th>담당 사업소</th>
					<th>설치일자</th>
					<th>높이</th>
					<th>변압기</th>
					<th>고압선</th>
					<th>저압선</th>
					<th>통신선</th>

				</tr>
				<%
					for (int i = 0; i < arrpVO.size(); i++) {
				%>
				<tr>
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
				</tr>
				<%
					}
				%>
			</table>
		</div>

	</div>

	<%
		} else {
	%>
	<!-- 검색 후 전주정보 -->

	<div id="min_wrapper">


		<div id="img">
			<img src="./images/search.png" width="40px" height="40px"
				id="searchimg">
		</div>
		<div>
			<input onkeyup="filter()" type="text" id="value"
				placeholder="전주 번호 입력" class="filter">
		</div>


		<div class="search_container" style="text-align: center;">
			<table id="poletable"
				style="text-align: center; margin: auto; border: 2px solid black;">
				<tr>
					<th>전주번호</th>
					<th>관리자</th>
					<th>담당 사업소</th>
					<th>설치일자</th>
					<th>높이</th>
					<th>변압기</th>
					<th>고압선</th>
					<th>저압선</th>
					<th>통신선</th>
				</tr>
				<%
					for (int i = 0; i < filter.size(); i++) {
				%>
				<tr>
					<td><a
						href="managePole.jsp?pole_code=<%=filter.get(i).getPole_code()%>"><%=filter.get(i).getPole_code()%></a></a></td>
					<td><%=filter.get(i).getEmp_id()%></td>
					<td><%=filter.get(i).getPole_office()%></td>
					<td><%=filter.get(i).getPole_date()%></td>
					<td><%=filter.get(i).getPole_height()%></td>
					<td><%=filter.get(i).getTransformer_yn()%></td>
					<td><%=arrpVO.get(i).getPole_high()%></td>
					<td><%=arrpVO.get(i).getPole_down()%></td>
					<td><%=arrpVO.get(i).getPole_com()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

	</div>
	<%
		}
	%>

	<!-- footer -->
	<div id="footer">
		<div class="copyright" style="text-align: center;">
			<h3 style="color: rgba(202, 202, 202, 0.733)">관리자를 위한 시스템으로서 인가된
				분만 사용 할 수 있습니다.</h3>
			<p style="color: rgba(202, 202, 202, 0.733)">Copyright 2021, Pole
				Of Pisa, LTD. All right Reserved.</p>
		</div>
	</div>

	<!--fonts-->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"	rel="stylesheet">


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
		$("#uncheck2").click(function() {
			$("#modal2").fadeOut();
		});
	</script>
	<!-- Scripts -->
	<!-- 알림창 toggle js -->
    <script>
    $(function (){
    	$("#togglebtn").click(function(){
    	$("#Toggle").toggle();	
    	});
    });
    </script>
    <!-- modal.js -->
	<script src="js/modal.js"></script>
</body>
</html>