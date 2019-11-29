<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8");%>

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
<sql:query var="rs" dataSource="${conn}">
	select * from member where id=?
	<sql:param>
		${param.id}
	</sql:param>
</sql:query>

<c:if test="${empty rs.rows}">
		<h1 class="unfind">ȸ�������� �� �� �ִ� ���̵��Դϴ�</h1>
</c:if>

<c:if test="${!empty rs.rows}">
	<h1 class="find">${rs.rows[0].id}�� �����ϴ� ���̵��Դϴ�</h1>	
</c:if>