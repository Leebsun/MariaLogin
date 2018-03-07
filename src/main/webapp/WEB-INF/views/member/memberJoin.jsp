<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<title>회원가입</title>
<link href="${pageContext.request.contextPath}/resources/css/memberJoin.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		
		var message = "${message}";
		
		if(message != "")
		{
			alert(message);
		}
		
		var naverCheck = "${sessionScope.naverId}";
		var agree1 = 0;
		var agree2 = 0;
		var agree3 = 0;
		var agree4 = 0;
		var agree5 = 0;
		var agree6 = 0;
		var agree7 = 0;
		
		if(naverCheck != "")
		{
			agree1 = 1;
		}
		
	//id체크
		$("#id").change(function(){
			if($(this).val().match(/\W/g))
			{
				alert("특수문자는 입력이 불가능합니다.");
				$(this).val("");
				agree1 = 0;
			}
			else if($(this).val().length < 8)
			{
				alert("8자리 이상의 아이디를 입력하세요.");
				$(this).val("");
				agree1 = 0;
			}
			else
			{
				$.ajax({
					type:"post",
					url:"./memberIdCheck",
					
					data: {"checkId":$(this).val()},
					success:function(data){
						var result = data;
						
						if(result.trim() == "사용 가능한 아이디입니다.")
						{
							$("#idCheckResult").css("color", "#29d336");
							agree1 = 1;
							console.log(agree1);
						}
						else
						{
							$("#idCheckResult").css("color", "red");
							agree1 = 0;
						}
						
						if(agree1+agree2+agree3+agree4+agree5+agree6+agree7 == 7)
						{
							$("#subBtn").css("background-color", "RGB(18, 165, 244)");
						}
						else
						{
							$("#subBtn").css("background-color", "darkgrey");
						}
						
						$("#idCheckResult").html(data);
					}
				});
			}
			
		});
	//pw체크
		function passwordCheck(str) {
			var check2 = false;
			
			if(str.match(/\W/g) != null && str.match(/\d/g) != null && str.match(/^[a-z]/g) != null && str.length > 8)
			{
				check2 = true;
			}
			
			return check2;
		}
		$("#pw").change(function(){
			
			if($(this).val().length > 15)
			{
				alert("비밀번호는 15자리까지만 가능합니다.");
			}
			
			if(passwordCheck($(this).val()))
			{
				$("#pwCheckResult1").css("color", "#29d336");
				$("#pwCheckResult1").html("사용 가능한 비밀번호 입니다.");
				agree2 = 1;
			}
			else
			{
				$("#pwCheckResult1").css("color", "red");
				$("#pwCheckResult1").html("사용이 불가능한 비밀번호 입니다.");
				agree2 = 0;
			}
			
			if($("#pwCheck").val() == "")
			{
				$("#pwCheckResult2").html("");
			}
			else if($(this).val() != $("#pwCheck").val())
			{
				$("#pwCheckResult2").css("color", "red");
				$("#pwCheckResult2").html("비밀번호가 다릅니다. 다시한번 입력해주세요.");
				agree2 = 0;
			}
			else
			{
				$("#pwCheckResult2").css("color", "#29d336");
				$("#pwCheckResult2").html("비밀번호가 일치합니다.");
				agree2 = 1;
			}
			
			if(agree1+agree2+agree3+agree4+agree5+agree6+agree7 == 7)
			{
				$("#subBtn").css("background-color", "RGB(18, 165, 244)");
			}
			else
			{
				$("#subBtn").css("background-color", "darkgrey");
			}
		});
		$("#pwCheck").change(function(){
			
			if($(this).val() === $("#pw").val())
			{
				$("#pwCheckResult2").css("color", "#29d336");
				$("#pwCheckResult2").html("비밀번호가 일치합니다.");
				agree3 = 1;
			}
			else if($(this).val() == "")
			{
				$("#pwCheckResult2").html("");
				agree3 = 0;
			}
			else
			{
				$("#pwCheckResult2").css("color", "red");
				$("#pwCheckResult2").html("비밀번호가 다릅니다. 다시한번 입력해주세요.");
				agree3 = 0;
			}
			
			if(agree1+agree2+agree3+agree4+agree5+agree6+agree7 == 7)
			{
				$("#subBtn").css("background-color", "RGB(18, 165, 244)");
			}
			else
			{
				$("#subBtn").css("background-color", "darkgrey");
			}
		});
		
		
	//전화번호
		$("#phone").change(function(){
			
			if($(this).val().match(/^[0-9]/g) != null && $(this).val().match(/\W/g) == null)
			{
				if($(this).val().length == 11)
				{
					$(this).val($(this).val().substring(0,3)+"-"+$(this).val().substring(3,7)+"-"+$(this).val().substring(7,11));
					agree4 = 1;
				}
				else if($(this).val().length == 10)
				{
					$(this).val($(this).val().substring(0,3)+"-"+$(this).val().substring(3,6)+"-"+$(this).val().substring(6,10));
					agree4 = 1;
				}
				else if($(this).val().length == 9)
				{
					$(this).val($(this).val().substring(0,2)+"-"+$(this).val().substring(2,5)+"-"+$(this).val().substring(5,9));
					agree4 = 1;
				}
				else
				{
					alert("9~11자리 번호를 입력해주세요.");
					$(this).val("");
					agree4 = 0;
				}
			}
			else
			{
				alert("숫자만 입력 가능합니다.");
				$(this).val("");
				agree4 = 0;
			}
			
			if(agree1+agree2+agree3+agree4+agree5+agree6+agree7 == 7)
			{
				$("#subBtn").css("background-color", "RGB(18, 165, 244)");
			}
			else
			{
				$("#subBtn").css("background-color", "darkgrey");
			}
		});
		
	//생년월일
		$("#year").change(function(){
			
			if($(this).val().match(/^[a-z]/g) != null || $(this).val().match(/\W/g) != null || $(this).val().match(/^[A-Z]/g) != null)
			{
				alert("숫자만 입력해주세요.");
				$(this).val("");
				agree5 = 0;
			}
			else if($(this).val() == "")
			{
				agree5 = 0;
			}
			else
			{
				agree5 = 1;
			}
			
			if(agree1+agree2+agree3+agree4+agree5+agree6+agree7 == 7)
			{
				$("#subBtn").css("background-color", "RGB(18, 165, 244)");
			}
			else
			{
				$("#subBtn").css("background-color", "darkgrey");
			}
		});
		$("#month").change(function(){
			
			if($(this).val()>12)
			{
				alert("1 ~ 12의 숫자를 입력해 주세요.");
				$(this).val("");
			}
			
			if($(this).val().match(/^[a-z]/g) != null || $(this).val().match(/\W/g) != null || $(this).val().match(/^[A-Z]/g) != null)
			{
				alert("숫자만 입력해주세요.");
				$(this).val("");
				agree6 = 0;
			}
			else if($(this).val() == "")
			{
				agree6 = 0;
			}
			else
			{
				agree6 = 1;
			}
			if(agree1+agree2+agree3+agree4+agree5+agree6+agree7 == 7)
			{
				$("#subBtn").css("background-color", "RGB(18, 165, 244)");
			}
			else
			{
				$("#subBtn").css("background-color", "darkgrey");
			}
		});
		$("#day").change(function(){
			
			if($(this).val().match(/^[a-z]/g) != null || $(this).val().match(/\W/g) != null || $(this).val().match(/^[A-Z]/g) != null)
			{
				alert("숫자만 입력해주세요.");
				$(this).val("");
				agree7 = 0;
			}
			else if($(this).val() == "")
			{
				agree7 = 0;
			}
			else
			{
				agree7 = 1;
			}
			if(agree1+agree2+agree3+agree4+agree5+agree6+agree7 == 7)
			{
				$("#subBtn").css("background-color", "RGB(18, 165, 244)");
			}
			else
			{
				$("#subBtn").css("background-color", "darkgrey");
			}
		});
	
	//이메일 readonly
		$("#emailSelect").change(function(){
			if($(this).val() == 'naver')
			{
				$("#emailSelected").val("naver.com");
				$("#emailSelected").prop("readonly", true);
			}
			else if($(this).val() == 'hanmail')
			{
				$("#emailSelected").val("hanmail.net");
				$("#emailSelected").prop("readonly", true);
			}
			else if($(this).val() == 'google')
			{
				$("#emailSelected").val("gmail.com");
				$("#emailSelected").prop("readonly", true);
			}
			else if($(this).val() == 'nate')
			{
				$("#emailSelected").val("nate.com");
				$("#emailSelected").prop("readonly", true);
			}
			else
			{
				$("#emailSelected").val("");
				$("#emailSelected").prop("readonly", false);
			}
		});

        $('.drop').on({
            
            'dragover':function(e){
            	$(".drop").css("background-color", "RGB(18, 165, 244)");
                e.preventDefault();
            },
            'dragenter':function(e){
                e.preventDefault();
            },
            'dragleave':function(e){
            	$(".drop").css("background-color", "white");
                e.preventDefault();
            },
			'drop':function(e){
                
            	var f = e.originalEvent.dataTransfer.files[0];
                var reader = new FileReader();
                
                $(reader).on('load',function(f){
                   $('#dropped').attr('src',reader.result);
                   //$("input[type='file']").prop("files", e.originalEvent.dataTransfer.files[0]);
                   $(".drop").css("background-color", "white");
                });
                
                reader.readAsDataURL(f);
                e.preventDefault();
                
            }
        });
        
		$("#delBtn").click(function(){
			$('#dropped').attr('src','../resources/images/defaultProfile.PNG');
			$("#fileInput").val("");
		});
	
		$("#subBtn").click(function(){
			var age = $("#year").val()+"-"+$("#month").val()+"-"+$("#day").val();
			var email = $("#emailWrite").val()+"@"+$("#emailSelected").val();
			var address = $("#sample6_address").val()+"/"+$("#sample6_address2").val();
			$("#age").val(age);
			$("#email").val(email);
			$("#address").val(address);
			
			if(agree1+agree2+agree3+agree4+agree5+agree6+agree7 == 7)
			{
				$("#frm").submit();				
			}
			else
			{
				alert("필수 입력란을 모두 입력해주세요.");
			}

		});
		
	});
