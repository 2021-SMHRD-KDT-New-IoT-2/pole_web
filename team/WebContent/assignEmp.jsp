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
		
		
		<div id = "header" >
        <img src="./images/upoplogo.PNG" width="125px" height="125px">
        </div>
        
        <div id = "assignform">
        <form action="assignEmp" method="post" class="form">
            <table width="800" height="600" class="tb_body" cellpadding="0" style="border-collapse:collapse;">

                <tr height="80">
                <td colspan="3" align="center" style="font-size: 25px;">사용자 등록</td>
                </tr>

                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>

                <tr height="30">
                    <td class="wid1"></td>
                    <td>사원번호 부여</td>
                    <td><input type="text" name="emp_id" style="margin-left: -20%;" />
                    </td>
                </tr>
                
                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                
                <tr height="30">
                    <td class="wid1"></td>
                    <td class="wid2">비밀번호</td>
                    <td><input type="password" name="emp_pw" id="pw" style="margin-left: -20%;" />
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                <!-- <tr height="30">
                    <td class="wid1">✔</td>
                    <td class="wid2">비밀번호 확인</td>
                    <td><input type="password" name="wUserPWConfirm" id="pwCheck" style="margin-left: -20%;" /></td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr> -->
                <tr height="30">
                    <td class="wid1"></td>
                    <td class="wid2">사원 이름</td>
                    <td><input type="text" name="emp_name" style="margin-left: -20%;" /></td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                <tr height="30">
                    <td class="wid1"></td>
                    <td class="wid2">사원 연락처</td>
                    <td><input type="tel" name="emp_phone" style="margin-left: -20%;" /></td>

                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                <tr height="30">
                    <td class="wid1"></td>
                    <td class="wid2">사업소 명</td>
                    <td><input type="text" name="emp_office" style="margin-left: -20%;" /></td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                
                <tr height="30">
                    <td class="wid1"></td>
                    <td class="wid2">사원 가입일자</td>
                    <td><input type="date" name="emp_joindate" style="margin-left: -20%;" /></td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                
                <tr height="30">
                    <td class="wid1"></td>
                    <td class="wid2">관리자 여부</td>
                    <td><input type="radio" name="admin_yesno" value="1" style="margin-left: -20%;">관리자
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="admin_yesno" value="0">사용자
                    </td>

                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>

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