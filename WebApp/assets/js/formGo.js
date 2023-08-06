

/* ajax */
$(document).ready(function(){
	console.log("여기");
    $("#formButton").on("click submit", function(){
    	validation();
    }); //id="formButton"인 태그에 click하면 function validation() 실행
});
	
	
	
function validation() {
	
	let formFile = $('form[name=imgForm]')[0]; //폼이미지
	
	let formName = $("#title").val(); //폼제목
	
	let formGName = $("li[name=goodsArray] .name").text();  //상품명
	let formGPrice = $("li[name=goodsArray] .price").text().slice(0, -1);  //상품가격
	let formQnt = $(".center .counts .quantity").text().slice(3, -1);  //상품재고
	let formLmtb = $("#limitMaxCheck0").is(':checked');  //구매개수제한
	let formLmtc = $(".center .counts .max").text().slice(5, -1);  //구매개수제한
	let formLmt = formLmtb + " " + formLmtc;  //구매개수제한(checkbox+count)
	let formStockOpen = $("#qunatity_open_check #quantity_open").is(':checked');  //재고공개 여부

/*	console.log("이미지 경로 확인 " + formFile);
	console.log(formName);
	console.log(formGN);
	console.log(formGP);
	console.log(formQnt);
	console.log(formLmt);
	console.log(formStockOpen);*/
	
	let formVal = $("form[name=imgForm]").serialize();
	console.log("확인 합시다 : " + formVal);
	let formData = new FormData();
	console.log("ehlfk: " + formData);
	
	formData.append("formFile", formFile);
	formData.append("formName", formName);
	formData.append("formGName", formGName);
	formData.append("formGPrice", formGPrice);
	formData.append("formQnt", formQnt);
	formData.append("formLmt", formLmt);
	formData.append("formStockOpen", formStockOpen);
	
	$.ajax({
	    type : 'post',           // 타입 (get, post, put 등등)
	    url : "/occuyeseul/event/info",           // 요청할 서버url
	    data : formData,
		processData: false,
		contentType: false,
		cache: false,
		enctype: 'multipart/form-data',      // 데이터 타입 (html, xml, json, text 등등)ctr로부터 받는 값의 타입

	    success : function(result) { // 결과 성공 콜백함수
	        console.log(result);
			
			//var texts = json[0].text1
		    	//$('#innerstart').text("");
	    }
	});
};
	
	
