package impl;

import dao.ScoreStatDao;
import entity.ScoreStat;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ScoreStatDaoImpl implements ScoreStatDao {

    // ★★★★★ 请修改这里为你自己的数据库配置 ★★★★★
    private static final String DB_URL = "jdbc:mysql://localhost:3306/student?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "123456";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
    }

    @Override
    public ScoreStat getStatBySubjectId(int subjectId) {
        ScoreStat stat = null;
        // 完美适配你的数据库字段：利用 sco_count 计算平均分
        String sql = "SELECT s.sub_name, AVG(sc.sco_count) as avg_score, COUNT(sc.stu_id) as count " +
                     "FROM score sc " +
                     "JOIN subject s ON sc.sub_id = s.sub_id " +
                     "WHERE sc.sub_id = ? " +
                     "GROUP BY s.sub_name";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, subjectId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                stat = new ScoreStat();
                stat.setSubjectName(rs.getString("sub_name"));
                stat.setAvgScore(rs.getDouble("avg_score"));
                stat.setStudentCount(rs.getInt("count"));
                stat.setClassName(null); // 表示全校
            }
        } catch (Exception e) { e.printStackTrace(); }
        return stat;
    }

    @Override
    public ScoreStat getStatByClassAndSub(int classId, int subjectId) {
        ScoreStat stat = null;
        // 适配你的数据库：带上班级筛选
        String sql = "SELECT s.sub_name, c.cla_name, AVG(sc.sco_count) as avg_score, COUNT(sc.stu_id) as count " +
                     "FROM score sc " +
                     "JOIN subject s ON sc.sub_id = s.sub_id " +
                     "JOIN classes c ON sc.cla_id = c.cla_id " +
                     "WHERE sc.sub_id = ? AND sc.cla_id = ? " +
                     "GROUP BY s.sub_name, c.cla_name";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, subjectId);
            ps.setInt(2, classId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                stat = new ScoreStat();
                stat.setSubjectName(rs.getString("sub_name"));
                stat.setClassName(rs.getString("cla_name"));
                stat.setAvgScore(rs.getDouble("avg_score"));
                stat.setStudentCount(rs.getInt("count"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return stat;
    }

    @Override
    public List<Object[]> getScoreRawData(int subjectId, int classId) {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT st.stu_name, su.sub_name, c.cla_name, sc.sco_count " +
                     "FROM score sc " +
                     "JOIN student st ON sc.stu_id = st.stu_id " +
                     "JOIN subject su ON sc.sub_id = su.sub_id " +
                     "JOIN classes c ON sc.cla_id = c.cla_id " +
                     "WHERE sc.sub_id = ? ";
        if(classId != 0) {
            sql += " AND sc.cla_id = ?";
        }
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, subjectId);
            if(classId != 0) {
                ps.setInt(2, classId);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Object[]{
                    rs.getString("stu_name"),
                    rs.getString("sub_name"),
                    rs.getString("cla_name"),
                    rs.getDouble("sco_count")
                });
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}