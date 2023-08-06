<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- viewport 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/occu.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/event.css" type="text/css">

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
					<a href="${pageContext.request.contextPath }/event"><i class="bi bi-backspace-fill"></i></a> 
					<span class="form_title">폼 작성하기</span>
					<a class="save">임시 저장</a>
				</div>

				<div class="form_content">

					<%-- <form action="${pageContext.request.contextPath }/event"
						method="post" enctype="multipart/form-data"> --%>

						<div class="upload_detail">
							<label class="detail_upload" for="chooseFile"> ✔️ 판매 상세 정보 이미지 업로드 ✔️ </label>
							<div class="fileInput">
								<p>업로드한 파일 이름 :</p>
								<a id="fileName"></a>
							</div>
							<input type="file" id="chooseFile" name="chooseFile"
								accept="image/*" onchange="loadFile(this)">
						</div>

						<div class="upload_title space text">
							<div class="title">
								<div class="ttl_text text">
									폼 제목
								</div>
							</div>
							<div>
								<input class="form_input" id="formTitle" type="text" placeholder="폼 제목을 입력하세요" name="form_title">
							</div>
						</div>

						<div class="upload_genre space text">
							<div class="title">
								<div class="ttl_text text">
									어떤 장르의 상품을 판매하시나요?
								</div>
							</div>
							<div>
								<select class="form_input" name="genre" id="formGenre">
									<option>장르를 선택하세요.</option>
									<option>창작캐릭터</option>
									<option>창작공예/문구</option>
									<option>인형/인형소품</option>
									<option>순수창작</option>
									<option>패션/액세서리</option>
									<option>아이돌/스타</option>
									<option>만화/애니/웹소설</option>
									<option>베이커리</option>
								</select>
							</div>
						</div>

						<div class="upload_banking space text">
							<div class="title">
								<div class="ttl_text text">
									계좌 정보
								</div>
							</div>
							<div>
								<select class="form_input" name="beneficiary" id="formBanking">
									<option value="">입금받을 계좌 정보를 선택해주세요.</option>
									<option value="1">DB에서 가져오는 유저 계좌</option>
									<option value="2">새로운 계좌 추가하기</option>
								</select>
							</div>
						</div>

						<div class="upload_duration space text">
							<div class="title">
								<div class="ttl_text text">
									판매 기간
								</div>
							</div>
							<div style="display:flex;margin-top:10px;">
								<div class="sale_duration">
									<p class="subtxt">폼 시작일</p>
									<div class="flex_row">
										<input type="date" id="startDate" name="datetime">
										<input type="time" id="startTime">
									</div>
								</div>
								<div class="sale_duration">
									<p class="subtxt">폼 종료일</p>
									<div class="flex_row">
										<input type="date" id="endDate" name="datetime">
										<input type="time" id="endTime">
									</div>
								</div>
							</div>
							<br>
							<input type="checkbox" id="for_sale" name="상시판매">
							<label for="for_sale">상시 판매</label>
						</div>

						<div class="upload_overview space text">
							<div class="title">
								<div class="ttl_text text">
									상세 설명
								</div>
							</div>
							<div>
								<textarea class="form_input" name="overview" rows="5" placeholder="내용을 작성해주세요."></textarea>
							</div>
						</div>

						<div class="upload_tag space text">
							<div class="title">
								<div class="ttl_text text">
									해시태그 입력
								</div>
							</div>
							<div>
								<ul id="tag-list">
								</ul>
								<input class="form_input" type="text" id="tag" size="20" placeholder="#태그 입력하기">
							</div>
						</div>

						<div class="upload_overview space text">
							<div class="title">
								<div class="ttl_text">
									<span>상품정보 입력</span>
									<span class="subtxt">재고를 제외한 상품 정보는 구매 발생 전까지만 수정 가능합니다.</span>
								</div>
							</div>
							<div class="boxing">
								<div>
									<span class="col-md-2">상품명</span>
									<input class="col-md-10" type="text" placeholder="상품명을 입력해주세요"> <br> 
								</div>
								<div>
									<span class="col-md-2">가격&nbsp;&nbsp;&nbsp;</span>
									<input class="col-md-10" type="text" placeholder="가격을 입력해주세요"> <br>
								</div>
								<div>
									<span class="col-md-2">재고&nbsp;&nbsp;&nbsp;</span>
									<input class="col-md-10" type="text" placeholder="최대 100,000개">
								</div>
								<div>
									<span>구매개수 제한</span>
									<input type="checkbox" name="limit" value="limit">
									<input type="text" name="limit" value="" placeholder="0000개">
								</div>
							</div>
							<button>상품등록</button>
						</div>

						<div class="upload_delivery space text">
				            <div class="title">
							    배송방법 입력
							</div>
							<div class="subtxt">
							    배송방법 수정은 구매 발생 전 까지만 가능합니다.
							    <p style="color: #FF6160;">*현장수령 거래는 원활한 정산을 위해 QR코드를 통한 수령완료를 꼭 확인해주세요</p>
							</div>
							<div class="qr_con">
							    <input id="qrCodeCheck" type="checkbox" onchange="qrCodeCheck()">
							    <label for="qrCodeCheck">현장수령</label>
							</div>
							<div class="flex_column">
							    <div class="deliveryNotice">
							        <div name="temp" id="input_cell">
							            <div>
							                <input class="name" type="text" placeholder="배송방법">
							                <input class="price" type="number" placeholder="배송비">
							                <input class="delivery_idx" type="hidden" value="">
							            </div>
							        </div>
							        <button class="btn" onclick="deliveryAdd()">배송방법 등록</button>
							    </div>
							    <div class="border"></div>
							    <ul class="deliveryList" id="deliveryList">
					                <li name="deliveryArray" id="deliveryQrCode" class="deliveryQrCode display-none">
						                <div>
						                    <input class="name" type="text" value="" disabled="">
						                    <input class="price" type="number" value="" disabled="">
						                    <input class="delivery_idx" type="hidden" value="">
						                </div>
						            </li>       
							    </ul>    
							</div>
						</div>
						<div class="upload_delvdate space text">
							<div class="title">
								<div class="ttl_text">
									배송 예정일
								</div>
							</div>
							<div>
								<input type="date">
							</div>
						</div>
						<div class="upload_delvnotice space text">
							<div class="title">
								<div class="ttl_text">
									배송 안내
								</div>
							</div>
							<div>
								<input class="form_input" type="text" placeholder="배송에 대한 안내가 필요할 경우 작성해 주세요">
							</div>
						</div>

						<div class="upload_question space text">
							<div class="title">
								<div class="ttl_text">
									추가 질문 받기
								</div>
								<div class="check">
									<input type="checkbox" class="onoff" id="questionOpen" style="display: none;" onchange="questCheck()">
									<label for="questionOpen">
										<span></span>
									</label>
									<span></span>
								</div>
							</div>
							<div class="con display-none">
								<div class="questionCheck">
									<input type="checkbox" id="questionCheck">
									<label for="questionCheck">필수로 답변 받기</label>
								</div>
								<ul id="questionList" class="questionList display-none">
								</ul>

								<div class="add_con">
									<input id="questionText" type="text" placeholder="새로운 질문을 입력해 주세요">
									<button onclick="questAdd()">
										<img class="add_icon" src="https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/add_icon.webp">
										질문 등록
									</button>
								</div>
							</div>
						</div>
						
						<div class="upload_transfer space text">
							<div class="title">
								<div class="ttl_text">
									양도 허용
								</div>
								<div class="check">
									<input type="checkbox" class="onoff" id="transferOpen" style="display: none;">
									<label for="transferOpen">
										<span></span>
									</label>
									<span></span>
								</div>
							</div>
						</div>
						
						<div class="upload_addSetting space">
							<div class="title">
								<div class="ttl_text subtxt">
									판매 기간
								</div>
							</div>
							<div>
								<input type="checkbox" id="dlvaddressCheck" checked>
								<label for="dlvaddressCheck">구매자 배송지 받기</label>
								<span class="subtxt">현장수령 제외</span>
							</div>
							<div>
								<input type="checkbox" id="refundCheck" checked>
								<label for="refundCheck">환불계좌 받기</label>
							</div>
							<div>
								<input type="checkbox" id="noneMemberCheck">
								<label for="noneMemberCheck">회원만 참여</label>
							</div>
							<div>
								<input type="checkbox" id="pccCheck">
								<label for="pccCheck">개인통관고유번호 받기</label>
							</div>
						</div>
						
						<div class="upload_userAccount space text">
							<div class="title">
								<div class="ttl_text subtxt">
									구매자 계정 받기
								</div>
							</div>
							<div class="text">
								<input type="checkbox" id="accountCheck">
								<label for="accountCheck">구매자 occu 계정</label>
							</div>
						</div>
						
						<div class="upload_limitAge space">
							<div class="title">
							    <div class="ttl_text text">
							        나이 제한 서비스
							    </div>
						        <div class="check">
									<input type="checkbox" class="onoff" id="limitAgeOpen" style="display:none;" onchange="limitAgeCheck()">
									<label for="limitAgeOpen">
										<span></span>
									</label>
									<span></span>
								</div>
							</div>
							<ul class="notice_text display-none subtxt">
							    <li>후불제 유료 서비스로 폼 참여 1건당 30WP의 이용료가 부과됩니다</li>
							    <li>최초 폼 생성 후 on/off 수정 불가합니다</li>
							</ul>
							<ul class="con display-none">
							    <li>
							        <input type="radio" name="limitAgeRadio" id="limitAge19" value="19" checked>
							        <label for="limitAge19">만 <span>19세</span> 이상 참여 가능</label>
							    </li>
							    <li>
							        <input type="radio" name="limitAgeRadio" id="limitAge14" value="14">
							        <label for="limitAge14">만 <span>15세</span> 이상 참여 가능</label>
							    </li>
							</ul>
						</div>
						
						<div class="upload_secretForm space">
				            <div class="title">
							    <div class="ttl_text text">
							        시크릿폼
							        <div class="caption_con">
							            <span class="display-none">판매자가 사전에 설정한<br>비밀번호를 입력해야 구매자가<br>폼에 접근할 수 있습니다</span>
							        </div>
							    </div>
							    <div class="check">
							        <input type="checkbox" class="onoff" id="secretFormOpen" style="display: none;" onchange="secretFormCheck()">
							        <label for="secretFormOpen"><span></span></label>
							        <span></span>
							    </div>
							</div>
							<ul class="con display-none">
							    <li>
							        <div class="subtxt">비밀번호 설정</div>
							        <input id="secretFormPassword" type="text" placeholder="시크릿폼 비밀번호를 설정해주세요" value="">
							    </li>
							    <li>
							        <div class="subtxt">비밀번호 힌트 설정</div>
							        <input id="secretFormPasswordHint" type="text" placeholder="비밀번호에 대한 힌트를 설정해주세요" value="">
							    </li>
							</ul>
						</div>
						
						<div class="upload_letter space">
				            <div class="title">
							    Thanks Letter
							</div>
							<ul class="con">
							    <li class="title">구매자분들께 전하는 감사 메시지를 사진과 함께 작성해보세요 :)</li>
							    <li class="file">
					                <span class="thanksLetterTitle subtxt">360x360 사이즈로 업로드 해주세요</span>
						            <div>
							            <input id="thanksLetterUpload" type="file" accept="image/*" onchange="thanksLetterBase64();">
							            <label for="thanksLetterUpload" id="thanksLetterUploadText">업로드</label>
							            <button id="thanksLetterDeleteButton" class="thanksLetterDeleteButton" onclick="thanksLetterDelete()" style="display: none;">삭제</button>
				                        <input type="hidden" id="thanksLetterDeleteCheck" value="1">
							            <input type="hidden" id="letter_image_s3" name="letter_image_s3" value="">
							            <input type="hidden" id="letter_image_temp" name="letter_image_temp" value="">
							        </div>
							    </li>
							    <li class="text">
							        <textarea id="thanksLetterMessage" placeholder="감사 인사를 적어 주세요" rows="4" style="width:100%;"></textarea>
							    </li>
							</ul>
						</div>
						
						<div class="upload_comply space">
							<div class="title">
							    판매자 준수사항 동의서
							</div>
							<ul>
							    <li style="padding:0;">
									<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="width:100%;">
										내용보기
									</button>
							    </li>
							    <li style="text-align:right;" class="subtxt">
							        <input type="checkbox" id="sellerCheck">
							        <label for="sellerCheck">판매자 준수사항을 확인하였고, 동의합니다.</label>
							    </li>
							</ul>
							
							<div class="modalSellerAgree modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body con">
							        <ul>
										<li><span>1</span> <div>설정한 상품 배송 예정일을 지켜주세요.</div></li>
										<li><span>2</span> <div>배송이 지연된다면 구매자에게 꼭 안내를 해야해요.</div></li>
										<li><span>3</span> <div>구매자와의 연락 수단은 윗치폼 메시지를 필수로 사용해 주세요.</div></li>
										<li><span>4</span> <div>구매자의 개인정보는 마케팅 등의 다른 목적으로 사용할 수 없어요.</div></li>
										<li><span>5</span> <div>개인정보는 배송/반품/환불 또는 고객 상담이 완료되는 즉시 삭제해 주세요.</div></li>
							        </ul>
									<div class="con_box">
										위 사항을 성실히 이행하지 않을 시,<br>
										관련 법에 의거하여 법적인 조치를 받을 수 있음을 인지하였습니다.
									</div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn" data-bs-dismiss="modal">Close</button>
							      </div>
							    </div>
							  </div>
							</div>
							
						</div>
						
						
						<div class="upload_button">
				            <div class="con">
						        <button id="formButton" class="save">폼만들기</button>
						    </div>
				        </div>
												
						
					<!-- </form> -->


				</div>
				
			</div>

		</div>
		<!-- main -->
		
		<div class="side_right"></div>
		<!-- side_right -->


	</div>

</body>

<!-- jquery import -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

<!-- bootstrap import -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- java script (+ajax) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/formGo.js"></script>



</html>
