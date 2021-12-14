var searchWord = document.getElementById('searchWord');
var searchButton = document.getElementByClassName(searchButton);

searchWord.addEventListener('keyup', function(event){
    //keyCode 13 = enter
    //keyup = key를 눌렀다 뗐을 때 event 실행

    if(event.keyCode === null){
        event.preventDefault();
    }

    if(event.keyCode === 13) {
        window.location.href = searchButton.href;
        //searchButton.href = window URI를 searchButton에 등록된 URI로 전환
        //Button 속성인 submit이 실행되면서 form action으로 전송
    }   

});
