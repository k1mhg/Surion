<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="cpath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>

<html lang="ko">
<%@ include file="../common/front_header.jsp" %>
<style>
    body {
        background: #fff !important;
    }
	
	 .center {
        display: flex;
        justify-content: center;
        align-items: center;
      }
      
    #my_page_right {
        padding: 35px 30px;
    }


    #navLink a:nth-child(${pageview}) {
        color: red !important;
    }

  

    textarea {
        height: 100px;
        border: none;
        resize: none;
    }
    
   @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css');
       .rate { display: inline-block;border: 0;margin-right: 85px;}
	.rate > input {display: none;}
	.rate > label {float: right;color: #ddd}
	.rate > label:before {display: inline-block;font-size: 1rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005";}
	.rate .half:before {content: "\f089"; position: absolute;padding-right: 0;}
	.rate input:checked ~ label, 
	.rate label:hover,.rate label:hover ~ label { color: #f73c32 !important;  } 
	.rate input:checked + .rate label:hover,
	.rate input input:checked ~ label:hover,
	.rate input:checked ~ .rate label:hover ~ label,  
	.rate label:hover ~ input:checked ~ label { color: #f73c32 !important;  }

    #rarara {
        position: relative;
    }

    #sendBtnDiv {
        position: absolute;
        bottom: 0;
    }
    
    .hr-sect {
        display: flex;
        flex-basis: 100%;
        align-items: center;
        color: rgba(0, 0, 0, 0.35);
        font-size: 12px;
        margin: 8px 0px;
      }
      .hr-sect::before,
      .hr-sect::after {
        content: "";
        flex-grow: 1;
        background: rgba(0, 0, 0, 0.35);
        height: 1px;
        font-size: 0px;
        line-height: 0px;
        margin: 0px 16px;
      }

</style>

<body>
<%@ include file="../common/header.jsp" %>
<div class="suriSize">
    <div class="container">
        <div class="row justify-content-between" style="min-height: 500px;">
            <%@ include file="../common/sidebar.jsp" %>
            <div class="col-lg-9" id="my_page_right">
                <div class="d-flex">
                    <div class="row justify-content-between" style="min-height: 500px;">
                        <div class="col-lg-8 px-3">
                            <!--채팅창-->
                            <div class="d-flex">
                                <div style="max-height: 600px;">
                                    <div class="card" id="chat1" style="border-radius: 15px; min-height: 550px;">
                                        <div class="card-body" id="rarara" style="min-width: 528px;max-width:529px">
                                            <div style="overflow-y: auto; max-height: 373px;" class="msgArea"
                                                 id="chatMonitor">
                                                 <c:set var="versus" value="0"/>
                                                 <c:forEach var="list" items="${ message }">   
                                                 	<c:if test="${fn:substring(versus, 0, 3)  ne fn:substring(list.send_time, 0, 3) }">
                                                 		<div class="hr-sect">${fn:substring(list.send_time, 0, 10) }</div>
                                                 	</c:if>                                              
                                                 	<c:choose>
                                                 		<c:when test="${list.member_id eq member.id}">
                                                 			<c:set var="versus" value="${fn:substring(list.send_time, 0, 3)}"/>                                         
                                                 			<input type=hidden id="memberId" value="${list.member_id}">
                                                 			<div class="justify-content-end d-flex flex-row mb-3">
                                                 				<div class="row align-items-end">
                                                 					<p class="col me-2 mb-0" style="font-size:small;">${fn:substring(list.send_time, 15, 21) }</p>
                                                 				</div>
                                                 	        	<div class="p-3 me-3 border" style="border-radius: 15px; background-color: #fbfbfb; max-width:300px;">
													        		<p class="small mb-0 text-wrap">${ list.message }</p>
													        	</div>
													        </div>
                                                 		</c:when>
                                                 		<c:otherwise>
                                                 			<c:set var="versus" value="${fn:substring(list.send_time, 0, 3)}"/> 
                                                 			<div class="d-flex flex-row justify-content-start mb-3" style="max-width:300px">
                                                 			<c:choose>
                                                 				<c:when test="${oppUrl ne null}">
												         	   		<img src="${cpath}/resources/images/${oppUrl}" style="border-radius:50%; width: 45px; height: 100%;">
                                                 				</c:when>                                                 			
                                                 				<c:otherwise>
                                                 					<img src="${cpath}/resources/images/default.png" style="border-radius:50%; width: 45px; height: 100%;">
                                                 				</c:otherwise>
                                                 			</c:choose>
												            	<div class="p-3 ms-3" style="border-radius: 15px; background-color: rgba(57, 192, 237,.2)">
												            		<p class="small mb-0 text-wrap" style="max-width:300px;">${ list.message }</p>
												           	 	</div>
												           	 	<div class="row align-items-end">
												           	 		<p class="col mb-0" style="font-size:small;">${fn:substring(list.send_time, 15, 21) }</p>
												           	 	</div>
												            </div>
                                                 		</c:otherwise>
                                                 	</c:choose>
                                                 </c:forEach>
                                                 </div>
                                            <div class="text-end align-bottom mb-1" id="sendBtnDiv"
                                                 style="vertical-align: bottom; width: 95%">
											<textarea
                                                    class="content form-control border border-primary-subtle"
                                                    id="messageVal" placeholder="욕설 및 혐오발언은 제재 대상입니다."></textarea>
                                                <button type="button" class="sendbtn btn btn-outline-primary"
                                                        style="margin-top: 4px" onclick="sendMessage()" id="sendBtn">보내기
                                                </button>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <!--고수 정보-->
                            <div class="card text-center me-0" id="chat2"
                                 style="border-radius: 15px; height: 100%; max-height: 550px;">
                                <div class="center">
                                	<c:choose>
                                		<c:when test="${oppUrl ne null}">
                                   			<img class="d-flex mt-1"
                                         	src="${cpath}/resources/images/default.png"
                                         	alt="프로필" style="width: 120px; height: 120px; border-radius:50%">
                                		</c:when>
                                		<c:otherwise>
                                		   <img class="d-flex mt-1"
                                         	src="${cpath}/resources/images/default.png"
                                         	alt="프로필" style="width: 120px; height: 120px; border-radius:50%">
                                		</c:otherwise>
                                	</c:choose>
                                </div>
                                <p class="fs-3 text mt-1 mb-0">자전거 가게</p>
                                <p class="fs-5 text mb-0">별점</p>
                                <fieldset class="rate" >
                                    <input type="radio" id="rating10" name="rating" value="10"><label
                                        for="rating10" title="5점"></label> <input type="radio" id="rating9"
                                                                                  name="rating" value="9" checked><label
                                        class="half"
                                        for="rating9" title="4.5점"></label> <input type="radio"
                                                                                   id="rating8" name="rating" value="8"><label
                                        for="rating8"
                                        title="4점"></label> <input type="radio" id="rating7" name="rating"
                                                                   value="7"><label class="half" for="rating7"
                                                                                    title="3.5점"></label>
                                    <input type="radio" id="rating6" name="rating" value="6"><label
                                        for="rating6" title="3점"></label> <input type="radio" id="rating5"
                                                                                 name="rating" value="5"><label
                                        class="half" for="rating5"
                                        title="2.5점"></label> <input type="radio" id="rating4"
                                                                     name="rating" value="4"><label for="rating4"
                                                                                                    title="2점"></label>
                                    <input type="radio" id="rating3" name="rating" value="3"><label
                                        class="half" for="rating3" title="1.5점"></label> <input
                                        type="radio" id="rating2" name="rating" value="2"><label
                                        for="rating2" title="1점"></label> <input type="radio" id="rating1"
                                                                                 name="rating" value="1"><label
                                        class="half" for="rating1"
                                        title="0.5점"></label>
                                </fieldset>
                                <p class="fs-6 text">4.5 / 5.0</p>

                                <p class="fs-5 text">서울시 강동구</p>
                                <p class="fs-5 text">연락가능시간 10시 ~ 21시</p>
                                <p class="fs-5 text">고수상세정보</p>
                                <p class="small mb-1 lh-2 mx-2">안녕하세요. 강동구에서 자전거 정비업체를 운영하고 있습니다.
                                    출장/방문 수리 모두 가능합니다. 업계 최고 수준으로 모시겠습니다. 감사합니다.</p>

                                <button type="button" class="btn btn-outline-primary mx-3" style=""
                                        id="requestCompletedBtn">의뢰완료
                                </button>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div> <!-- //row -->
    </div> <!-- //container -->
</div><!-- //suriSize -->
</body>

<%@ include file="../common/footer.jsp" %>


<!-- socket -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script>
    // websocket & stomp initialize
    var sock = new SockJS("http://" + location.host + "/surion/ws-stomp");
    var ws = Stomp.over(sock);
    var reconnect = 0;

    let room_id = '';
    let room = {};
    let member_id = '';
    let message = '';
    let messages = [];
    let send_time = '';

    $(document).ready(function () {
        room_id = localStorage.getItem('wschat.room_id');
        member_id = localStorage.getItem('wschat.member_id');
        findRoom();
        scrollToBottom();
    });

    function korTime(){
    	const now = new Date(); // 현재 시간
    	const utcNow = now.getTime() + (now.getTimezoneOffset() * 60 * 1000); // 현재 시간을 utc로 변환한 밀리세컨드값
    	const koreaTimeDiff = 9 * 60 * 60 * 1000; // 한국 시간은 UTC보다 9시간 빠름(9시간의 밀리세컨드 표현)
    	const koreaNow = new Date(utcNow + koreaTimeDiff); // utc로 변환된 값을 한국 시간으로 변환시키기 위해 9시간(밀리세컨드)를 더함
		return koreaNow;
    }
    
    function findRoom() {
        $.ajax({
            url: '/surion/chat/room/' + room_id,
            type: 'get',
            error: function () {
                alert('채팅방 입장 실패');
            },
            success: function (res) {
                room = res.data;
                console.log(res);
            }
        });
    }

    function sendMessage() {
        message = $('#messageVal').val();
        ws.send("/pub/chat/message", {}, JSON.stringify({
            type: 'TALK',
            room_id: room_id,
            member_id: member_id,
            message: message,
            send_time: korTime()
        }));
       	insertMsg();
        message = '';
    }

    function insertMsg(){
    	 $.ajax({
             type: 'post',
             url: '${cpath}/insertChat',
             data: {
                 "message": message,
                 "room_id": room_id,
                 "member_id": member_id,
                 "send_time": korTime()
             },
             success: console.log("insertMessageSuccess"),
             error: function () {
                 alert('insertMsg error')
             }
         });
    }
    
    function recvMessage(recv) {
        messages.unshift({
            "type": recv.type,
            "room_id": recv.type == 'ENTER' ? '[알림]' : recv.member_id,
            "message": recv.message,
            "send_time": recv.send_time
        })
        renderChat(recv);
        
    }

    function renderChat(recv) {
        var msgArea = document.querySelector('.msgArea');
        var newMsg = document.createElement("span");
        var addDiv = '';
/* 		let id = document.getElementById('memberId').value;
 */        if (recv.member_id == '${member.id}') { 
           	addDiv += '<div class="d-flex flex-row justify-content-end mb-3">';
           	addDiv += '<div class="row align-items-end">'
           	addDiv += '<p class="col mb-0 me-0" style="font-size:small;">'+recv.send_time.getHours()+':'+recv.send_time.getMinutes()+'</p>'
            addDiv += '</div>';
            addDiv += '<div class="p-3 me-3 border" style="border-radius: 15px; background-color: #fbfbfb; max-width:300px;">';
            addDiv += '<p class="small mb-0 text-wrap">' + recv.message + '</p>';
            addDiv += '</div>';
            addDiv += '</div>';
        } else {
           	addDiv += '<div class="d-flex flex-row justify-content-start mb-3" style="max-width:300px">';
           	if("${oppUrl}" != null){
            	addDiv += '<img src="${cpath}/resources/images/${oppUrl}" style="width: 45px; height: 100%; border-radius:50%;">';
           	} else {
           		addDiv += '<img src="${cpath}/resources/images/default.png" style="width: 45px; height: 100%; border-radius:50%;">';
           	}
            addDiv += '<div class="p-3 ms-3" style="border-radius: 15px; background-color: rgba(57, 192, 237,.2);">';
            addDiv += '<p class="small mb-0 text-wrap" style="max-width:300px;">' + recv.message + '</p>';
            addDiv += '</div>';
            addDiv += '<div class="row align-items-end">';
            addDiv += '<p class="col mb-0 me-0" style="font-size:small;">'+recv.send_time.getHours()+':'+recv.send_time.getMinutes()+'</p>'
            addDiv += '</div>';
            addDiv += '</div>';
        }
        newMsg.innerHTML = addDiv;
        msgArea.append(newMsg);
        scrollToBottom();
    }

    const scrollToBottom = () => { //채팅창 스크롤 고정 함수
        document.getElementById('chatMonitor').scrollBy({top: 100});
    };


    var sendbtn = document.getElementById("sendBtnDiv");
    var messageArea = document.getElementById("messageVal");
    messageArea.addEventListener("keyup", function (event) { //엔터키 입력시 채팅입력 함수
        if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("sendBtn").click();
            messageArea.value = '';
        }
    });



    function connect() {
        // pub/sub event
        ws.connect({}, function (frame) {
            ws.subscribe("/sub/chat/room/" + room_id, function (message) {
                var recv = JSON.parse(message.body);
                recv.send_time = new Date();
                recvMessage(recv);
            });
            ws.send("/pub/chat/message", {}, JSON.stringify({
                type: 'ENTER',
                room_id: room_id,
                member_id: member_id,
            }));

        }, function (error) {
            if (reconnect++ <= 5) {
                setTimeout(function () {
                    console.log("connection reconnect");
                    sock = new SockJS("/ws-stomp");
                    ws = Stomp.over(sock);
                    connect();
                }, 10 * 1000);
            }
        });
    }

    connect();
</script>

</body>
</html>