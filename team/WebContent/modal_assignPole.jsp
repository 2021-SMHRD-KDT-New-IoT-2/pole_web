<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
						<td><select name = "pole_office" style="width: 225px; margin-left : -70px;">
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
						<td><input type="text" name="pole_date"
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
</body>
</html>