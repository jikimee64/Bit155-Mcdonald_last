<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<jsp:include page="/WEB-INF/user/common/head.jsp"></jsp:include>
<title>주문하기</title>

</head>
<style>
.show-grid [class^=col-] {
	padding-top: 10px;
	padding-bottom: 10px;
	background-color: #eee;
	background-color: #F3F3F3;
	border: 1px solid #ddd;
	border: 1px solid #FFFFFF;
}
</style>
<body>
	<!-- header include-->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="hamburgermenu">
		<h1 class="titDep1">
			<strong>주문하기</strong>
		</h1>
		<ul style="padding-left: 10%; margin-top: 5%;">
			<li id="topli"><a href="../Mcdonald_main.html">Home</a></li>
			<li id="topli"><a href="../menu/Mcdonald_menu_hamburger.html">Menu</a></li>
		</ul>
	</div>

	<div class="container show-grid">
		<div class="row">
			<div class="col-md-2">공간</div>
			<div class="col-md-10">메뉴 || 버거 & 세트</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<div class="btn-group-vertical" style="width: 99%">
					<button type="button" class="btn btn-warning"
						style="border-bottom: 1px solid darkblue;">일반메뉴</button>
					<button type="button" class="btn btn-warning"
						style="border-top: 1px solid darkblue;">버거 & 세트</button>
					<button type="button" class="btn btn-warning">맥모닝</button>
					<button type="button" class="btn btn-warning">사이드 & 디저트</button>
					<button type="button" class="btn btn-warning"
						style="border-bottom: 1px solid darkblue;">맥카페 & 음료</button>
					<button type="button" class="btn btn-warning"
						style="border-top: 1px solid darkblue;">
						<br>
					</button>

					<br>
					<div style="width: 100%; margin-left: 8px; padding-right: 10px;">
						<!-- 전체보기 라디오버튼 -->
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input"
								id="defaultGroupExample1" name="groupOfDefaultRadios" checked>
							<label class="custom-control-label" for="defaultGroupExample1">전체보기</label>
						</div>

						<hr>
						<!--  -->
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input"
								id="defaultGroupExample2" name="groupOfDefaultRadios"> <label
								class="custom-control-label" for="defaultGroupExample2">낮은
								가격순</label>
						</div>

						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input"
								id="defaultGroupExample3" name="groupOfDefaultRadios"> <label
								class="custom-control-label" for="defaultGroupExample3">높은
								가격순</label>
						</div>

						<hr>
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input"
								id="defaultGroupExample4" name="groupOfDefaultRadios"> <label
								class="custom-control-label" for="defaultGroupExample4">낮은
								칼로리순</label>
						</div>

						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input"
								id="defaultGroupExample5" name="groupOfDefaultRadios"> <label
								class="custom-control-label" for="defaultGroupExample5">높은
								칼로리순</label>
						</div>
					</div>

				</div>
			</div>
			
			
			<div class="col-md-7 _menuList">


	
			</div>


				<div class="col-md-3" style="background-color: whitesmoke;">
					<div class="row" style="place-content: center;">내 주문 정보</div>
					<hr>
					<div class="row">
						&nbsp; &nbsp;배달 주소 : 경기도 하남시 덕풍동
						<!-- 여기에 주소를 받아야댐 -->
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6" style="padding-left: 0px;">
							&nbsp; &nbsp;총 주문합계 :
							<!-- 여기에 총 가격 받아야댐 -->
						</div>
						<div class="col-md-6">
							<p style="color: green">₩ 17,300</p>
						</div>
					</div>
					<p></p>
					<div class="row" style="justify-content: center;">
						<a href="Mcdonald_order2.html" class="btn btn-danger"
							style="width: 85%; background-color: #D1402D; height: 40px;">결제
							진행하기</a>

						<!-- 버튼으로 넘어가야대는거 넣어야댐 -->
					</div>
					<hr>
					<div class="row">
						&nbsp; &nbsp; 주문 세부사항 <br> ----------------------------------
						<br> &nbsp; &nbsp; 동적으로 추가해야댐
						<!-- 동적으로 추가해야댐 대애애앰~~~~!!! -->
					</div>
				</div>
			</div>
		</div>


		<!-- 모달 버튼 누르면 해당 컨텐츠 나오게 해야댐 (6개 필요) -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">

					<div class="card-deck">
						<div class="card-body" style="width: 380px">
							<img class="card-img-top _productImage"
								src=""
								alt="" style="background-color: #ffffffab;">
							<div class="card-body" id="card-inner"
								style="background-color: #f6f6f6;">
								<strong class="_productName">허니sssss</strong>
								<div class="row">
									<div class="col-6"
										style="padding: 5px; border: aliceblue; align-self: center;">
										<div class="input-group">
											<span class="input-group-btn">
												<button type="button" class="btn btn-danger btn-number"
													data-type="minus" data-field="quant[2]"
													style="height: 45px;">
													<p style="margin: 0">-</p>
												</button>
											</span> <input type="text" name="quant[2]"
												class="form-control input-number" value="10" min="1"
												max="100" style="height: auto"> <span
												class="input-group-btn">
												<button type="button" class="btn btn-success btn-number"
													data-type="plus" data-field="quant[2]"
													style="height: 45px;">
													<p style="margin: 0">+</p>
												</button>
											</span>
										</div>

									</div>
									<div class="col-6"
										style="border: aliceblue; align-self: center;">
										<div class="row">
											<div class="col-6">
												<img class="card-img-top _productImage"
													src=""
													alt="">
											</div>
											<div class="col-6" style="place-self: center; margin: 0">

												<p style="margin: 0" class="_productKind">단품sss</p>
													<div class="_productPrice2"></div>
												<!-- 여기에 가격 동적으로 추가 -->
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-6"
										style="padding: 5px; border: aliceblue; align-self: center;">


										<div class="input-group">
											<span class="input-group-btn">
												<button type="button" class="btn btn-danger btn-number"
													data-type="minus" data-field="quant[2]"
													style="height: 45px;">
													<p style="margin: 0">-</p>
												</button>
											</span> <input type="text" name="quant[2]"
												class="form-control input-number" value="10" min="1"
												max="100" style="height: auto"> <span
												class="input-group-btn">
												<button type="button" class="btn btn-success btn-number"
													data-type="plus" data-field="quant[2]"
													style="height: 45px;">
													<p style="margin: 0">+</p>
												</button>
											</span>
										</div>



									</div>
									<div class="col-6"
										style="border: aliceblue; align-self: center;">
										<div class="row">
											<div class="col-6">
												<img class="card-img-top _productImage2"
													src=""
													alt="">
											</div>
											<div class="col-6" style="place-self: center;">
												<p style="margin: 0" class="_productKind2">세트ssss</p>
												<div class="_productPrice3"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="justify-content: left;">

						<button type="button" class="btn btn-warning"
							style="background-color: rgba(255, 217, 0, 0.87); border: 2px solid rgb(255, 0, 0); height: 40px;">추가하기</button>
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
</body>

