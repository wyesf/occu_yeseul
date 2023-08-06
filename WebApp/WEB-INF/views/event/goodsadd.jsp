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

		<!-- header -->
		<div class="main">

			<div class="event_container">

				<div class="form_header">
					<a href="${pageContext.request.contextPath }/event"><i class="bi bi-backspace-fill"></i></a> 
					<span class="form_title">폼 작성하기</span>
					<a class="save">임시 저장</a>
				</div>

				<div class="form_content">


					
					<!-- step 1 -->
					
					<div class="goodsAddComponent">
			            <div class="title">
						    상품정보 입력
						    <p class="special_icon">*</p>
						    <div class="sub_notice">
						    재고를 제외한 상품 정보는 구매 발생 전까지만 수정 가능합니다.
						    </div>
						</div>
						
						<ul class="con">
						    <li><div>상품명</div><div class="limit_content"><input id="goodsName" class="name" type="text" placeholder="상품명을 입력해 주세요" onkeyup="checkText(this)"><div class="limit_length">(0/100)</div></div></li>
						    <li><div>가격</div><input id="goodsPrice" class="price" type="number" min="0" inputmode="numeric" pattern="[0-9]*" placeholder="가격을 입력해 주세요" onkeyup="checkNumber(this)"></li>
						    <li class="flex_row">
						        <div class="pc">
						            <div>재고</div><input id="goodsQuantity" class="count" type="number" min="0" inputmode="numeric" pattern="[0-9]*" placeholder="최대 100,000개" onkeyup="checkNumber(this)">
						        </div>
						        <div class="pc">
						            <input id="limitMaxCheck0" class="checkbox" type="checkbox" onchange="limitMaxCheck(0)"><label for="limitMaxCheck0">구매개수 제한</label>
						            <input class="limit_max_count" id="limitMaxCount0" type="number" min="0" inputmode="numeric" pattern="[0-9]*" placeholder="0000개" disabled="" onkeyup="checkNumber(this)">
						        </div>
						    </li>
						</ul>
						<ul class="con con_btn">
						    <div>
						        <div id="goodsValueNotice0" class="goodsValueNotice">상품 정보를 모두 입력해주세요 :)</div><button id="btn" class="btn" onclick="goodsAdd()">상품등록</button>
						    </div>
						</ul>
					</div>
					
					
					
					<!-- step 2 -->
					
					<div class="goodsListComponent">
			            <div class="title" onclick="goodsListFolder()">
						    <div class="left">
						        <img class="goods_icon" src="https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/goods_icon.webp" alt="">
						        <div class="main">판매 상품 리스트</div>
						        <div class="sub">(총 <span id="goodsCountTitle" class="count">0</span>개의 상품)</div>
						    </div>
						    <img class="arrow_icon rotate180" src="https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/down_arrow_icon.webp" alt="">
						</div>
						<div id="qunatity_open_check" class="check" style="display: none;">
						    <input class="checkbox" id="quantity_open" type="checkbox">
						    <label for="quantity_open">재고 공개하기</label>
						</div>
						<ul id="goodsList" class="con">
						</ul>
					</div>	
					
					
						
						
					<div class="upload_button">
			            <div class="con">
					        <button id="formButton" class="save" onclick="validation()">폼만들기</button>
					    </div>
			        </div>
												
						


				</div>


			</div>

		</div>
		<!-- main -->
		<div class="side_right"></div>
		<!-- side_right -->


	</div>

</body>

<!-- jquery import -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- bootstrap import -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>

