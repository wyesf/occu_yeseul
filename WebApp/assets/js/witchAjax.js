 
    function validationTemp(){
        //폼제목 검즘
        if(!document.querySelector('#title').value){
            return [alert('폼 제목을 입력해 주세요.'), document.querySelector('.titleComponent').scrollIntoView()];
        }

        //입금기간 검즘
            if(
                document.querySelector('#result_no_time').value 
                && $('#result_start_hour option:selected').val() 
                && $('#result_start_min option:selected').val() 

                && document.querySelector('#result_no_time_end').value 
                && $('#result_end_hour option:selected').val()
                && $('#result_end_min option:selected').val()

                && document.querySelector('#nodate').checked === false
            ){
                const startDate = moment(document.querySelector('#result_no_time').value + ' ' + $('#result_start_hour option:selected').val()  + ' ' + $('#result_start_min option:selected').val() , 'YYYY-MM-DD h:m:s'); 
                const endDate = moment(document.querySelector('#result_no_time_end').value + ' ' + $('#result_end_hour option:selected').val()  + ' ' + $('#result_end_min option:selected').val() , 'YYYY-MM-DD h:m:s');
                if(startDate >= endDate){
                    return [alert('폼 시작일을 폼 종료일보다 늦게 설정하실 수 없습니다. 확인 후 변경해 주세요.'), document.querySelector('.dateTimeComponent').scrollIntoView()];
                }
            }
        
        //상세설명 검증
        // if(!document.querySelector('#content').value){
        //     return alert('상세 설명을 입력해 주세요.')
        // }

        //판매물품 검증
        if(document.querySelector('#goodsList').childElementCount > 0){
            for(let i = 0; i < document.querySelector('#goodsList').childElementCount; i++){
                if($('#goodsList li .fix').eq(i).hasClass('display-none') == false ){
                    return [alert('상품 수정을 완료해 주세요.'), document.querySelector('.goodsListComponent').scrollIntoView()];
                }
            }
        }
          
        //추가질문 검증
        if(document.querySelector('#questionOpen').checked === true){
            //추가 질문 필수로 받기
            if($('li[name=questionArray]').length <= 0){
                return [alert('추가 질문을 추가해 주세요.'), document.querySelector('.questionComponent').scrollIntoView()];
            }
        }

        //시크릿폼 검증
        if(document.querySelector('#secretFormOpen').checked === true){
            if(!document.querySelector('#secretFormPassword').value){
                return [alert('시크릿폼 비밀번호를 입력해 주세요.'), document.querySelector('.secretFormComponent').scrollIntoView()];
            }

            if(!document.querySelector('#secretFormPasswordHint').value){
                return [alert('시크릿폼 비밀번호 힌트를 입력해 주세요.'), document.querySelector('.secretFormComponent').scrollIntoView()];
            }
        }

        //땡스레터검증
        if(document.querySelector('#thanksLetterUpload').value != '' && document.querySelector('#thanksLetterMessage').value == ''){
            return [alert('감사 메세지를 적어주세요'), document.querySelector('.thanksLetterComponent').scrollIntoView()];
        }

        //판매자동의 검증
        // if(document.querySelector('#sellerCheck').checked === false){
        //     return alert('판매자 동의는 필수입니다.');
        // }

        uploadTemp();
    }

    function validation(){
        //썸네일 검증
        if(!document.querySelector('#thumbnail').value){
            return [alert('썸네일을 선택해 주세요.'), document.querySelector('.thumbnailComponent').scrollIntoView()];
        }
    
        //폼제목 검즘
        if(!document.querySelector('#title').value){
            return [alert('폼 제목을 입력해 주세요.'), document.querySelector('.titleComponent').scrollIntoView()];
        }
        //폼제목 필터링 검사
        let title_filter = 0;
        let title_filter_txt = '';
        let post_data_title = new Object();
        post_data_title.keyword = document.querySelector('#title').value;
        $.ajax({
            url: "/ajax/filter.php"
            , type: "POST"
            , dataType: "json"
            , data: post_data_title
            , async : false
            , success: function (data) {
                if(data.result=="1"){
                    title_filter_txt = data.keyword;
                    title_filter=1;
                }
            }
            , error: function(request, textStatus, errorThrown){
                //에러내용확인
                //alert('error: ' + textStatus + request);
            }
        });
        if(title_filter_txt != ''){
            return alert(title_filter_txt + '이 저작권 필터링에 의해 제한되었습니다.');
        }

        //장르(카테고리)검증
        if(!$('input:radio[name="category"]').is(':checked')){
            return [alert('장르를 선택해 주세요.'), document.querySelector('.categoryComponent').scrollIntoView()];
        }

        //은행 정보 검증
        if($('#bank_name option:selected').val() != "은행 정보 없음")
        {
            if($('#bank_name option:selected').val() == '' || $('#bank_number').val() == '' || $('#bank_depositor').val() == ''){
                return [alert('은행 정보를 전부 입력해 주세요.'), document.querySelector('.bankComponent').scrollIntoView()];
            }
            if(document.querySelector('#cert_check_value').value == 0){
                return [alert('은행 정보 인증을 해주세요.'), document.querySelector('.bankComponent').scrollIntoView()];
            }
        }

        //입금기간 검즘
        if(
            (
            document.querySelector('#result_no_time').value == ''
            || $('#result_start_hour option:selected').val() == '시'
            || $('#result_start_min option:selected').val() == '분'

            || document.querySelector('#result_no_time_end').value == '' 
            || $('#result_end_hour option:selected').val() == '시'
            || $('#result_end_min option:selected').val() == '분'
            )
            && document.querySelector('#nodate').checked === false
        ){
            return [alert('입금 기간을 선택해 주세요.'), document.querySelector('.dateTimeComponent').scrollIntoView()];
        }

        if(
            document.querySelector('#result_no_time').value 
            && $('#result_start_hour option:selected').val() 
            && $('#result_start_min option:selected').val() 

            && document.querySelector('#result_no_time_end').value 
            && $('#result_end_hour option:selected').val()
            && $('#result_end_min option:selected').val()

            && document.querySelector('#nodate').checked === false
        ){
            const startDate = moment(document.querySelector('#result_no_time').value + ' ' + $('#result_start_hour option:selected').val()  + ' ' + $('#result_start_min option:selected').val() , 'YYYY-MM-DD h:m:s'); 
            const endDate = moment(document.querySelector('#result_no_time_end').value + ' ' + $('#result_end_hour option:selected').val()  + ' ' + $('#result_end_min option:selected').val() , 'YYYY-MM-DD h:m:s');
            if(startDate >= endDate){
                return [alert('폼 시작일을 폼 종료일보다 늦게 설정하실 수 없습니다. 확인 후 변경해 주세요.'), document.querySelector('.dateTimeComponent').scrollIntoView()];
            }
        }
                
        //상세설명 검증
//        const content_data = editor.getData();
		const content_data = $("#content").val();
        if(!content_data){
            return [alert('상세 설명을 입력해 주세요.'), document.querySelector('.editorComponent').scrollIntoView()];
        }
        //상세설명 필터링 검사
        let content_filter = 0;
        let content_filter_txt = '';
        let post_data_content = new Object();
        post_data_content.keyword = content_data;
        $.ajax({
            url: "/ajax/filter.php"
            , type: "POST"
            , dataType: "json"
            , data: post_data_content
            , async : false
            , success: function (data) {
                if(data.result=="1"){
                    content_filter_txt = data.keyword;
                    content_filter=1;
                }
            }
            , error: function(request, textStatus, errorThrown){
                //에러내용확인
                //alert('error: ' + textStatus + request);
            }
        });
        if(content_filter_txt != ''){
            return alert(content_filter_txt + '이 저작권 필터링에 의해 제한되었습니다.');
        }

        //해시태그 필터링 검사
        if($('input[name=hashtagArray]').length > 0){
            let hashtag_filter = 0;
            let hashtag_filter_txt = '';
            let hashtag_filter_array = '';
            for(let i = 0; i < $('input[name=hashtagArray]').length; i++){
                hashtag_filter_array += $('input[name=hashtagArray]').eq(i).val();
            }
            let post_data_hashtag = new Object();
            post_data_hashtag.keyword = hashtag_filter_array;
            $.ajax({
                url: "/ajax/filter.php"
                , type: "POST"
                , dataType: "json"
                , data: post_data_hashtag
                , async : false
                , success: function (data) {
                    if(data.result=="1"){
                        hashtag_filter_txt = data.keyword;
                        hashtag_filter=1;
                    }
                }
                , error: function(request, textStatus, errorThrown){
                    //에러내용확인
                    //alert('error: ' + textStatus + request);
                }
            });
            if(hashtag_filter_txt != ''){
                return alert(hashtag_filter_txt + '이 저작권 필터링에 의해 제한되었습니다.');
            }
        }

        //판매물품 검증
        if(document.querySelector('#goodsList').childElementCount > 0){
            for(let i = 0; i < document.querySelector('#goodsList').childElementCount; i++){
                if($('#goodsList li .fix').eq(i).hasClass('display-none') == false ){
                    return [alert('상품 수정을 완료해 주세요.'), document.querySelector('.goodsListComponent').scrollIntoView()];
                }
            }
        }else{
            return [alert('상품을 추가해 주세요.'), document.querySelector('.goodsAddComponent').scrollIntoView()];
        }

        //배송방법 검증
        let hideCnt = 0;
        let deliveryArrayLength = $('li[name=deliveryArray]').length;
        for(let i = 0; i < deliveryArrayLength; i++){
            if(!$('li[name=deliveryArray] .name').eq(i).val() || !$('li[name=deliveryArray] .price').eq(i).val()){
                return [alert('배송 정보를 전부 입력해 주세요.'), document.querySelector('.deliveryComponent').scrollIntoView()];
            }
            if($('li[name=deliveryArray] .dhc').eq(i).get().length > 0 && $('li[name=deliveryArray] .dhc').eq(i).get()[0].checked)
            {
                hideCnt++;
            }
        }       
        if(!$('#qrCodeCheck').is(':checked')){ deliveryArrayLength-= 1; }
        let newdeliveryArrayLength = $('li[name=newdeliveryArray]').length;
        if(deliveryArrayLength == hideCnt && newdeliveryArrayLength==0){
            return [alert('배송 방법을 하나이상 추가해 주세요.'), document.querySelector('.deliveryComponent').scrollIntoView()];
        }        

        //배송예정일 검증
        // if(document.querySelector('#delivery_date_undefined').checked == false){
            if(document.querySelector('#nodate').checked == false && document.querySelector('#delivery_date_select').value == ''){
                return [alert('배송 예정일을 선택해 주세요.'), document.querySelector('.deliveryDateComponent').scrollIntoView()];
            }else if(document.querySelector('#nodate').checked == true && document.querySelector('#nodate_delivery_date_value').value == ''){
                return [alert('배송 예정일을 선택해 주세요.'), document.querySelector('.deliveryDateComponent').scrollIntoView()];
            }else if(document.querySelector('#nodate').checked == true && document.querySelector('#nodate_delivery_date_value').value == 0){
                return [alert('배송 예정일을 1일 이상으로 선택해 주세요'), document.querySelector('.deliveryDateComponent').scrollIntoView()];
            }
        // }
        
        //추가질문 검증
        if(document.querySelector('#questionOpen').checked === true){
            //추가 질문 필수로 받기
            if($('li[name=questionArray]').length <= 0){
                return [alert('추가 질문을 추가해 주세요.'), document.querySelector('.questionComponent').scrollIntoView()];
            }
        }

        //시크릿폼 검증
        if(document.querySelector('#secretFormOpen').checked === true){
            if(!document.querySelector('#secretFormPassword').value){
                return [alert('시크릿폼 비밀번호를 입력해 주세요.'), document.querySelector('.secretFormComponent').scrollIntoView()];
            }

            if(!document.querySelector('#secretFormPasswordHint').value){
                return [alert('시크릿폼 비밀번호 힌트를 입력해 주세요.'), document.querySelector('.secretFormComponent').scrollIntoView()];
            }
        }

        //땡스레터검증
        if(document.querySelector('#thanksLetterUpload').value != '' && document.querySelector('#thanksLetterMessage').value == ''){
            return [alert('감사 메세지를 적어주세요'), document.querySelector('.thanksLetterComponent').scrollIntoView()];
        }

        //판매자동의 검증
        if(document.querySelector('#sellerCheck').checked === false){
            return [alert('판매자 동의는 필수입니다.'), document.querySelector('.sellerAgreeComponent').scrollIntoView()];
        }

        upload();
    }

    function uploadTemp(){
        if($('#goodsDigitalUpload').val() != ''){
            addFileTempPromise('upload_file',document.getElementById("goodsDigitalUpload").files,'1135229');
        }else if($("#thumbnail").val() != ''){ 
            ResizeImageTemp();
        }else if($('#thanksLetterUpload').val() != ''){
            ResizeLetterTemp();
        }else{
            tempSave();
        }        
    }

    function upload(){
        if($('#goodsDigitalUpload').val() != ''){
            addFilePromise('upload_file',document.getElementById("goodsDigitalUpload").files,'1135229');
        }else if($("#thumbnail").val() != ''){ 
            ResizeImage();
        }else if($('#thanksLetterUpload').val() != ''){
            ResizeLetter();
        }else{
            Save();
        }        
    }

    let submit_status = false;
    function tempSave(){
        if(submit_status == true){
            return;
        }


        let formData = new FormData();
        
        //폼정보
        formData.append('temp_form_idx', document.querySelector('#temp_form_idx').value);
        formData.append('form_idx', document.querySelector('#form_idx').value);
        formData.append('form_type', document.querySelector('#form_type').value);
        formData.append('type', document.querySelector('#type').value);

        //썸네일
        formData.append('thumbnail', $("#thumbnail")[0].files[0]);
        formData.append('thumbnail_s3', document.querySelector('#thumbnail_s3').value);
        formData.append('thumbnail_temp', document.querySelector('#thumbnail_temp').value);

        //제목
        formData.append('title', document.querySelector('#title').value);

        //카테고리
        if($('#category_modal input[name=category]').is(':checked') == true){
            formData.append('category_idx', document.querySelector('#category_modal input[name=category]:checked').value);
        }

        //은행정보
        formData.append('bank', $('#bank_name option:selected').val());
        formData.append('account', document.querySelector('#bank_number').value);
        formData.append('depositor', document.querySelector('#bank_depositor').value);
        formData.append('certDate', document.querySelector('#cert_check_date').value);

        //입금기간
        formData.append('startDate', document.querySelector('#result_no_time').value);
        formData.append('startHour', document.querySelector('#result_start_hour').value);
        formData.append('startMin', document.querySelector('#result_start_min').value);
        formData.append('endDate', document.querySelector('#result_no_time_end').value);
        formData.append('endHour', document.querySelector('#result_end_hour').value);
        formData.append('endMin', document.querySelector('#result_end_min').value);
        if(document.querySelector('#nodate').checked == true){
            formData.append('nodate', 1);
        }else{
            formData.append('nodate', '');
        }
        

        //상세설명
//        const content_data = editor.getData();
		const content_data = $("#content").val();
        formData.append('content', content_data);

        //해시태그
        let hashtagArrayLength = $('input[name=hashtagArray]').length;
        for(let i = 0; i < hashtagArrayLength; i++){
            formData.append('hashtag[]', $('input[name=hashtagArray]').eq(i).val());
        }

        //판매상품
        let goodsArrayLength = $('li[name=goodsArray]').length;
        if(goodsArrayLength > 0){
            for(let i = 0; i < goodsArrayLength; i++){
                formData.append('goodsName[]', $('li[name=goodsArray] #goodsArrayName').eq(i).val());
                formData.append('goodsPrice[]', $('li[name=goodsArray] #goodsArrayPrice').eq(i).val());
                formData.append('goodsQuantity[]', $('li[name=goodsArray] #goodsArrayQuantity').eq(i).val());
                if($('li[name=goodsArray] input[name=goodsArrayLimitMaxCheck]').eq(i).is(':checked') == true){
                    formData.append('goodsLimitMaxCheck[]', 1);    
                }else{
                    formData.append('goodsLimitMaxCheck[]', 0);
                }
                formData.append('goodsLimitMaxCount[]', $('li[name=goodsArray] input[name=goodsArrayLimitMaxCount]').eq(i).val());
                formData.append('goodsIdx[]', $('li[name=goodsArray] input[name=goodsArrayIdx]').eq(i).val());
            }
        }

        //참여자 있을때 수정하면서 임시저장>판매상품추가
        
        //판매상품재고공개여부
        if(document.querySelector('#quantity_open').checked == true){
            formData.append('quantity_open', 1);
        }else{
            formData.append('quantity_open', 0);
        }

        //디지털파일
        formData.append('goodsDigitalUpload', $("#goodsDigitalUpload")[0].files[0]);
        formData.append('goodsDigitalUpload_s3', document.querySelector('#goodsDigitalUpload_s3').value);
        formData.append('goodsDigitalUpload_temp', document.querySelector('#goodsDigitalUpload_temp').value);

        //배송방법
        let deliveryArrayLength = $('li[name=deliveryArray]').length;                
        for(let i = 0; i < deliveryArrayLength; i++){
            formData.append('deliveryName[]', $('li[name=deliveryArray] .name').eq(i).val());
            formData.append('deliveryPrice[]', $('li[name=deliveryArray] .price').eq(i).val());            
        }

        //참여자있을때 수정하기에서 임시저장 추가배송방법
                //qrcode 사용
        
        if(document.querySelector('#qrCodeCheck').checked == true){
            formData.append('qrcode_open', 1);
        }else{
            formData.append('qrcode_open', 0);
        }
        
        //배송예정일
        // if(document.querySelector('#delivery_date_undefined').checked == true){
        //     formData.append('deliveryDate', '0000-00-00');
        //     formData.append('nodate_deliveryDate', '0');
        // }else{
            if(document.querySelector('#nodate').checked == false){
                formData.append('deliveryDate', document.querySelector('#delivery_date_select').value);
            }else if(document.querySelector('#nodate').checked == true){
                formData.append('nodate_deliveryDate', document.querySelector('#nodate_delivery_date_value').value);
            }
        // }

        //배송안내
        formData.append('deliveryNotice', document.querySelector('#deliveryNotice').value);

        //추가 질문 받기
        if(document.querySelector('#questionOpen').checked == true){
            formData.append('questionOpen', 1);
        }else{
            formData.append('questionOpen', 0);
        }
        if(document.querySelector('#questionOpen').checked === true){
            //추가 질문 필수로 받기
            if(document.querySelector('#questionCheck').checked == true){
                formData.append('questionCheck', 1);
            }else{
                formData.append('questionCheck', 0);
            }
            let questionArrayLength = $('li[name=questionArray]').length;
            if(questionArrayLength <= 0){
                return [alert('추가 질문을 추가해 주세요.'), document.querySelector('.questionComponent').scrollIntoView()];
            }
            
            for(let i = 0; i < questionArrayLength; i++){
                formData.append('question[]', $('li[name=questionArray] input[type=hidden]').eq(i).val());
            }
        }

        //양도 허용
        if(document.querySelector('#transferOpen').checked == true){
            formData.append('transferOpen', 1);
        }else{
            formData.append('transferOpen', 0);
        }

        //추가 설정
        if(document.querySelector('#deliveryReceiveCheck').checked == true){
            formData.append('deliveryReceiveCheck', 1);
        }else{
            formData.append('deliveryReceiveCheck', 0);
        }
        if(document.querySelector('#refundReceiveCheck').checked == true){
            formData.append('refundReceiveCheck', 1);
        }else{
            formData.append('refundReceiveCheck', 0);
        }
        if(document.querySelector('#noneMemberCheck').checked == true){
            formData.append('noneMemberCheck', 1);
        }else{
            formData.append('noneMemberCheck', 0);
        }

        //SNS계정 받기
        if(document.querySelector('#receiveInstargram').checked == true){
            formData.append('receiveInstargram', 1);
        }else{
            formData.append('receiveInstargram', 0);
        }
        if(document.querySelector('#essentialInstagram').checked == true){
            formData.append('essentialInstagram', 1);
        }else{
            formData.append('essentialInstagram', 0);
        }
        if(document.querySelector('#receiveTwitter').checked == true){
            formData.append('receiveTwitter', 1);
        }else{
            formData.append('receiveTwitter', 0);
        }
        if(document.querySelector('#essentialTwitter').checked == true){
            formData.append('essentialTwitter', 1);
        }else{
            formData.append('essentialTwitter', 0);
        }

        //나이제한서비스
        if(document.querySelector('#limitAgeOpen').checked == true){
            formData.append('limitAgeOpen', 1);
        }else{
            formData.append('limitAgeOpen', 0);
        }
        if(document.querySelector('#limitAgeOpen').checked === true){
            //제한나이값
            formData.append('limitAge', document.querySelector('input[name=limitAgeRadio]:checked').value);
        }

        //시크릿폼
        if(document.querySelector('#secretFormOpen').checked == true){
            formData.append('secretFormOpen', 1);
        }else{
            formData.append('secretFormOpen', 0);
        }
        if(document.querySelector('#secretFormOpen').checked === true){
            if(!document.querySelector('#secretFormPassword').value){
                return [alert('시크릿폼 비밀번호를 입력해 주세요.'), document.querySelector('.secretFormComponent').scrollIntoView()];
            }

            if(!document.querySelector('#secretFormPasswordHint').value){
                return [alert('시크릿폼 비밀번호 힌트를 입력해 주세요.'), document.querySelector('.secretFormComponent').scrollIntoView()];
            }
            //시크릿폼 비번
            formData.append('secretFormPassword', document.querySelector('#secretFormPassword').value);
            //시크릿폼 비번힌트
            formData.append('secretFormPasswordHint', document.querySelector('#secretFormPasswordHint').value);
        }

        //폼 공개 여부
        if(document.querySelector('#formViewCheck').checked == true){
            formData.append('formViewCheck', 1);
        }else{
            formData.append('formViewCheck', 0);
        }

        //푸시 및 알림
        if(document.querySelector('#appPushCheck').checked == true){
            formData.append('appPushCheck', 1);
        }else{
            formData.append('appPushCheck', 0);
        }
        if(document.querySelector('#requestPushCheck').checked == true){
            formData.append('requestPushCheck', 1);
        }else{
            formData.append('requestPushCheck', 0);
        }

        //땡스레터
        formData.append('thanksLetterUpload', $("#thanksLetterUpload")[0].files[0]);
        formData.append('letter_image_s3', document.querySelector('#letter_image_s3').value);
        formData.append('letter_image_temp', document.querySelector('#letter_image_temp').value);
        formData.append('thanksLetterMessage', document.querySelector('#thanksLetterMessage').value);

        //마케팅동의
        if(document.querySelector('#marketingCheck').checked == true){
            formData.append('marketingCheck', 1);
        }else{
            formData.append('marketingCheck', 0);
        }

        $.ajax({
            async: false
            , url: "/formMaker/ajax/ajax_temp_save_slim.php"
            , type: "POST"
            , dataType: "json"
            , data: formData
            , processData: false
            , contentType: false
            , success: function (data) {
                if(data!=""){
                    if(data.result=='SUCCESS'  && data.temp_form_idx!=''){ 
                        alert("임시 저장되었습니다.");
                        location.href='?temp_form_idx='+data.temp_form_idx;
      
                    }else{
                        alert(data.msg);
                        location.href=data.url;
                    }
                    // else console.log(data.sql1);
                }
                submit_status = true;
            }
            , error: function(request, textStatus, errorThrown){
            //에러내용확인
                alert('error: ' + textStatus);
                submit_status = true;
            }
        });

    }


    function Save(){
        if(submit_status == true){
            return
        }

        let formData = new FormData();
        
        //폼정보
        formData.append('temp_form_idx', document.querySelector('#temp_form_idx').value);
        formData.append('form_idx', document.querySelector('#form_idx').value);
        formData.append('form_type', document.querySelector('#form_type').value);
        formData.append('type', document.querySelector('#type').value);
		formData.append('copy_idx', document.querySelector('#copy_idx').value);
		formData.append('copy_type', document.querySelector('#copy_type').value);

        //썸네일
        formData.append('thumbnail', $("#thumbnail")[0].files[0]);
        formData.append('thumbnail_s3', document.querySelector('#thumbnail_s3').value);
        formData.append('thumbnail_temp', document.querySelector('#thumbnail_temp').value);

        //제목
        formData.append('title', document.querySelector('#title').value);

        //카테고리
        if($('#category_modal input[name=category]').is(':checked') == true){
            formData.append('category_idx', document.querySelector('#category_modal input[name=category]:checked').value);
        }

        //은행정보
        formData.append('bank', $('#bank_name option:selected').val());
        formData.append('account', document.querySelector('#bank_number').value);
        formData.append('depositor', document.querySelector('#bank_depositor').value);
        formData.append('certDate', document.querySelector('#cert_check_date').value);

        //입금기간
        formData.append('startDate', document.querySelector('#result_no_time').value);
        formData.append('startHour', document.querySelector('#result_start_hour').value);
        formData.append('startMin', document.querySelector('#result_start_min').value);
        formData.append('endDate', document.querySelector('#result_no_time_end').value);
        formData.append('endHour', document.querySelector('#result_end_hour').value);
        formData.append('endMin', document.querySelector('#result_end_min').value);
        if(document.querySelector('#nodate').checked == true){
            formData.append('nodate', 1);
        }else{
            formData.append('nodate', '');
        }
        

        //상세설명
//        const content_data = editor.getData();
		const content_data = $("#content").val();
        formData.append('content', content_data);

        //해시태그
        let hashtagArrayLength = $('input[name=hashtagArray]').length;
        for(let i = 0; i < hashtagArrayLength; i++){
            formData.append('hashtag[]', $('input[name=hashtagArray]').eq(i).val());
        }

        //판매상품순서
        const goodsOrderNumberLength = $('input[name=order_name]').length;
        if(goodsOrderNumberLength > 0){
            for(let i = 0; i < goodsOrderNumberLength; i++){
                formData.append('orderNumber[]', $('input[name=order_name]').eq(i).val());
            }
        }

        //판매상품
        let goodsArrayLength = $('li[name=goodsArray]').length;
        if(goodsArrayLength > 0){
            for(let i = 0; i < goodsArrayLength; i++){
                formData.append('goodsName[]', $('li[name=goodsArray] #goodsArrayName').eq(i).val());
                formData.append('goodsPrice[]', $('li[name=goodsArray] #goodsArrayPrice').eq(i).val());
                formData.append('goodsQuantity[]', $('li[name=goodsArray] #goodsArrayQuantity').eq(i).val());
                if($('li[name=goodsArray] input[name=goodsArrayLimitMaxCheck]').eq(i).is(':checked') == true){
                    formData.append('goodsLimitMaxCheck[]', 1);    
                }else{
                    formData.append('goodsLimitMaxCheck[]', 0);
                }
                formData.append('goodsLimitMaxCount[]', $('li[name=goodsArray] input[name=goodsArrayLimitMaxCount]').eq(i).val());
                formData.append('goodsIdx[]', $('li[name=goodsArray] input[name=goodsArrayIdx]').eq(i).val());
            }
        }

        //추가판매상품
        let newgoodsArrayLength = $('li[name=newgoodsArray]').length;
        if(newgoodsArrayLength > 0){
            for(let i = 0; i < newgoodsArrayLength; i++){
                formData.append('newgoodsName[]', $('li[name=newgoodsArray] #newgoodsArrayName').eq(i).val());
                formData.append('newgoodsPrice[]', $('li[name=newgoodsArray] #newgoodsArrayPrice').eq(i).val());
                formData.append('newgoodsQuantity[]', $('li[name=newgoodsArray] #newgoodsArrayQuantity').eq(i).val());
                if($('li[name=newgoodsArray] input[name=newgoodsArrayLimitMaxCheck]').eq(i).is(':checked') == true){
                    formData.append('newgoodsLimitMaxCheck[]', 1);    
                }else{
                    formData.append('newgoodsLimitMaxCheck[]', 0);
                }
                formData.append('newgoodsLimitMaxCount[]', $('li[name=newgoodsArray] input[name=newgoodsArrayLimitMaxCount]').eq(i).val());
            }
        }

        //판매상품재고공개여부
        if(document.querySelector('#quantity_open').checked == true){
            formData.append('quantity_open', 1);
        }else{
            formData.append('quantity_open', 0);
        }

        //디지털파일
        formData.append('goodsDigitalUpload', $("#goodsDigitalUpload")[0].files[0]);
        formData.append('goodsDigitalUpload_s3', document.querySelector('#goodsDigitalUpload_s3').value);
        formData.append('goodsDigitalUpload_temp', document.querySelector('#goodsDigitalUpload_temp').value);
        formData.append('goodsDigitalDeleteCheck', document.querySelector('#goodsDigitalDeleteCheck').value); 

        //배송방법
        let deliveryArrayLength = $('li[name=deliveryArray]').length;                
        for(let i = 0; i < deliveryArrayLength; i++){
            formData.append('deliveryName[]', $('li[name=deliveryArray] .name').eq(i).val());
            formData.append('deliveryPrice[]', $('li[name=deliveryArray] .price').eq(i).val());
            formData.append('deliveryIdx[]', $('li[name=deliveryArray] .delivery_idx').eq(i).val());
            if($('li[name=deliveryArray] .dhc').eq(i).get().length > 0 && $('li[name=deliveryArray] .dhc').eq(i).get()[0].checked)
            {
                formData.append('deliveryHide[]', $('li[name=deliveryArray] .dhc').eq(i).val());
            }
        }
        
        //추가배송방법
        let newdeliveryArrayLength = $('li[name=newdeliveryArray]').length;
        for(let i = 0; i < newdeliveryArrayLength; i++){
            if(!$('li[name=newdeliveryArray] .name').eq(i).val() || !$('li[name=newdeliveryArray] .price').eq(i).val()){
                return [alert('배송 정보를 전부 입력해 주세요.'), document.querySelector('.deliveryComponent').scrollIntoView()];
            }
            formData.append('newdeliveryName[]', $('li[name=newdeliveryArray] .name').eq(i).val());
            formData.append('newdeliveryPrice[]', $('li[name=newdeliveryArray] .price').eq(i).val());
        }

        //qrcode 사용
        if(document.querySelector('#qrCodeCheck').checked == true){
            formData.append('qrcode_open', 1);
        }else{
            formData.append('qrcode_open', 0);
        }
        
       //배송예정일
    //    if(document.querySelector('#delivery_date_undefined').checked == true){
    //         formData.append('deliveryDate', '0000-00-00');
    //         formData.append('nodate_deliveryDate', '0');
    //     }else{
            if(document.querySelector('#nodate').checked == false){
                formData.append('deliveryDate', document.querySelector('#delivery_date_select').value);
            }else if(document.querySelector('#nodate').checked == true){
                formData.append('nodate_deliveryDate', document.querySelector('#nodate_delivery_date_value').value);
            }
        // }

        //배송안내
        formData.append('deliveryNotice', document.querySelector('#deliveryNotice').value);

        //추가 질문 받기
        if(document.querySelector('#questionOpen').checked == true){
            formData.append('questionOpen', 1);
        }else{
            formData.append('questionOpen', 0);
        }
        if(document.querySelector('#questionOpen').checked === true){
            //추가 질문 필수로 받기
            if(document.querySelector('#questionCheck').checked == true){
                formData.append('questionCheck', 1);
            }else{
                formData.append('questionCheck', 0);
            }
            let questionArrayLength = $('li[name=questionArray]').length;
            if(questionArrayLength <= 0){
                return [alert('추가 질문을 추가해 주세요.'), document.querySelector('.questionComponent').scrollIntoView()];
            }
            
            for(let i = 0; i < questionArrayLength; i++){
                formData.append('question[]', $('li[name=questionArray] input[type=hidden]').eq(i).val());
            }
        }

        //양도 허용
        if(document.querySelector('#transferOpen').checked == true){
            formData.append('transferOpen', 1);
        }else{
            formData.append('transferOpen', 0);
        }

        //추가 설정
        if(document.querySelector('#deliveryReceiveCheck').checked == true){
            formData.append('deliveryReceiveCheck', 1);
        }else{
            formData.append('deliveryReceiveCheck', 0);
        }
        if(document.querySelector('#refundReceiveCheck').checked == true){
            formData.append('refundReceiveCheck', 1);
        }else{
            formData.append('refundReceiveCheck', 0);
        }
        if(document.querySelector('#noneMemberCheck').checked == true){
            formData.append('noneMemberCheck', 1);
        }else{
            formData.append('noneMemberCheck', 0);
        }
        if(document.querySelector('#pccCheck').checked == true){
            formData.append('pccCheck', 1);
        }else{
            formData.append('pccCheck', 0);
        }

        //SNS계정 받기
        if(document.querySelector('#receiveInstargram').checked == true){
            formData.append('receiveInstargram', 1);
        }else{
            formData.append('receiveInstargram', 0);
        }
        if(document.querySelector('#essentialInstagram').checked == true){
            formData.append('essentialInstagram', 1);
        }else{
            formData.append('essentialInstagram', 0);
        }
        if(document.querySelector('#receiveTwitter').checked == true){
            formData.append('receiveTwitter', 1);
        }else{
            formData.append('receiveTwitter', 0);
        }
        if(document.querySelector('#essentialTwitter').checked == true){
            formData.append('essentialTwitter', 1);
        }else{
            formData.append('essentialTwitter', 0);
        }

        //나이제한서비스
                if(document.querySelector('#limitAgeOpen').checked == true){
            formData.append('limitAgeOpen', 1);
        }else{
            formData.append('limitAgeOpen', 0);
        }
        if(document.querySelector('#limitAgeOpen').checked === true){
            //제한나이값
            formData.append('limitAge', document.querySelector('input[name=limitAgeRadio]:checked').value);
        }
                //시크릿폼
        if(document.querySelector('#secretFormOpen').checked == true){
            formData.append('secretFormOpen', 1);
        }else{
            formData.append('secretFormOpen', 0);
        }
        if(document.querySelector('#secretFormOpen').checked === true){
            if(!document.querySelector('#secretFormPassword').value){
                return [alert('시크릿폼 비밀번호를 입력해 주세요.'), document.querySelector('.questionComponent').scrollIntoView()];
            }

            if(!document.querySelector('#secretFormPasswordHint').value){
                return [alert('시크릿폼 비밀번호 힌트를 입력해 주세요.'), document.querySelector('.questionComponent').scrollIntoView()];
            }
            //시크릿폼 비번
            formData.append('secretFormPassword', document.querySelector('#secretFormPassword').value);
            //시크릿폼 비번힌트
            formData.append('secretFormPasswordHint', document.querySelector('#secretFormPasswordHint').value);
        }

        //폼 공개 여부
        if(document.querySelector('#formViewCheck').checked == true){
            formData.append('formViewCheck', 1);
        }else{
            formData.append('formViewCheck', 0);
        }

        //푸시 및 알림
        if(document.querySelector('#appPushCheck').checked == true){
            formData.append('appPushCheck', 1);
        }else{
            formData.append('appPushCheck', 0);
        }
        if(document.querySelector('#requestPushCheck').checked == true){
            formData.append('requestPushCheck', 1);
        }else{
            formData.append('requestPushCheck', 0);
        }

        //땡스레터
        formData.append('thanksLetterUpload', $("#thanksLetterUpload")[0].files[0]);
        formData.append('letter_image_s3', document.querySelector('#letter_image_s3').value);
        formData.append('letter_image_temp', document.querySelector('#letter_image_temp').value);
        formData.append('thanksLetterMessage', document.querySelector('#thanksLetterMessage').value);

        //마케팅동의
        if(document.querySelector('#marketingCheck').checked == true){
            formData.append('marketingCheck', 1);
        }else{
            formData.append('marketingCheck', 0);
        }

        
        if(confirm('작성하신 입금폼을 등록하시겠습니까?')){
            			hackleClient.onReady(() => {
				var userId = Hackle.getUserId();

				const user_hackle = {
					id:userId,
					properties:  {
						platform: "pc",
						utm_source: "",
						utm_medium: "",
						utm_campaign: "",
						utm_term: "",
						utm_content: "",
						os: osinfo(),
						login_id: "1135229"
						
					}
				};

				// 사용자 이벤트 전송
				const event = {
				  key: "deposit_form_created",
				  properties: {
					  type : "Slim"					
				  }
				}
				hackleClient.track(event,user_hackle);
			  });
			
            $.ajax({
                async: false
                , url: "/formMaker/ajax/ajax_save_slim.php"
                , type: "POST"
                , dataType: "json"
                , data: formData
                , processData: false
                , contentType: false
                , success: function (data) {                    
                    gtag('event', 'slim_formMaker', {'event_category' : 'formMaker', 'event_label' : '슬림폼생성'});
                    if(data!=""){
                        alert(data.msg);
                        location.href = data.url;
                    }
                    submit_status = true;
                }
                , error: function(request, textStatus, errorThrown){
                    //에러내용확인  
                    alert('error: ' + textStatus);
                    submit_status = true;
                }
            });
        }
    }
