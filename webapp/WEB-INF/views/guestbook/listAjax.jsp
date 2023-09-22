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
					<form action="" method="">
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
									<td colspan="4"><button type="submit">등록</button></td>
								</tr>
							</tbody>
							
						</table>
						<!-- //guestWrite -->
					
					</form>	
					
					
					<!-- <button id="btnGetData">데이터가져오기</button> -->
					
					<div id="gbListArea">
					
					</div>
					
					<%-- 
						<table class="guestRead">
							<colgroup>
								<col style="width: 10%;">
								<col style="width: 40%;">
								<col style="width: 40%;">
								<col style="width: 10%;">
							</colgroup>
							<tr>
								<td>1</td>
								<td>정우성</td>
								<td>2022-02-02</td>
								<td><a href="">[삭제]</a></td>
							</tr>
							<tr>
								<td colspan=4 class="text-left">정우성 다녀갑니다</td>
							</tr>
						</table>
						<!-- //guestRead -->
				   --%>

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
//DOM이 완성되었을때 --> 그리기 직전
$(document).ready(function(){
	console.log("ready()");
	fetchList(); 
	console.log("ready()요청후");
});

//화면을 그리고 난후
$(window).load(function(){
	console.log("load()");
//	fetchList();

	console.log("load()요청후");
});


//임시버튼을 클릭했을때
$("#btnGetData").on("click", function(){
	console.log("버튼클릭");
	
	//fetchList(); //ajax통신을 이용해서 데이타를 요청하고 + 그린다(render())
	
});
	
	
//ajax통신을 이용해서 데이타를 요청하고 + 그린다(render())
function fetchList(){
	
	//서버로 부터 방명록 데이타만 받고 싶다 ajax요청
	$.ajax({
		url : "${pageContext.request.contextPath }/api/guestbook/list",		
		type : "get",
		/* contentType : "application/json", */
		/* data : {name: "홍길동"}, */
		
		dataType : "json",
		success : function(guestbookList){
			/*성공시 처리해야될 코드 작성*/
			//리스트받기
			console.log(guestbookList);
			
			for(let i=0; i<guestbookList.length; i++){
				render(guestbookList[i]); //그리기	
			}
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});

}
	
	
//방명록 내용을 1개씩 그린다
function render(guestbookVo){
	
	let str ='';
	str +='<table class="guestRead">';
	str +='    <colgroup>';
	str +='        <col style="width: 10%;">';
	str +='        <col style="width: 40%;">';
	str +='        <col style="width: 40%;">';
	str +='        <col style="width: 10%;">';
	str +='    </colgroup>';
	str +='    <tr>';
	str +='        <td>' + guestbookVo.no + '</td>';
	str +='        <td>' + guestbookVo.name + '</td>';
	str +='        <td>' + guestbookVo.regDate + '</td>';
	str +='        <td><a href="">[삭제]</a></td>';
	str +='    </tr>';
	str +='    <tr>';
	str +='        <td colspan=4 class="text-left">' + guestbookVo.content + '</td>';
	str +='    </tr>';
	str +='</table>';
	
	console.log("그린다");
	$("#gbListArea").prepend(str);
}
	

</script>


</html>