<!-- java script -->
<script type="text/javascript">
		
		
	/* step 1 */
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
	    const goodsOrderNumberLength = $('input[name=order_name]').length;
	    if(goodsOrderNumberLength > 0){
	        for(let i = 0; i < goodsOrderNumberLength; i++){
	            if($('input[name=order_name]').eq(i).val()==goodsName){
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
	
	    list += `<li id='goodsList${goodsListCount}' name='goodsArray' class='draggable' draggable='true'>`;
	
	    list += `<div id='goodsContent${goodsListCount}'class='content'>`;
	            list += "<img class='drag_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/drag_icon.webp'>";
	            list += "<div class='center'>";
	
	    list += "<div class='top'>";
	    list += `<div class='name'>${goodsName}</div>`;
	    list += "<div class='counts'>";
	    list += "<span class='span'>(</span>";
	    list += `<span class='quantity'>재고 ${goodsQuantity}개</span>`;
	    if(limitMaxCheck && limitMaxCount>0){
	        list += `<span class='max'>구매제한 ${limitMaxCount}개</span>`;
	    }
	    list += "<span class='span'>)</span>";
	    list += "</div>";
	    list += "</div>"
	
	    list += "<div class='bottom'>";
	    list += `<div class='price'>${goodsPriceComma}원</div>`;
	    
	    list += "</div>"
	
	    list += "</div>";
	    list += `<button class='btn' onclick='goodsFix(${goodsListCount})'>수정</button>`;
	    list += `<img class='delete_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/goods_delete_icon.webp' onclick='goodsDelete(${goodsListCount})'>`;
	    list += "</div>"
	
	    list += "<ul class='fix display-none'>";
	    list += `<li><div>상품명</div><input name='order_name' id='goodsArrayName' class='name' type='text' placeholder='상품명을 입력 해주세요' value='${goodsName}' onkeyup="checkText(this)"></li>`;
	    list += `<li><div>가격</div><input id='goodsArrayPrice' class='price' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='가격을 입력해 주세요' value='${goodsPrice}' onkeyup="checkNumber(this)"></li>`;
	    list += "<li class='flex_row'>";
	    list += `<div class='pc'><div>재고</div><input id='goodsArrayQuantity' class='count' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='최대 100,000개' value='${goodsQuantity}' onkeyup="checkNumber(this)"></div>`;
	    if(limitMaxCheck){
	        list += `<div class='pc'><input name='goodsArrayLimitMaxCheck' id='limitMaxCheck${goodsListCount}' class='checkbox' type='checkbox' onchange='limitMaxCheck(${goodsListCount})' checked><label for='limitMaxCheck${goodsListCount}'>구매개수 제한</label><input name='goodsArrayLimitMaxCount' class='limit_max_count' id='limitMaxCount${goodsListCount}' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='0000개' value='${limitMaxCount}' onkeyup="checkNumber(this)"></div>`;
	    }else{
	        list += `<div class='pc'><input name='goodsArrayLimitMaxCheck' id='limitMaxCheck${goodsListCount}' class='checkbox' type='checkbox' onchange='limitMaxCheck(${goodsListCount})'><label for='limitMaxCheck${goodsListCount}'>구매개수 제한</label><input name='goodsArrayLimitMaxCount' class='limit_max_count' id='limitMaxCount${goodsListCount}' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='0000개' value='' disabled onkeyup="checkNumber(this)"></div>`;
	    }
	    list += "</li>";
	    list += `<input type="hidden" name="goodsArrayIdx" id="goodsIdx${goodsListCount}" value="">`;
	    list += `<div class='con_btn'><div id='goodsValueNotice${goodsListCount}' class='goodsValueNotice'>상품 정보를 모두 입력해주세요 :)</div><button class='btn' onclick='goodsFixSave(${goodsListCount})'>수정완료</button></div>`;
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
	
	<!-- 참여자있을때 새로운 상품 추가 -->
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
	    const goodsOrderNumberLength = $('input[name=order_name]').length;
	    if(goodsOrderNumberLength > 0){
	        for(let i = 0; i < goodsOrderNumberLength; i++){
	            if($('input[name=order_name]').eq(i).val()==newgoodsName){
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
	
	    list += `<li id='newgoodsList${newgoodsListCount}' name='newgoodsArray' class='draggable' draggable='true'>`;
	
	    list += `<div id='newgoodsContent${newgoodsListCount}'class='content'>`;
	                list += "<img class='drag_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/drag_icon.webp'>";
	            list += "<div class='center'>";
	
	    list += "<div class='top'>";
	    list += `<div class='name'>${newgoodsName}</div>`;
	    list += "<div class='counts'>";
	    list += "<span class='span'>(</span>";
	    list += `<span class='quantity'>재고 ${newgoodsQuantity}개</span>`;
	    if(newlimitMaxCheck && newlimitMaxCount>0){
	        list += `<span class='max'>구매제한 ${newlimitMaxCount}개</span>`;
	    }
	    list += "<span class='span'>)</span>";
	    list += "</div>";
	    list += "</div>"
	
	    list += "<div class='bottom'>";
	    list += `<div class='price'>${newgoodsPriceComma}원</div>`;
	    
	    list += "</div>"
	
	    list += "</div>";
	    list += `<button class='btn' onclick='newgoodsFix(${newgoodsListCount})'>수정</button>`;
	    list += `<img class='delete_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/goods_delete_icon.webp' onclick='newgoodsDelete(${newgoodsListCount})'>`;
	    list += "</div>"
	
	    list += "<ul class='fix display-none'>";
	    list += `<li><div>상품명</div><input name='order_name' id='newgoodsArrayName' class='name' type='text' placeholder='상품명을 입력 해주세요' value='${newgoodsName}' onkeyup="checkText(this)"></li>`;
	    list += `<li><div>가격</div><input id='newgoodsArrayPrice' class='price' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='가격을 입력해 주세요' value='${newgoodsPrice}' onkeyup="checkNumber(this)"></li>`;
	    list += "<li class='flex_row'>";
	    list += `<div class='pc'><div>재고</div><input id='newgoodsArrayQuantity' class='count' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='최대 100,000개' value='${newgoodsQuantity}' onkeyup="checkNumber(this)"></div>`;
	    if(newlimitMaxCheck){
	        list += `<div class='pc'><input name='newgoodsArrayLimitMaxCheck' id='newlimitMaxCheck${newgoodsListCount}' class='checkbox' type='checkbox' onchange='newlimitMaxCheck(${newgoodsListCount})' checked><label for='newlimitMaxCheck${newgoodsListCount}'>구매개수 제한</label><input name='newgoodsArrayLimitMaxCount' class='limit_max_count' id='newlimitMaxCount${newgoodsListCount}' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='0000개' value='${newlimitMaxCount}' onkeyup="checkNumber(this)"></div>`;
	    }else{
	        list += `<div class='pc'><input name='newgoodsArrayLimitMaxCheck' id='newlimitMaxCheck${newgoodsListCount}' class='checkbox' type='checkbox' onchange='newlimitMaxCheck(${newgoodsListCount})'><label for='newlimitMaxCheck${newgoodsListCount}'>구매개수 제한</label><input name='newgoodsArrayLimitMaxCount' class='limit_max_count' id='newlimitMaxCount${newgoodsListCount}' type='number' min='0' inputmode='numeric' pattern='[0-9]*' placeholder='0000개' value='' disabled onkeyup="checkNumber(this)"></div>`;
	    }
	    list += "</li>";
	    list += `<div class='con_btn'><div id='goodsValueNotice${newgoodsListCount}' class='goodsValueNotice'>상품 정보를 모두 입력해주세요 :)</div><button class='btn' onclick='newgoodsFixSave(${newgoodsListCount})'>수정완료</button></div>`;
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
	    
	    
	    
	    
	    
	/* step 2 */

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
        const goodsOrderNumberLength = $('input[name=order_name]').length;
        if(goodsOrderNumberLength > 0){
            for(let i = 0; i < goodsOrderNumberLength; i++){
                if($('input[name=order_name]').eq(i).val()==goodsName){
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

        // if(goodsName.length > 30){
        //     goodsName = goodsName.substr(0,30)+"...";
        // }

        $('#goodsContent'+n).empty();
                list += "<img class='drag_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/drag_icon.webp'>";
                list += "<div class='center'>";
        list += "<div class='top'>";
        list += `<div class='name'>${goodsName}</div>`;
        list += "<div class='counts'>";
        list += "<span class='span'>(</span>";
        list += `<span class='quantity'>재고 ${goodsQuantity}개</span>`;
        if(limitMaxCheck && limitMaxCount>0){
            list += `<span class='max'>구매제한 ${limitMaxCount}개</span>`;
        }
        list += "<span class='span'>)</span>";
        list += "</div>";
        list += "</div>";
        list += "<div class='bottom'>";
        list += `<div class='price'>${goodsPriceComma}원</div>`;
        list += "</div>";
        list += "</div>";
        list += `<button class='btn' onclick='goodsFix(${n})'>수정</button>`;
                list += `<img class='delete_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/goods_delete_icon.webp' onclick='goodsDelete(${n})'>`;
        
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

	<!-- 참여자 있을때  -->
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
        const goodsOrderNumberLength = $('input[name=order_name]').length;
        if(goodsOrderNumberLength > 0){
            for(let i = 0; i < goodsOrderNumberLength; i++){
                if($('input[name=order_name]').eq(i).val()==newgoodsName){
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
        list += `<div class='name'>${newgoodsName}</div>`;
        list += "<div class='counts'>";
        list += "<span class='span'>(</span>";
        list += `<span class='quantity'>재고 ${newgoodsQuantity}개</span>`;
        if(newlimitMaxCheck && newlimitMaxCount>0){
            list += `<span class='max'>구매제한 ${newlimitMaxCount}개</span>`;
        }
        list += "<span class='span'>)</span>";
        list += "</div>";
        list += "</div>";
        list += "<div class='bottom'>";
        list += `<div class='price'>${newgoodsPriceComma}원</div>`;
        list += "</div>";
        list += "</div>";
        list += `<button class='btn' onclick='newgoodsFix(${n})'>수정</button>`;
        list += `<img class='delete_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/goods_delete_icon.webp' onclick='newgoodsDelete(${n})'>`;
        

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


</html>


