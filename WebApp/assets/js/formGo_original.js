


/* 이미지 업로드 */
	function loadFile(input) {
		var file = input.files[0]; //선택된 파일 가져오기

		//미리 만들어 놓은 div에 text(파일 이름) 추가
		var name = document.getElementById('fileName');
		name.textContent = file.name;

	};

	/* 해시태그 */
	$(document).ready(function(){

		var tag = {};
		var counter = 0;

		// 태그를 추가한다.
		function addTag(value) {
			tag[counter] = value; // 태그를 Object 안에 추가
			counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
		}

		// 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
		function marginTag() {
			return Object.values(tag).filter(function(word) {
				return word !== "";
			});
		}

		$("#tag").on("keyup", function(e) {
			var self = $(this);
			console.log("keypress");

			// input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
			if (e.key === "Enter" || e.keyCode == 32) {
				var tagValue = self.val(); // 값 가져오기
				/*console.log(tagValue);*/
				// 값이 없으면 동작 안합니다.
				if (tagValue !== "") {
					// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
					var result = Object.values(tag).filter(
						function(word) {
							return word === tagValue;
						}
					)

					// 태그 중복 검사
					if (result.length == 0) {
						$("#tag-list").append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'><i class='bi bi-x'></i></span></li>");
						addTag(tagValue);
						self.val("");
					} else {
						alert("태그값이 중복됩니다.");
					}
				}
				e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
			}
		});

		// 삭제 버튼
		// 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
		$(document).on("click", ".del-btn", function(e) {
			var index = $(this).attr("idx");
			tag[index] = "";
			$(this).parent().remove();
		});
	});
	
	
	
	
	/* 배송방법 입력 */    
    let deliveryTypeCount = document.querySelector('#deliveryList').childElementCount;
    let deliveryType_Number = deliveryTypeCount - 2;

    //배송방법추가    
    function deliveryAdd(){
        let list = '';
        const deliveryName = document.querySelector('#input_cell .name').value;
        /*console.log(deliveryName);*/
        const deliveryPrice = document.querySelector('#input_cell .price').value;
        
        if(!deliveryName || !deliveryPrice){
            return alert('배송 방법을 전부 입력해 주세요.');
        }

        list += `<li name='deliveryArray' id='deliveryType${deliveryType_Number}'>`;
        list += '<div>';
        list += `<input class="name" type="text" placeholder="배송방법" onkeyup="checkText(this)" value='${deliveryName}'>`;
        list += `<input class="price" type="number" placeholder="배송비" onkeyup="checkNumber(this)" value='${deliveryPrice}'>`;
        list += '<input class="delivery_idx" type="hidden" value="">';
        list += '</div>';
        list += `<img class='delete_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/goods_delete_icon.webp' onclick='deliveryDelete(${deliveryType_Number})'>`;        
        list += '</li>';
        $('#deliveryList').append(list);
        deliveryReset();
        deliveryType_Number++;
    }

    //배송방법삭제
    function deliveryDelete(n){
        $('#deliveryType'+n).remove();
    }

    function qrCodeCheck(){
        if(document.querySelector('#qrCodeCheck').checked === true){
            document.querySelector('#deliveryQrCode').classList.remove('display-none');
        }else{
            document.querySelector('#deliveryQrCode').classList.add('display-none');
        }
    }

    function DeliveryMethodHide(cb, n)
    {
        //배송방법
        let hideCnt = 0;
        let deliveryArrayLength = $('li[name=deliveryArray]').length;                
        for(let i = 0; i < deliveryArrayLength; i++){          
            if($('li[name=deliveryArray] .dhc').eq(i).get().length > 0 && $('li[name=deliveryArray] .dhc').eq(i).get()[0].checked)
            {
                hideCnt++;
            }
        }        
        if(!$('#qrCodeCheck').is(':checked')){ deliveryArrayLength-= 1; }
        //추가배송방법
        let newdeliveryArrayLength = $('li[name=newdeliveryArray]').length;        
        if(deliveryArrayLength == hideCnt && newdeliveryArrayLength==0)
        {
            alert("배송방법은 최소 1개 이상 노출되어야 합니다.");
            cb.checked = false;
        }
        else
        {
            let el = '#deliveryType'+n+' div';
            if(cb.checked)
            {
                document.querySelector(el).classList.add('hide');
            }
            else
            {
                document.querySelector(el).classList.remove('hide');
            }
        }
    }

	/* 참여자 있을때 */
    function newdeliveryAdd(){
        let list = '';
        const deliveryName = document.querySelector('#input_cell .name').value;
        const deliveryPrice = document.querySelector('#input_cell .price').value;
        
        if(!deliveryName || !deliveryPrice){
            return alert('배송 방법을 전부 입력해 주세요.');
        }
        
        list += `<li name='newdeliveryArray' id='newdeliveryType\${deliveryType_Number}'>`;
        list += '<div>';
        list += `<input class="name" type="text" placeholder="배송방법" onkeyup="" value='\${deliveryName}'>`;
        list += `<input class="price" type="number" placeholder="배송비" onkeyup="" value='\${deliveryPrice}'>`;
        list += '<input class="delivery_idx" type="hidden" value="">';
        list += '</div>';        
        list += `<img class='delete_icon' src='https://d2i2w6ttft7yxi.cloudfront.net/site_img/formMaker/goods_delete_icon.webp' onclick='newdeliveryDelete(\${deliveryType_Number})'>`;
        list += '</li>';
        $('#deliveryList').append(list);
        deliveryReset();
        deliveryType_Number++;
    }

    //배송방법삭제
    function newdeliveryDelete(n){
        //배송방법
        let hideCnt = 0;
        let deliveryArrayLength = $('li[name=deliveryArray]').length;
        for(let i = 0; i < deliveryArrayLength; i++){          
            if($('li[name=deliveryArray] .dhc').eq(i).get().length > 0 && $('li[name=deliveryArray] .dhc').eq(i).get()[0].checked)
            {
                hideCnt++;
            }
        }        
        if(!$('#qrCodeCheck').is(':checked')){ deliveryArrayLength-= 1; }
        //추가배송방법
        let newdeliveryArrayLength = $('li[name=newdeliveryArray]').length;
        if(deliveryArrayLength == hideCnt && newdeliveryArrayLength==1)
        {
            alert("배송방법은 최소 1개 이상 노출되어야 합니다.");
        }
        else
        {
            $('#newdeliveryType'+n).remove();
        }
    }

    //배송등록버튼 활성화
    const deliveryNameForm = document.querySelector('#input_cell .name');
    const deliveryPriceForm = document.querySelector('#input_cell .price');
    const deliveryAddButton = document.querySelector('.upload_delivery .deliveryNotice .btn');
    deliveryNameForm.addEventListener('keyup', deliverylistener);
    deliveryPriceForm.addEventListener('keyup', deliverylistener);

    function deliverylistener() {
        switch (!(deliveryNameForm.value && deliveryPriceForm.value)) {
            case true: deliveryAddButton.classList.remove('active'); break;
            case false: deliveryAddButton.classList.add('active'); break;
        }
    }

    function deliveryReset(){
        document.querySelector('#input_cell .name').value = '';
        document.querySelector('#input_cell .price').value = '';
        document.querySelector('#input_cell .name').focus();
        document.querySelector('.upload_delivery .deliveryNotice .btn').classList.remove('active');
    }
	
	
	
	
	/* 질문 추가 */
	/*
	$("#btnTest").click(function(){
		  console.log(event);
		  // 이벤트 실행 막기
		  // url 이동 막기
		  event.preventDefault();
		  $("button[name=btnValue]").html("버튼테스트");
	});
	*/

	function questCheck() {
		if (document.querySelector('#questionOpen').checked === true) {
			document
					.querySelector('.upload_question .con').classList
					.remove('display-none');
		} else {
			document
					.querySelector('.upload_question .con').classList
					.add('display-none');
		}
	}

	let questionCount = 0;
	console.log(questionCount);
	function questAdd() {
		console.log("여기1");

		let list = '';
		// const questionText = checkEmojis(formMaker_escapeHtml(document.querySelector('#questionText').value));
		const questionText = document.querySelector('#questionText').value;
		console.log("여기2");


		if (!questionText) {
			return [
				alert('추가 질문 내용을 입력해 주세요.'),
				document.querySelector('#questionText').focus() ];
				console.log("여기3");

		}

		if (document.querySelector('#questionList').childElementCount >= 5) {
			return alert('추가 질문은 최대 5개까지 등록 가능합니다.')
			console.log("여기4");

		}
		console.log(questionCount);

		questionCount++;
		console.log("여기5");
		console.log(questionCount);


		list += `<li name='questionArray' id='question\${questionCount}'>`;
		console.log(questionCount);
		list += '<div>';
		list += `<span>Q</span>\${questionText}</div>`;
		list += `<i class="bi bi-x-circle-fill delete_icon" onclick='questionDelete(\${questionCount})'></i>`;
		list += `<input type='hidden' value='\${questionText}'>`;
		list += '</li>';
		console.log("여기5");
		console.log(questionCount);


		$('#questionList').append(list);
		document.querySelector('#questionText').value = null;
		document.querySelector('#questionText')
				.focus();
		questionCountCheck();
		console.log("여기6");
		console.log(questionCount);
		event.preventDefault();
	}
	console.log("여기7");

	function questionDelete(n) {
		$('#question' + n).remove();
		questionCountCheck();
	}

	function questionCountCheck() {
		const questionCnt = document
				.querySelector('#questionList').childElementCount;
		if (questionCnt === 0) {
			document.querySelector('#questionList').classList
					.add('display-none');
		} else if (questionCnt > 0) {
			document.querySelector('#questionList').classList
					.remove('display-none');
		}
	}
	
	
	
	/* 나이제한 서비스 */
	function limitAgeCheck(){
	    if(document.querySelector('#limitAgeOpen').checked === true){
	        document.querySelector('.upload_limitAge .con').classList.remove('display-none');
	        document.querySelector('.notice_text').classList.remove('display-none');
	    }else{
	        document.querySelector('.upload_limitAge .con').classList.add('display-none');
	        document.querySelector('.notice_text').classList.add('display-none');
	    }
	}

    
    
    
    

    /* 시크릿폼 */
    function secretFormCheck(){
        if(document.querySelector('#secretFormOpen').checked === true){
            document.querySelector('.upload_secretForm .con').classList.remove('display-none');
        }else{
            document.querySelector('.upload_secretForm .con').classList.add('display-none');
            document.querySelector('.upload_secretForm #secretFormPassword').value = null;
            document.querySelector('.upload_secretForm #secretFormPasswordHint').value = null;
            
        }
    }

    
    
    /* 땡스레터 */
    const fileTarget = $('#thanksLetterUpload');

    fileTarget.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }
        
        var ext = $(this)[0].files[0].name.split('.').pop().toLowerCase();
        if(ext=='gif'){
            alert("gif 파일은 업로드 할 수 없습니다.");
            letter_del();
            return;
        }
        if(ext=='heic') {
            alert('heic 파일은 업로드 할 수 없습니다.');
            letter_del();
            return;
        }

        if(filename.length > 20){
            filename = filename.substr(0, 20) + '...';
        }

        $('.thanksLetterTitle').text(filename);
        $('.thanksLetterTitle').addClass('upload');
        $("#thanksLetterUploadText").text("변경");
        $("#thanksLetterDeleteButton").css("display","block");
        $("#thanksLetterDeleteCheck").val("0");

    });

    jQuery.browser = {};
    (function () {
        jQuery.browser.msie = false;
        jQuery.browser.version = 0;
        if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
            jQuery.browser.msie = true;
            jQuery.browser.version = RegExp.$1;
        }
    })();

    function thanksLetterDelete(){
        if ($.browser.msie) { 
            // ie 일때 input[type=file] init. 
            $("#thanksLetterUpload").replaceWith( $("#thanksLetterUpload").clone(true) ); 
        } else { 
            // other browser 일때 input[type=file] init. 
            $("#thanksLetterUpload").val(""); 
        }
        $("#thanksLetterUploadText").text("업로드");
        $("#thanksLetterDeleteButton").css("display","none");
        $("#thanksLetterDeleteCheck").val("1");
        $('.thanksLetterTitle').text("360x360 사이즈로 업로드 해주세요");
        $('.thanksLetterTitle').removeClass('upload');
    }

    $(function(){
        $('#thanksLetterMessage').keyup(function(e){
            $(this).css('height', 'auto');
            $(this).height(this.scrollHeight - 3);
        });

            });

	var TKBASE = '';
	function thanksLetterBase64(){ 	
		var filesToUploads = document.getElementById("thanksLetterUpload").files;
        var file = filesToUploads[0];
		var READER = new FileReader(); 	 	
		READER.onload = function () { 		
			TKBASE = READER.result;
		} 	 	
		if (file) {
			READER.readAsDataURL(file); 
		}
	} 
  
	






