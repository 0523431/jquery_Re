<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%-- 
	DB를 연결해서 member의 정보를 가져와야함
	그 방법은 마이바티스 연결하는게 있고
	지금은 JSTL을 이용할 거야 그러기 위해서 jstl.jar파일이랑 mariadb.jar파일을 WEB-INF > lib에 복사
	
	JSTL은 우리가 3개를 배웠어
	- co tag
	- fmt tag
	- function
	그리고 지금 배우는게
	- sql
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<fmt:requestEncoding value="UTF-8" /> <%-- 파라미터 값을 인코딩 --%>
<%-- 데이터베이스의 Connection 객체 생성 --%>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
				   url="jdbc:mariadb://localhost:3306/classdb"
				   user="scott"
				   password="1234" />

<%--
	executeQuery(sql)의 결과를 rs가 받게 됨
	resultSet의 기능을 가진 객체가 되는 거
--%>
	<!-- 프로젝트에서는 mybatis를 이용해야함 ....? ㅠㅠㅠ 우엑 -->
<sql:query var="rs" dataSource="${conn}">
	select * from member where id=? and pass=?
	<sql:param>
		${param.id}
	</sql:param>
	<sql:param>
		${param.pass}
	</sql:param>
</sql:query>

<c:if test="${!empty rs.rows}">
	<c:forEach var="mem" items="${rs.rows}">
		반갑습니다. ${mem.name}님<br>
		${mem.name}님 성별은 ${mem.gender==1? "남자":"여자"}<br>
		전화번호 ${mem.tel}님<br>
		이메일 ${mem.email}님
	</c:forEach>
	
	(forEach 안쓰고 출력) 반갑습니다. ${rs.rows[0].name}님
</c:if>

<c:if test="${empty rs.rows}">
	아이디 또는 비밀번호가 틀립니다
</c:if>