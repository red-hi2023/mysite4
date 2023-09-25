<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css">

<!-- js -->
<script src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js" type="text/javascript"> </script>


</head>
<body>
	<div id="wrap">

		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<!-- //header -->
		<!-- //nav -->

		<div id="container" class="clearfix">
			<div id="aside">
				<h2>회원</h2>
				<ul>
					<li>회원정보</li>
					<li>로그인</li>
					<li>회원가입</li>
				</ul>
			</div>
			<!-- //aside -->

			<div id="content">
			
				<div id="content-head">
					<h3>회원가입</h3>
					<div id="location">
						<ul>
							<li>홈</li>
							<li>회원</li>
							<li class="last">회원가입</li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<!-- //content-head -->
	
				<div id="user">
					<div id="joinForm">
						<form id="formJoin" action="${pageContext.request.contextPath}/user/join" method="get">
							<!-- 아이디 -->
							<div class="form-group">
								<label class="form-text" for="input-uid">아이디</label> 
								<input type="text" id="input-uid" name="id" value="" placeholder="아이디를 입력하세요">
								<button type="button" id="btnIdCheck">중복체크</button>
								<p id="checkResult"></p>
							</div>
	
							<!-- 비밀번호 -->
							<div class="form-group">
								<label class="form-text" for="input-pass">패스워드</label> 
								<input type="text" id="input-pass" name="password" value="" placeholder="비밀번호를 입력하세요"	>
							</div>
	
							<!-- 이메일 -->
							<div class="form-group">
								<label class="form-text" for="input-name">이름</label> 
								<input type="text" id="input-name" name="name" value="" placeholder="이름을 입력하세요">
							</div>
	
							<!-- //나이 -->
							<div class="form-group">
								<span class="form-text">성별</span> 
								
								<label for="rdo-male">남</label> 
								<input type="radio" id="rdo-male" name="gender" value="male" > 
								
								<label for="rdo-female">여</label> 
								<input type="radio" id="rdo-female" name="gender" value="female" > 
	
							</div>
	
							<!-- 약관동의 -->
							<div class="form-group">
								<span class="form-text">약관동의</span> 
								
								<input type="checkbox" id="chk-agree"  name="agree" value="yes">
								<label for="chk-agree">서비스 약관에 동의합니다.</label> 
							</div>
							
							<!-- 버튼영역 -->
							<div class="button-area">
								<button type="submit" id="btn-submit">회원가입</button>
							</div>
							
						</form>
					</div>
					<!-- //joinForm -->
				</div>
				<!-- //user -->
			</div>
			<!-- //content  -->
		</div>
		<!-- //container  -->
		
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!-- //footer -->

	</div>
	<!-- //wrap -->

</body>
<script type="text/javascript">
//id중복체크 버튼 클릭했을때
$("#btnIdCheck").on("click", function(){
	console.log("버튼클릭");
	
	let id = $("#input-uid").val();

	$.ajax({
		
		url : "${pageContext.request.contextPath }/user/idCheck",		
		type : "post",
		/* contentType : "application/json", */
		data : {id: id},

		dataType : "json",
		success : function(jsonResult){
			/*성공시 처리해야될 코드 작성*/
			console.log(jsonResult);
			
			if(jsonResult.result=="success"){//정상적인 통신 성공
				if(jsonResult.data == true){
					$("#checkResult").text("사용할수 있는 id입니다.");	
				}else if(jsonResult.data == false){
					$("#checkResult").text("사용할수 없는 id입니다.");
				}else{
					console.log("잘못된 처리");
				}
				
			}else if(jsonResult.result=="fail"){//정상적인 통신X
				console.log("통신오류")
			}
			
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});

});


//회원가입 버튼 클릭할때 (submit버튼은 form에 클릭이벤트)
$("#formJoin").on("submit", function(){
	console.log("회원가입 버튼 클릭");
	
	//id를 입력안했을때
	let id = $("#input-uid").val();
	if(id == "" || id==null){
		alert("아이디를 입력하세요");
		return false;
	}
	
	//패스워드 입력안했을때
	let pw = $("#input-pass").val();
	if(pw =="" || pw==null){
		alert("패스워드를 입력하세요");
		return false;
	}else if(pw.length < 8){
		alert("패스워드를 8글자 이상 입력해주세요");
		return false;
	}
	
	//약관동의
	let agree = $("#chk-agree").is(":checked")
	if(agree==false){
		alert("약관에 동의해 주세요");
		return false;
	}
	
	//submit의 원래전송을 하지 않아야 할때 return false;
	return true;
});


</script>








</html>