/* ajax */
$(document).ready(function(){
	console.log("여기");
    $("#formButton").on("click", function(){
    	validation();
    }); //id="formButton"인 태그에 click하면 function validation() 실행
});
	
	
	
function validation() {
	
	let formFile = $("#chooseFile").val();
	
	let formName = $("#formTitle").val().trim(); //폼제목
	
	let formGenre = $("select[name=genre] > option:selected").val(); //폼장르
	
	let startDate = $("#startDate").val().trim();  //폼날짜
	let startTime = $("#startTime").val().trim();
	let formStart = startDate + " " + startTime;
	let endDate = $("#endDate").val().trim();
	let endTime = $("#endTime").val().trim();
	let formEnd = endDate + " " + endTime;
	let forSale = $("#for_sale").val().trim();  //상시판매
	
	let overview = $("textarea[name=overview]").val().trim(); //폼상세설명
	
	/*let formTags = [];*/
	let formTag = $("ul#tag-list > li.tag-item").text();  //폼태그
	/*formTags.push(formTag);*/
	
	let formWiCall = $("#qrCodeCheck").val().trim();  //현장수령
	let formdlvN = $("li[name=deliveryArray] input.name").val();
	let formdlvP = $("li[name=deliveryArray] input.price").val();   
	
	console.log(formFile);
	console.log(formName);
	console.log(formGenre);
	console.log(formStart);
	console.log(typeof formStart);
	console.log(formEnd);
	console.log(forSale);
	console.log(overview);	
	console.log(formTag);
	console.log(formWiCall);
	console.log(formdlvN);
	console.log(formdlvP);
	
	$.ajax({
	    type : 'get',           // 타입 (get, post, put 등등)
	    url : '${pageContext.request.contextPath}/event/info',           // 요청할 서버url
	    dataType : 'text',       // 데이터 타입 (html, xml, json, text 등등)ctr로부터 받는 값의 타입
	    data : {formMain: formName},
	    success : function(result) { // 결과 성공 콜백함수
	        console.log(result);
	    }
	})
};
	
	
	