<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/event.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

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
						<li>
							<a href="${pageContext.request.contextPath }/home">
								<div class="home">
									<img alt="home" src="${pageContext.request.contextPath }/assets/images/main_menu/timeline.png">
									<span> HOME </span>
								</div>
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/search">
								<div class="search">
									<img alt="" src="${pageContext.request.contextPath }/assets/images/main_menu/search.png">
									<span> SEARCH </span>
								</div>
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/dm">
								<div class="dm">
									<img alt=""
										src="${pageContext.request.contextPath }/assets/images/main_menu/dm.png">
									<span> CCUCHAT </span>
								</div>
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/event">
								<div class="event">
									<img alt="" src="${pageContext.request.contextPath }/assets/images/main_menu/event.png">
									<span> EVENT </span>
								</div>
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/profile">
								<div class="profile">
									<img alt="" src="${pageContext.request.contextPath }/assets/images/main_menu/profile.png">
									<span> PROFILE </span>
								</div>
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/settings">
								<div class="settings">
									<img alt="" src="${pageContext.request.contextPath }/assets/images/main_menu/settings.png">
									<span> SETTINGS </span>
								</div>
							</a>
						</li>

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

					<form action="${pageContext.request.contextPath }/event" method="post" enctype="multipart/form-data">

						<div class="upload_detail space">
							<label class="detail_upload" for="chooseFile"> ✔️ 판매 상세 정보 이미지 업로드 ✔️ </label>
							<div class="fileInput">
								<p>업로드한 파일 이름 :</p>
								<a id="fileName"></a>
							</div>
							<input type="file" id="chooseFile" name="chooseFile"
								accept="image/*" onchange="loadFile(this)">
						</div>

						<div class="upload_title space">
							<p>폼 제목</p>
							<input type="text" placeholder="폼 제목을 입력하세요" name="form_title" required>
						</div>

						<div class="upload_genre space">
							<p>어떤 장르의 상품을 판매하시나요?</p>
							<select name="genre" required>
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
						
						<div class="upload_banking space">
							<p>계좌 정보</p>
							<select name="beneficiary" required>
								<option value="">입금받을 계좌 정보를 선택해주세요.</option>
								<option>DB에서 가져오는 유저 계좌</option>
								<option>새로운 계좌 추가하기</option>
							</select>
						</div>
						
						<div class="upload_duration space">
							<p>판매 기간</p>
							<div class="sale_duration">
								<p class="subtxt">폼 시작일</p>
								<input type="date" id="date" name="datetime" value="" min="2023-01-01" max="2024-12-31" required>
								<input type="time">
							</div>
							<div class="sale_duration">
								<p class="subtxt">폼 종료일</p>
								<input type="date" id="date" name="datetime" value="" min="2023-01-01" max="2024-12-31" required>
								<input type="time">
							</div>
							<br>
							<input type="checkbox" name="for_sale" value="상시판매"> 상시 판매
						</div>
						
						<p>상세 설명</p>
						<div class="upload_overview space">
							<input type="text" size="90" placeholder="내용을 작성해주세요.">
						</div>
						
						<div class="upload_tag space">
							<p>해시태그 입력</p>
							<ul id="tag-list">
        					</ul>
							<input type="text" id="tag" size="20" placeholder="#태그 입력하기">
						</div>

						<div  class="space">
							<span>상품정보 입력</span>
							<span class="subtxt">재고를 제외한 상품 정보는 구매 발생 전까지만 수정 가능합니다.</span>
							<div class="upload_overview boxing space">
								<span>상품명</span>
								<input type="text" size="70" placeholder="상품명을 입력해주세요">
								<br>
								<span>가격&nbsp;&nbsp;&nbsp;</span>
								<input type="text" size="70" placeholder="가격을 입력해주세요">
								<br>
								<span>재고&nbsp;&nbsp;&nbsp;</span>
								<input type="text" size="20" placeholder="최대 100,000개">
								<span>구매개수 제한</span>
								<input type="checkbox" name="limit" value="limit">
								<input type="text" name="limit" value="limit" placeholder="0000개">
							</div>
							<button>상품등록</button>
						</div>
						
						<div class="upload_delivery space">
							<p>배송방법 입력</p>
							<p class="subtxt">배송방법 수정은 구매 발생 전 까지만 가능합니다.</p>
							<p class="subtxt" style="color:red;">*현장수령 거래는 원활한 정산을 위해 QR코드를 통한 수령완료를 꼭 확인해주세요</p>
							<input type="text" placeholder="배송 방법">
						</div>

						<div class="upload_delvdate space">
							<p>배송 예정일</p>
							<input type="date">
						</div>
						
						<div class="upload_delvnotice space">
							<p>배송 안내</p>
							<input type="text" placeholder="배송에 대한 안내가 필요할 경우 작성해 주세요">
						</div>

						<div class="upload_qna space">
							<span>추가 질문 받기</span>
							<label class="switch">
							  <input type="checkbox" value="qna open" onclick="addQues()">
							  <span class="slider round"></span>
							</label>
							<div>
								<p id="qna" style="display:none;">qna!!!</p>
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

<!-- jquery import -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- java script -->
<script type="text/javascript">
/* img file import */
function loadFile(input) {
    var file = input.files[0];	//선택된 파일 가져오기

    //미리 만들어 놓은 div에 text(파일 이름) 추가
    var name = document.getElementById('fileName');
    name.textContent = file.name;

};


/* create hashtag */
$(document)
.ready(function () {

  var tag = {};
  var counter = 0;

  // 태그를 추가한다.
  function addTag(value) {
    tag[counter] = value; // 태그를 Object 안에 추가
    counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
  }

  // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
  function marginTag() {
    return Object.values(tag)
      .filter(function (word) {
        return word !== "";
      });
  }

  $("#tag")
    .on("keyup", function (e) {
      var self = $(this);
      console.log("keypress");

      // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
      if (e.key === "Enter" || e.keyCode == 32) {

        var tagValue = self.val(); // 값 가져오기

        // 값이 없으면 동작 안합니다.
        if (tagValue !== "") {

          // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
          var result = Object.values(tag)
            .filter(function (word) {
              return word === tagValue;
            })

          // 태그 중복 검사
          if (result.length == 0) {
            $("#tag-list")
              .append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'>x</span></li>");
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
  $(document)
    .on("click", ".del-btn", function (e) {
      var index = $(this)
        .attr("idx");
      tag[index] = "";
      $(this)
        .parent()
        .remove();
    });
});



function addQues() {
	var target=document.querySelector('#qna');
	console.log(this.value);
	if (this.value==='qna close'){
		  target.style.display = 'none';
		  this.value = 'qna open';
	}
	else {
		  target.style.display = 'block';
		  this.value = 'qna close';
	}
}
</script>

</html>