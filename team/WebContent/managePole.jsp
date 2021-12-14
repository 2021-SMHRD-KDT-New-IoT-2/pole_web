<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shorcut icon" type="image/x-icon" href="./images/upoplogo.PNG" type="text/css">
<title>POLE OF PISA 전주관리 시스템</title>
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
            <!-- 전주 점검 페이지-->
            <div class="managepole">
                <h1> 전주 점검 </h1>
                <div class="search_pole">
                    <form method="get" action="">
                        <input type="text" name="swearchWord" placeholder="사업소 검색(서구)">
                        <button type="submit" name="searchButton">검색</button>
                    </form>
                </div>
                <br>
                    <!-- 이 아래는 차후에 DB구성 이후 DB값으로 들어갈 예정-->
                    
                    <table border="1" bordercolor="black" style="text-align:center;">
                        <th>전주 번호</th>
                        <th>담당 사업소</th>
                        <th>위치</th>
                        <th>상태</th>

                            <tr>
                                <td>0110A001</td>
                                <td>서구 지사</td>
                                <td>풍암동 22번지</td>
                                <td>90</td>
                            </tr>

                            <tr>
                                <td>0110B002</td>
                                <td>남구 지사</td>
                                <td>금호동 11번지</td>
                                <td>95</td>

                  </table>                         
            </div>
        </div>
    </div>

    <!-- 기울기 분석 페이지를 하나 구현할지, 
        아니면 onclick시 해당페이지 하단으로 팝업될지 -->
    <div id="tiltpole">
        <h1>전주 기울기 분석</h1>
        <table border="1" bordercolor="black" style="text-align:center;">
            <th>담당 사업소</th>
            <th>상세 주소</th>
            <th>최종 점검일자</th>
            <th>비고</th>

            <tr>
                <td>서구지사</td>
                <td>풍암동 100번</td>
                <!-- 날짜태그 가져오기-->
                <td>21.11.28</td>
                <!-- textarea 가져오기 -->
                <td>나무 자라는 중</td>

        </table>

        <div class="graph"> 그래프 올 자리 </div>

        <div class="list_btn"> 리스트 
            <br>
            <button>이전</button>
            <button>점검</button>
            <button>확인</button>
        </div>
    </div>

    <footer>
    <p>Copyright 2021, Pole Of Pisa, LTD. All right Reserved.</p>
    </footer>
    <!-- 리스트 페이징은 jsp로 수정 후 추가 예정-->
    <!--fonts-->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</body>
</html>