<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@page import="Model.motionVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shorcut icon" type="image/x-icon" href="./images/upoplogo.PNG" type="text/css">
<title>POLE OF PISA ���ְ��� �ý���</title>
<link rel="stylesheet" href="css/Maincss.css">
</head>
<style>
	*{
        font-family: 'Nanum Gothic', sans-serif;
    }
</style>
<body>

<%
	motionVO mvo = (motionVO)session.getAttribute("motion");
%>

<form method="post" encType = "multipart/form-data" action="writeAction.jsp?boardID=<%-- <%=user_id%> --%>&keyValue=multipart">
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color: #eeeee; text-align: center;">��ǰ��� Ȯ��</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" class="form-control" placeholder="�� ����" name="bbsTitle" maxlength="50"></td>
			</tr>
				<%-- <%if(user_id==1){ %> --%>
			<tr>
				<td><input type="text" class="form-control" placeholder="�ּ�" name="map" maxlength="50"></td>
			</tr>
			<%-- 	<%} %> --%>
			<tr>
				<td><textarea class="form-control" placeholder="�� ����" name="bbsContent" maxlength="2048" style="height:350px;"></textarea></td>
			</tr>
			<tr>
				<td><input type="file" name="fileName"></td>
			</tr>
		</tbody>
		</table>
			<input type="submit" class="btn-primary pull-right" value="�۾���">
</form>



	<div id="footer">

		<footer>
  		<div class="copyright" style="margin:0; text-align: center;">
        <h3 style="color:black">  �����ڸ� ���� �ý������μ� �ΰ��� �и� ��� �� �� �ֽ��ϴ�.</h3>
        <p>Copyright 2021, Pole Of Pisa, LTD. All right Reserved.</p>
   		</div>
    	</footer>
    </div>

<!--fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</body>
</html>