<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<title>회원가입</title>
<link
	href="${pageContext.request.contextPath}/resources/css/memberJoin.css"
	rel="stylesheet">
<!-- <script type="text/javascript">
	$(function() {

		var message = "${message}";

		if (message != "") {
			alert(message);
		}

		var naverCheck = "${sessionScope.naverId}";
		var agree1 = 0;
		var agree2 = 0;
		var agree3 = 0;
	

		if (naverCheck != "") {
			agree1 = 1;
		}

		//id체크
		$("#id")
				.change(
						function() {
							if ($(this).val().match(/\W/g)) {
								alert("특수문자는 입력이 불가능합니다.");
								$(this).val("");
								agree1 = 0;
							} else if ($(this).val().length < 8) {
								alert("8자리 이상의 아이디를 입력하세요.");
								$(this).val("");
								agree1 = 0;
							} else {
								$
										.ajax({
											type : "post",
											url : "./memberIdCheck",

											data : {
												"checkId" : $(this).val()
											},
											success : function(data) {
												var result = data;

												if (result.trim() == "사용 가능한 아이디입니다.") {
													$("#idCheckResult").css(
															"color", "#29d336");
													agree1 = 1;
													console.log(agree1);
												} else {
													$("#idCheckResult").css(
															"color", "red");
													agree1 = 0;
												}

												if (agree1 + agree2 + agree3 + agree4 == 4) {
													$("#subBtn")
															.css(
																	"background-color",
																	"RGB(18, 165, 244)");
												} else {
													$("#subBtn").css(
															"background-color",
															"darkgrey");
												}

												$("#idCheckResult").html(data);
											}
										});
							}

						});
		//pw체크
		function passwordCheck(str) {
			var check2 = false;

			if (str.match(/\W/g) != null && str.match(/\d/g) != null
					&& str.match(/^[a-z]/g) != null && str.length > 8) {
				check2 = true;
			}

			return check2;
		}
		$("#pw").change(
				function() {

					if ($(this).val().length > 15) {
						alert("비밀번호는 15자리까지만 가능합니다.");
					}

					if (passwordCheck($(this).val())) {
						$("#pwCheckResult1").css("color", "#29d336");
						$("#pwCheckResult1").html("사용 가능한 비밀번호 입니다.");
						agree2 = 1;
					} else {
						$("#pwCheckResult1").css("color", "red");
						$("#pwCheckResult1").html("사용이 불가능한 비밀번호 입니다.");
						agree2 = 0;
					}

					if ($("#pwCheck").val() == "") {
						$("#pwCheckResult2").html("");
					} else if ($(this).val() != $("#pwCheck").val()) {
						$("#pwCheckResult2").css("color", "red");
						$("#pwCheckResult2").html("비밀번호가 다릅니다. 다시한번 입력해주세요.");
						agree2 = 0;
					} else {
						$("#pwCheckResult2").css("color", "#29d336");
						$("#pwCheckResult2").html("비밀번호가 일치합니다.");
						agree2 = 1;
					}

					if (agree1 + agree2 + agree3 + agree4 == 4) {
						$("#subBtn").css("background-color",
								"RGB(18, 165, 244)");
					} else {
						$("#subBtn").css("background-color", "darkgrey");
					}
				});
		
		
		
		$("#pwCheck").change(
				function() {

					if ($(this).val() === $("#pw").val()) {
						$("#pwCheckResult2").css("color", "#29d336");
						$("#pwCheckResult2").html("비밀번호가 일치합니다.");
						agree3 = 1;
					} else if ($(this).val() == "") {
						$("#pwCheckResult2").html("");
						agree3 = 0;
					} else {
						$("#pwCheckResult2").css("color", "red");
						$("#pwCheckResult2").html("비밀번호가 다릅니다. 다시한번 입력해주세요.");
						agree3 = 0;
					}

					if (agree1 + agree2 + agree3 + agree4 == 4) {
						$("#subBtn").css("background-color",
								"RGB(18, 165, 244)");
					} else {
						$("#subBtn").css("background-color", "darkgrey");
					}
					
					
				});
		
		$("#name").change(
				function() {

					if ($(this).val().length > 15) {
						alert(" 이름이 너무 깁니다.");
						agree4 = 0;
					}
					else{

					
						agree4 = 1;
					}
				

					if (agree1 + agree2 + agree3 + agree4 == 4) {
						$("#subBtn").css("background-color",
								"RGB(18, 165, 244)");
					} else {
						$("#subBtn").css("background-color", "darkgrey");
					}
					
					if(agree1+agree2+agree3 + agree4== 4)
					{
						$("#frm").submit();				
					}
					else
					{
						alert("필수 입력란을 모두 입력해주세요.");
					}
				});

	});
</script> -->
</head>
<body>

	<%-- <section>
		<div class="allContents">
			<div class="rightContents">
				<div class="contents_header">
					${menuTitle}<span>&nbsp;("*" 는 필수 입력 사항입니다.)</span>
				</div>
				<div class="contents_wrapper">
					<form id="frm"
						action="${pageContext.request.contextPath}/member/memberJoin"
						method="post">
						<table class="joinForm">
							<tr>
								<td class="joinTitles"><h4>
										아이디<span class="required_mark">*</span>
									</h4></td>
								<td colspan="4">
										<input type="text" class="form-control"
											placeholder="8~15자리의 아이디를 입력하세요." name="id" id="id"
											maxlength="15">
									<div id="idCheckResult" class="checkResult"></div></td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>
										패스워드<span class="required_mark">*</span>
									</h4></td>
								<td colspan="4"><input type="password" class="form-control"
									placeholder="8~15자리의 영문/숫자/특수문자 각 1개 이상 혼용 사용" name="pw"
									id="pw" maxlength="15"> <span id="pwCheckResult1"
									class="checkResult"></span></td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>
										패스워드 확인<span class="required_mark">*</span>
									</h4></td>
								<td colspan="4"><input type="password" class="form-control"
									placeholder="8~15자리의 영문/숫자/특수문자 각 1개 이상 혼용 사용" id="pwCheck"
									maxlength="15"> <span id="pwCheckResult2"
									class="checkResult"></span></td>
							</tr>
							<tr>
								<td class="joinTitles"><h4>
										이름<span class="required_mark">*</span>
									</h4></td>
								<td colspan="4">
										<input type="text" class="form-control"
											placeholder="이름을 입력하세요." name="name" id="name">
									</td>
							</tr>
							
							<tr style="height: 30px;"></tr>

						</table>
						<input type="hidden" id="age" name="age" value=""> <input
							type="hidden" id="email" name="email" value=""> <input
							type="hidden" id="address" name="address" value="">
						<div class="contents_btn">
							<input type="button" id="subBtn" value="가입 "> <a
								href="../home.jsp">취소</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section> --%>

	<form id="frm"
		action="${pageContext.request.contextPath}/member/memberJoin"
		method="post">
		<div class="contents_btn">
			<input type="text" placeholder="아이디" name="id" id="id" maxlength="15">
			<input type="password" placeholder="비밀번호" name="pw" id="pw"
				maxlength="15"> <input type="text" placeholder="이름을 입력하세요."
				name="name" id="name"> <input type="submit" id="subBtn"
				value="가입 "> <a href="../home.jsp">취소</a>
		</div>




	</form>

</body>
</html>