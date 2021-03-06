<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<jsp:include page="/WEB-INF/user/common/head.jsp"></jsp:include>


<title>자유게시판</title>
</head>



	<!-- header include-->
	<jsp:include page="../common/header.jsp"></jsp:include>
<body>
	<div class="board_notice_detail">
		<h1 class="titDep1" style="padding-top: 3%; color: white;">
			<strong>자유게시판 글쓰기</strong>
		</h1>
		<ul style="padding-left: 10%; margin-top: 5%;">
			<li id="topli"><a href="../Mcdonald_main.html"
				style="color: white;">Home</a></li>
			<li id="topli"><a href="../menu/Mcdonald_menu_hamburger.html"
				style="color: white;">menu</a></li>
		</ul>
	</div>
	<!-- //visualArea -->


	<div class="container" style="padding-top: 2%; padding-right: 2%;">

		<form method="post" action="BoardFreeRegister.b"
			enctype="multipart/form-data">
			<div class="row mb-4">
				<div class="col-8">

					<input type="file" id="fileName" name="fileName"
						class="custom-file-input" accept="image/*"> <label
						class="custom-file-label" for="fileName"> 파일을 선택해주세요. </label>
				</div>
			</div>

			<div class="row mb-4">
				<div class="input-group ">
					<input type="text" name="title" id="title"
						class="form-control mb-4" placeholder="글제목"
						aria-label="Recipient's username" aria-describedby="button-addon2">
					<div class="input-group-append"></div>
				</div>
			</div>

			<textarea rows="10" cols="50" id="content" name="content" class="form-control"></textarea>


			<div class="row mb-4 d-flex justify-content-center">
				<div style="margin-left: 100px; margin: 50px 50px">
					<button type="submit" class="btn btn-danger mr-3 btn-lg">글등록</button>
				</div>
			</div>

		</form>



	</div>
	<!-- //container  -->
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	<jsp:include page="/WEB-INF/user/common/footer.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/user/common/script.jsp"></jsp:include>

	<script
		src="${pageContext.request.contextPath}/usercss/vendors/vendors/summernote/summernote-lite.js"></script>
	<script
		src="${pageContext.request.contextPath}/usercss/vendors/vendors/summernote/lang/summernote-ko-KR.js"></script>

	<script
		src="${pageContext.request.contextPath}/usercss/assets/js/weather.js"></script>

<!-- 	<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script> -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/usercss/vendors/vendors/ckeditor/ckeditor.js"></script>
	
	
	<script>
		$(function() {
			// Add the following code if you want the name of the file appear on select
			$(".custom-file-input").on(
					"change",
					function() {
						var fileName = $(this).val().split("\\").pop();
						$(this).siblings(".custom-file-label").addClass(
								"selected").html(fileName);
					});

			
			
			//여기부터 연규가 ▼▼▼▼▼
			
			$('button[type=submit]').click(function(evt) {
				
				if($('#title').val() === ""){
					evt.preventDefault();
					alert("제목을 입력해주세요");
					$('#title').focus();
					$('button[type=submit]').unbind();
				}else if($('#title').val() != ""){
					$('button[type=submit]').unbind();
				}
			
			});
			
			
			
			
			//여기까지  연규가 ▲▲▲▲▲
		});
	</script>

	<script>
		//Get the button
		var mybutton = document.getElementById("myBtn");
		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {
			scrollFunction()
		};
		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				mybutton.style.display = "block";
			} else {
				mybutton.style.display = "none";
			}
		}
		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
	</script>

	<script>
	CKEDITOR.replace('content', {
		
		width:'100%',
		height:'350'
			
	});

	</script>
	


</body>

</html>