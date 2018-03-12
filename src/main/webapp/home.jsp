<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>한국인식산업(주)</title>
</head>
<body>


 <c:if test="${empty member}">
	<a href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a>
	<form action="${pageContext.request.contextPath}/member/memberLogin">
		<input type="text" id="id" name="id"> <input type="password"
			id="password" name="password">
		<button type="submit">로그인</button>
	</form>
	 </c:if>
	 <c:if test="${!empty member}">
	                     	<li><a id="memberInfo">${member.name}</a></li>
	                     	<a href="${pageContext.request.contextPath}/member/memberLogout" class="logout">로그아웃</a>
	                     </c:if>

</body>
</html>