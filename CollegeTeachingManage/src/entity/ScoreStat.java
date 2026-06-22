package entity;

public class ScoreStat {
    private String subjectName;  // 科目名称
    private String className;    // 班级名称
    private Double avgScore;     // 平均分
    private Integer studentCount;// 考试人数

    public String getSubjectName() { return subjectName; }
    public void setSubjectName(String subjectName) { this.subjectName = subjectName; }
    public String getClassName() { return className; }
    public void setClassName(String className) { this.className = className; }
    public Double getAvgScore() { return avgScore; }
    public void setAvgScore(Double avgScore) { this.avgScore = avgScore; }
    public Integer getStudentCount() { return studentCount; }
    public void setStudentCount(Integer studentCount) { this.studentCount = studentCount; }
}