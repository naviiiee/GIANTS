<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/YHJ/member.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/confirmId.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/confirmNk.js"></script>
<div class="mypage-top2">
	<div class="mypage-top-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>일반회원가입</h2>
		<p>자이언츠 일반 회원가입 입니다.</p>
	</div> 
</div>
<!-- 회원가입 시작 -->
<div class="page-main">
	<form:form modelAttribute="memberVO" action="registerMember.do" id="member_register" enctype="multipart/form-data">
		<div class="register-box">
		<ul>
			<li>
				<form:label path="memberDetailVO.mem_name">이름(한글)</form:label>
				<form:input path="memberDetailVO.mem_name"/><br>
				<form:errors path="memberDetailVO.mem_name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="mem_id">아이디</form:label>
				<form:input path="mem_id" placeholder="영문, 숫자 4~12자" autocomplete="off"/>
				<input type="button" id="confirmId" value="ID중복체크" class="default-btn">
				<span id="message_id"></span><br>
				<form:errors path="mem_id" cssClass="error-color"/>
 			</li>
			<li>
				<form:label path="passwd">비밀번호</form:label>
				<form:password path="passwd" placeholder="영문,숫자 4~12자"/><br>
				<form:errors path="passwd" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="memberDetailVO.mem_public">생년월일</form:label>
				<form:input path="memberDetailVO.mem_public" placeholder="숫자 6자"/><br>
				<form:errors path="memberDetailVO.mem_public" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="memberDetailVO.mem_phone">연락처</form:label>
				<form:input path="memberDetailVO.mem_phone" placeholder="숫자 11자"/><br>
				<form:errors path="memberDetailVO.mem_phone" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="memberDetailVO.mem_email">이메일</form:label>
				<form:input path="memberDetailVO.mem_email" placeholder="test@test.com"/>
				<form:errors path="memberDetailVO.mem_email" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="memberDetailVO.mem_zipcode">우편번호</form:label>
				<form:input path="memberDetailVO.mem_zipcode" placeholder="숫자 5자"/>
				<input type="button" onclick="execDaumPostcode()" value="우편번호찾기" class="default-btn"><br>
				<form:errors path="memberDetailVO.mem_zipcode" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="memberDetailVO.mem_address1">주소</form:label>
				<form:input path="memberDetailVO.mem_address1"/><br>
				<form:errors path="memberDetailVO.mem_address1" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="memberDetailVO.mem_address2">상세주소</form:label>
				<form:input path="memberDetailVO.mem_address2"/><br>
				<form:errors path="memberDetailVO.mem_address2" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="mem_nickname">닉네임</form:label>
				<form:input path="mem_nickname"/>
				<input type="button" id="confirmNk" value="닉네임중복체크" class="default-btn">
				<span id="message_nk"></span><br>
				<form:errors path="mem_nickname" cssClass="error-color"/>
			</li>
		</ul>
		</div>
		<div class="align-center">
			<form:button class="bottom-btn">전송</form:button>
			<input type="button" value="홈으로" class="bottom-btn"
			       onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>
<!-- 회원가입 끝 -->
<!-- 우편번호 검색 시작 -->
	<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    // 우편번호 찾기 화면을 넣을 element
	    var element_layer = document.getElementById('layer');
	
	    function closeDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_layer.style.display = 'none';
	    }
	
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    //(주의)address1에 참고항목이 보여지도록 수정
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    //(수정) document.getElementById("address2").value = extraAddr;
	                
	                } 
	                //(수정) else {
	                //(수정)    document.getElementById("address2").value = '';
	                //(수정) }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('memberDetailVO.mem_zipcode').value = data.zonecode;
	                //(수정) + extraAddr를 추가해서 address1에 참고항목이 보여지도록 수정
	                document.getElementById("memberDetailVO.mem_address1").value = addr + extraAddr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("memberDetailVO.mem_address2").focus();
	
	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_layer.style.display = 'none';
	            },
	            width : '100%',
	            height : '100%',
	            maxSuggestItems : 5
	        }).embed(element_layer);
	
	        // iframe을 넣은 element를 보이게 한다.
	        element_layer.style.display = 'block';
	
	        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	        initLayerPosition();
	    }
	
	    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	    function initLayerPosition(){
	        var width = 300; //우편번호서비스가 들어갈 element의 width
	        var height = 400; //우편번호서비스가 들어갈 element의 height
	        var borderWidth = 5; //샘플에서 사용하는 border의 두께
	
	        // 위에서 선언한 값들을 실제 element에 넣는다.
	        element_layer.style.width = width + 'px';
	        element_layer.style.height = height + 'px';
	        element_layer.style.border = borderWidth + 'px solid';
	        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
	        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	    }
	</script>
<!-- 우편번호 검색 끝 -->