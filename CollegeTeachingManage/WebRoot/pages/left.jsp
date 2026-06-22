<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>left page</title>
<link href="../css/left.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.8.3.min.js"></script>
<script src="../js/left.js"></script>
</head>
<body>
<c:forEach items="${sessionScope.list}" var="pri">
	<div class="big" onclick="toggleBox(this)">${pri.menu_name}</div>
	<div class="box">
		<c:forEach items="${sessionScope.list_privilege}" var="privilege">
			<c:if test="${privilege.menu_name == pri.menu_name}">
				<div class="small">
					<a href="${privilege.url}" target="main">${privilege.name}</a>
				</div>
			</c:if>
		</c:forEach>
        
        <c:if test="${fn:contains(pri.menu_name, '成绩管理')}">
			<div class="small">
				<a href="${pageContext.request.contextPath}/scoreStat?action=query&subjectId=1&classId=0" target="main">成绩统计分析</a>
			</div>
		</c:if>
        
	</div>
</c:forEach>
</body>
</html>