<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link href="${pageContext.request.contextPath }/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/guestbook.css" rel="stylesheet" type="text/css">

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
				<h2>방명록</h2>
				<ul>
					<li>일반방명록</li>
					<li>ajax방명록</li>
				</ul>
			</div>
			<!-- //aside -->

			<div id="content">
				
				<div id="content-head" class="clearfix">
					<h3>일반방명록</h3>
					<div id="location">
						<ul>
							<li>홈</li>
							<li>방명록</li>
							<li class="last">일반방명록</li>
						</ul>
					</div>
				</div>
				<!-- //content-head -->

				<div id="guestbook">
					<form id="guestbookForm" >
						<table id="guestAdd">
							<colgroup>
								<col style="width: 70px;">
								<col>
								<col style="width: 70px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th><label class="form-text" for="input-uname">이름</label></th>
									<td><input id="input-uname" type="text" name="name"></td>
									<th><label class="form-text" for="input-pass">패스워드</label></th>
									<td><input id="input-pass"type="password" name="password"></td>
								</tr>
								<tr>
									<td colspan="4"><textarea name="content" cols="72" rows="5"></textarea></td>
								</tr>
								<tr class="button-area">
									<td colspan="4"><button id="btnSubmit" type="submit">json등록</button></td>
								</tr>
								
							</tbody>
							
						</table>
						<!-- //guestWrite -->
					</form>	
					
			
					<button id="btnDataSend" type="button">복잡한데이터 전송</button>
					
					<div id="gbListArea">
						<!-- 리스트출력영역 -->
					</div>
					

				</div>
				<!-- //guestbook -->
			
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
$("#guestbookForm").on("submit", function(event){
	event.preventDefault();  //기존의 폼 형식으로 작동안된다(파라미터로 값을 넘기면 안된다)
	console.log("전송버튼 클릭");
	
	
	let name = $("#input-uname").val();
	let pw = $("#input-pass").val();
	let content = $("[name=content]").val();
	
	let guestbookVo = {
		name: name,
		password: pw,
		content: content
	}
	console.log(guestbookVo);
	
	$.ajax({
		
		url : "${pageContext.request.contextPath }/api/guestbook/add2",		
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(guestbookVo),  //js객체-->json으로 {"name":"황일영", "password":1234, "content":"내용"}

		dataType : "json",
		success : function(jsonResultVo){
			/*성공시 처리해야될 코드 작성*/
			console.log(jsonResultVo);
			
			//name값 꺼내기
			console.log(jsonResultVo.data.name);
			
			//success
			console.log(jsonResultVo.result);
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
	
});

//복잡한 데이터 전송
$("#btnDataSend").on("click", function(){
	console.log("복잡한데이터 전송 버튼 클릭");
	
	let guestbookList = [];
	
	guestbookVo1 ={
		name: "정우성",
		password: "1234",
		content: "정우성다녀감"
	}
	
	guestbookVo2 ={
		name: "이효리",
		password: "1234",
		content: "이효리다녀감"
	}
	
	guestbookVo3 ={
		name: "박명수",
		pw: "1234",
		content: "박명수다녀감"
	}
	
	guestbookList.push(guestbookVo1);
	guestbookList.push(guestbookVo2);
	guestbookList.push(guestbookVo3);
	
	console.log(guestbookList);
	
	$.ajax({
		url : "${pageContext.request.contextPath }/api/guestbook/add3",		
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(guestbookList),  //js객체를 json(문자열) 로 변경한다

		dataType : "json",
		success : function(result){
			/*성공시 처리해야될 코드 작성*/
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});

});




</script>


</html>