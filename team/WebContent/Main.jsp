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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    *{
        font-family: 'Nanum Gothic', sans-serif;
        
    }

    #notice {
        padding : 10px;
        width : 30%;
        float : left;
        height: 20%;
        border : 1px solid black;
        margin-bottom : 5%;
        text-align : center;
        margin : 0 auto;
        margin-left : 10%;
    }
    
    #alarm{
        padding : 10px;
		float : right;
        width : 30%;
        height: 20%;
        border : 1px solid black;
        text-align : center;
        margin-bottom : 5%;
        margin-right : 10%;
    }
    
    fieldset{
        text-align : center;
        margin : 0 10%;
        display : inline-block;
        width : 78%;
    }
</style>
<body>

<%

	poleVO pvo = (poleVO)session.getAttribute("pole");
	poleDAO pdao = new poleDAO();
	
	String pole_height = request.getParameter("pole_height");

	ArrayList<poleVO> arrpVO = pdao.pole_selectAll();
	
%>
      <div id="nav">
        <nav>
            <!-- if login : LoginMain, else : Main -->
            <button>홈</button>
            <button id="modal_pole">전주 등록</button>
            <button id="modal_emp">사용자 등록</button> <!-- href="assignEmp.jsp" -->
            <a href=""><img src="./images/bell.png" class="img" width="30px" height="30px" style="margin-top: 1%;"></a>
        </nav>

        <div id="header">
            <h1><a href="Main.jsp"><img src="./images/upoplogo.PNG" width="100px" height="100px" id="logo"></a>전주 통합 관리
                시스템</h1>
        </div>
        
           <!----------------------------------------------- 사용자 등록 모달 공간 -------------------------------------------->
        <center>
            <div id="modal">
                <form action="" method="post" name="" class="emp_form">
                    <table width="900" height="1000" class="tb_body" cellpadding="0" style="border-collapse:collapse;">
                        <tr height="100">

                            <td colspan="3" align="center" style="font-size: 30px;">
                                <img src="./img4.png" width="40px" height="40px">
                                	사용자 등록
                            </td>
                        </tr>

                        <tr height="7">
                            <td colspan="3">
                                <hr>
                            </td>
                        </tr>

                        <tr height="30">
                            <td class="wid1"><img src="./images/check2.png" width="25px"; height="25px";></td>
                            <td>사원번호 부여</td>
                            <td><input type="text" name="User_ID"
                                    style="margin-left: 12.2%; width: 250px;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                    href="" style="text-decoration: none;">중복 검사 ✅</a></td>
                        </tr>
                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>
                        <tr height="30">
                            <td class="wid1"><img src="./images/check2.png" width="25px"; height="25px";></td>
                            <td class="wid2">비밀번호</td>
                            <td><input type="password" name="User_PW" id="pw"
                                    style="margin-left: -20%; width: 250px;" />
                            </td>
                        </tr>
                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>
                        <tr height="30">
                            <td class="wid1"><img src="./check2.png" width="25px"; height="25px";></td>
                            <td class="wid2">비밀번호 확인</td>
                            <td><input type="password" name="wUserPWConfirm" id="pwCheck"
                                    style="margin-left: -20%; width: 250px;" />
                            </td>
                        </tr>
                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>
                        <tr height="30">
                            <td class="wid1"><img src="./check2.png" width="25px"; height="25px";></td>
                            <td class="wid2">사원 이름</td>
                            <td><input type="text" name="wUserName" style="margin-left: -20%; width: 250px;" /></td>
                        </tr>
                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>
                        <tr height="30">
                            <td class="wid1"><img src="./check2.png" width="25px"; height="25px";></td>
                            <td class="wid2">사원 연락처</td>
                            <td><input type="tel" name="user_phone" style="margin-left: -20%; width: 250px;" /></td>

                        </tr>
                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>
                        <tr height="30">
                            <td class="wid1"><img src="./check2.png" width="25px"; height="25px";></td>
                            <td class="wid2">사원 가입일자</td>
                            <td><input type="date" name="user_date" style="margin-left: -20%; width: 250px;" /></td>
                        </tr>
                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>
                        <tr height="30">
                            <td class="wid1"><img src="./check2.png" width="25px"; height="25px";></td>
                            <td class="wid2">사업소 명</td>
                            <td><input type="text" name="use_office" style="margin-left: -20%; width: 250px;" /></td>
                        </tr>
                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>
                        <tr height="30">
                            <td class="wid1"><img src="./check2.png" width="25px"; height="25px";></td>
                            <td class="wid2">관리자 여부</td>
                            <td><input type="radio" name="admin" value="관리자" class="input_focus" style="margin-left: -20%; width: 20px;">관리자
                                &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="admin" class="input_focus" value="사용자" style="width: 20px;"> 사용자
                            </td>

                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>

                        <tr height="80">
                            <td colspan="3"><input type="button" name="rol" value="취소하기" id="uncheck"
                                    class="rol">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" name="suc" value="등록하기" class="suc" id="check">
                            </td>
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
                <form action="" method="post" name="" class="pole_form">
                    <table width="700" height="800" class="pole_tb_body" cellpadding="0"
                        style="border-collapse:collapse;">
                        <tr height="100px">

                            <td colspan="3" align="center" style="font-size: 30px;">
                                <img src="./pole.png" width="40px" height="40px">
                                전주 등록
                            </td>
                        </tr>
                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>

                        <tr height="25">
                            <td class="wid3"><img src="./check2.png" width="25px"; height="25px";></td>
                            <td class="wid4">전주번호 부여</td>
                            <td><input type="text" name="pole_code" style="margin-left: -15%;">
                            </td>
                        </tr>

                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>

                        <tr height="25">
                            <td class="wid3"><img src="./check2.png" width="25px"; height="25px";></td>
                            <td class="wid4">전주 높이</td>
                            <td><input type="text" name="pole_height" style="margin-left: -15%;" /></td>
                        </tr>

                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>

                        <tr height="25">
                            <td class="wid3"><img src="./check2.png" width="25px"; height="25px";></td>
                            <td class="wid4">전주 주소</td>
                            <td><input type="text" name="pole_addr" style="margin-left: -15%;" /></td>
                        </tr>

                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>

                        <tr height="25">
                            <td class="wid3"><img src="./check2.png" width="25px"; height="25px";></td>
                            <td class="wid4">설치 일자</td>
                            <td><input type="date" name="pole_date" style="margin-left: -15%; width: 222px;" /></td>
                        </tr>
                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>



                        <tr height="25">
                            <td class="wid3"><img src="./check2.png" width="25px"; height="25px";></td>
                            <td class="wid4">담당자 사원번호</td>
                            <td><input type="text" name="emp_id" style="margin-left: -15%;" /></td>
                        </tr>

                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>

                        <tr height="25">
                            <td class="wid3"><img src="./check2.png" width="25px"; height="25px";></td>
                            <td class="wid4"></td>
                            <td><input type="checkbox" class="input_focus" name="transformer_yn" value="Y"
                                    style="margin-left: -50%; width: 20px;"><a>변압기</a>
                                <input type="hidden" name="transformer_yn" value='N'>
                                <input type="checkbox" class="input_focus" name="pole_com" value="Y"
                                    style="margin-left: 4%; width: 20px;">통신선
                                <input type="hidden" name="pole_com" value='N'>
                                <input type="checkbox" class="input_focus" name="pole_high" value="Y"
                                    style="margin-left: 4%; width: 20px;">고압선
                                <input type="hidden" name="pole_high" value='N'>
                                <input type="checkbox" class="input_focus" name="pole_down" value="Y"
                                    style="margin-left: 4%; width: 20px;">저압선
                                <input type="hidden" name="pole_down" value='N'>
                            </td>

                        <tr height="7">
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>

                        <tr height="70">
                            <td colspan="3"><input type="button" name="rol" value="취소하기" id="uncheck2"
                                    class="rol2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" name="suc" value="등록하기" class="suc2" id="check2">
                            </td>
                        </tr>
                    </table>

                </form>

                <div class="modal_layer"></div>
            </div>
        </center>
        <!-- --------------------------------------------- 전주 등록 모달 공간 ------------------------------------------ -->
	
	<div id="divbox">
	<div id="notice">
        <h4>공지사항</h4>
        <div>공지사항 내용</div>
