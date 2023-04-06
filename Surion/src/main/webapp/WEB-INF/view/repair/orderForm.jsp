<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<%@ include file="../common/front_header.jsp" %>
<style>

/* uvisual */
	.usec_visual{
		background: #000;
	}
	.usec_visual .uvisual{
		width: 100%;
		height: 320px;
		background: url('./image/submit.png')center center / cover no-repeat;
		padding: 6rem 0;
		font-size: 3rem;
		color: #fff;
	}

/* content */
	.content {
		height: 887px;
		background: #fafafa;
		padding-top: 3rem;
	}

	.suriSize {
		display: flex;
	}

	.mainForm {
		width: 560px;
		height: 800px;
		background: #fff;
		border-radius: 1rem;
		border: .0625rem solid #e1e1e1;
		padding: 2.4375rem;
		transform: translateY(-6.25rem);
	}

	.main1 {
		width: 51%;
	    padding-right: 2.2rem;
	}

	.main2 {
		width: 42%;
	}

	.main2 h3 {
		line-height: 3rem;
	}

	.main2 h4 {
		margin-bottom: 0.25rem;
		font-size: 1rem;
		line-height: 2.0625rem;
		font-weight: 500;
		letter-spacing: -.025rem;
	}

	.main2 p {
		margin-bottom: 2.5rem;
		color: #737373;
		font-size: .875rem;
		line-height: 2rem;
		font-weight: 400;
		letter-spacing: -.0125rem;
	}

	

	.loading {
		display: flex;
		align-items: center;

	}

	.loading .bar{
		width: 0%;
		transition:1s;
		height: 5px;
		background: linear-gradient(to right, #93F9B9, #1D976C);
		margin-right: 5px;
	}

	.loading span{
		color: #00c7ae;
		font-weight: bold;
	}

	.first {
		font-size: .75rem;
		color: #737373;
	}

	.loading div:nth-child(2) {
		width: 3rem;
		color: #00c7ae;
		font-weight: bold;
	}

	.service {
		font-size: 2rem;
		padding-bottom: 1.5rem;
	}

	.below {
		padding-top: 3rem;
	}

	.text-area {
		width: 100%;
		display: flex;
		border: 0.0625rem solid #e7e7e7;
	}
	
	.selBtn {
		display: flex;
		justify-content: end;
	}

	.select {
		padding: 2rem 0 2rem;
	}

	.nextBtn {
		width: 7.5rem;
		height: 48px;
		border-style: none;
		background: #00c7ae;
		color: #fff;
		font-weight: bold;
		font-size: 1.1rem;
		border-radius: 0.3rem;
		margin-left: 1rem;
	}

	.prevBtn {
		width: 7.5rem;
		height: 48px;
		border: 0.0625rem solid #e1e1e1;
		background: #fff;
		color: #00c7ae;
		font-weight: bold;
		font-size: 1.1rem;
		border-radius: 0.3rem;
	}
	
	.progress	{
		width: 100%;
		height: 0.25rem;
		border-radius: 2px;
		box-shadow: none;
		margin: 0;
		flex: 1;
	}

	 .progress {
    appearance: none;
	}

	 .progress::-webkit-progress-bar {
		background:#f0f0f0;
		border-radius:10px;
		box-shadow: inset 3px 3px 10px #ccc;
	}

	 .progress::-webkit-progress-value {
		border-radius:10px;
		background: #1D976C;
		background: -webkit-linear-gradient(to right, #93F9B9, #1D976C);
		background: linear-gradient(to right, #93F9B9, #1D976C);
	}

	.loadingGage {
		padding-left: 15px;
	}

/* input css */
	input[type="checkbox"]{
        display: none;
      }

	input[type="checkbox"] + label{
		display:flex;
		align-items: center;
		height: 4rem;
		width: 100%;
		cursor: pointer;
		padding-left: 1rem;
	}
	input[type="checkbox"] + label span{
		width: 20px;
		height: 20px;
		position: relative;
		background: url('./image/checkbox.svg') center center / contain no-repeat;
	}

	input[type="checkbox"] + label div{
		padding-left: 1rem;
		font-size: 1.2rem;
	}


	input[type="checkbox"]:checked + label span::after{
			content:"";
			font-size: 25px;
			width: 20px;
			height: 20px;
			text-align: center;
			position: absolute;
			left: 0;
			top:0;
			background: url('./image/checkSuc.svg') center center / contain no-repeat;
      }


</style>
<body>
<%@ include file="../common/header.jsp" %>

<!-- header -->
<div class="usec_visual">
		<div class="uvisual">
			<div class="suriSize">
			견적요청
			</div>
		</div>
</div>

<!-- content -->
<div class="sec_content">
	<div class="content">
		<div class="suriSize">
			<div class="main1">
				<form class="mainForm">
					<div>
						<div class="first">완료 시 평균 4개 견적 도착</div>
						<div class="loading">
							<div class="bar"></div>
							<span>0%</span>
						</div>
					</div>
					<div class="below">
						<div class="service">어떤 서비스를 받기 원하시나요?</div>
						<ul class="select">
							<li class="text-area">
								<input type="checkbox" value="자전거" id="checkbox-area-0" name="selectOne"   onclick="checkOnlyOne(this)" class="selClass"/>
								<label for="checkbox-area-0">
									<span></span>
									<div>자전거</div>
								</label>
							</li>	
							<li class="text-area">
								<input type="checkbox" value="오토바이" id="checkbox-area-1" name="selectOne"   onclick="checkOnlyOne(this)" class="selClass"/>
								<label for="checkbox-area-1">
									<span></span>
									<div>오토바이</div>
								</label>
							</li>
							<li class="text-area">
								<input type="checkbox" value="에어컨" id="checkbox-area-2" name="selectOne"   onclick="checkOnlyOne(this)" class="selClass"/>
								<label for="checkbox-area-2">
									<span></span>
									<div>에어컨</div>
								</label>
							</li>
							<li class="text-area">
								<input type="checkbox" value="보일러" id="checkbox-area-3" name="selectOne" onclick="checkOnlyOne(this)" class="selClass"/>
								<label for="checkbox-area-3">
									<span></span>
									<div>보일러</div>
								</label>
							</li>
							<li class="text-area">
								<input type="checkbox" value="컴퓨터" id="checkbox-area-4" name="selectOne" onclick="checkOnlyOne(this)" class="selClass"/>
								<label for="checkbox-area-4">
									<span></span>
									<div>컴퓨터</div>
								</label>
							</li>
							<li class="text-area">
								<input type="checkbox" value="음향" id="checkbox-area-5" name="selectOne" onclick="checkOnlyOne(this)" class="selClass"/>
								<label for="checkbox-area-5">
									<span></span>
									<div>음향</div>
								</label>
							</li>
							<li class="text-area">
								<input type="checkbox" value="기타" id="checkbox-area-6" name="selectOne" onclick="checkOnlyOne(this)" class="selClass"/>
								<label for="checkbox-area-6">
									<span></span>
									<div>기타</div>
								</label>
							</li>
						</ul>
					</div>
						<div class="selBtn">
							<input type="button" value="이전" class="prevBtn" onclick=""/>
							<input type="button" value="다음" class="nextBtn" onclick="next()"/>
						</div>
					</div>
				</form>
			<div class="main2">
				<h4>Surion은 어떤 곳인가요?</h4>
				<p>서비스가 필요한 고객과 서비스를 제공하는 숨은 고수를 쉽고 빠르게 연결해드리는 전문가 매칭 서비스입니다.
					1분 내외의 요청서를 작성하면, 여러 고수님들이 맞춤형 견적을 보내드려요.
					맘에 쏙 드는 고수의 맞춤형 서비스를 받아보세요.</p>
				<h4>모든 분야의 고수만을 모았다!</h4>
				<p>수리 및 무언가를 원하시나요?
					모든 물건은 그에 맞는 수리법이 있는 것인데, 숨고에는 다양한 경력의 수리 전문가가 활동하고 있어요.
					지금 바로 요청서를 작성하시고, 쉽고 간편하게 전문가님과 상담해보세요!</p>
				<h3>내가 찾는 고수<br> Surion에서 만나세요 &#128161;</h3>
			</div>
		</div>
	</div>
</div>

	<%@ include file="../common/footer.jsp" %>

<script>
	// 체크박스 1개만 클릭
	 function checkOnlyOne(element) {
	  const checkboxes = document.getElementsByName("selectOne");
	  checkboxes.forEach((cb) => {
		cb.checked = false;
	  })
	  element.checked = true;
	}
	
	var total = 33;
	var barElem = document.querySelector('.bar');
	const loading = document.querySelector('.loading');
	const select = document.querySelector('.select');
	


	const bicycle = ''
					+'<li class="text-area">'
					+'<input type="checkbox" value="타이어펑크" id="checkbox-area-0" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-0">'
					+'<span></span>'
					+'<div>타이어펑크</div>'
					+'</label>'
					+'</li>'; 

	let goNextValue;

	function next()	{
		goNextValue = document.querySelector('.selClass:checked').value;
		if(goNextValue == '자전거'){
			select.innerHTML = bicycle;
		}

		barElem.style.width = total + "%";
	}

	


	
	



</script>
</body>
</html>