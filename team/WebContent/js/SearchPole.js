//전주 검색 js

//html input 태그의 onkeyup 누를 때마다 filter() 함수 실행
function filter(){

    var value, number, pole_num, i;
    //전주번호 내의 대소문자 구분않고 가져오기 위해 toUpperCase()로 모두 대문자 변환 후 value에 담기
    value=document.getElementById("value").value.toUpperCase();
    //목록에 있는 모든 전주번호 getElementByClassName으로 가져오기
    pole_num = document.getElementsByClassName("pole_num");


    //목록을 for문 돌려 i번째 전주번호의 number값 가져오기
    for(i=0;i<pole_num.length;i++){
        number = pole_num[i].getElementsByClassName("number")
        //비교를 위해 number값도 대문자로 바꿔주고 indexOf()로 검색 값 확인 값 없을 시 -1 반환
        if(number[0].innerHTML.toUpperCase().indexOf(value) > -1){
            pole_num[i].style.display="flex";
        }else{
            //값이 -1 아닐 경우 pole_num[i].style.display를 none처리해 목록에 띄우지 않기
            pole_num[i].style.display="none";
        }
    }

}