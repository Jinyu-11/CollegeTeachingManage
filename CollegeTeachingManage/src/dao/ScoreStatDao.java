package dao;
import entity.ScoreStat;
import java.util.List;

public interface ScoreStatDao {
    ScoreStat getStatBySubjectId(int subjectId);
    ScoreStat getStatByClassAndSub(int classId, int subjectId);
    List<Object[]> getScoreRawData(int subjectId, int classId);
}