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
								<p>����� ���</p>
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
						<td>�����ȣ �ο�</td>
						<td><input type="text" name="emp_id"
							style="margin-left: 6%; width: 250px;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="LoginCheckService" style="text-decoration: none;">�ߺ� �˻�</a></td>
					</tr>
					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>
					<tr height="30">
						<td class="wid1"><img src="./images/check2.png" width="25px"
							; height="25px";></td>
						<td class="wid2">��й�ȣ</td>
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
						<td class="wid2">��й�ȣ Ȯ��</td>
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
						<td class="wid2">��� �̸�</td>
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
						<td class="wid2">��� ����ó</td>
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
						<td class="wid2">����� ��</td>
						<td><select name = "emp_office" style="width: 250px; margin-left : -120px;">
						<option >�����ϼ���</option>
						<option value="�ϱ�">�ϱ�</option>
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="���걸" >���걸</option>
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
						<td class="wid2">������ ����</td>
						<td><input type="radio" name="admin_yesno" value="Y"
							class="input_focus" style="margin-left: -20%; width: 20px;">������
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="admin_yesno"
							class="input_focus" value="N" style="width: 20px;">�����</td>
					<tr height="7">
						<td colspan="3">
							<hr />
						</td>
					</tr>

					<tr height="80">
						<td colspan="3"><input type="button" name="rol" value="����ϱ�"
							id="uncheck" class="rol">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="submit" value="����ϱ�" class="suc" id="check"></td>
					</tr>
				</table>

			</form>

			<div class="modal_layer"></div>
		</div>
	</center>
	<!----------------------------------------------- ����� ��� ��� ���� -------------------------------------------->
</body>
</html>