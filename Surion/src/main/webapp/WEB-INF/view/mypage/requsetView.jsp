<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />


<style>
@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

.rate {
	display: inline-block;
	border: 0;
	margin-right: 1%;
}

.rate>input {
	display: none;
}

.rate>label {
	float: right;
	color: #ddd
}

.rate>label:before {
	display: inline-block;
	font-size: 1rem;
	padding: .3rem .2rem;
	margin: 0;
	cursor: pointer;
	font-family: FontAwesome;
	content: "\f005 ";
}

.rate .half:before {
	content: "\f089 ";
	position: absolute;
	padding-right: 0;
}

.rate input:checked ~ label, .rate label:hover, .rate label:hover ~
	label {
	color: #f73c32 !important;
}

.rate input:checked+.rate label:hover, .rate input input:checked ~ label:hover,
	.rate input:checked ~ .rate label:hover ~ label, .rate label:hover ~
	input:checked ~ label {
	color: #f73c32 !important;
}

body {
	margin-top: 20px;
	color: #1a202c;
	text-align: left;
	background-color: #e2e8f0;
}

@media ( min-width : 992px) {
	.sticky-navbar .inner-wrapper {
		height: calc(100vh - 3.5rem - 48px);
	}
}

.inner-main-body {
	padding: 1rem;
	position: relative;
	flex: 1 1 auto;
}

.inner-main-body .sticky-top, .sticky-top {
	z-index: 999;
}

@media ( max-width : 767.98px) {
	.inner-expand .main-body {
		overflow: hidden;
	}
	.inner-expand .inner-wrapper {
		transform: translate3d(235px, 0, 0);
	}
}

.nav .show>.nav-link.nav-link-faded, .nav-link.nav-link-faded.active,
	.nav-link.nav-link-faded:active, .nav-pills .nav-link.nav-link-faded.active,
	.navbar-nav .show>.nav-link.nav-link-faded {
	color: #3367b5;
	background-color: #c9d8f0;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	color: #fff;
	background-color: #467bcb;
}

.nav-link.has-icon {
	display: flex;
	align-items: center;
}

.nav-link.active {
	color: #467bcb;
}

.nav-pills .nav-link {
	border-radius: .25rem;
}

.nav-link {
	color: #4a5568;
}

.card {
	box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0
		rgba(0, 0, 0, .06);
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
}

.card-body {
	flex: 1 1 auto;
	min-height: 1px;
	padding: 1rem;
}

.test {
	height: 115px;
	transition: .2s;
	cursor: pointer;
	overflow-y: hidden
}

.active .test {
	height: 300px;
	cursor: context-menu;
}

#chat-list>div {
	padding: 0 0 10px 0 !important;
}

.wait {
	  display: grid;
  place-items: center;
  min-height: 50vh;
}
</style>


<!-- 여기부터 -->
<c:if test="${joinList eq '[]'}">
	<div class="wait">
		<h2>아직 들어온 견적이 없어요.</h2>
		<h4>조금만 더 기다려 주세요!</h4>
	</div>
</c:if>
<c:forEach var="list" items="${joinList}">
	<div id="chat-list" onclick="go(this)">
		<div class=" p-2 forum-content show">
			<div class="d-flex card mb-2 test"
				style="flex-direction: inherit; flex-wrap: wrap;">
				<div class="col-lg-7 card-body p-2 p-sm-3">
					<div class="media forum-item">
						<div class="d-flex">
						<c:choose>
							<c:when test="${list.imgurl eq null }">
								<img src="${cpath}/resources/images/default.png"
								class="mr-3 rounded-circle" width="50" height="50" alt="User" />
							</c:when>
							<c:otherwise>
								<img src="${cpath}/resources/images/${list.imgurl}"
								class="mr-3 rounded-circle" width="50" height="50" alt="User" />
							</c:otherwise>
						</c:choose>
							<h3 class="ms-3 align-self-center">${list.shopName}</h3>
						</div>
						<div class="media-body d-flex">
							<fieldset class="rate">
								<input type="radio" id="rating310" name="rating2" value="10"
									onclick="return(false);"><label
									for="rating310" title="5점"></label> <input type="radio"
									id="rating39" name="rating2" value="9" onclick="return(false);"
									checked><label class="half" for="rating39" title="4.5점"></label>
								<input type="radio" id="rating38" name="rating2" value="8"
									onclick="return(false);"><label
									for="rating38" title="4점"></label> <input type="radio"
									id="rating37" name="rating2" value="7" onclick="return(false);"><label
									class="half" for="rating37" title="3.5점"></label> <input
									type="radio" id="rating36" name="rating2" value="6"
									onclick="return(false);"><label
									for="rating36" title="3점"></label> <input type="radio"
									id="rating35" name="rating2" value="5" onclick="return(false);"><label
									class="half" for="rating35" title="2.5점"></label> <input
									type="radio" id="rating34" name="rating2" value="4"
									onclick="return(false);"><label
									for="rating34" title="2점"></label> <input type="radio"
									id="rating33" name="rating2" value="3" onclick="return(false);"><label
									class="half" for="rating33" title="1.5점"></label> <input
									type="radio" id="rating32" name="rating2" value="2"
									onclick="return(false);"><label
									for="rating32" title="1점"></label> <input type="radio"
									id="rating31" name="rating2" value="1" onclick="return(false);">
								<label class="half" for="rating31" title="0.5점"></label>
							</fieldset>
							<p class="text-muted mb-0 align-self-center"
								style="font-size: small">(4.5 / 5.0)</p>
						</div>
					</div>

				</div>
				<div class="col-lg-5 card-body p-2 p-sm-3 align-self-center">
					<div class="media forum-item d-flex justify-content-end">
						<h1>${list.estimate} 원</h1>
					</div>
				</div>
				<div class="col-lg-12 px-3" style="max-height: 300px">
					<p>${list.office}</p>
					<p>연락 가능 시간 : ${list.startTime}시 ~ ${list.endTime}시</p>
					<p>${list.intro}</p>
					<div class="d-flex justify-content-end pe-3 mb-3">
						<button type="button" class="btn btn-outline-primary"
							onclick="makeRoom('${list.mechanic_id}', '${list.member_id}')">여기서 고치기</button>
					</div>
				</div>

			</div>
		</div>
	</div>
</c:forEach>
<!-- 여기까지 글 하나 -->


<script>



	function go(a) {
		a.classList.toggle('active');
	}

	//방만들기
	function makeRoom(id, sessionId) {
		if (confirm('해당 엔지니어에게 맡기시겠습니까?')) {
			var params = new URLSearchParams();
			params.append("name", id); 
			//alert(params);

			$.ajax({//해당 엔지니어와 채팅방 개설 후 받았던 견적 삭제
				url : "${cpath}/chat/room?" + params,
				type : "post",
				error : function() {
					alert('채팅방 개설 실패')
				},
				success : function(res) {
					$.ajax({
						url : "${cpath}/mypage/offerDelete",
						type : "post",
						data :{
							"id" : sessionId
						},
						error : function(){
							console.log("받은 견적 목록 삭제 실패");
						},
						success : function(res){
							console.log(res + "개 삭제 성공");
							alert("견적이 수락 되었습니다. 채팅으로 이동합니다.")
							location.href = "${cpath}/mypage/myinfo?pageview=3";
						}
					});
				}
			});
		} else {
			return;
		}
	}
</script>