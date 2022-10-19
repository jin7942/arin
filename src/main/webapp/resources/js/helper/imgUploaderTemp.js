/**
 * @ 이미지업로더
 */
let uploadFiles = [];
document.querySelector('.real-upload').addEventListener('change', getImageFiles);

const imagePreview = document.querySelector('.image-preview');
const fileInput = document.querySelector('#uploadedImage');

function getImageFiles(e) {
	const files = e.currentTarget.files;

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

		if ([...files].length < 7) {
			uploadFiles.push(file);
			const reader = new FileReader();

			reader.onload = (e) => {

				imagePreview.innerHTML += `
				<li id="${file.name}" class="imgList position-relative preview">
					<img src="${e.target.result}" alt="" class="imgList">
					<span class="position-absolute top-10 start-100 translate-middle badge rounded-pill bg-danger">
					X
					</span>
				</li>`;
				
			};

			reader.readAsDataURL(file);
		}
	});
}

function removeFile(key) {
	console.log(key)
}

// 삭제
function deleteList() {
	const list = document.querySelectorAll('.imgList');
	const imgInput = document.getElementById('uploadedImage');

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
	console.log(imagePreview.childElementCount);
	console.groupEnd();
}

function test2() {
	console.log("HELlo");
}
