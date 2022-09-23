/**
 * @ 이미지업로더
 */
var uploadFiles = [];
document.querySelector('.real-upload').addEventListener('change', getImageFiles);
function getImageFiles(e) {
    const files = e.currentTarget.files;
    const imagePreview = document.querySelector('.image-preview');
    const imagePreview2 = document.querySelector('.image-preview2');

    if ([...files].length >= 7 || uploadFiles.length >= 6) {
        alert('이미지는 최대 6개 까지 업로드가 가능합니다.');
        return;
    }

    // 파일 타입 검사
    [...files].forEach((file) => {
        if (!file.type.match('image/.*')) {
            alert('이미지 파일만 업로드가 가능합니다.');
            return;
        }

        // 파일 갯수 검사
        if ([...files].length < 7) {
            uploadFiles.push(file);
            const reader = new FileReader();
            reader.onload = (e) => {
                const preview = createElement(e, file);

                imagePreview.childElementCount >= 3 ? imagePreview2.appendChild(preview) : imagePreview.appendChild(preview);
            };

            reader.readAsDataURL(file);
        }
    });
    console.log(uploadFiles);
}

function createElement(e, file) {
    const li = document.createElement('li');
    const img = document.createElement('img');
    img.setAttribute('class', 'imgList');
    img.setAttribute('src', e.target.result);
    img.setAttribute('data-file', file.name);
    li.appendChild(img);

    console.log(li);

    return li;
}

function deleteList() {
    const list = document.querySelectorAll('.imgList');
    const imgInput = document.getElementById('imgInput');

    if (list.length > 0) {
        list.forEach((li) => {
            li.remove();
        });
        imgInput.value = '';
        uploadFiles = [];
    } else {
        alert('삭제할 사진이 없습니다.');
    }
    console.group();
    console.log('========== 삭제 프로세스 ==========');
    console.log(uploadFiles);
    console.log(document.querySelectorAll('.imgList'));
    console.groupEnd();
}
