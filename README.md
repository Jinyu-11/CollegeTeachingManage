# 高校教学管理系统-JavaWeb MVC课程实验
## 项目简介
基于JSP+Servlet+MySQL实现B/S高校教学管理系统，MVC分层架构，支持管理员/教师/学生三类用户，实现专业、班级、学生、教师、课程、成绩管理，新增课程平均分统计功能。
## 技术栈
Java Servlet、JSP、JDBC、MySQL、Tomcat、jxl导出Excel
## 项目分层
1. entity：实体Bean
2. dao：数据访问接口
3. impl：DAO JDBC实现类
4. servlet：控制器
5. filter：编码/登录过滤器
6. util：数据库工具类
## 新增功能（实验七任务7）
教务成绩统计：按班级+课程计算平均分、统计参考人数
核心文件：ScoreStatDao.java / ScoreStatDaoImpl.java / ScoreStatServlet / score_stat.jsp
## 实验配套材料
/doc文件夹：完整实验报告、UML用例图/类图/顺序图/E-R图、系统登录界面截图、功能测试截图