<!-- ======= -->
<!--     <div id="header">
        <a href="Main.jsp">
        <img src="./images/upoplogo.PNG" width="100px" height="100px" id="logo"></a>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-IoT-2/pole_web.git -->
    </div>
    <div id="alarm">
        <h4>알림메세지</h4>
        <div>알림 내용</div>
    </div>
    </div>
	
	
	<!-- 필터  -->
    <form action = "Main.jsp" method="post" id="searchBar">
    <fieldset>
        <legend>필터</legend>
        <h2>광주광역시</h2>
        <label>담당 사업소</label>
            <select name = "pole_office">
            <option value="동구">동구</option>
            <option value="서구">서구</option>
            <option value="남구">남구</option>
            <option value="북구">북구</option>
            <option value="광산구">광산구</option>           
            </select>
            
        <label>관리자</label>
            <select name = "emp_id">
            <%for(int i = 0; i<arrpVO.size();i++){ %>
                <option value="<%=arrpVO.get(i).getEmp_id()%>" selected><%=arrpVO.get(i).getEmp_id() %></option>
			<%} %>
			
            </select>
        <label>설치 일자</label>
            <input type="date" name="pole_date">
        <label>높이</label>
             <select name = "pole_height">
            <%for(int i = 0; i<arrpVO.size();i++){ %>
                <option value="<%=arrpVO.get(i).getPole_height()%>" selected><%=arrpVO.get(i).getPole_height() %></option>
			<%} %>
            </select>
        <label>변압기 유무</label>
        	 <select name = "transformer_yn">
            <option value="Y">Y</option>
            <option value="N">N</option>
            </select>
        <input type="submit" name="filter" value="검색">
    </fieldset> 
    </form>                 
    </div>
   
     <!-- 검색 전 pole_info 전체결과 -->
	<% if(request.getParameter("pole_height")==null) {%>
     <div id="wrapper">
        <div id="img">
            <img src="./images/search.png" width="40px" height="40px">
        </div>
        <div>
            <input onkeyup="filter()" type="text" id="value" placeholder="전주 번호 입력" class="filter">
        </div>

        <div class="search_container" style="text-align: center;">
            <table id="poletable" style="text-align:center; margin:auto; border: 2px solid black;">
         <tr>
         	<th>전주번호</th>
         	<th>관할지구</th>
         	<th>설치일자</th>
         	<th>관리자</th>
         	<th>최종 수정일자</th>
         </tr>             
         <%for(int i = 0; i<arrpVO.size();i++){ %>
         <tr>
         	
         	<td><a href="managePole.jsp"><%=arrpVO.get(i).getPole_code() %></a></td>
         	<td><%=arrpVO.get(i).getPole_addr() %></td>
         	<td><%=arrpVO.get(i).getPole_date() %></td>
         	<td><%=arrpVO.get(i).getEmp_id() %></td>
         	<td><%=arrpVO.get(i).getPole_eday() %></td>
         </tr>
         <%} %>
            </table>
        </div>

    </div>
    <% } else {%>
     <div id="wrapper">
        <div id="img">
            <img src="./images/search.png" width="40px" height="40px" id="searchimg">
        </div>
        <div>
            <input onkeyup="filter()" type="text" id="value" placeholder="전주 번호 입력" class="filter">
        </div>


        <div class="search_container" style="text-align: center;">
            <table id="poletable" style="text-align:center; margin:auto; border: 2px solid black;">
         <tr>
         	<th>전주번호  <% out.println(request.getParameter("pole_height")); %></th>
         	<th>관할지구</th>
         	<th>설치일자</th>
         	<th>관리자</th>
         	<th>최종 수정일자</th>
         </tr>             
         <%for(int i = 0; i<arrpVO.size();i++){ %>
         <tr>
         	
         	<td><a href="managePole.jsp"><%=arrpVO.get(i).getPole_code() %></a></td>
         	<td><%=arrpVO.get(i).getPole_addr() %></td>
         	<td><%=arrpVO.get(i).getPole_date() %></td>
         	<td><%=arrpVO.get(i).getEmp_id() %></td>
         	<td><%=arrpVO.get(i).getPole_eday() %></td>
         </tr>
         <%} %>
            </table>
        </div>

    </div>
    <% } %>

    <!-- footer -->
    <footer>
        <div class="copyright" style="text-align: center;">
            <h3 style="color:rgba(202, 202, 202, 0.733)">
                관리자를 위한 시스템으로서 인가된 분만 사용 할 수 있습니다.</h3>
            <p style="color:rgba(202, 202, 202, 0.733)">Copyright 2021, Pole Of Pisa, LTD. All right Reserved.</p>
        </div>
    </footer>

    <!--fonts-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

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