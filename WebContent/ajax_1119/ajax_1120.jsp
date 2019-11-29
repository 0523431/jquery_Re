<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%-- 
	DB�� �����ؼ� member�� ������ �����;���
	�� ����� ���̹�Ƽ�� �����ϴ°� �ְ�
	������ JSTL�� �̿��� �ž� �׷��� ���ؼ� jstl.jar�����̶� mariadb.jar������ WEB-INF > lib�� ����
	
	JSTL�� �츮�� 3���� �����
	- co tag
	- fmt tag
	- function
	�׸��� ���� ���°�
	- sql
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<fmt:requestEncoding value="UTF-8" /> <%-- �Ķ���� ���� ���ڵ� --%>
<%-- �����ͺ��̽��� Connection ��ü ���� --%>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
				   url="jdbc:mariadb://localhost:3306/classdb"
				   user="scott"
				   password="1234" />

<%--
	executeQuery(sql)�� ����� rs�� �ް� ��
	resultSet�� ����� ���� ��ü�� �Ǵ� ��
--%>
	<!-- ������Ʈ������ mybatis�� �̿��ؾ��� ....? �ФФ� �쿢 -->
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
		�ݰ����ϴ�. ${mem.name}��<br>
		${mem.name}�� ������ ${mem.gender==1? "����":"����"}<br>
		��ȭ��ȣ ${mem.tel}��<br>
		�̸��� ${mem.email}��
	</c:forEach>
	
	(forEach �Ⱦ��� ���) �ݰ����ϴ�. ${rs.rows[0].name}��
</c:if>

<c:if test="${empty rs.rows}">
	���̵� �Ǵ� ��й�ȣ�� Ʋ���ϴ�
</c:if>