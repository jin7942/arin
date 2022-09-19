/**
 * @ 유효성 검사 및 기타 유틸
 */

// 정규포현식
const nameRegex = /^[a-zA-Z0-9가-힣]{2,12}$/;
const idRegex = /^[A-Za-z0-9]{4,12}$/;
const pwRegex = /^[A-Za-z0-9]{4,12}$/;
const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

const userName = document.getElementById('name');
const id = document.getElementById('id');
const pw = document.getElementById('pw');
const chkPw = document.getElementById('chkPw');
const email = document.getElementById('email');
const mobile = document.getElementById('mobile');
const zonecode = document.getElementById('zonecode');
const address = document.getElementById('address');
const chkbox = document.getElementById('chkbox');

let isName = false;
let isId = false;
let isPw = false;
let isChkPw = false;
let isEmail = false;
let isMobile = false;

userName.addEventListener('keyup', () => {
    if (userName.value == '' || !nameRegex.test(userName.value)) {
        document.getElementById('nameFeedback').style.display = 'block';
        isName = false;
    } else {
        document.getElementById('nameFeedback').style.display = 'none';
        userName.removeEventListener;
        isName = true;
    }
});

id.addEventListener('keyup', () => {
    if (id.value == '' || !idRegex.test(id.value)) {
        document.getElementById('idFeedback').style.display = 'block';
        isId = false;
    } else {
        document.getElementById('idFeedback').style.display = 'none';
        id.removeEventListener;
        isId = true;
    }
});

pw.addEventListener('keyup', () => {
    if (pw.value == '' || !pwRegex.test(pw.value)) {
        document.getElementById('pwFeedback').style.display = 'block';
        isPw = false;
    } else {
        document.getElementById('pwFeedback').style.display = 'none';
        pw.removeEventListener;
        isPw = true;
    }
});

chkPw.addEventListener('keyup', () => {
    if (pw.value !== chkPw.value) {
        document.getElementById('chkPwFeedback').style.display = 'block';
        isChkPw = false;
    } else {
        document.getElementById('chkPwFeedback').style.display = 'none';
        chkPw.removeEventListener;
        isChkPw = true;
    }
});

mobile.addEventListener('keyup', () => {
    if (mobile.value == '') {
        document.getElementById('mobileFeedback').style.display = 'block';
        isMobile = false;
    } else {
        document.getElementById('mobileFeedback').style.display = 'none';
        mobile.removeEventListener;
        isMobile = true;
    }
});

function onSubmit() {
    if (zonecode.value == '') {
        document.getElementById('zonecodeFeedback').style.display = 'block';
        return false;
    } else {
        document.getElementById('zonecodeFeedback').style.display = 'none';
    }

    if (address.value == '') {
        document.getElementById('addressFeedback').style.display = 'block';
        return false;
    } else {
        document.getElementById('addressFeedback').style.display = 'none';
    }

    if (!chkbox.checked) {
        document.getElementById('chkBoxFeedback').style.display = 'block';
        return false;
    } else {
        document.getElementById('chkBoxFeedback').style.display = 'none';
    }

    if (isName && isId && isPw && isChkPw  && isMobile) {
        alert('제출');
        document.getElementById('loginForm').submit();
    } else alert('다시확인');
}

// 주소찾기
function searchAddress() {
    //팝업 위치를 지정(화면의 가운데 정렬)
    var width = 500; //팝업의 너비
    var height = 600; //팝업의 높이

    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            document.getElementById('zonecode').value = data.zonecode;
            document.getElementById('address').value = data.address;
            document.getElementById('bname').value = data.bname;
        },
    }).open({
        left: window.screen.width / 2 - width / 2,
        top: window.screen.height / 2 - height / 2,
    });
}

// input 길이제한
function handleOnInput(el, maxlength) {
    if (el.value.length > maxlength) {
        el.value = el.value.substr(0, maxlength);
    }
}