<!--css-->
<link rel="stylesheet" href="../assets/css/common.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<!--font-->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@700&display=swap"
	rel="stylesheet">

<!--Jquery, Popper.js, Bootstrap Js-->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script>
    ///  url에 추가할 수 있게 해준다
	function getUrlParams() {
		var params = {};
		window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str,
				key, value) {
			params[key] = value;
		});
		return params;
	}
    
    //페이지 로딩후 시작됨
	$(document).ready(function() {

		var params = getUrlParams();

		console.log(params);
		console.log("params = " + params);
		loadOrderPageListAjax(params.product_category);

	});
	/////////////////////
	
	//주문 페이지 처음왔을때 버거&세트만
	function loadOrderPageListAjax(product_category) {
	
		$.ajax({
			type : "get",
			url : "OrderPageBurger.ua",
			data : {
				product_category : decodeURIComponent(product_category)
			},
			success : function(response) {

				
					$.each(response, function (index, item) {
						if(response[index].product_kind === '단품'){
							let start = $("._menuList");
							//////////////////////////
							let firstlist = <div class="row">
							<div class="col" style="height: 350px;">
							<div class="card-deck">
								<div class="card-body" style="width: 380px">
									<img class="card-img-top _productImage" src="" alt=""
										style="background-color: #f6f6f6;">
									<div class="card-body" id="card-inner"
										style="background-color: #f6f6f6;">
										<strong class="ko _productName">response[index].product_name</strong>
										<!-- 동적 추가 -->
										<div class="row">
											<div class="col-6" style="padding: 5px; border: aliceblue;">
												<div class="_productPrice">가격 ₩ 5,100</div>
												<div class="_productCalorie">554Kcal</div>

											</div>
											<div class="col-6" style="border: aliceblue;">
												<button type="button" class="btn btn-warning btn-lg"
													data-toggle="modal" data-target="#myModal"
													style="width: 100%; height: 50px; border: 2px solid red;">
													추가</button>
												<!-- 이건 모달 버튼 -->

											</div>
										</div>

									</div>

								</div>
							</div>
						</div>
					</div>;
								
								
								
								
								
								
								
								
								
								
								
								
								
							
							if(index % 2 === 0){
								start.append(`<div class="row">`);
						
								
							} else if(index % 2 === 1){
								start.append(`<div class="col" style="height: 350px;">`);
								start.append(`<div class="card-deck">`);
								start.append(`<div class="card-body" style="width: 380px">`);
								start.append(`<img class="card-img-top _productImage" src="" alt=""style="background-color: #f6f6f6;">`);
								start.append(`<div class="card-body" id="card-inner"style="background-color: #f6f6f6;">`);
								start.append(`<strong class="ko _productName">response[index].product_name</strong>`);
								start.append(`<div class="row">`);
								start.append(`<div class="col-6" style="padding: 5px; border: aliceblue;">`);
								start.append(`<div class="_productPrice">가격 ₩ 5,100</div>`);
								start.append(`<div class="_productCalorie">554Kcal</div>`);
								start.append(`</div>`);
								start.append(`<div class="col-6" style="border: aliceblue;">`);
								start.append(`<button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#myModal"style="width: 100%; height: 50px; border: 2px solid red;">추가</button>`);
								start.append(`</div>`);
								start.append(`</div>`);
								start.append(`</div>`);
								start.append(`</div>`);
								start.append(`</div>`);
								start.append(`</div>`);
								start.append(`</div>`);
							} 
						
							
							
						}
					})
					

				
				
				  /* $('._productImage').attr(
						'src',
						"${pageContext.request.contextPath}/usercss/vendors/images/DB_images/"
								+ response[0].product_image); 
				  			

				  $('._productName').text(response[0].product_name);
				  $('._productPrice').text("가격 : ₩" + response[0].product_price);
				  $('._productCalorie').text(response[0].nutrition_code + "Kcal");
 */

				  
				  
				  
					//이건 모달창 안에 ▼▼▼▼////////////////////////////////
				/*   $('._productImage2').attr(
						'src',
						"${pageContext.request.contextPath}/usercss/vendors/images/DB_images/"
								+ response[6].product_image); 	

				  $('._productKind').text(response[0].product_kind);	
				  $('._productKind2').text(response[6].product_kind);		
				  $('._productPrice2').text(" (₩ " + response[0].product_price+ ")");
				  $('._productPrice3').text(" (₩ " + response[6].product_price + ")"); */


					//이건 모달창 안에 ▲▲▲▲////////////////////////////////				
				  
				  
				  
				  
				
				/* console.log("response : " + response);
				
				console.log(response[0].product_image);
				console.log(response[0].product_kind);
				console.log(response[0].product_kind);
				
				console.log(response[1].product_kind);
				
				console.log(response[6].product_kind);  */
				
				
				
				
			},
			
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});

	}
    
    
      var mybutton = document.getElementById("myBtn");
    
      // When the user scrolls down 20px from the top of the document, show the button
      window.onscroll = function () { scrollFunction() };
    
      function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
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
    
      
      //모달 창 띄웠을때 숫자 +- 버튼
      $('.btn-number').click(function (e) {
        e.preventDefault();
    
        fieldName = $(this).attr('data-field');
        type = $(this).attr('data-type');
        var input = $("input[name='" + fieldName + "']");
        var currentVal = parseInt(input.val());
        if (!isNaN(currentVal)) {
          if (type == 'minus') {
    
            if (currentVal > input.attr('min')) {
              input.val(currentVal - 1).change();
            }
            if (parseInt(input.val()) == input.attr('min')) {
              $(this).attr('disabled', true);
            }
    
          } else if (type == 'plus') {
    
            if (currentVal < input.attr('max')) {
              input.val(currentVal + 1).change();
            }
            if (parseInt(input.val()) == input.attr('max')) {
              $(this).attr('disabled', true);
            }
    
          }
        } else {
          input.val(0);
        }
      });
      $('.input-number').focusin(function () {
        $(this).data('oldValue', $(this).val());
      });
      $('.input-number').change(function () {
    
        minValue = parseInt($(this).attr('min'));
        maxValue = parseInt($(this).attr('max'));
        valueCurrent = parseInt($(this).val());
    
        name = $(this).attr('name');
        if (valueCurrent >= minValue) {
          $(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr('disabled')
        } else {
          alert('Sorry, the minimum value was reached');
          $(this).val($(this).data('oldValue'));
        }
        if (valueCurrent <= maxValue) {
          $(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr('disabled')
        } else {
          alert('Sorry, the maximum value was reached');
          $(this).val($(this).data('oldValue'));
        }
    
    
      });
      $(".input-number").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
          // Allow: Ctrl+A
          (e.keyCode == 65 && e.ctrlKey === true) ||
          // Allow: home, end, left, right
          (e.keyCode >= 35 && e.keyCode <= 39)) {
          // let it happen, don't do anything
          return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
          e.preventDefault();
        }
      });
    </script>




</html>