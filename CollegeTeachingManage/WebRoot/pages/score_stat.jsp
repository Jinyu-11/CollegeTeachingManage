<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>成绩统计分析结果</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <script>
        function changeData() {
            var subId = document.getElementById("subSelect").value;
            var classId = document.getElementById("classSelect").value;
            location.href = "${pageContext.request.contextPath}/scoreStat?action=query&subjectId=" + subId + "&classId=" + classId;
        }
    </script>
</head>
<body>
    <div style="padding: 20px;">
        <h3>📊 成绩统计分析</h3>
        <hr/>
        
        <div style="margin: 15px 0; padding: 15px; border: 1px solid #ddd; background-color: #f9f9f9;">
            <label>选择科目：</label>
            <select id="subSelect" onchange="changeData()">
                <option value="1" ${selSubId == 1 ? 'selected' : ''}>J2SE</option>
                <option value="2" ${selSubId == 2 ? 'selected' : ''}>C语言</option>
                <option value="3" ${selSubId == 3 ? 'selected' : ''}>PhotoShop</option>
                <option value="4" ${selSubId == 4 ? 'selected' : ''}>DIV+CSS</option>
                <option value="5" ${selSubId == 5 ? 'selected' : ''}>矢量图</option>
            </select>
            &nbsp;&nbsp;
            <label>选择班级：</label>
            <select id="classSelect" onchange="changeData()">
                <option value="0" ${selClassId == 0 ? 'selected' : ''}>全校</option>
                <option value="1" ${selClassId == 1 ? 'selected' : ''}>12网编1班</option>
                <option value="2" ${selClassId == 2 ? 'selected' : ''}>12ERP1班</option>
                <option value="3" ${selClassId == 3 ? 'selected' : ''}>12UI1班</option>
                <option value="4" ${selClassId == 4 ? 'selected' : ''}>12智能楼宇1班</option>
                <option value="5" ${selClassId == 5 ? 'selected' : ''}>12网络1班</option>
                <option value="7" ${selClassId == 7 ? 'selected' : ''}>12游软1班</option>
            </select>
        </div>

        <c:if test="${not empty stat}">
            <table border="1" cellpadding="10" cellspacing="0" style="width: 60%; border-collapse: collapse;">
                <tr style="background-color: #f2f2f2;">
                    <th>科目名称</th>
                    <th>班级</th>
                    <th>平均分</th>
                    <th>参考人数</th>
                </tr>
                <tr>
                    <td>${stat.subjectName}</td>
                    <td>${stat.className == null ? '全校' : stat.className}</td>
                    <td>${stat.avgScore}</td>
                    <td>${stat.studentCount}</td>
                </tr>
            </table>
            <br/>
            <a href="${pageContext.request.contextPath}/scoreStat?action=export&subjectId=${selSubId}&classId=${selClassId}" target="_blank">
                <button style="padding: 5px 15px; cursor: pointer;">📥 导出成绩数据</button>
            </a>
        </c:if>
        
        <c:if test="${empty stat}">
            <p style="color: red; font-weight: bold;">⚠️ 抱歉，当前条件下暂无成绩数据！</p>
        </c:if>
    </div>
</body>
</html>