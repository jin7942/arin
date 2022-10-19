document.getElementById('uploadedImage').addEventListener('change', (e) => {
	const files = e.currentTarget.files;

	if ([...files].length >= 7) {
		alert('이미지는 최대 6개 까지 업로드가 가능합니다.');
		removeAll()
		return;
	}
	
	[...files].forEach((file) => {
		if (!file.type.match('image/.*')) {
			alert('이미지 파일만 업로드가 가능합니다.');
			removeAll()
			return;
		}
		
		const reader = new FileReader();

		reader.onload = (e) => {
			console.log("file.lastModified : " + file.lastModified)
			
			document.querySelector('.image-preview').innerHTML += `
            <li id="${file.lastModified}" class="imgList position-relative preview">
                <img src="${e.target.result}" alt="" class="imgList">
                <span onclick="removeFile(${file.lastModified})" class="position-absolute top-10 start-100 translate-middle badge rounded-pill bg-danger">
                X
                </span>
            </li>`;
		};
		reader.readAsDataURL(file);
	});
});

function removeFile(target) {
	const removeTarget = document.getElementById(target);
	const files = document.getElementById('uploadedImage').files;
	const dataTranster = new DataTransfer();

	Array.from(files)
		.filter((file) => file.lastModified != target)
		.forEach((file) => {
			dataTranster.items.add(file);
		});

	document.getElementById('uploadedImage').files = dataTranster.files;
	removeTarget.remove();
}

function removeAll() {
	const list = document.querySelectorAll('.imgList');
	
	document.getElementById('uploadedImage').value = "";
	
	if (list != 0) {
		list.forEach((li) => {
			li.remove()
		})
	} else {
		alert('삭제할 사진이 없습니다.')
	}
	
}