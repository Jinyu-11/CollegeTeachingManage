<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生信息管理系统 - 登录</title>
    <style>
        /* 页面全局重置 */
        body {
            margin: 0;
            padding: 0;
            background-color: #f0f2f5;
            font-family: "微软雅黑", sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        /* 登录框居中容器 */
        .login-container {
            background-color: #ffffff;
            width: 400px;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        /* 系统大标题 */
        .login-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 30px;
        }
        /* 输入框容器 */
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            outline: none;
            transition: border 0.3s;
        }
        .form-group input:focus {
            border-color: #4a90e2;
        }
        /* 登录按钮 */
        .login-btn {
            width: 100%;
            padding: 12px;
            background-color: #4a90e2;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .login-btn:hover {
            background-color: #357abd;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="login-title">学生信息管理系统</div>
    
    <!-- 你的表单提交路径可能是 LoginServlet 或者 /login，根据你的项目实际情况 -->
    <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
        <div class="form-group">
            <label for="username">账号：</label>
            <input type="text" id="username" name="ope_name" placeholder="请输入账号" value="tec1" />
        </div>
        
        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" id="password" name="ope_pwd" placeholder="请输入密码" value="tec1" />
        </div>
        
        <button type="submit" class="login-btn">立即登录</button>
    </form>
</div>

</body>
</html>