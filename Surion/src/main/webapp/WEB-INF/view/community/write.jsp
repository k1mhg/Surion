<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html lang="ko">
<%@ include file="../common/front_header.jsp"%>
<style>
body {
	background: #fff !important;
}

#my_page_right {
	padding: 35px 30px;
}

#navLink a:nth-child(${pageview}){
	color:red !important;
}

.subject {
	display: flex;
	padding: 27px 0;
	justify-content: space-between;
}

.option_subject {
	height: 3.5rem;
	padding: 1rem 0;
	background-color: #fff;
}

.pick_picture {
	height: 3.5rem;
	background-color: lightgray;
}

.insert_title {
	width: 100%;
	padding: 1.25rem 0;
	margin-top: 15px;
}

.option {
	display: flex;
	height: 62.97px;
	margin-top: 15px;
}

.option_service, .option_loc {
	
}

.text {
	color: gray;
	padding-top: 20px;
	width: 100%;
	height: 300px;
	margin-top: 15px;
}

.form-control {
	text-align: center;
}

.form-control option {
	text-align: center;
}

.pick_picture{
	align-items: center;
    display: flex;
}

.pick_picture i{
	align-items: center;
	margin-left:10px;
	font-size: 20px;
}

.height{
	height: 100%;
    width: 150px;
    margin-right: 15px;
    cursor: pointer;
    background: #198754;
    color: #fff;
}


</style>
<script> 
//선택한 것 보여주기
function change(){
	
	var values = document.getElementById('test').value;
	document.getElementById('show').value = values;
}
</script>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="suriSize">
		<div class="container">
			<div class="row justify-content-between" style="min-height: 500px;">
				<%@ include file="../common/communiSidebar.jsp"%>
				<div class="col-lg-9" id="my_page_right">
					<!-- 커뮤니티 글 등록 -->
					<form action="${cpath}/community/writePro" method="post">
						<div class="subject">
							<!-- <div class="option_subject">
							주제선택 <i class="fa-solid fa-caret-down"></i>
						</div> -->
							<!-- 주제선택 -->
							<div class="pull-right">
									<select class="form-control btn btn-success" name="searchField">
											<option value="0">주제 선택</option>
											<option value="query">궁금해요</option>
											<option value="howmuch">얼마예요</option>
											<option value="findgosu">고수찾아요</option>
											<option value="together">함께해요</option>
									</select>
							</div>
							<!-- <input type="text" id="show"> -->
							<div data-v-63515f9a class="write-button desktop">
						<input type="submit" value="등록"
							class="btn btn-outline-info">
					</div>
						</div>
						<div class="pick_picture">
							<a><i class="fa-solid fa-camera"></i></a>
						</div>
						<input type="text" class="insert_title" placeholder="제목을 입력해주세요." name="title"/>
						<div class="option">
							<div class="option_service">
								<!-- (선택) 서비스 <i class="fa-regular fa-chevron-down"></i> -->
								<select class="form-control height" name="suri_list">
									<option value="0">(선택) 서비스</option>
									<option value="자전거">자전거</option>
									<option value="오토바이">오토바이</option>
									<option value="에어컨">에어컨</option>
									<option value="보일러">보일러</option>
									<option value="컴퓨터">컴퓨터</option>
									<option value="이어폰/기타 등 음향">이어폰/기타 등 음향</option>
									<option value="기타">기타</option>
								</select>
							</div>
							<div class="option_loc">
								<!-- (선택) 지역 <i class="fa-regular fa-chevron-down"></i> -->
								<select class="form-control height" name="loc">
									<option value="0">(선택) 지역</option>
									<option value="전국">전국</option>
									<option value="서울">서울</option>
									<option value="경기">경기</option>
									<option value="대전">대전</option>
									<option value="대구">대구</option>
									<option value="부산">부산</option>
									<option value="제주">제주</option>
								</select>
							</div>
						</div>
						<input type="hidden" value="${member.id}" name="id">
						<textarea
							class="text"
							placeholder="요청 서비스 정보를 공유하거나 고객과 고수님들에게 궁금한 서비스를 물어보세요.&#13;&#10;주제에 맞지 않는 글이나 커뮤니티 이용정책에 위배되어 일정 수 이상 신고를 받는 경우 글이 숨김 및 삭제될 수 있습니다."
							name="content"
						></textarea>
					</form>
				</div>
				<!-- //row -->
			</div>
			<!-- //container -->
		</div>
		<!-- //suriSize -->
	</div>
</body>

<%@ include file="../common/footer.jsp"%>



</body>
</html>