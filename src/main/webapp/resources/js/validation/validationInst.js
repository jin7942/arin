/**
 * @FileName : validationInst.js
 * @Description : 삽입 프로세스 데이터 유효성 검사 함수
 */

/** 정규 표현식 */
const nameEngRegex = /^[A-Za-z0-9]{2,12}$/;
const nameKorRegex = /^[가-힣0-9]{2,12}$/;

/**
 * 삽입 프로세스 데이터 유효성 검사 함수.
 * 각 엘리먼트를 파라미터로 전달.
 * @param {Object} nameEng
 * @param {Object} nameKor
 * @param {Object} useNY
 * @param {Object} delNY
 * @returns {Boolean} true or false
 */
function validationInst(nameEng, nameKor) {
    if (nameEng.val() == '' || !nameEngRegex.test(nameEng.val())) {
        alert('2 ~ 12 영어만 가능합니다.');
        nameEng.focus();
        return false;
    }

    if (nameKor.val() == '' || !nameKorRegex.test(nameKor.val())) {
        alert('2 ~ 12 한글만 가능합니다.');
        nameKor.focus();
        return false;
    }

    return true;
}
