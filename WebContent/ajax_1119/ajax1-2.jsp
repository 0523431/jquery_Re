<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>

<h2>
	안녕하세요 ${param.name}입니다.
	<br>
	나이는 ${param.age}입니다.
	<br>
	혈액형은 ${param.blood}입니다.
</h2>

<!--
	이 페이지가 서버
	html에서 요청을 하면, parameter값 2개를 받아서 
-->
