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
    <div id="wrapper">
        <div id="header">
            <!-- ���� ���� ������-->
            <div class="managepole">
                <h1> ���� ���� </h1>
                <div class="search_pole">
                    <form method="get" action="">
                        <input type="text" name="swearchWord" placeholder="����� �˻�(����)">
                        <button type="submit" name="searchButton">�˻�</button>
                    </form>
                </div>
                <br>
                    <!-- �� �Ʒ��� ���Ŀ� DB���� ���� DB������ �� ����-->
                    
                    <table border="1" bordercolor="black" style="text-align:center;">
                        <th>���� ��ȣ</th>
                        <th>��� �����</th>
                        <th>��ġ</th>
                        <th>����</th>

                            <tr>
                                <td>0110A001</td>
                                <td>���� ����</td>
                                <td>ǳ�ϵ� 22����</td>
                                <td>90</td>
                            </tr>

                            <tr>
                                <td>0110B002</td>
                                <td>���� ����</td>
                                <td>��ȣ�� 11����</td>
                                <td>95</td>

                  </table>                         
            </div>
        </div>
    </div>

    <!-- ���� �м� �������� �ϳ� ��������, 
        �ƴϸ� onclick�� �ش������� �ϴ����� �˾����� -->
    <div id="tiltpole">
        <h1>���� ���� �м�</h1>
        <table border="1" bordercolor="black" style="text-align:center;">
            <th>��� �����</th>
            <th>�� �ּ�</th>
            <th>���� ��������</th>
            <th>���</th>

            <tr>
                <td>��������</td>
                <td>ǳ�ϵ� 100��</td>
                <!-- ��¥�±� ��������-->
                <td>21.11.28</td>
                <!-- textarea �������� -->
                <td>���� �ڶ�� ��</td>

        </table>

        <div class="graph"> �׷��� �� �ڸ� </div>

        <div class="list_btn"> ����Ʈ 
            <br>
            <button>����</button>
            <button>����</button>
            <button>Ȯ��</button>
        </div>
    </div>

    <footer>
    <p>Copyright 2021, Pole Of Pisa, LTD. All right Reserved.</p>
    </footer>
    <!-- ����Ʈ ����¡�� jsp�� ���� �� �߰� ����-->
    <!--fonts-->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</body>
</html>