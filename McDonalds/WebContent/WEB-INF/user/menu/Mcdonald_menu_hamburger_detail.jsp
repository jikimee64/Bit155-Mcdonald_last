<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/WEB-INF/user/common/head.jsp"></jsp:include>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>메뉴 디테일</title>

</head>

<body>
	<!-- header include-->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="hamburgermenu">
		<h1 class="titDep1">
			<strong>상세 메뉴</strong>
		</h1>
		<p class="subCopy">
			빅맥<sub class="reg">®</sub>에서 맥스파이시<sub class="reg">®</sub> 상하이버거까지, <br>주문
			즉시 바로 조리해 더욱 맛있는, 맥도날드의 다양한 버거를 소개합니다.
		</p>
		<ul style="padding-left: 10%; padding-top: 1%">
			<li id="topli"><a href="../Mcdonald_main.html">Home</a></li>
			<li id="topli"><a href="../menu/Mcdonald_menu_hamburger.html">Menu</a></li>
		</ul>
	</div>
	<div class="contArea" wfd-id="32">
		<div class="inner" wfd-id="33">
			<div class="menuView" wfd-id="34">
				<div class="viewTop" wfd-id="40">
					<div class="name" wfd-id="47"></div>
					<div class="info" data-title="허니 크림치즈 상하이 버거(버거)" data-desc="버거 메뉴"
						wfd-id="41">
						<div class="visual" wfd-id="46" style="text-align: center;">
							<img src="" class="_detailImage" alt="허니 크림치즈 상하이 버거">
						</div>
					</div>
				</div>
				<div style="text-align: -webkit-center;">
					<div class="panel panel-warning" style="width: 1000px;">
						<h4 class="panel-heading" id="ppanel">영양정보</h4>
						<div class="panel-body" id="ppanellist">
							<table class="table   table-bordered">
								<colgroup>
									<col style="width: 15%">
									<col>
								</colgroup>
								<thead>
									<!--아래 데이터 넣기-->
									<tr>
										<th scope="row">영양소</th>
										<th scope="col">중량(g)</th>
										<th scope="col">열량</th>
										<th scope="col">당</th>
										<th scope="col">단백질</th>
										<th scope="col">포화지방</th>
										<th scope="col">나트륨</th>
										<th scope="col">카페인</th>

									</tr>
								</thead>
								<tbody>
									<tr class="_nutritionList">
										<td scope="row">함량</td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>

				</div>

				<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
			</div>
			<br> <br> <br>
		</div>
	</div>
	<!-- //contArea -->
	<!-- <form id="searchForm" method="post" wfd-id="31">
                <input type="hidden" name="page" id="page" value="1" wfd-id="74">
                <input type="hidden" name="seq" id="seq" wfd-id="73">
                <input type="hidden" name="sub_category_seq" id="sub_category_seq" value="1" wfd-id="72">
            </form> -->


	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

</body>

<jsp:include page="/WEB-INF/user/common/footer.jsp"></jsp:include>

<jsp:include page="/WEB-INF/user/common/script.jsp"></jsp:include>

<script
	src="${pageContext.request.contextPath}/usercss/assets/js/weather.js"></script>

<script>
	function getUrlParams() {
		var params = {};
		window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str,
				key, value) {
			params[key] = value;
		});
		return params;
	}
	$(document).ready(function() {
		$('#ppanellist').addClass('closePanel');

		var params = getUrlParams();
		ppanelClick();

		loadProductDetailAjax(params.product_code);

	});

	function loadProductDetailAjax(product_code) {
		$.ajax({
			type : "get",
			url : "UserMenuDetail.ua",
			data : {
				product_code : product_code
			},
			success : function(response) {

				console.log(response[0].nutritionDto.weight);

				$('._detailImage').attr(
						'src',
						"${pageContext.request.contextPath}/usercss/vendors/images/DB_detail_images/"
								+ response[0].productDto.product_image);
				var $nutritionList = $('._nutritionList');
				$nutritionList.append('<td>' + response[0].nutritionDto.weight
						+ 'g</td>');
				$nutritionList.append('<td>' + response[0].nutritionDto.calorie
						+ 'kcal</td>');
				$nutritionList.append('<td>' + response[0].nutritionDto.sugar
						+ 'g</td>');
				$nutritionList.append('<td>' + response[0].nutritionDto.protein
						+ 'g</td>');
				$nutritionList.append('<td>' + response[0].nutritionDto.fat
						+ 'mg</td>');
				$nutritionList.append('<td>' + response[0].nutritionDto.natrium
						+ 'mg</td>');
				$nutritionList.append('<td>'
						+ response[0].nutritionDto.caffeine + 'mg</td>');

				// '<td>' + response.nutritionWeight + 'g </td>' 이렇게 방식도있음

			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}

		});

	}

	function ppanelClick() {
		$('#ppanel').click(function(evt) {
			evt.preventDefault();

			var $ppanelList = $('#ppanellist');

			if ($ppanelList.hasClass('openPanel')) {
				$ppanelList.removeClass('openPanel');
				$ppanelList.addClass('closePanel');
			} else {
				$ppanelList.removeClass('closePanel');
				$ppanelList.addClass('openPanel');
			}
		});
	}
	function goDetail(seq) {
		$("#seq").val(seq);
		$("#searchForm").attr("action", "/kor/menu/detail.do");
		$("#searchForm").submit();
	}
	function showSize(seq) {
		$("#seq").val(seq);
		$("#searchForm").attr("action", "/kor/menu/size.do");
		$("#searchForm").submit();
	}
	function openMaterial(seq) {
		$.post("/kor/common/materialPop.do", {
			seq : seq,
		}, function(data) {
			if (data.is_ok == "ok") {
				$("#materialPopCon").html(getMaterial(data.material));
				altEscapeTag();
				commonJs.popup.basic.show($('#materialPop'));
			} else {
				alert("재료정보 가져오기에 실패하였습니다\관리자에게 문의하세요");
			}
		}

		);
	}
	function getMaterial(data) {
		return makeHtml("materialPopText", data);
	}
</script>

</html>