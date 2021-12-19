<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="Model.poleDAO"%>
<%@page import="Model.poleVO"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
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
<body>

	<%
	request.setCharacterEncoding("utf-8");
	poleVO pvo = (poleVO)session.getAttribute("pole");
	poleDAO pdao = new poleDAO();	

	
	ArrayList<poleVO> arrpVO = pdao.pole_selectAll();
	
	String pole_code = request.getParameter("pole_code");
	String pole_height = request.getParameter("pole_height");
	String pole_date = request.getParameter("pole_date");
	String emp_id = request.getParameter("emp_id");
	String transformer_yn = request.getParameter("transformer_yn");
	String pole_office = request.getParameter("pole_office");
	
	ArrayList<poleVO> filter = pdao.filter(pole_height,pole_date,emp_id,transformer_yn,pole_office);
%>

	<div id="nav">
		<nav>
			<!-- if login : LoginMain, else : Main -->
			<button>HOME</button>
			<button id="modal_pole">전주 등록</button>
			<button id="modal_emp">사용자 등록</button>
			
			<!-- href="assignEmp.jsp" -->
			<a href="LogoutService">로그아웃</a> 
			<a href=""><img src="./images/bell.png" class="img" width="30px" height="30px"
				style="margin-top: 1%;"></a>
		</nav>
	</div>


	<!--수정부분1217 -->
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
	<!--수정부분1217 -->

	<!----------------------------------------------- 사용자 등록 모달 공간 -------------------------------------------->
	<center>
		<div id="modal">
			<form action="assignEmp" method="post" class="emp_form">
				<table width="900" height="1000" class="tb_body" cellpadding="0"
					style="border-collapse: collapse;">
					<tr height="100">

						<td colspan="3" align="center" style="font-size: 30px;">
							<div id="empas">
								<img src="./images/img4.png" width="50px" height="50px">
								<p>사용자 등록</p>
							</div>
						</td>
					</tr>

					<tr height="7">
						<td colspan="3">
							<hr>
						</td>
					</tr>

					<tr height="30">
						<td class="wid1"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td>사원번호 부여</td>
						<td><input type="text" name="emp_id"
							style="margin-left: 6%; width: 250px;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="LoginCheckService" style="text-decoration: none;">중복 검사</a></td>
					</tr>
					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>
					<tr height="30">
						<td class="wid1"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid2">비밀번호</td>
						<td><input type="password" name="emp_pw" id="pw"
							style="margin-left: -20%; width: 250px;" /></td>
					</tr>
					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>
					<tr height="30">
						<td class="wid1"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid2">비밀번호 확인</td>
						<td><input type="password" name="wUserPWConfirm" id="pwCheck"
							style="margin-left: -20%; width: 250px;" /></td>
					</tr>
					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>
					<tr height="30">
						<td class="wid1"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid2">사원 이름</td>
						<td><input type="text" name="emp_name"
							style="margin-left: -20%; width: 250px;" /></td>
					</tr>
					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>
					<tr height="30">
						<td class="wid1"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid2">사원 연락처</td>
						<td><input type="tel" name="emp_phone"
							style="margin-left: -20%; width: 250px;" /></td>

					</tr>
					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>
					<tr height="30">
						<td class="wid1"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid2">사원 가입일자</td>
						<td><input type="date" name="emp_joindate"
							style="margin-left: -20%; width: 250px;" /></td>
					</tr>
					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>
					<tr height="30">
						<td class="wid1"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid2">사업소 명</td>
						<td><input type="text" name="emp_office"
							style="margin-left: -20%; width: 250px;" /></td>
					</tr>
					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>
					<tr height="30">
						<td class="wid1"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid2">관리자 여부</td>
						<td><input type="radio" name="admin_yesno" value="Y"
							class="input_focus" style="margin-left: -20%; width: 20px;">관리자
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="admin_yesno"
							class="input_focus" value="N" style="width: 20px;"> 사용자</td>
					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>

					<tr height="80">
						<td colspan="3"><input type="button" name="rol" value="취소하기"
							id="uncheck" class="rol">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="submit" value="등록하기" class="suc" id="check"></td>
					</tr>
				</table>

			</form>

			<div class="modal_layer"></div>
		</div>
	</center>
	<!----------------------------------------------- 사용자 등록 모달 공간 -------------------------------------------->

	<!----------------------------------------------- 전주 등록 모달 공간 -------------------------------------------->
	<center>
		<div id="modal2">
			<form action="assignpole" method="post" class="pole_form">
				<table width="700" height="800" class="pole_tb_body" cellpadding="0"
					style="border-collapse: collapse;">
					<tr height="100px">

						<td colspan="3" align="center" style="font-size: 30px;">
							<div id="empas">
								<img src="./images/pole.png" width="50px" height="50px">
								<p>전주 등록</p>
							</div>
						</td>
					</tr>
					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>

					<tr height="25">
						<td class="wid3"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid4">전주번호</td>
						<td><input type="text" name="pole_code"
							style="margin-left: -15%;"></td>
					</tr>

					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>

					<tr height="25">
						<td class="wid3"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid4">전주 높이</td>
						<td><input type="text" name="pole_height"
							style="margin-left: -15%;" /></td>
					</tr>

					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>

					<tr height="25">
						<td class="wid3"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid4">전주 주소</td>
						<td><input type="text" name="pole_addr"
							style="margin-left: -15%;" /></td>
					</tr>

					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>


					<tr height="25">
						<td class="wid3"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid4">담당 사업소</td>
						<td><input type="text" name="pole_office"
							style="margin-left: -15%;" /></td>
					</tr>

					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>


					<tr height="25">
						<td class="wid3"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid4">담당자 사원번호</td>
						<td><input type="text" name="emp_id"
							style="margin-left: -15%;" /></td>
					</tr>

					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>


					<tr height="25">
						<td class="wid3"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid4">설치 일자</td>
						<td><input type="date" name="pole_date"
							style="margin-left: -15%; width: 222px;" /></td>
					</tr>
					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>

					<tr height="25">
						<td class="wid3"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td colspan="2" style="text-align: center;"><input
							type="checkbox" class="input_focus" name="transformer_yn"
							value="Y" style="margin-left: 4%; width: 20px;">변압기 <input
							type="hidden" name="transformer_yn" value='N'> <input
							type="checkbox" class="input_focus" name="pole_com" value="Y"
							style="margin-left: 4%; width: 20px;">통신선 <input
							type="hidden" name="pole_com" value='N'> <input
							type="checkbox" class="input_focus" name="pole_high" value="Y"
							style="margin-left: 4%; width: 20px;">고압선 <input
							type="hidden" name="pole_high" value='N'> <input
							type="checkbox" class="input_focus" name="pole_down" value="Y"
							style="margin-left: 4%; width: 20px;">저압선 <input
							type="hidden" name="pole_down" value='N'></td>
					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>

					<tr height="70">
						<td colspan="3"><input type="button" name="rol" value="취소하기"
							id="uncheck2" class="rol2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value="등록하기" class="suc2" id="check2">
						</td>
					</tr>
				</table>

			</form>

			<div class="modal_layer"></div>
		</div>
	</center>
	<!-- --------------------------------------------- 전주 등록 모달 공간 ------------------------------------------ -->

	<!-- 필터  -->
	<!-- 수정부분 1217 -->
	<div id="searchBar">
		<div id="field_area">
			<form>
				<fieldset>
					<h2>광주광역시</h2>
					<label>담당 사업소</label> <select name="pole_office">
						<option value="">선택하세요</option>
						<option value="동구">동구</option>
						<option value="서구">서구</option>
						<option value="남구">남구</option>
						<option value="북구">북구</option>
						<option value="광산구">광산구</option>	
					</select>
					
						<label>관리자</label> <select name="emp_id">
						<%for(int i=0; i<arrpVO.size();i++){ %>
						<option value="<%=arrpVO.get(i).getEmp_id()%>" selected>
							<%=arrpVO.get(i).getEmp_id() %>
						</option>
						<%} %>

					</select> <label>설치 일자</label> <input type="date" name="pole_date">
					
					<label>높이</label> <select name="pole_height">
						<%for(int i=0; i<arrpVO.size();i++){ %>
						<option value="<%=arrpVO.get(i).getPole_height()%>" selected>
							<%=arrpVO.get(i).getPole_height() %>
						</option>
						<%} %>
						
					</select> <label>변압기 유무</label> <select name="transformer_yn">
						<option value="Y">Y</option>
						<option value="N">N</option>
						
					</select> <input type="submit" name="filter" value="검색">
				
				</fieldset>
			</form>
		</div>
		<div id="alarm">
			<h3>알림메세지</h3>
			<div>알림 내용</div>
		</div>
	</div>

	<!-- 검색 전 pole_info 전체결과 -->
	<% if(pole_height==null) {%>
	<div id="wrapper">
		<div id="img">
			<img src="./images/search.png" width="40px" height="40px">
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
					<th>변압기 유무</th>
				</tr>
				<%for(int i = 0; i<arrpVO.size();i++){ %>
				<tr>

					<td><a href="managePole.jsp?pole_code=<%= arrpVO.get(i).getPole_code()%>"><%=arrpVO.get(i).getPole_code() %></a></td>
					<td><%=arrpVO.get(i).getEmp_id() %></td>
					<td><%=arrpVO.get(i).getPole_office() %></td>
					<td><%=arrpVO.get(i).getPole_date() %></td>
					<td><%=arrpVO.get(i).getPole_height() %></td>
					<td><%=arrpVO.get(i).getTransformer_yn() %></td>
				</tr>
				<%} %>
			</table>
		</div>
		
	</div>
	 <% } else {%> <!-- 검색 후 전주정보 -->
	
	<div id="min_wrapper">
	

		<div id="img">
			<img src="./images/search.png" width="40px" height="40px" id="searchimg">
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
					<th>변압기 유무</th>
				</tr>
				<%for(int i = 0; i<filter.size(); i++){ %>
				<tr>
					<td><a href="managePole.jsp?pole_code=<%=filter.get(i).getPole_code()%>"><%=filter.get(i).getPole_code() %></a></a></td>
					<td><%=filter.get(i).getEmp_id() %></td>
					<td><%=filter.get(i).getPole_office() %></td>
					<td><%=filter.get(i).getPole_date() %></td>
					<td><%=filter.get(i).getPole_height() %></td>
					<td><%=filter.get(i).getTransformer_yn() %></td>
				</tr>
				<%} %>
			</table>
		</div>

	</div>
	<% } %>

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
	<link
		href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
		rel="stylesheet">

	<!-- 사용자 등록 모달 -->
	<script>
        $("#modal_emp").click(function () {
            $("#modal").fadeIn();
        });
        $("#uncheck").click(function () {
            $("#modal").fadeOut();
        });
    </script>
	<script>
        // 전주 등록 모달
        $("#modal_pole").click(function () {
            $("#modal2").fadeIn();
        });
        $("#uncheck2").click(function () {
            $("#modal2").fadeOut();
        });
    </script>
    
     	
</body>
</html>