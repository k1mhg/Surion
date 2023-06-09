<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />   
<style>
	body{
		 overFlow : scroll
	}
	
	
	/* 회원가입 */
	.sec_ujoin{padding-top: 23px;flex-direction:column; width:100%; height:87vh;background:#fafafa; display:flex; align-items:center; justify-content:center;z-index: 99;}
	.sec_ujoin h2{text-align:center; margin-bottom:30px;}
	.sec_ujoin .ujoin{ width:420px; padding:40px; background:#fff; border:2px solid #f5f5f5;}
	.sec_ujoin .ujoin .uline{margin-bottom:30px; height:75px;}
	.sec_ujoin .ujoin .uline:last-child{margin-bottom:0; height:40px;}
	.sec_ujoin .ujoin .uline p{color:#737373; margin-right:25px; margin-bottom:0; position:relative;}
	.sec_ujoin .ujoin .uline p::after{content:""; display: block; width: 1px; height: 11px;background: #bdbdbd;top: 7px;right: -15px; position: absolute; }
	.sec_ujoin .ujoin .uline p:last-child::after{display:none;}
	.sec_ujoin .ujoin .uline p:last-child{margin-right:0; border-right:0; padding-right:0;}
	.sec_ujoin .ujoin .uline label{width:100%; font-size:16px; font-weight:bold; margin-bottom:5px;}
	.sec_ujoin .ujoin .uline input{padding-left:10px; width:100%; height:48px; border-radius:3px; border:1px solid #e1e1e1;}
	.sec_ujoin .ujoin .uline input[type="submit"]{
		background:#00c7ae;
		color:#fff;
	}
	.lastline{margin-bottom:0 !important;}
	
	
	/* 중복확인 */
	.idcheck{
		display:flex;
		justify-content:space-between;
	}
	
	.idcheck button{
		width:30%;
		border:none;
		color:#454545;
		background: #00c7ae;
		color: #fff;
	}
	
	.addressLine {
		display:flex;
		justify-content:space-between;
	}
	.addressLine button{
		width:30%;
		border:none;
		color:#454545;
		background: #00c7ae;
		color: #fff;
	}
	
	
	
	
	
	
	
	
</style>

<html>
<%@ include file="../common/front_header.jsp" %>
<body>
<%@ include file="../common/header.jsp" %>
<!--  회원가입  ---> 
<div id="map" style="width:300px;height:300px;margin-top:10px; display:none;"></div>
<div class="sec_ujoin">
	<h2>정비사 등록</h2>
	<form id="frm" action="${cpath}/order2/join" method="post" name="frma">
		<div class="ujoin">
			<div class="uline">
				<label>사업자 번호</label>
				<div class="idcheck">
					<input type="text" placeholder="사업자 번호를 입력해주세요." name="mechanic_id" id="mechanic_id" value="${mecha}">
					<button type="button" onclick="mechanic_idConfirm();">중복확인</button>
				</div>
				<span id="mechanic_idWarning" style="color:red"></span>
			</div>
			<div class="uline">
				<label>사업장 이름</label>
				<input type="text" placeholder="사업장 이름을 입력해주세요." name="shopName" id="shopName" onclick= "shopN();" value="${shop}">
				<span id="shopNameWarning" style="color:red"></span>
			</div>
			<div class="uLine">
				<label>사업장 주소</label>
				<div class= "addressLine" id="address">
				  	<input class="left" type="text" placeholder="주소를 입력해주세요." name="office" id="sample5_address" onclick="off();" value="${of}">
				  	<button class="right" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">주소검색</button>
			  	</div>
			  	<span id="officeWarning" style="color:red"></span>
			</div>
			<div class="uline">
				<label>대표 이름</label>
				<input type="text" placeholder="이름을 입력해주세요." name="name" id="name" onclick= "ceoName();" value="${na}">
				<span id="nameWarning" style="color:red"></span>
			</div>
			<div class="uline">
				<input type="submit" value="정비사 등록" onclick="return totalResult()">
			</div>
		</div>
	</form>
</div>



  <button id="mbtn" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal" style="display:none;">
    Open modal
  </button>
  
  
  
<c:if test="${!empty msg}">
	<!-- 모든 요청모달 여기로 해주세요. -->
		<!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <c:if test="${msgTitle == 'Error Message!'}">
			       <div class="modal-header bg-danger" style="background:#00c7ae;">
			        <h4 class="modal-title text-white">${msgTitle}</h4>
			        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			      </div>
		      </c:if>
			  <c:if test="${msgTitle != 'Error Message!'}">
			       <div class="modal-header" style="background:#00c7ae;">
			        <h4 class="modal-title text-white">${msgTitle}</h4>
			        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			      </div>
		      </c:if>
		      <!-- Modal body -->
		      <div class="modal-body">
		        ${msg}
		      </div>
		    </div>
		  </div>
		</div>
<script>
		$(function(){
			$('#mbtn').trigger('click');
		});
	</script>
</c:if>
<script>
	
	var mechanic_idWarning = $('#mechanic_idWarning');
	var shopNameWarning = $('#shopNameWarning');
	var officeWarning = $('#officeWarning');
	var nameWarning = $('#nameWarning');
	var frm = $('#frm');
	var mechanic_idflag = true;
	var shopNameflag = false;
	var nameflag = false;
	var officeflag = false;
	var dataResult;
	var confirm = false;
	
	var mechanic_idValue;
	var shopNameValue;
	var officeValue;
	var nameValue;
	var lastIdValue;
	var user_id;
	
	
	function shopN() {
	    shopNameflag = true;
	}

	function ceoName() {
	    nameflag = true;
	}

	function off() {
		officeflag = true;
	}

	makeResult();

	function totalResult() {
	    return confirm;
	}

	function makeResult() {

	    if (dataResult == 0) {
	        mechanic_idWarning.html('사업자 번호 중복 확인이 완료 되었습니다.');
	        mechanic_idWarning.css('color', 'green');
	        mechanic_idflag = false;
	        confirm = true;
	    }

	    frm.on('keyup', function() {
	        console.log(confirm);

	        var shopNameValue = $('#shopName').val();
	        var mechanic_idValue = $('#mechanic_id').val();
	        var officeValue = $('#office').val();
	        var nameValue = $('#name').val();

	        // 유효성 기본상태
	        if (mechanic_idflag) {
	            if (mechanic_idValue != null) {
	                mechanic_idWarning.html('사업자 번호 중복 확인을 해주세요.');
	                mechanic_idWarning.css('color', 'red');
	                confirm = false;
	            }
	            if (mechanic_idValue == '') {
	                mechanic_idWarning.html('빈 값을 입력 하실 수 없습니다.');
	                mechanic_idWarning.css('color', 'red');
	                
	            }

	        }
	        
	        

	        if (shopNameflag) {
	            if (shopNameValue != '') {
	                shopNameWarning.html('');
	            }

	            if (shopNameValue == '') {
	                shopNameWarning.html('사업장 이름에 빈 값을 입력 하실 수 없습니다.');
	                shopNameWarning.css('color', 'red');
					}
			}
	        
	        if (officeflag) {
	            if (officeValue != '') {
	            	officeWarning.html('');
	            }

	            if (officeValue == '') {
	            	officeWarning.html('사업장 주소에 빈 값을 입력 하실 수 없습니다.');
	            	officeWarning.css('color', 'red');
					}
			}
	        if (nameflag) {
	            if (nameValue != '') {
	            	nameWarning.html('');
	            }

	            if (nameValue == '') {
	            	nameWarning.html('대표자 이름에 빈 값을 입력 하실 수 없습니다.');
	            	nameWarning.css('color', 'red');
					}
			}	

			});
		}
		
		
		
		
		function gologin(){
			location.href='${cpath}/member/login';
		}
		
		function gojoin(){
			location.href='${cpath}/member/join';
		}
		
		
		
	
	

	//중복체크
	function mechanic_idConfirm(){
		var user_id = $('#mechanic_id').val();
		
		$.ajax({
			url:"${cpath}/order2/check",
			type:"get",
			data:{
				"mechanic_id":user_id,
			},
			success:mechanic_idConfirmResult,
			error: function(){ alert('error')}
		});
	}
	
	
	function mechanic_idConfirmResult(data){
		dataResult = data;
		if(data == 1){
			alert('중복되는 사업자 번호 입니다.');
		}else{
			alert('등록 가능한 사업자 번호 입니다.');
		}
		makeResult();
	}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=555d7f6279f62f81ef88a8b268b9cfc0&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
    


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	var addr = data.address; // 최종 주소 변수 // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                console.log(addr);
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                    	

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "none";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>

</body>
</html>



