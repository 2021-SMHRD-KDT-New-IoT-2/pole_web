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
<head >
<meta charset="EUC-KR">
<link rel="shorcut icon" type="image/x-icon" href="./images/upoplogo.PNG" type="text/css">
<title>POLE OF PISA ���ְ��� �ý���</title>
<link rel="stylesheet" href="css/pole.css">
</head>
<style>
	*{
        font-family: 'Nanum Gothic', sans-serif;
    }
</style>
<body >
<nav >
		<!-- if login : LoginMain, else : Main -->
        <a href="LoginMain.jsp">Ȩ</a>
        <a a href="javascript:void(0);" onclick="iframe();">��ϰ���</a>
        <a href="assignemp.jsp">������ ���</a>
        <a href=""><img src="./images/bell.png" class="img" width="30px" height="30px" style="margin-top: 1%;"></a>
    </nav>


    <header >
        <div class="logo"><img src="./images/upoplogo.PNG" width="60px" height="60px"></div>
        <div class="logo_name">
            <h2>Utility Pole Of Pisa</h2>
            <h3>���ְ��� �ý���</h3>
        </div>
    </header>
<%
	request.setCharacterEncoding("utf-8");
	String pole_code = request.getParameter("pole_code");
	poleDAO pdao = new poleDAO();	
	poleVO pvo = pdao.pole_selectONE(pole_code);
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String pole_date = df.format(pvo.getPole_date());
%>
	
    <section >
        <div class="tb_name">
            <p style="font-size:20px; padding: 20px"><b>���̺� ����</b></p>
        </div>
        <div class="tb_body">
            <form action = "Main.jsp" name="pole_tb" class="fom_tb" method="post">
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
                        <td><%=pole_date%></td>
                        <td><%=pvo.getPole_office()%></td>
                        <td><%=pvo.getPole_high()%></td>
                        <td><%=pvo.getPole_down()%></td>
                        <td><%=pvo.getPole_com()%></td>
                        <td><%=pvo.getTransformer_yn()%></td>
                        <td><%=pvo.getPole_level()%></td>
                    </tr>  
         
              </form>

		
         </table>
        </div>
        <div class="tb_nav">
            <input type="button" class="btn1" value="����">
            <input type="submit" class="sub1" value="����">
        </div>
    </section>
   

    <aside>
        <p style="font-size:20px; padding: 20px"><b>* ���� ��ȭ</b></p>
        <div class="graph">
            <h3>�׷��� �����ϰ�</h3><br>
        </div>
        <p style="font-size:20px; padding: 20px"><b>* Ư�̻��� ���</b></p>
        <div class="text_area">
            <h3>Ư�̻��� ���� �� �ִ� ���� �־�� ��</h3>
        </div>
        <div class="text_save">
            <input type="submit" name="save2" value="����">
        </div>
    </aside>


    <!-- <div id = "footer"> -->
    <div id="footer">
        <p style="color: black; font-size:20px; padding: 20px"><b>* ����</b></p>
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


        <div class="dots" style="text-align:center">
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
            <span class="dot" onclick="currentSlide(3)"></span>
        </div>
        <div class="img_save">
            <input type="button" value="���� �ٲٱ�">
        </div>
    </div>
	
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function iframe(){
			console.log("test");
			$("#html").append("<iframe src='assignEmp.jsp' style='position:absolute; width:100%; height:100%;'></iframe>")
		}
	
	</script>
    <script src="./js/managePole.js"></script>

</body>
</html>