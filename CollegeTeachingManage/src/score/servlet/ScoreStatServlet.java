package score.servlet;

import dao.ScoreStatDao;
import impl.ScoreStatDaoImpl;
import entity.ScoreStat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/scoreStat")
public class ScoreStatServlet extends HttpServlet {
    private ScoreStatDao statDao = new ScoreStatDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 设置请求和响应的编码（正确做法）
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        // 2. 获取参数并安全转换 (核心修改点)
        String action = request.getParameter("action");
        String subIdStr = request.getParameter("subjectId");
        String classIdStr = request.getParameter("classId");

        Integer subId = 0;
        Integer classId = 0;

        // 使用 try-catch 防范 NumberFormatException
        if (subIdStr != null && !subIdStr.trim().isEmpty()) {
            try {
                subId = Integer.parseInt(subIdStr);
            } catch (NumberFormatException ignored) {
                // 转换失败保持默认值0，避免页面直接崩溃 500
            }
        }
        if (classIdStr != null && !classIdStr.trim().isEmpty()) {
            try {
                classId = Integer.parseInt(classIdStr);
            } catch (NumberFormatException ignored) {
                // 转换失败保持默认值0
            }
        }

        // 3. 导出逻辑
        if ("export".equals(action)) {
            List<Object[]> data = statDao.getScoreRawData(subId, classId);
            request.setAttribute("exportData", data);
            request.getRequestDispatcher("/pages/score_export.jsp").forward(request, response);
            return;
        }

        // 4. 统计分析逻辑
        ScoreStat stat;
        if (classId == 0) {
            stat = statDao.getStatBySubjectId(subId);
        } else {
            stat = statDao.getStatByClassAndSub(classId, subId);
        }

        // 5. 存放数据并转发
        request.setAttribute("stat", stat);
        request.setAttribute("selSubId", subId);
        request.setAttribute("selClassId", classId);
        request.getRequestDispatcher("/pages/score_stat.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}