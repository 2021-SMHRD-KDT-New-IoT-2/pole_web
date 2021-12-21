<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
						<td class="wid2">사업소 명</td>
						<td><select name = "emp_office" style="width: 250px; margin-left : -120px;">
						<option >선택하세요</option>
						<option value="북구">북구</option>
						<option value="남구">남구</option>
						<option value="동구">동구</option>
						<option value="서구">서구</option>
						<option value="광산구" >광산구</option>
						</select></td>
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
							class="input_focus" value="N" style="width: 20px;">사용자</td>
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
</body>
</html>