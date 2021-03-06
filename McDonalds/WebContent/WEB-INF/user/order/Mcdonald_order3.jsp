<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/WEB-INF/user/common/head.jsp"></jsp:include>


<title>결제수단 선택</title>
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
<jsp:include page="../common/header.jsp"></jsp:include>
	<c:set var="basketlist" value="${requestScope.basketlist}" />
	<c:set var="totalOrderSum" value="${requestScope.totalOrderSum}" />

  <div class="hamburgermenu">
    <h1 class="titDep1-2"><strong>결제수단 선택</strong></h1>
  </div>

	<p></p>


  <div class="container show-grid">
    <div class="row">
      <div class="col-md-12"><b>결제수단을 선택해주세요.</b></div>
    </div>
    <div class="row" style="min-height: 600px; background-color:white;">

      <div class="col-md-9">

        <div class="row" style="background-color: white; margin-left: 2px; margin-right:2px; min-height:50px">
          <div class="col-md-12" style="margin-top:10px; min-height:100px; background-color: linen;">
      
            <h5 style="font-size:small;">온라인 결제</h5>
            <div class="custom-control custom-radio">
             <input type="radio" class="custom-control-input" id="defaultGroupExample1" name="payment_type" value="신용카드">
              <label class="custom-control-label" for="defaultGroupExample1">신용카드</label>
            </div>
          </div>
        </div>

   <hr>

        <div class="row" style="background-color: white; margin-left: 2px; margin-right:2px; min-height:50px">
          <div class="col-md-12" style="margin-top:10px; min-height:100px; background-color: linen;">
          <h5 style="font-size:small;">현장 결제</h5>
            <p></p>
            <div class="custom-control custom-radio">
              <input type="radio" class="custom-control-input" id="defaultGroupExample2" name="payment_type" value="현금">
              <label class="custom-control-label" for="defaultGroupExample2">현금</label>
            </div>
          </div>

				</div>

			</div>

    			<div class="col-md-3" style="background-color: whitesmoke;">
				<div class="row" style="place-content: center;"><b>주문 요약</b></div>
				<hr>
					<div class="row" style="padding-left:0px; padding-right:10px;">
					&nbsp; &nbsp;<b>주소 :</b><h5 style="text-align:right; font-size: medium;"> ${basketlist[0].address}</h5>
					<!-- 여기에 주소를 받아야댐 -->
				</div>
				<hr>
				<div class="row">
					<div class="col-md-12" style="padding-left: 0px;">
						&nbsp; &nbsp;<b>총 주문합계 :</b><p style="color: green; text-align:right;">₩ ${totalOrderSum}</p>
						<!-- 여기에 총 가격 받아야댐 -->
					</div>
				</div>
				
				<div class="row" style="justify-content: center;">
					<!-- 	<a href="Order3.uo" class="btn btn-danger"
						style="width: 85%; background-color: #D1402D; height: 40px;">결제
						진행하기</a> -->
					<button id="payment" class="btn btn-danger"
						style="width: 85%; background-color: #D1402D; height: 40px;">결제
						진행하기</button>
					<!-- 버튼으로 넘어가야대는거 넣어야댐 -->
				</div>
				<p></p>
				<div class="row" style="justify-content: center;">
					<!-- 	<a href="PaymentCancel.ua" class="btn btn-primary"
						style="width: 85%; background-color: #4882b6; height: 40px;">결제
						취소하기</a> -->
					<a href="PaymentCancel.uo" class="btn btn-primary"
						style="width: 85%; background-color: #4882b6; height: 40px;">결제
						취소하기</a>
					<!-- 버튼으로 넘어가야대는거 넣어야댐 -->
				</div>
			</div>



    </div>
  </div>
  <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