</script>
</head>
<body>

<section>
		<div class="allContents">
			<div class="rightContents">
				<div class="contents_header">
					${menuTitle}<span>&nbsp;("*" 는 필수 입력 사항입니다.)</span>	
				</div>
				<div class="contents_wrapper">
					<form id="frm" action="${pageContext.request.contextPath}/member/memberJoin" method="post" enctype="multipart/form-data">
						<table class="joinForm">
							<tr>
								<td class="joinTitles"><h4>아이디<span class="required_mark">*</span></h4></td>
								<td colspan="4">
									<c:if test="${!empty sessionScope.naverId}">
										<input type="text" class="form-control" placeholder="아이디를 입력하세요." name="id" id="id" value="${sessionScope.naverId}" readonly="readonly">
									</c:if>
									<c:if test="${empty sessionScope.naverId}">
										<input type="text" class="form-control" placeholder="8~15자리의 아이디를 입력하세요." name="id" id="id" maxlength="15">	
									</c:if>
									<div id="idCheckResult" class="checkResult"></div>
								</td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>패스워드<span class="required_mark">*</span></h4></td>
								<td colspan="4">
									<input type="password" class="form-control" placeholder="8~15자리의 영문/숫자/특수문자 각 1개 이상 혼용 사용" name="pw" id="pw" maxlength="15">
									<span id="pwCheckResult1" class="checkResult"></span>
								</td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>패스워드 확인<span class="required_mark">*</span></h4></td>
								<td colspan="4">
									<input type="password" class="form-control" placeholder="8~15자리의 영문/숫자/특수문자 각 1개 이상 혼용 사용" id="pwCheck" maxlength="15">
									<span id="pwCheckResult2" class="checkResult"></span>
								</td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>이름<span class="required_mark">*</span></h4></td>
								<td colspan="4">
									<c:if test="${!empty sessionScope.naverName}">
										<input type="text" class="form-control" placeholder="이름을 입력하세요." name="name" id="name" value="${sessionScope.naverName}">									
									</c:if>
									<c:if test="${empty sessionScope.naverName}">
										<input type="text" class="form-control" placeholder="이름을 입력하세요." name="name" id="name">
									</c:if>
								</td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>휴대폰 번호<span class="required_mark">*</span></h4></td>
								<td colspan="4">
									<input type="text" class="form-control" placeholder="'-'을 제거하고 입력하세요" name="phone" id="phone" maxlength="13">
								</td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>이메일 주소<span class="required_mark">*</span></h4></td>
								<td>
									<input type="text" class="form-control" placeholder="이메일" id="emailWrite">
								</td>
								<td style="text-align: center;">@</td>
								<td>
									<select id="emailSelect">
											<option selected="selected" value="write">직접입력</option>
											<option value="naver">네이버</option>
											<option value="hanmail">한메일</option>
											<option value="google">구글</option>
											<option value="nate">네이트</option>
									</select>
								</td>
								<td>
									<input id="emailSelected" type="text" class="form-control">
								</td>
							</tr>
							<tr id="birth">
								<td class="joinTitles"><h4>생년월일<span class="required_mark">*</span></h4></td>
								<td>
									<input type="text" class="form-control" id="year" placeholder="XXXX" name="year" maxlength="4" style="text-align: center; display: inline-block; width: 80%;"> 년
								</td>
								<td>
									<input type="text" class="form-control" id="month" placeholder="XX" name="month" maxlength="2" style="text-align: center; display: inline-block; width: 80%;"> 월
								</td>
								<td>
									<input type="text" class="form-control" id="day" placeholder="XX" name="day" maxlength="2" style="text-align: center; display: inline-block; width: 80%;" > 일
								</td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>주소</h4></td>
								<td colspan="4">
									<input type="hidden" id="sample6_postcode" placeholder="우편번호">
									<input type="text" onclick="sample6_execDaumPostcode()" id="sample6_address" class="form-control" readonly="readonly" style=" display: inline-block; width: 80%;">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="height: 32px;"><br><br>
									<input type="text" id="sample6_address2" class="form-control" placeholder="상세주소를 입력해주세요." style=" display: inline-block; width: 100%;">
									
									<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
									<script> //다음 우편 API
									    function sample6_execDaumPostcode() {
									        new daum.Postcode({
									            oncomplete: function(data) {
									                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
									
									                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
									                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									                var fullAddr = ''; // 최종 주소 변수
									                var extraAddr = ''; // 조합형 주소 변수
									
									                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
									                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									                    fullAddr = data.roadAddress;
									
									                } else { // 사용자가 지번 주소를 선택했을 경우(J)
									                    fullAddr = data.jibunAddress;
									                }
									
									                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
									                if(data.userSelectedType === 'R'){
									                    //법정동명이 있을 경우 추가한다.
									                    if(data.bname !== ''){
									                        extraAddr += data.bname;
									                    }
									                    // 건물명이 있을 경우 추가한다.
									                    if(data.buildingName !== ''){
									                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
									                    }
									                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
									                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
									                }
									
									                // 우편번호와 주소 정보를 해당 필드에 넣는다.
									                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
									                document.getElementById('sample6_address').value = fullAddr;
									
									                // 커서를 상세주소 필드로 이동한다.
									                document.getElementById('sample6_address2').focus();
									            }
									        }).open();
									    }
									</script>
								</td>
							</tr>
							<tr style="height: 30px;"></tr>
						
						</table>
						<input type="hidden" id="age" name="age" value="">
						<input type="hidden" id="email" name="email" value="">
						<input type="hidden" id="address" name="address" value="">
						<div class="contents_btn">
							<input type="button" id="subBtn" value="가입 ">
							<a href="../home.jsp">취소</a>
						</div>
	  				</form>
				</div>
			</div>
		</div>
	</section>

</body>
</html>