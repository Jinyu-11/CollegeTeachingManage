<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成绩数据导出</title>
    <style>
        body { font-family: "微软雅黑"; padding: 20px; }
        table { width: 80%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
        th { background-color: #4CAF50; color: white; }
    </style>
</head>
<body>
    <h3>📋 成绩原始数据导出</h3>
    <table>
        <thead>
            <tr>
                <th>学生姓名</th>
                <th>科目名称</th>
                <th>班级</th>
                <th>成绩</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty exportData}">
                <c:forEach items="${exportData}" var="row">
                    <tr>
                        <td>${row[0]}</td>
                        <td>${row[1]}</td>
                        <td>${row[2]}</td>
                        <td>${row[3]}</td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty exportData}">
                <tr><td colspan="4" style="color:red;">没有可导出的数据</td></tr>
            </c:if>
        </tbody>
    </table>
    <br/>
    <button onclick="window.print()">🖨️ 打印 / 另存为 PDF</button>
    <button onclick="window.close()">关闭窗口</button>
</body>
</html>