<jsp:include page="/WEB-INF/user/common/footer.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/user/common/script.jsp"></jsp:include>

	<!-- JS -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

	<!-- 결제API  -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script>
    $(function(){

    	
    $('#payment').click(function(e){
    	
    	if(!$('input:radio[name=payment_type]').is(':checked')){
			alert('결제방식을 한개이상 선택해주세요.')
			return false;
    	}
    	
    	$.ajax({
			type: 'GET',
			url: 'paymentInfo.ua',
			/* data: {
				product_name: decodeURIComponent(productName)
			}, */
			success: function(response) {

					    	
		        var IMP = window.IMP; // 생략가능
		        IMP.init('imp28448525'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		        var msg;
		        
	    		var st = $(":input:radio[name=payment_type]:checked").val();
	    		if(st === '신용카드'){
	    		      IMP.request_pay({
	    		            pg : 'uplus',
	    		            pay_method : 'card',
	    		            merchant_uid : 'merchant_' + new Date().getTime(),
	    		            name : '맥도날드 결제',
	    		            amount : response[response.length-1],   
	    		            buyer_email : '',
	    		            buyer_name : response[0].b_id,
	    		            //buyer_tel : '010-1234-5678',
	    		            buyer_addr : response[0].address
	    		           /*  buyer_postcode : '123-456', */
	    		            //m_redirect_url : 'http://www.naver.com'
	    		        }, function(rsp) {
	    		            if ( rsp.success ) {
	    		                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    		                jQuery.ajax({
	    		                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	    		                    type: 'POST',
	    		                    dataType: 'json',
	    		                    data: {
	    		                        imp_uid : rsp.imp_uid
	    		                        //기타 필요한 데이터가 있으면 추가 전달
	    		                    }
	    		                }).done(function(data) {
	    		                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		                    if ( everythings_fine ) {
	    		                        msg = '결제가 완료되었습니다.';
	    		                      /*   msg += '\n고유ID : ' + rsp.imp_uid; */
	    		                        msg += '\n지점명 : ' + response[0].s_name;
	    		                        msg += '\결제 금액 : ' + response[response.length-1];
	    		                        /* msg += '카드 승인번호 : ' + rsp.apply_num; */
	    		                        
	    		                        alert(msg);
	    		                    } else {
	    		                        //[3] 아직 제대로 결제가 되지 않았습니다.
	    		                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		                    }
	    		                });
	    		                //성공시 이동할 페이지
	    		                location.href="Order4.uo?payment_method=신용카드&payment_price=" + response[response.length-1] + ""
	    		            } else {
	    		                msg = '결제에 실패하였습니다.';
	    		                msg += '에러내용 : ' + rsp.error_msg;
	    		                //실패시 이동할 페이지
	    		                location.href='Order3.uo';
	    		                alert(msg);
	    		            }
	    		        }); 
	    		}else{ //현금
	    			e.preventDefault();
					location.href = "Order4.uo?payment_method=현금&payment_price=" + response[response.length-1] + "";
	    			
	    			
	    		}
				
				
			},
			  error:function(request,status,error){
			        consolle.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }

		});
    
  
    		
    	});
    	
    

        
    });
    </script>

 <script
		src="${pageContext.request.contextPath}/usercss/assets/js/weather.js"></script> 


	<script>

	
	
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

$(document).ready(function(){
 
 // 라디오버튼 클릭시 이벤트 발생
 $("input:radio[name=groupOfDefaultRadios]").click(function(){

           if($("input[name=groupOfDefaultRadios]:checked").val() == "1"){
            //  alert('신용카드 결제창 띄우기');
            $("a[name=paypay]").attr("href","#");
            // https://sseung-fire.tistory.com/24 여기 참고해야됨

            //  $("input:text[name=text]").attr("disabled",false);
         // radio 버튼의 value 값이 1이라면 활성화

     }else if($("input[name=groupOfDefaultRadios]:checked").val() == "0"){
          $("a[name=paypay]").attr("href","Mcdonald_order4.html");
            //  $("input:text[name=text]").attr("disabled",true);
         // radio 버튼의 value 값이 0이라면 비활성화
     }
 });
});

</script>
</body>

</html>