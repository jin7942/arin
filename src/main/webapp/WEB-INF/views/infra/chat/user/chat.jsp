<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Chat Tutorial</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">


<style>
div {
	/* border: solid 1px orange; */
	
}

.card {
	height: 700px;
	border-radius: 15px !important;
	background-color: rgba(0, 0, 0, 0.4) !important;
}

.contacts_body {
	padding: 0.75rem 0 !important;
	overflow-y: auto;
	white-space: nowrap;
	background: #1F2122;
}

.msg_card_body {
	overflow-y: auto;
	background: #1F2122;
}

.card-header {
	border-radius: 15px 15px 0 0 !important;
	border-bottom: 0 !important;
	background: #1F2122;
}

.card-footer {
	border-radius: 0 0 15px 15px !important;
	border-top: 0 !important;
	background: #1F2122;
}

.container {
	align-content: center;
}

.search {
	border-radius: 15px 0 0 15px !important;
	background-color: rgba(0, 0, 0, 0.3) !important;
	border: 0 !important;
	color: white !important;
}

.search:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.type_msg {
	background-color: rgba(0, 0, 0, 0.3) !important;
	border: 0 !important;
	color: white !important;
	height: 60px !important;
	overflow-y: auto;
}

.type_msg:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.attach_btn {
	border-radius: 15px 0 0 15px !important;
	background-color: rgba(0, 0, 0, 0.3) !important;
	border: 0 !important;
	color: white !important;
	cursor: pointer;
}

.send_btn {
	border-radius: 0 15px 15px 0 !important;
	background-color: rgba(0, 0, 0, 0.3) !important;
	border: 0 !important;
	color: white !important;
	cursor: pointer;
}

.search_btn {
	border-radius: 0 15px 15px 0 !important;
	background-color: rgba(0, 0, 0, 0.3) !important;
	border: 0 !important;
	color: white !important;
	cursor: pointer;
}

.contacts {
	list-style: none;
	padding: 0;
}

.contacts li {
	width: 100% !important;
	padding: 5px 10px;
	margin-bottom: 15px !important;
}

.active {
	background-color: #27292A;
}

.user_img {
	height: 60px;
	width: 60px;
	border: 1.5px solid #f5f6fa;
}

.img_cont {
	display: flex;
	align-items: center;
	position: relative;
	height: 70px;
	width: 70px;
}

.chat_product_img {
	border-radius: 5px;
	align-items: center;
	position: relative;
	height: 50px;
	width: 50px;
}

.chat_product_info {
	margin-top: 10px;
	margin-bottom: auto;
	margin-left: 0px;
	overflow: hidden;
	white-space: nowrap;
}

.chat_product_info .title {
	font-size: 12px;
	color: white;
}

.chat_product_info .status {
	font-size: 12px;
	color: white;
	font-weight: bold;
	margin-right: 5px;
}

.chat_product_info p {
	font-size: 12px;
	color: rgba(255, 255, 255, 0.6);
}

.msg_cotainer {
	margin-top: auto;
	margin-bottom: auto;
	margin-left: 10px;
	border-radius: 25px;
	background-color: #27292A;
	color: white;
	padding: 10px;
	position: relative;
}

.msg_cotainer_send {
	margin-top: auto;
	margin-bottom: auto;
	margin-right: 10px;
	border-radius: 25px;
	background-color: #E75E8D;
	color: white;
	padding: 10px;
	position: relative;
}

.msg_time {
	position: absolute;
	left: 0;
	margin-left: 10px;
	min-width: 100px;
	bottom: -15px;
	color: rgba(255, 255, 255, 0.5);
	font-size: 10px;
}

.msg_time_send {
	position: absolute;
	right: 0;
	margin-right: 10px;
	min-width: 100px;
	bottom: -15px;
	color: rgba(255, 255, 255, 0.5);
	font-size: 10px;
	text-align: end;
}

.msg_head {
	position: relative;
	background: #1F2122;
}

/* width */
::-webkit-scrollbar {
	width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
	background: #f1f1f1;
}

/* Handle */
::-webkit-scrollbar-thumb {
	background: #888;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
	background: #555;
}

