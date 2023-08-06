<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

<!-- bootstrap import -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
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

				<div class="components">
					<form name="imgForm" action="${pageContext.request.contextPath }/event/info" method="post" enctype="multipart/form-data">
					
						<div class="thumbnailComponent">
							<input class="form-control" type="file" id="thumbnail"
								name="formFile" accept="image/*" style="display: none;">
							<label class="thumbnail_before" id="thumbnail_img"
								for="thumbnail" style="width: 100%; position: relative;">
								<div class="icon">썸네일 이미지 등록</div>
							</label>
						
							<script>
							    var sel_files = [];
							    
							    $(document).ready(function() {
							    	//이미지 메소드 실행
							        $("#thumbnail").on("change", handleImgsFilesSelect);
							    }); 
								
							 	// 이미지 변경
							    function handleImgsFilesSelect(e) {
							        var files = e.target.files;
							        var filesArr = Array.prototype.slice.call(files);
							
							        filesArr.forEach(function(f) {
							            var ext = $('#thumbnail').val().split('.').pop().toLowerCase();
							            if(ext=='gif') {
							                alert('gif 파일은 업로드 할 수 없습니다.');
							                return;
							            }
							            if(ext=='heic') {
							                alert('heic 파일은 업로드 할 수 없습니다.');
							                return;
							            }
							            if(!f.type.match("image.*")) {
							                alert("확장자는 이미지 확장자만 가능합니다.");
							                return;
							            }
							
							            sel_files.push(f);
							
							            var reader = new FileReader();
							            reader.onload = function(e) {
							
							                $("#thumbnail_img").text("");
							                $("#thumbnail_img").append("<div class='thumbnail_after_btn'>썸네일 변경</div>");
							                $("#thumbnail_img").css("background-image","url("+e.target.result+")");
							                $("#thumbnail_img").css("background-color","#fff");
							
							                $("#thumbnail_img").css("background-size","cover");
							                $("#thumbnail_img").css("background-repeat","no-repeat");
							                $("#thumbnail_img").css("background-position","center");
							
							                $("#thumbnail_s3").val("");
							            }
							            reader.readAsDataURL(f);
							            
							        });
							        
							    }
							</script>
						</div>


						<div class="titleComponent">
							<div class="title_main">
								폼 제목
								<p class="special_icon">*</p>
							</div>
							<input class="title" name="formName" type="text" id="title" placeholder="폼 제목을 입력해주세요">
						</div>
	
	
						<div class="goodsAddComponent">
							<div class="title">
								상품정보 입력
								<p class="special_icon">*</p>
								<div class="sub_notice">재고를 제외한 상품 정보는 구매 발생 전까지만 수정 가능합니다.</div>
							</div>
							<ul class="con">
								<li>
									<div>상품명</div>
									<div class="limit_content">
										<input id="goodsName" class="name" type="text" placeholder="상품명을 입력해 주세요" onkeyup="checkText(this)">
										<div class="limit_length">(0/100)</div>
									</div>
								</li>
								<li>
									<div>가격</div>
									<input id="goodsPrice" class="price" type="number"
									min="0" inputmode="numeric" pattern="[0-9]*"
									placeholder="가격을 입력해 주세요" onkeyup="checkNumber(this)">
								</li>
								<li class="flex_row">
									<div class="pc">
										<div>재고</div>
										<input id="goodsQuantity" class="count" type="number" min="0"
											inputmode="numeric" pattern="[0-9]*" placeholder="최대 100,000개"
											onkeyup="checkNumber(this)">
									</div>
									<div class="pc">
										<input id="limitMaxCheck0" class="checkbox" type="checkbox" onchange="limitMaxCheck(0)">
										<label for="limitMaxCheck0">구매개수 제한</label>
										<input class="limit_max_count" id="limitMaxCount0" type="number"
											min="0" inputmode="numeric" pattern="[0-9]*"
											placeholder="0000개" disabled="" onkeyup="checkNumber(this)">
									</div>
								</li>
							</ul>
							<ul class="con con_btn">
								<div>
									<div id="goodsValueNotice0" class="goodsValueNotice">상품 정보를 모두 입력해주세요 :)</div>
									<button id="btn" class="btn" onclick="goodsAdd()">상품등록</button>
								</div>
							</ul>
	
							<script>
							    //구매개수제한ONOFF
							    function limitMaxCheck(n){
							        if(document.querySelector('#limitMaxCheck'+n).checked === false){
							            document.querySelector('#limitMaxCount'+n).value = '';
							            document.querySelector('#limitMaxCount'+n).disabled = true;
							        }else{
							            document.querySelector('#limitMaxCount'+n).disabled = false;
							        }
							    }
							
							    //상품등록기능
							    let goodsListCount = 0;
							    
							    function goodsAdd(){
							    	event.preventDefault();
							        goodsListCount++;
							        let list = '';
							        let goodsName = document.querySelector('#goodsName').value;
							        const goodsPriceComma = document.querySelector('#goodsPrice').value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
							        const goodsPrice = document.querySelector('#goodsPrice').value;
							        const goodsQuantity = document.querySelector('#goodsQuantity').value;
							        const limitMaxCheck = document.querySelector('#limitMaxCheck0').checked;
							        const limitMaxCount = document.querySelector('#limitMaxCount0').value;
							
							
							        if(!goodsName || !goodsPrice || !goodsQuantity){
							            document.querySelector('#goodsValueNotice0').classList.add('display-block');
							            setTimeout(function() {
							                document.querySelector('#goodsValueNotice0').classList.remove('display-block');
							            }, 3000);
							            return 
							        }
							
							        //상품이름체크
							        const goodsOrderNumberLength = $('input[name=formGName]').length;
							        if(goodsOrderNumberLength > 0){
							            for(let i = 0; i < goodsOrderNumberLength; i++){
							                if($('input[name=formGName]').eq(i).val()==goodsName){
							                    return alert('이미 등록된 상품입니다. 상품 이름을 변경해 주세요.');
							                }
							            }
							        }
							
							        if(goodsQuantity > 100000){
							            return alert('재고는 최대 100,000개까지 가능합니다.');
							        }
							
							        if(limitMaxCheck == true && !limitMaxCount){
							            return alert('구매개수 제한 값을 입력해 주세요.');
							        }
							
							                if(document.querySelector('#goodsList').childElementCount >= 30){
							            return alert('물품을 최대 30개 등록할 수 있습니다.');
							        }
							        
							        // if(goodsName.length > 30){
							        //     goodsName = goodsName.substr(0,30)+"...";
							        // }
							
							        list += `<li id='goodsList\${goodsListCount}' name='goodsArray' class='draggable' draggable='true'>`;
							
							        list += `<div id='goodsContent\${goodsListCount}'class='content'>`;
							                list += "<img class='drag_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/drag_icon.webp'>";
							                list += "<div class='center'>";
							
							        list += "<div class='top'>";
							        list += `<div class='name' name='formGName'>\${goodsName}</div>`;
							        list += "<div class='counts'>";
							        list += "<span class='span'>(</span>";
							        list += `<span class='quantity' name='formQnt'>재고 \${goodsQuantity}개</span>`;
							        if(limitMaxCheck && limitMaxCount>0){
							            list += `<span class='max' name='formLmtc'>구매제한 \${limitMaxCount}개</span>`;
							        }
							        list += "<span class='span'>)</span>";
							        list += "</div>";
							        list += "</div>"
							
							        list += "<div class='bottom'>";
							        list += `<div class='price' name='formGPrice'>\${goodsPriceComma}원</div>`;
							        
							        list += "</div>"
							
							        list += "</div>";
							        list += `<button class='btn' onclick='goodsFix(\${goodsListCount})'>수정</button>`;
							        list += `<img class='delete_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/goods_delete_icon.webp' onclick='goodsDelete(\${goodsListCount})'>`;
							        list += "</div>"
							
							        list += "<ul class='fix display-none'>";
							        list += `<li><div>상품명</div><input name='formGName' id='goodsArrayName' class='name' type='text' placeholder='상품명을 입력 해주세요' value='\${goodsName}' onkeyup="checkText(this)"></li>`;
							        list += `<li><div>가격</div><input name='formGPrice' id='goodsArrayPrice' class='price' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='가격을 입력해 주세요' value='\${goodsPrice}' onkeyup="checkNumber(this)"></li>`;
							        list += "<li class='flex_row'>";
							        list += `<div class='pc'><div>재고</div><input name='formQnt' id='goodsArrayQuantity' class='count' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='최대 100,000개' value='\${goodsQuantity}' onkeyup="checkNumber(this)"></div>`;
							        if(limitMaxCheck){
							            list += `<div class='pc'><input name='formLmtb' id='limitMaxCheck\${goodsListCount}' class='checkbox' type='checkbox' onchange='limitMaxCheck(\${goodsListCount})' checked><label for='limitMaxCheck\${goodsListCount}'>구매개수 제한</label><input name='formLmtc' class='limit_max_count' id='limitMaxCount\${goodsListCount}' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='0000개' value='\${limitMaxCount}' onkeyup="checkNumber(this)"></div>`;
							        }else{
							            list += `<div class='pc'><input name='formLmtb' id='limitMaxCheck\${goodsListCount}' class='checkbox' type='checkbox' onchange='limitMaxCheck(\${goodsListCount})'><label for='limitMaxCheck\${goodsListCount}'>구매개수 제한</label><input name='formLmtc' class='limit_max_count' id='limitMaxCount\${goodsListCount}' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='0000개' value='' disabled onkeyup="checkNumber(this)"></div>`;
							        }
							        list += "</li>";
							        list += `<input type="hidden" name="goodsArrayIdx" id="goodsIdx\${goodsListCount}" value="">`;
							        list += `<div class='con_btn'><div id='goodsValueNotice\${goodsListCount}' class='goodsValueNotice'>상품 정보를 모두 입력해주세요 :)</div><button class='btn' onclick='goodsFixSave(\${goodsListCount})'>수정완료</button></div>`;
							        list += "</ul>";
							        list += "</li>";
							
							        $('#goodsList').append(list);
							        goodsCount();
							        draggableAdd();
							        goodsAddReset();
							    }
							
							
							    //상품등록개수확인
							    function goodsCount(){
							        const goodsCount = document.querySelector('#goodsList').childElementCount;
							        document.querySelector('#goodsCountTitle').textContent = goodsCount;
							
							        if(goodsCount === 0){
							            document.querySelector('#qunatity_open_check').style.display = 'none';
							        }else if(goodsCount === 1){
							            document.querySelector('#qunatity_open_check').style.display = 'flex';
							        }
							    }
							
							    //상품등록 후 input값 초기화
							    function goodsAddReset(){
							        document.querySelector('#goodsName').value = null;
							        document.querySelector('#goodsPrice').value = null;
							        document.querySelector('#goodsPrice').value = null;
							        document.querySelector('#goodsQuantity').value = null;
							        document.querySelector('#limitMaxCheck0').checked = false;
							        document.querySelector('#limitMaxCount0').value = null;
							        document.querySelector('#limitMaxCount0').disabled = true;
							        document.querySelector('#goodsName').focus();
							        document.querySelector('.goodsAddComponent #btn').classList.remove('active');
							    }
							
							    //상품등록버튼 활성화
							    const goodsNameForm = document.querySelector('#goodsName');
							    const goodsPriceForm = document.querySelector('#goodsPrice');
							    const goodsQuantityForm = document.querySelector('#goodsQuantity');
							    const goodsAddButton = document.querySelector('.goodsAddComponent #btn');
							            goodsNameForm.addEventListener('keyup', listener);
							        goodsPriceForm.addEventListener('keyup', listener);
							        goodsQuantityForm.addEventListener('keyup', listener);
							    
							    function listener() {
							        switch (!(goodsNameForm.value && goodsPriceForm.value && goodsQuantityForm.value)) {
							            case true: goodsAddButton.classList.remove('active'); break;
							            case false: goodsAddButton.classList.add('active'); break;
							        }
							    }
							
							</script>
	
							<!-- 참여자있을때 새로운 상품 추가 -->
							<script>
							    //구매개수제한ONOFF
							    function newlimitMaxCheck(n){
							        if(document.querySelector('#newlimitMaxCheck'+n).checked === false){
							            document.querySelector('#newlimitMaxCount'+n).value = '';
							            document.querySelector('#newlimitMaxCount'+n).disabled = true;
							        }else{
							            document.querySelector('#newlimitMaxCount'+n).disabled = false;
							        }
							    }
							
							    //상품등록기능
							    let newgoodsListCount = 0;
							    
							    function newgoodsAdd(){
							        newgoodsListCount++;
							        let list = '';
							        let newgoodsName = document.querySelector('#newgoodsName').value;
							        const newgoodsPriceComma = document.querySelector('#newgoodsPrice').value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
							        const newgoodsPrice = document.querySelector('#newgoodsPrice').value;
							        const newgoodsQuantity = document.querySelector('#newgoodsQuantity').value;
							        const newlimitMaxCheck = document.querySelector('#newlimitMaxCheck0').checked;
							        const newlimitMaxCount = document.querySelector('#newlimitMaxCount0').value;
							
							        if(!newgoodsName || !newgoodsPrice || !newgoodsQuantity){
							            document.querySelector('#goodsValueNotice0').classList.add('display-block');
							            setTimeout(function() {
							                document.querySelector('#goodsValueNotice0').classList.remove('display-block');
							            }, 3000);
							            return 
							        }
							
							        //상품이름체크
							        const goodsOrderNumberLength = $('input[name=formGName]').length;
							        if(goodsOrderNumberLength > 0){
							            for(let i = 0; i < goodsOrderNumberLength; i++){
							                if($('input[name=formGName]').eq(i).val()==newgoodsName){
							                    return alert('이미 등록된 상품입니다. 상품 이름을 변경해 주세요.');
							                }
							            }
							        }
							
							        if(newgoodsQuantity > 100000){
							            return alert('재고는 최대 100,000개까지 가능합니다.');
							        }
							
							        if(newlimitMaxCheck == true && !newlimitMaxCount){
							            return alert('구매개수 제한 값을 입력해 주세요.');
							        }
							
							                if(document.querySelector('#goodsList').childElementCount >= 30){
							            return alert('물품을 최대 30개 등록할 수 있습니다.');
							        }
							        
							        // if(newgoodsName.length > 30){
							        //     newgoodsName = newgoodsName.substr(0,30)+"...";
							        // }
							
							        list += `<li id='newgoodsList\${newgoodsListCount}' name='newgoodsArray' class='draggable' draggable='true'>`;
							
							        list += `<div id='newgoodsContent\${newgoodsListCount}'class='content'>`;
							                    list += "<img class='drag_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/drag_icon.webp'>";
							                list += "<div class='center'>";
							
							        list += "<div class='top'>";
							        list += `<div class='name' name='formGName'>\${newgoodsName}</div>`;
							        list += "<div class='counts'>";
							        list += "<span class='span'>(</span>";
							        list += `<span class='quantity' name='formQnt'>재고 \${newgoodsQuantity}개</span>`;
							        if(newlimitMaxCheck && newlimitMaxCount>0){
							            list += `<span class='max' name='formLmtc'>구매제한 \${newlimitMaxCount}개</span>`;
							        }
							        list += "<span class='span'>)</span>";
							        list += "</div>";
							        list += "</div>"
							
							        list += "<div class='bottom'>";
							        list += `<div class='price' name='formGPrice'>${newgoodsPriceComma}원</div>`;
							        
							        list += "</div>"
							
							        list += "</div>";
							        list += `<button class='btn' onclick='newgoodsFix(\${newgoodsListCount})'>수정</button>`;
							        list += `<img class='delete_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/goods_delete_icon.webp' onclick='newgoodsDelete(\${newgoodsListCount})'>`;
							        list += "</div>"
							
							        list += "<ul class='fix display-none'>";
							        list += `<li><div>상품명</div><input name='formGName' id='newgoodsArrayName' class='name' type='text' placeholder='상품명을 입력 해주세요' value='\${newgoodsName}' onkeyup="checkText(this)"></li>`;
							        list += `<li><div>가격</div><input name='formGPrice' id='newgoodsArrayPrice' class='price' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='가격을 입력해 주세요' value='\${newgoodsPrice}' onkeyup="checkNumber(this)"></li>`;
							        list += "<li class='flex_row'>";
							        list += `<div class='pc'><div>재고</div><input name='formQnt' id='newgoodsArrayQuantity' class='count' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='최대 100,000개' value='\${newgoodsQuantity}' onkeyup="checkNumber(this)"></div>`;
							        if(newlimitMaxCheck){
							            list += `<div class='pc'><input name='formLmtb' id='newlimitMaxCheck\${newgoodsListCount}' class='checkbox' type='checkbox' onchange='newlimitMaxCheck(\${newgoodsListCount})' checked><label for='newlimitMaxCheck\${newgoodsListCount}'>구매개수 제한</label><input name='formLmtc' class='limit_max_count' id='newlimitMaxCount\${newgoodsListCount}' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='0000개' value='\${newlimitMaxCount}' onkeyup="checkNumber(this)"></div>`;
							        }else{
							            list += `<div class='pc'><input name='formLmtb' id='newlimitMaxCheck\${newgoodsListCount}' class='checkbox' type='checkbox' onchange='newlimitMaxCheck(\${newgoodsListCount})'><label for='newlimitMaxCheck\${newgoodsListCount}'>구매개수 제한</label><input name='formLmtc' class='limit_max_count' id='newlimitMaxCount\${newgoodsListCount}' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='0000개' value='' disabled onkeyup="checkNumber(this)"></div>`;
							        }
							        list += "</li>";
							        list += `<div class='con_btn'><div id='goodsValueNotice\${newgoodsListCount}' class='goodsValueNotice'>상품 정보를 모두 입력해주세요 :)</div><button class='btn' onclick='newgoodsFixSave(\${newgoodsListCount})'>수정완료</button></div>`;
							        list += "</ul>";
							
							        list += "</li>";
							
							        $('#goodsList').append(list);
							        newgoodsCount();
							        draggableAdd();
							        newgoodsAddReset();
							    }
							
							    //상품등록개수확인
							    function newgoodsCount(){
							        const goodsCount = document.querySelector('#goodsList').childElementCount;
							        document.querySelector('#goodsCountTitle').textContent = goodsCount;
							
							        if(goodsCount === 0){
							            document.querySelector('#qunatity_open_check').style.display = 'none';
							        }else if(goodsCount === 1){
							            document.querySelector('#qunatity_open_check').style.display = 'flex';
							        }
							    }
							
							    //상품등록 후 input값 초기화
							    function newgoodsAddReset(){
							        document.querySelector('#newgoodsName').value = null;
							        document.querySelector('#newgoodsPrice').value = null;
							        document.querySelector('#newgoodsPrice').value = null;
							        document.querySelector('#newgoodsQuantity').value = null;
							        document.querySelector('#newlimitMaxCheck0').checked = false;
							        document.querySelector('#newlimitMaxCount0').value = null;
							        document.querySelector('#newlimitMaxCount0').disabled = true;
							        document.querySelector('#newgoodsName').focus();
							        document.querySelector('.goodsAddComponent #newbtn').classList.remove('active');
							    }
							
							    //상품등록버튼 활성화
							    const newgoodsNameForm = document.querySelector('#newgoodsName');
							    const newgoodsPriceForm = document.querySelector('#newgoodsPrice');
							    const newgoodsQuantityForm = document.querySelector('#newgoodsQuantity');
							    const newgoodsAddButton = document.querySelector('.goodsAddComponent #newbtn');
							        function listener() {
							        switch (!(newgoodsNameForm.value && newgoodsPriceForm.value && newgoodsQuantityForm.value)) {
							            case true: newgoodsAddButton.classList.remove('active'); break;
							            case false: newgoodsAddButton.classList.add('active'); break;
							        }
							    }
							</script>
						</div>
	
	
						<div class="goodsListComponent">
							<div class="title" onclick="goodsListFolder()">
								<div class="left">
									<div class="main">판매 상품 리스트</div>
									<div class="sub"> (총 <span id="goodsCountTitle" class="count">0</span>개의 상품)</div>
									<i class="bi bi-chevron-down arrow_icon"></i>
								</div>
							</div>
							<div id="qunatity_open_check" class="check" style="display: none;">
								<input class="checkbox" id="quantity_open" type="checkbox" name="formStockOpen">
								<label for="quantity_open" name="formStockOpen">재고 공개하기</label>
							</div>
							<ul id="goodsList" class="con">
							</ul>
	
							<script>
							    //드래그앤드랍변수
							    const draggables = document.querySelectorAll(".draggable");
							    const containers = document.querySelectorAll("#goodsList");
							
							    //드래그앤드랍초기실행
							    $(function(){
							        draggablesCheck();
							        containersCheck();
							    })
							
							    //드래그앤드랍상품확인
							    function draggablesCheck(){
							        draggables.forEach(draggable => {
							            draggable.addEventListener("dragstart", () => {
							                draggable.classList.add("dragging");
							            });
							
							            draggable.addEventListener("dragend", () => {
							                draggable.classList.remove("dragging");
							            });
							        });
							    }
							    
							    //드래그앤드랍영역확인
							    function containersCheck(){
							        containers.forEach(container => {
							            container.addEventListener("dragover", e => {
							                e.preventDefault();
							                const afterElement = getDragAfterElement(container, e.clientY);
							                const draggable = document.querySelector(".dragging");
							                if (afterElement === undefined) {
							                    container.appendChild(draggable);
							                } else {
							                    container.insertBefore(draggable, afterElement);
							                }
							            });
							        });
							    }
							
							    //드래그앤드랍위치변경
							    function getDragAfterElement(container, y) {
							        const draggableElements = [
							            ...container.querySelectorAll(".draggable:not(.dragging)"),
							        ];
							
							        return draggableElements.reduce(
							            (closest, child) => {
							                //console.log(y)
							                const box = child.getBoundingClientRect();
							                const offset = y - box.top - box.height / 2;
							                //console.log(offset);
							                if (offset < 0 && offset > closest.offset) {
							                    return { offset: offset, element: child };
							                } else {
							                    return closest;
							                }
							            },
							            { offset: Number.NEGATIVE_INFINITY },
							        ).element;
							    }
							
							    //상품등록후드래그앤드랍기능적용
							    function draggableAdd(){
							        const draggables = document.querySelectorAll(".draggable");
							        draggables.forEach(draggable => {
							            draggable.addEventListener("dragstart", () => {
							                draggable.classList.add("dragging");
							            });
							
							            draggable.addEventListener("dragend", () => {
							                draggable.classList.remove("dragging");
							            });
							        });
							    }
							
							    //상품삭제
							    function goodsDelete(n){
							        $('#goodsList'+n).remove();
							        goodsCount();
							    }
							
							    //상품수정폼보여주기
							    function goodsFix(n){
							        document.querySelector('#goodsList'+n+' > .content').classList.add('display-none');
							        document.querySelector('#goodsList'+n+' > .fix').classList.remove('display-none');
							    }
							
							    //상품수정저장
							    function goodsFixSave(n){
							
							        let list = '';
							        let goodsName = document.querySelector('#goodsList'+n+' .fix .name').value
							        const goodsPriceComma = document.querySelector('#goodsList'+n+' .fix .price').value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
							        const goodsPrice = document.querySelector('#goodsList'+n+' .fix .price').value
							        const goodsQuantity = document.querySelector('#goodsList'+n+' .fix .count').value
							        const limitMaxCheck = document.querySelector('#limitMaxCheck'+n).checked;
							        const limitMaxCount = document.querySelector('#limitMaxCount'+n).value;
							
							    
							        if(!goodsName || !goodsPrice || !goodsQuantity){
							            document.querySelector('#goodsValueNotice'+n).classList.add('display-block');
							            setTimeout(function() {
							                document.querySelector('#goodsValueNotice'+n).classList.remove('display-block');
							            }, 3000);
							            return 
							        }
							
							        //상품이름체크
							        let sameValue = 0;
							        const goodsOrderNumberLength = $('input[name=formGName]').length;
							        if(goodsOrderNumberLength > 0){
							            for(let i = 0; i < goodsOrderNumberLength; i++){
							                if($('input[name=formGName]').eq(i).val()==goodsName){
							                    sameValue++;
							                }
							            }
							            if(sameValue > 1){
							                return alert('이미 등록된 상품입니다. 상품 이름을 변경해 주세요.');
							            }
							        }
							
							        if(goodsQuantity > 100000){
							            return alert('재고는 최대 100,000개까지 가능합니다.');
							        }
							
							        if(limitMaxCheck == true && !limitMaxCount){
							            return alert('구매개수 제한 값을 입력해 주세요.');
							        }
							
							        $('#goodsContent'+n).empty();
							                list += "<img class='drag_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/drag_icon.webp'>";
							                list += "<div class='center'>";
							        list += "<div class='top'>";
							        list += `<div class='name' name='formGName'>\${goodsName}</div>`;
							        list += "<div class='counts'>";
							        list += "<span class='span'>(</span>";
							        list += `<span class='quantity' name='formQnt'>재고 \${goodsQuantity}개</span>`;
							        if(limitMaxCheck && limitMaxCount>0){
							            list += `<span class='max' name='formLmtc'>구매제한 \${limitMaxCount}개</span>`;
							        }
							        list += "<span class='span'>)</span>";
							        list += "</div>";
							        list += "</div>";
							        list += "<div class='bottom'>";
							        list += `<div class='price' name='formGPrice'>\${goodsPriceComma}원</div>`;
							        list += "</div>";
							        list += "</div>";
							        list += `<button class='btn' onclick='goodsFix(\${n})'>수정</button>`;
							                list += `<img class='delete_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/goods_delete_icon.webp' onclick='goodsDelete(\${n})'>`;
							        
							        $('#goodsContent'+n).append(list);
							
							        document.querySelector('#goodsList'+n+' > .fix').classList.add('display-none');
							        document.querySelector('#goodsList'+n+' > .content').classList.remove('display-none');
							    }
							    
							    //상품리스트폴더기능
							    let goodsListFolderValue = false;
							    function goodsListFolder(){
							        const goodsCount = document.querySelector('#goodsList').childElementCount;
							
							        if(goodsListFolderValue === false && goodsCount > 0){
							            goodsListFolderValue = true;
							            document.querySelector('.goodsListComponent .arrow_icon').classList.remove('rotate180');
							            document.querySelector('#qunatity_open_check').style.display = 'none';
							            document.querySelector('#goodsList').style.display = 'none';
							        }else if(goodsListFolderValue === true && goodsCount > 0){
							            goodsListFolderValue = false;
							            document.querySelector('.goodsListComponent .arrow_icon').classList.add('rotate180');
							            document.querySelector('#qunatity_open_check').style.display = 'flex';
							            document.querySelector('#goodsList').style.display = 'flex';
							        }
							
							    }
							</script>
							<!-- 참여자 있을때  -->
							<script>
							    //상품수정폼보여주기
							    function newgoodsFix(n){
							        document.querySelector('#newgoodsList'+n+' > .content').classList.add('display-none');
							        document.querySelector('#newgoodsList'+n+' > .fix').classList.remove('display-none');
							    }
							
							    //상품수정저장
							    function newgoodsFixSave(n){
							
							        let list = '';
							        let newgoodsName = document.querySelector('#newgoodsList'+n+' .fix .name').value
							        const newgoodsPriceComma = document.querySelector('#newgoodsList'+n+' .fix .price').value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
							        const newgoodsPrice = document.querySelector('#newgoodsList'+n+' .fix .price').value
							        const newgoodsQuantity = document.querySelector('#newgoodsList'+n+' .fix .count').value
							        const newlimitMaxCheck = document.querySelector('#newlimitMaxCheck'+n).checked;
							        const newlimitMaxCount = document.querySelector('#newlimitMaxCount'+n).value;
							
							        if(!newgoodsName || !newgoodsPrice || !newgoodsQuantity){
							            document.querySelector('#goodsValueNotice'+n).classList.add('display-block');
							            setTimeout(function() {
							                document.querySelector('#goodsValueNotice'+n).classList.remove('display-block');
							            }, 3000);
							            return 
							        }
							
							        //상품이름체크
							        let sameValue = 0;
							        const goodsOrderNumberLength = $('input[name=formGName]').length;
							        if(goodsOrderNumberLength > 0){
							            for(let i = 0; i < goodsOrderNumberLength; i++){
							                if($('input[name=formGName]').eq(i).val()==newgoodsName){
							                    sameValue++;
							                }
							            }
							            if(sameValue > 1){
							                return alert('이미 등록된 상품입니다. 상품 이름을 변경해 주세요.');
							            }
							        }
							
							        if(newgoodsQuantity > 100000){
							            return alert('재고는 최대 100,000개까지 가능합니다.');
							        }
							
							        if(newlimitMaxCheck == true && !newlimitMaxCount){
							            return alert('구매개수 제한 값을 입력해 주세요.');
							        }
							
							        // if(newgoodsName.length > 30){
							        //     newgoodsName = newgoodsName.substr(0,30)+"...";
							        // }
							
							        $('#newgoodsContent'+n).empty();
							                list += "<img class='drag_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/drag_icon.webp'>";
							                list += "<div class='center'>";
							        list += "<div class='top'>";
							        list += `<div class='name' name='formGName'>\${newgoodsName}</div>`;
							        list += "<div class='counts'>";
							        list += "<span class='span'>(</span>";
							        list += `<span class='quantity' name='formQnt'>재고 \${newgoodsQuantity}개</span>`;
							        if(newlimitMaxCheck && newlimitMaxCount>0){
							            list += `<span class='max' name='formLmtc'>구매제한 \${newlimitMaxCount}개</span>`;
							        }
							        list += "<span class='span'>)</span>";
							        list += "</div>";
							        list += "</div>";
							        list += "<div class='bottom'>";
							        list += `<div class='price' name='formGPrice'>\${newgoodsPriceComma}원</div>`;
							        list += "</div>";
							        list += "</div>";
							        list += `<button class='btn' onclick='newgoodsFix(\${n})'>수정</button>`;
							        list += `<img class='delete_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/goods_delete_icon.webp' onclick='newgoodsDelete(\${n})'>`;
							        
							        $('#newgoodsContent'+n).append(list);
							
							        document.querySelector('#newgoodsList'+n+' > .fix').classList.add('display-none');
							        document.querySelector('#newgoodsList'+n+' > .content').classList.remove('display-none');
							    }
							
							    //상품삭제
							    function newgoodsDelete(n){
							        $('#newgoodsList'+n).remove();
							        newgoodsCount();
							    }
							</script>
						</div>
	
	
						<div class="saveComponent">
							<div class="con">
								<button id="formButton" class="Save">폼만들기</button>
							</div>
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
