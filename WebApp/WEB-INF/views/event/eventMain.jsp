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
	href="${pageContext.request.contextPath }/assets/css/occu.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/event.css"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<title>O'CCU event</title>
</head>
<body>
	<div id="wrap">

		<header>
			<div class="container">
				<nav class="main_nav">
					<div class="logo">
						<a href="${pageContext.request.contextPath }/index"> <img
							alt=""
							src="${pageContext.request.contextPath }/assets/images/main_menu/logo.png">
						</a>
					</div>


					<ul>
						<li><a href="${pageContext.request.contextPath }/index">
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
					<a href="${pageContext.request.contextPath }/index"><i class="bi bi-backspace-fill"></i></a>
					<span class="form_title">이벤트 계정</span>
					<a href="${pageContext.request.contextPath}/event/form" class="save">폼 등록하기</a>
				</div>
				<p class="month"></p>
				<div class="seller_list">
					<div class="seller_info">
						<a class="seller_img"><img alt="" src=""></a> 
						<span class="seller_name"></span>
						<span class="seller_type"></span>
					</div>
					<div class="seller_posts">
						<a class="selling_post"></a> <a class="selling_post"></a>
					</div>
				</div>
			</div>

		</div>
		<!-- main -->
		<div class="side_right"></div>
		<!-- side_right -->


	</div>

</body>
</html>