@media ( max-width : 576px) {
	.contacts_card {
		margin-bottom: 15px !important;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="page-content">
			<form id="mainForm" method="POST">
				<input type="hidden" id="selectedRoom">
				<div class="row justify-content-center h-100">
					<div class="col-md-4 col-xl-3 chat">
						<div class="card mb-sm-3 mb-md-0 contacts_card">
							<div class="card-header">
								<div class="input-group">
									<input type="text" placeholder="add ChatUser Seq..." id="cuMember" name="cuMember" class="form-control search">
									<span class="input-group-text search_btn" onclick="addChat()"><i class="fa-solid fa-plus"></i></span>
								</div>
							</div>
							<div class="card-body contacts_body">
								<ui class="contacts" id="chatList"> 
								<c:forEach items="${list }" var="list" varStatus="status">

									<li class="room" id="${list.chatSeq}" onclick="selectChatRoom(${list.chatSeq})">
										<div class="d-flex bd-highlight">
											<div class="img_cont">
												<!-- 아래 path 와 uuidname 도 본인의 dto field에 맞게 수정 -->
												<img src="
																										<c:if test = "${list.upPath ne null}">
																											${list.upPath}${list.upUuidName}
																										</c:if>
		                                                " class="rounded-circle user_img">
											</div>
											<div class="chat_product_info">
												<!-- 아래 mmNickName  도 본인의 dto field에 맞게 수정 -->
												<span class="status"><c:out value="${list.mmNickName }" /></span>
												<p>TEST TEXT FIELD</p>
											</div>
										</div>
									</li>

								</c:forEach> </ui>
							</div>
							<div class="card-footer"></div>
						</div>
					</div>
					<div class="col-md-8 col-xl-6 chat">
						<div class="card">
							<div id="chatBox" class="card-body msg_card_body">

								<!-- 채팅 메세지 박스 -->

							</div>
							<div class="card-footer">
								<div class="input-group">
									<span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
									<textarea id="chatMessage" class="form-control type_msg" placeholder="Type your message..."></textarea>
									<span class="input-group-text send_btn" id="sendBtn"><i class="fas fa-location-arrow"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>



			</form>
		</div>
	</div>
	<script src="https://kit.fontawesome.com/63aa3074b3.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

	<script type="module">

	import { initializeApp } from "https://www.gstatic.com/firebasejs/9.12.1/firebase-app.js";
	
  //Firebase 프로젝트에서 추출한 정보 입력
	  // Your web app's Firebase configuration
  const firebaseConfig = {
    apiKey: "AIzaSyCmQGOKHA8p3gVPxFwpgNfm1sp1hmCFumg",
    authDomain: "my-chat-deb98.firebaseapp.com",
    databaseURL: "https://my-chat-deb98-default-rtdb.firebaseio.com",
    projectId: "my-chat-deb98",
    storageBucket: "my-chat-deb98.appspot.com",
    messagingSenderId: "488741933694",
    appId: "1:488741933694:web:ff9209209488c598cb7e2f"
  };

	// Initialize Firebase
	const app = initializeApp(firebaseConfig);

	import { getDatabase, ref, set, onValue }	from "https://www.gstatic.com/firebasejs/9.12.1/firebase-database.js";
	
	const db = getDatabase();

	var insMsg = document.getElementById("chatMessage");
	insMsg.addEventListener('keyup',enterKey);

	var sendBtn = document.getElementById("sendBtn");
	sendBtn.addEventListener('click',sendMessage);


	function enterKey() {
		
		var keycode = event.keyCode;
		
		if(keycode == 13) //Enter
			sendMessage();
	};
		
	function sendMessage(){

		var room = $("#selectedRoom").val();
	
		if(room == "") {
			//채팅방을 선택하지 않고 메세지 보내면 동작하지 않도록
			$("#chatMessage").val("");
			return;
		}

		var message = $("#chatMessage").val();

		//메시지 입력창 초기화
		$("#chatMessage").val("");
		
		//새 메세지 추가하면 채팅방에 이전 기록도 다시 다 불러와서 한번 비워줌
		$("#chatBox").html(""); 	
	
		//새 메세지를 Firebase / realtime database / chat / 채팅방seq / 시간대 / 작성자 / 메세지에 입력합니다.
		set(ref(db,'chat/'+room+'/'+getnow()+'/'+${sessSeq} ),{
			Masseage: message
		})

		//스크롤을 제일 아래로 유지
		$("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
	};
	
	function readMessage(e){

		const room = e.id; 
		$("#selectedRoom").val(room);
		
		const dbRef = ref(db, 'chat/'+room);
		const txt = "";
        onValue(dbRef,(snapshot) => {
            if(snapshot.key == $("#selectedRoom").val()){
				//채팅을 누르면 기존 채팅은 지우고 새로 불러오게
				$("#chatBox").html("");
                snapshot.forEach((childSnapshot) => {
                    const timetable = childSnapshot.key;
                    console.log(timetable); 
                    onValue(ref(db,'chat/'+room+'/'+timetable),(snapshot2) => {
                        snapshot2.forEach((childSnapshot2) => {
                            const writer = childSnapshot2.key
                            console.log(writer);
                        
                            onValue(ref(db,'chat/'+room+'/'+timetable+'/'+writer),(snapshot3) => {
                                snapshot3.forEach((childSnapshot3) => {
                                        const message = childSnapshot3.val()
                                        console.log(message);
                                            
                                        var txt = '';
                                        txt += '<div class="d-flex mb-4 justify-content-';
                                        txt += writer == ${sessSeq} ? 'end' : 'start';
                                        txt += '">';
                                        txt += '<div class="msg_cotainer';
                                        txt += writer == ${sessSeq} ? '_send' : '';
                                        txt += '">';
                                        txt += message;
                                        txt += '<span class="msg_time';
                                        txt += writer == ${sessSeq} ? '_send' : '';
                                        txt += '">';
                                        txt += getTimeFormat(timetable);
                                        txt += '</span>';
                                        txt += '</div>';
                                        txt += '</div>';

                                        $("#chatBox").append(txt);
                                        $("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
                                    });
                                }); 
                            }); 
                        });
                    });
                 }		
            });	
	}

	$(".room").click(function(){
		readMessage(event.currentTarget);
				
	}); 
	function getTimeFormat(timetable){
		//221105080634 
		return timetable.substring(0,2)+"-"+timetable.substring(2,4)+"-"+timetable.substring(4,6)+" "+timetable.substring(6,8)+":"+timetable.substring(8,10)+":"+timetable.substring(10,12);	
	}

	</script>

	<script>
				
		getnow = function() {
				
			var timestamp = new Date().getTime();
			
			var date = new Date(timestamp); //타임스탬프를 인자로 받아 Date 객체 생성
			
			var year = date.getFullYear().toString().slice(-2); //년도 뒤에 두자리
			var month = ("0" + (date.getMonth() + 1)).slice(-2); //월 2자리 (01, 02 ... 12)
			var day = ("0" + date.getDate()).slice(-2); //일 2자리 (01, 02 ... 31)
			var hour = ("0" + date.getHours()).slice(-2); //시 2자리 (00, 01 ... 23)
			var minute = ("0" + date.getMinutes()).slice(-2); //분 2자리 (00, 01 ... 59)
			var second = ("0" + date.getSeconds()).slice(-2); //초 2자리 (00, 01 ... 59)
			
			return year+month+day+hour+minute+second;
		};
	
		selectChatRoom = function (roomNo) {
            
            var roomArray = $("li[name=room]");
            roomArray.each(function (index, item) {
                if (index != roomNo - 1)
                    item.classList.remove("active");
                else
                    item.classList.add("active");
            });


        };

		addChat = function(){
			
					$.ajax({
						url: '/chat/insChat'
						,type: 'POST'
						,datatype:'json'
						,data:{
							cuMember : $("#cuMember").val()
						}
						,success:function(result){
							if(result.rt=="success"){
								
								$("#cuMember").val("");
								var txt="";
								txt+='<li class="room" id="';
								txt+=result.newChat.chatSeq;
								txt+='" onclick="selectChatRoom(';
								txt+=result.newChat.chatSeq;
								txt+=')">';
								txt+='<div class="d-flex bd-highlight">';
								txt+='<div class="img_cont">';
								//아래 path 와 uuidname 도 본인의 dto field에 맞게 수정
								txt+='<img src="';
								if(result.newChat.upPath != null)
								{
									txt+=result.newChat.upPath + result.newChat.upUuidName;
								}
								txt+='" class="rounded-circle user_img">';
								txt+='</div>';
								txt+='<div class="chat_product_info">';
								txt+='<span class="status">';
								txt+=result.newChat.id;
								txt+='</span>';
								txt+='<p>TEST TEXT FIELD</p>';
								txt+='</div>';
								txt+='</div>';
								txt+='</li>';
								$("#chatList").prepend(txt);
							}else{
								alert("fail..!");
							}
						}
						,error:function(){
							alert("ajax error..!");
						}
					});
			
				}
    </script>
</body>
</html>