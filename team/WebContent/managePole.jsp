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
	pageEncoding="UTF-8"%>
<%@page import="Model.poleDAO"%>
<%@page import="Model.poleVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html id="html" style="position: relative; display: grid;">
<head>
<meta charset="EUC-KR">
<link rel="shorcut icon" type="image/x-icon"
	href="./images/upoplogo.PNG" type="text/css">
<title>전주 상세정보</title>
<link rel="stylesheet" href="css/pole.css">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<style>
@font-face {
	font-family: 'neon';
	src: url('./fonts/AppleSDGothicNeoL.ttf') format('truetype');
}

.suc:hover {
	color: #000e1f;
}

.rol:hover {
	color: #000e1f;
}

#update_modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.705);
	z-index: -1;
}
</style>
</head>


<body>
	<!-- 네비게이션  -->
	<div id="nav" style="height: 60px;">
		<nav>
				<p
				style="float: left; color: wheat; font-size: 20px; margin: 0.8% 0% 0% 4%;">
				UTILITY POLE OF PISA
				</p>
			<button type="button" onclick="location.href='Main.jsp'">
			HOME
			</button>
			<button id="modal_pole">전주 등록</button>
			<button id="modal_emp">사용자 등록</button>
			<button type="button" onclick="location.href='LogoutService'">
			로그아웃
			</button>
		</nav>
		<div class="nav_img">
			<img src="./images/bar.png" width="100%" height="60px">
		</div>
	</div>

	<%
   request.setCharacterEncoding("utf-8");
   String pole_code = request.getParameter("pole_code");
   poleDAO pdao = new poleDAO();
   poleVO pvo = pdao.pole_selectONE(pole_code);
   String comment = pvo.getPole_comment();

   %>
	  <section>
      <!------------------------------------ 모달 --------------------------------------->
      <div id="camera_modal">


         <div id="cameraView">
            <img src="http://172.30.1.42:80/camera">
         </div>

         <input type="button" name="rol" value="뒤로" id="uncheck" class="rol"
            style="margin-left: -62%;">

         <button type="button" id="buzzer">부저 작동</button>

         <div class="modal_layer"></div>

      </div>
      <!------------------------------------ 모달 --------------------------------------->
      <div class="tb_name">

         <p style="font-size: 25px; padding: 10px; font-weight: 700;">
            &nbsp;&nbsp;<%=pvo.getPole_code()%>번 전주 상세정보
            <a href="http://172.30.1.42:80/camera"><img src="./images/cam.png" width=20px; height=20px; style="margin-left:25%;"></a>
 		<div id="cameraMove">
			<input type="button" value="카메라 화면 이동">
		</div>
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
                  <th>현재 기울기</th>
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
                  <td><%=pvo.getNow_tilt()%></td>
               </tr>
            </table>
         </form>
      </div>
      <div class="tb_nav">
         <input type="button" id="update_modal_open" value="수정">


         <!-- 전주 수정 모달 -------------------------------------------------------------------------------------------------------------------- -->
         <div id="update_modal"
            style="display: none; position: absolute; width: 80%; z-index: 1;">
            <form action="" method="post" name="update_pole"
               style="width: 50%; background: white; position: absolute; box-shadow: 0 0 3px rgba(0, 0, 0, 0.3); margin-left: 18%; margin-top: -25%;">
               <table cellpadding="0"
                  style="border-collapse: collapse; width: 80%; height: 500px; margin: auto;">


                  <td colspan="3" align="center"
                     style="font-size: 20px; height: 50px; text-align: center; color: hsl(190, 3%, 40%);">전주
                     수정</td>


                  <tr height="7" style="color: hsl(190, 3%, 40%);">
                     <td colspan="3">
                        <hr>
                     </td>
                  </tr>

                  <tr height="30"
                     style="font-size: 15px; text-align: center; color: hsl(190, 3%, 40%);">
                     <td style="width: 15%;"><img src="./images/check2.png"
                        width="25px" height="25px"></td>
                     <td style="width: 25%; font-size: 17px;">관할 지역</td>
                     <td><input type="text" name="User_ID"
                        style="width: 150px; height: 30px;" />
                  </tr>
                  <tr height="7" style="color: hsl(190, 3%, 40%);">
                     <td colspan="3">
                        <hr />
                     </td>
                  </tr>

                  <tr height="30"
                     style="font-size: 15px; text-align: center; color: hsl(190, 3%, 40%);">
                     <td style="width: 15%;"><img src="./images/check2.png"
                        width="25px" height="25px"></td>
                     <td style="width: 25%; font-size: 17px;">담당자</td>
                     <td><input type="text" name="User_ID"
                        style="width: 150px; height: 30px;" />
                  </tr>
                  <tr height="7" style="color: hsl(190, 3%, 40%);">
                     <td colspan="3">
                        <hr />
                     </td>
                  </tr>
                  <tr height="30"
                     style="font-size: 15px; text-align: center; color: hsl(190, 3%, 40%);">
                     <td style="width: 15%;"><img src="./images/check2.png"
                        width="25px" height="25px"></td>
                     <td style="width: 25%; font-size: 17px;">담당자 사원 번호</td>
                     <td><input type="text" name="wUserName"
                        style="width: 150px; height: 30px;" /></td>
                  </tr>
                  <tr height="7" style="color: hsl(190, 3%, 40%);">
                     <td colspan="3">
                        <hr />
                     </td>
                  </tr>

                  <tr height="25"
                     style="font-size: 17px; text-align: center; color: hsl(190, 3%, 40%);">
                     <td style="width: 15%;"><img src="./images/check2.png"
                        width="25px" height="25px"></td>
                     <td colspan="2" style="text-align: center;"><input
                        type="checkbox" name="transformer_yn" value="Y"
                        style="margin-left: 4%; width: 20px;">변압기 <input
                        type="hidden" name="transformer_yn" value='N'> <input
                        type="checkbox" name="pole_com" value="Y"
                        style="margin-left: 4%; width: 20px;">통신선 <input
                        type="hidden" name="pole_com" value='N'> <input
                        type="checkbox" name="pole_high" value="Y"
                        style="margin-left: 4%; width: 20px;">고압선 <input
                        type="hidden" name="pole_high" value='N'> <input
                        type="checkbox" name="pole_down" value="Y"
                        style="margin-left: 4%; width: 20px;">저압선 <input
                        type="hidden" name="pole_down" value='N'></td>
                  <tr height="7" style="color: hsl(190, 3%, 40%);">
                     <td colspan="3">
                        <hr />
                     </td>
                  </tr>



                  <tr height="60"
                     style="font-size: 15px; text-align: center; color: hsl(190, 3%, 40%);">
                     <td colspan="3"><input type="button" name="rol" value="취소하기"
                        id="modal_uncheck" class="rol"
                        style="border: 0px; height: auto; display: inline-block; text-transform: uppercase; margin-bottom: 1.5%; cursor: pointer; background: #002C5F; box-shadow: 0 0 3px rgba(0, 0, 0, 0.3); padding: 10px 25px; color: #fff; font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="submit" name="suc" value="수정하기" class="suc"
                        id="modal_check"
                        style="border: 0px; height: auto; display: inline-block; text-transform: uppercase; margin-bottom: 1.5%; cursor: pointer; background: #002C5F; box-shadow: 0 0 3px rgba(0, 0, 0, 0.3); padding: 10px 25px; color: #fff; font-size: 14px;">
                     </td>
                  </tr>
               </table>

            </form>
            <div class="modal_layer"></div>

         </div>
         <!-- 전주 수정 모달 -------------------------------------------------------------------------------------------------------------------- -->
      </div>
       &nbsp;&nbsp;
      <p style="font-size: 20px; padding: 10px; font-weight: 600; margin-top: -3%; font-weight: 500; margin-left : 3%; ">
       	<b>특이사항 기록</b>
      </p>

      <div class="text_area">
         <%System.out.print(pvo.getPole_comment()); %>
         <%if(pvo.getPole_comment()!=null){ %>
         <%=comment.replace("-","<br>")%>
         <%}else{ %>
         
         <%} %>
      </div>
      <div class="text_save">
         <button type="button" id="Memo_modal_open">기록</button>
      </div>
   </section>

  <aside>

      <!-- 차트 길이---------------------------------------------------------------------------------------- -->
      <div><p style="font-size: 18px; padding: 10px; font-weight: 600; font-weight: 500; ">
         &nbsp;&nbsp;&nbsp;&nbsp;기울기 변화율
      </p></div>
      <div style="width: 550px; height: 450px" style="margin: 0;">
         <canvas id="curve_chart" style="width: 550px; height: 450px;">
      </div>
      <!-- ----------------------------메모 모달--------------------------------- -->
      <div id="Memo_modal">
         <form action="pole_Memo" method="post">
            <div class="Memo_area">
               <input type="text" name="pole_memo" class="Memo_area">
            </div>
            <input type="hidden" name="pole_code" value="<%=pole_code%>">
            <input type="hidden" name="pole_comment"
               value="<%=pvo.getPole_comment()%>">
            <div class="Memo_btn">
               <input type="button" name="rol" value="취소" id="uncheck2"
                  class="rol"> <input type="submit" name="save2" value="저장"
                  class="suc" id="check2" style="margin-left: 15%;">
            </div>
         </form>
         <div class="modal_layer"></div>

      </div>
      <!-- ----------------------------메모 모달--------------------------------- -->
      <div class="pole_img_head">
      <p style="font-size: 20px; padding: 10px; margin-top:4%; font-weight: 500;">관련사진</p>
      </div>
      <div class="pole_img" style="margin-left: 0.7%;">
      <img src="./images/pole1.jpg" width="190px" height="180px">
      </div>
      <div class="pole_img">
      <img src="./images/pole2.jpg" width="190px" height="180px">
      </div>
      <div class="pole_img">
      <img src="./images/pole3.jpg" width="190px" height="180px">      
      </div>
   </aside>


   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   <script>
       $.ajax({         
         url : 'AjaxChart',
         type : 'get',
         data : {'pole_code' : '<%=pole_code%>'},
         dataType : 'json',
         success : function(res){
         let labels = res.map(item => item.tilt_date);
         let values = res.map(item => item.tilt_value);
         const data = {
              labels: labels,
              datasets: [{ 
                data: values,
               label:"기울기",
                fill: false,
                borderColor: 'red',
               borderWidth: 2,
                tension: 0.1,            
              }]
         };

         const config = {
              type: 'line',
              data: data
         };
         

         const myChart = new Chart(
             document.getElementById('curve_chart'),
             config
           );
         },
         error : function(){
            alert('차트 로딩 실패');
         }
         
      })
   </script>

   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript">
   
      // ajax 이용해서 페이지 열릴때, 바로 함수실행    
   
   </script>


   <script>

      $("#cameraMove").click(function() {
         $("#camera_modal").fadeIn();
      });
      $("#uncheck").click(function() {
         $("#camera_modal").fadeOut();
      });
      </script>

   <script>
      /* Memo_modal */
      $("#Memo_modal_open").click(function() {
         $("#Memo_modal").fadeIn();
      });
      $("#uncheck2").click(function() {
         $("#Memo_modal").fadeOut();
      });
      
      </script>

   <script>
        $("#update_modal_open").click(function () {
            $("#update_modal").fadeIn();
        });
        $("#modal_uncheck").click(function () {
            $("#update_modal").fadeOut();
        });
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

   <!---------------------------------------- 부저 ---------------------------------------->
   <script>
   
    $("#buzzer").on('click',function(){
              $.ajax({
                 url : "http://172.30.1.42/buzzer",
                 type : "get",
                 success : function(res){
                    location.href="http://localhost:8087/team/managePole.jsp?<%=pole_code%>";
                              },
                              error : function() {
                                 alert('부저작동 성공.');
                              }
                           });
                  });
   </script>
   <!---------------------------------------- 부저 ---------------------------------------->

</body>
</html>
