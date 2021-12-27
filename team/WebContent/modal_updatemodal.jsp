<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 전주 수정 모달 -------------------------------------------------------------------------------------------------------------------- -->
			<div id="update_modal"
				style="display: none; position: absolute; width: 80%; z-index: 1;">
				<form action="" method="post" name="update_pole"
					style="width: 50%; background: white; position: absolute; box-shadow: 0 0 3px rgba(0, 0, 0, 0.3); margin-left: 25%; margin-top: -50%;">
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
</body>
</html>