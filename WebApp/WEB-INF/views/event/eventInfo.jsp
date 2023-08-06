<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- viewport 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/occu.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/event.css"
	type="text/css">

<!-- jquery import -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

<!-- bootstrap import -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<!-- java script -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/formGo.js"></script> --%>
<script type="text/javascript">
	function checkNumber(e) {
	  const text = /[^0-9]/g;
	  if (text.test(e.value)) {
	    let strVal = $(e).val().replace(text, "");
	    $(e).val(strVal);
	    return;
	  }

	  if (e.value == "") {
	    let strVal = $(e).val().replace("", "");
	    $(e).val(strVal);
	    return;
	  }
	}

	function checkText(e) {
	  const text = /[^ㄱ-ㅎ^가-힣^ㅏ-ㅣ^a-z^A-Z^0-9^\#\_\ㆍ\ᆢ\(\)\_\-\+\s]/g;
	  if (text.test(e.value)) {
	    let strVal = $(e).val().replace(text, "");
	    $(e).val(strVal);
	    return;
	  } else if (e.value.includes("^")) {
	    let strVal = $(e).val().replace(/\^/g, "");
	    $(e).val(strVal);
	    return;
	  } else if (e.value == "현장수령") {
	    let strVal = $(e).val() + "(판매자)";
	    $(e).val(strVal);
	  }
	}

	$(document).ready(function () {
	  $("#goodsName").on("keyup", function () {
	    $(".limit_length").html("(" + $(this).val().length + " / 100)");

	    if ($(this).val().length > 100) {
	      $(this).val($(this).val().substring(0, 100));
	      $(".limit_length").html("(100 / 100)");
	    }
	  });
	});

</script>

<title>O'CCU event</title>
</head>
<body>
	<div id="wrap">

		<header>
			<div class="container">
				<nav class="main_nav">
					<div class="logo">
						<a href="${pageContext.request.contextPath }/index">
						<img alt="" src="${pageContext.request.contextPath }/assets/images/main_menu/logo.png">
						</a>
					</div>

					<ul>
						<li><a href="${pageContext.request.contextPath }/home">
								<div class="home">
									<img alt="home"
										src="${pageContext.request.contextPath }/assets/images/main_menu/timeline.png">
									<span> HOME </span>
								</div>
						</a></li>
						<li><a href="${pageContext.request.contextPath }/search">
								<div class="search">
									<img alt=""
										src="${pageContext.request.contextPath }/assets/images/main_menu/search.png">
									<span> SEARCH </span>
								</div>
						</a></li>
						<li><a href="${pageContext.request.contextPath }/dm">
								<div class="dm">
									<img alt=""
										src="${pageContext.request.contextPath }/assets/images/main_menu/dm.png">
									<span> CCUCHAT </span>
								</div>
						</a></li>
						<li><a href="${pageContext.request.contextPath }/event">
								<div class="event">
									<img alt=""
										src="${pageContext.request.contextPath }/assets/images/main_menu/event.png">
									<span> EVENT </span>
								</div>
						</a></li>
						<li><a href="${pageContext.request.contextPath }/profile">
								<div class="profile">
									<img alt=""
										src="${pageContext.request.contextPath }/assets/images/main_menu/profile.png">
									<span> PROFILE </span>
								</div>
						</a></li>
						<li><a href="${pageContext.request.contextPath }/settings">
								<div class="settings">
									<img alt=""
										src="${pageContext.request.contextPath }/assets/images/main_menu/settings.png">
									<span> SETTINGS </span>
								</div>
						</a></li>

					</ul>

				</nav>
			</div>
		</header>
		<!-- header -->
		<div class="main">

			<div class="event_container">

				<div class="form_header">
					<a href="${pageContext.request.contextPath }/event">
						<i class="bi bi-backspace-fill"></i>
					</a>
					<span class="form_title">폼 작성하기</span>
					<a class="save">임시 저장</a>
				</div>
				
			
				<div class="components">
					<form name="imgForm" action="${pageContext.request.contextPath }/event/buy" method="post">
						<div class="thumbnailContent">
							<img alt="" src="${pageContext.request.contextPath }/upload/${formData.formPath}">
						</div>
					
					</form>
				</div>
		
			</div>
			
		</div>
		<!-- main -->

		<div class="side_right"></div>
		<!-- side_right -->


	</div>

</body>


<!-- java script (+ajax) -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/formGo.js"></script> --%>


</html>
