<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shorcut icon" type="image/x-icon" href="./images/upoplogo.PNG" type="text/css">
<title>POLE OF PISA 전주관리 시스템</title>
<link rel="stylesheet" href="css/join2.css">
</head>
<body>
		
		
		<div id = "header">
        <img src="./images/upoplogo.PNG" width="125px" height="125px">
        </div>
        
        <div id = "assignform">
        <form action="assignpole" method="post" class="form">
            <table width="800" height="600" class="tb_body" cellpadding="0" style="border-collapse:collapse;">

                <tr>
                <td colspan="3" align="center" style="font-size: 30px;">전주 등록</td>
                </tr>

                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>

                <tr height="30">
                	<td class="wid1"></td>
                    <td>전주번호 부여</td>
                    <td><input type="text" name="pole_code" style="margin-left: -20%;">
                    </td>
                </tr>
             
                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
           
                 <tr height="30">
                 	<td class="wid1"></td>
                    <td class="wid2">전주 높이</td>
                    <td><input type="text" name="pole_height" style="margin-left: -20%;" /></td>
                </tr>
                
                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                
                <tr height="30">
                    <td class="wid1"></td>
                    <td class="wid2">전주 주소</td>
                    <td><input type="text" name="pole_addr" style="margin-left: -20%;" /></td>
                </tr>
                
                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                
                <tr height="30">
                    <td class="wid1"></td>
                    <td class="wid2">설치 일자</td>
                    <td><input type="date" name="pole_date" style="margin-left: -20%;" /></td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                
         
                
                <tr height="30">
                	<td class="wid1"></td>
                    <td class="wid2">담당자 사원번호</td>
                    <td><input type="text" name="emp_id" style="margin-left: -20%;" /></td>
                </tr>

                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                
                 <tr height="30">
                    <td class="wid1"></td>
                    <td class="wid2"></td>
                    <td><input type="checkbox" name="transformer_yn" value="Y" style="margin-left: -20%;">변압기
                        <input type="hidden" name="transformer_yn" value='N'>
                        <input type="checkbox" name="pole_com" value="Y" style="margin-left: 4%;">통신선
                        <input type="hidden" name="pole_com" value='N'>
                        <input type="checkbox" name="pole_high" value="Y" style="margin-left: 4%;">고압선
                        <input type="hidden" name="pole_high" value='N'>
                        <input type="checkbox" name="pole_down" value="Y" style="margin-left: 4%;">저압선
                        <input type="hidden" name="pole_down" value='N'>
                    </td>
                
                               <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>

           
                
                
<!--                    
                <tr height="30">
                    <td class="wid1">✔</td>
                    <td class="wid2">통신선 유·무</td>
                    <td><input type="radio" name="pole_com" style="margin-left: -20%;" /></td>
                </tr>

                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                
                       <tr height="30">
                    <td class="wid1">✔</td>
                    <td class="wid2">변압기 유·무</td>
                    <td><input type="radio" name="transformer_yn" style="margin-left: -20%;" /></td>
                </tr>
                
                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                
                   <tr height="30">
                    <td class="wid1">✔</td>
                    <td class="wid2">고압선 유·무</td>
                    <td><input type="radio" name="pole_high" style="margin-left: -20%;" /></td>
                </tr>

                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                
                   <tr height="30">
                    <td class="wid1">✔</td>
                    <td class="wid2">저압선 유·무</td>
                    <td><input type="radio" name="pole_down" style="margin-left: -20%;" /></td>
                </tr>

                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                 -->
                
                

                <tr height="60">
                    <td colspan="3"><input type="button" name="rol" value="취소하기"
                            class="rol">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="submit" name="suc" value="등록하기" class="suc">
                    </td>
                </tr>
            </table>

        </form>
	</div>

 

	<footer>
		<div class="copyright" style="margin: 0; text-align: center;">
			<h4 style="color: black">관리자를 위한 시스템으로서 인가된 분만 사용 할 수 있습니다.</h4>
			<p>Copyright 2021, Pole Of Pisa, LTD. All right Reserved.</p>
		</div>
	</footer>

 

</body>

</html>