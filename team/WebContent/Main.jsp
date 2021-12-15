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
    pageEncoding="EUC-KR"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html>
<head>
<link rel="shorcut icon" type="image/x-icon" href="./images/upoplogo.PNG" type="text/css">
<title>POLE OF PISA 전주관리 시스템</title>
<link rel="stylesheet" href="css/Maincss.css">
</head>
<style>
    *{
        font-family: 'Nanum Gothic', sans-serif;
        
    }
</style>
<body>
<%
	poleVO pvo = (poleVO)session.getAttribute("pole");	
	//Date date = pvo.getPole_date(request.setAttribute(name, "Date"));
	poleDAO pdao = new poleDAO();	
	ArrayList<poleVO> arrpVO = pdao.pole_selectAll();
%>

    <div id="header">
        <a href="Main.jsp">
        <img src="./images/upoplogo.PNG" width="100px" height="100px" id="logo"></a>
    </div>
    <div id="Searchfilter">
    <h1>전주 통합 관리 시스템</h1>
    <br>
    <form action = "SearchBar" method="post">
    <fieldset>
        <legend>필터</legend>
        <h4>광주</h4>
        <label>담당 사업소</label>
            <select name = "pole_office">
            <% request.setCharacterEncoding("EUC-KR"); %>
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
   
     <!-- 검색 div -->
     <div id="wrapper">
        <!-- 전주 번호 입력 div, 관리대상 번호 입력, 차후 관리페이지로 이동작업 필요-->
        <div id="img">
            <img src="./images/search.png" width="40px" height="40px" id="searchimg">
        </div>
        <div>
            <input onkeyup="filter()" type="text" id="value" placeholder="전주 번호 입력" class="filter">
        </div>

        <div class="search_container" style="text-align: center;">
            <table id="poletable" style="text-align:center; margin:auto; border: 2px solid black;">
         <tr>
         	<td>전주번호</td>
         	<td>관할지구</td>
         	<td>설치일자</td>
         	<td>관리자</td>
         </tr>             
         <%for(int i = 0; i<arrpVO.size();i++){ %>
         <tr>
         	<td><%=arrpVO.get(i).getPole_code() %></td>
         	<td><%=arrpVO.get(i).getPole_office() %></td>
         	<td><%=arrpVO.get(i).getPole_date() %></td>
         	<td><%=arrpVO.get(i).getEmp_id() %></td>
         </tr>
         <%} %>
            </table>
        </div>

    </div>

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

</body>
</html>