let inputFiles = document.getElementById('uploadedImage').files;
let index = 0;

document.getElementById('uploadedImage').addEventListener('change', (e) => {
    const item = e.currentTarget.files;
    const newFiles = addFile(inputFiles, item);
	
    [...item].forEach((file) => {
        /**
        if (!file.type.match('image/.*')) {
            alert('이미지 파일만 업로드가 가능합니다.');
            removeAll();
            return;
        }
         */

        if ([...inputFiles].length < 7) {
            const reader = new FileReader();

            file.index = index++;
            reader.onload = (e) => {
                document.querySelector('.image-preview').innerHTML += `
	            <li id="${file.index}" class="imgList position-relative preview">
	                <img src="${e.target.result}" alt="" class="imgList">
	                <span onclick="removeFile(${file.index})" class="position-absolute top-10 start-100 translate-middle badge rounded-pill bg-danger">
	                X
	                </span>
	            </li>`;
            };
            reader.readAsDataURL(file);
        } else {
            // alert('이미지는 최대 6장만 업로드 가능합니다.');
            // return;
        }
    });
    document.getElementById('uploadedImage').files = newFiles;
    inputFiles = document.getElementById('uploadedImage').files;
});

/**
 * 두개의 FileList 를 합쳐주는 함수
 * @param {FileList} inputFiles
 * @param {FileList} item
 * @returns {FileList} FileList
 */
const addFile = (inputFiles, item) => {
    const dataTranster = new DataTransfer();
    const orginItem = Array.from(inputFiles);
    const addItem = Array.from(item);
    const result = [...addItem, ...orginItem];

    result.forEach((file) => {
        dataTranster.items.add(file);
    });

    return dataTranster.files;
};

/**
 * file, element 삭제 함수
 * @param {String} target
 */
const removeFile = (target) => {
    const removeTarget = document.getElementById(target);
    const files = document.getElementById('uploadedImage').files;
    const dataTranster = new DataTransfer();

    if ([...files].length < 2) {
        removeAll();
        inputFiles = files;
    }

    Array.from(files)
        .filter((file) => file.index != target)
        .forEach((file) => {
            dataTranster.items.add(file);
        });
	
 	document.getElementById('uploadedImage').files = dataTranster.files
    inputFiles = dataTranster.files;
    removeTarget.remove();
};

/**
 * filelist, element 전부 삭제
 */
const removeAll = () => {
    const imgList = document.querySelectorAll('.imgList');
    document.getElementById('uploadedImage').value = '';

    if (imgList != 0) {
        imgList.forEach((li) => {
            li.remove();
        });
    } else {
        alert('삭제할 사진이 없습니다.');
    }
};
