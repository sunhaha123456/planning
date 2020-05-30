package com.rose.data.enums;

/**
 * 描述：员工在职状态 enum
 * @author sunpeng
 */
public enum EmployerOnJobStateEnum {

    // tb_employer 表 on_job_state 字段，如下：
    // 在职状态     0在职   1离职中    2已离职

    EMPLOYER_JOB_STATE_AT_WORK(0, "在职"),
    EMPLOYER_JOB_STATE_QUITING(1, "离职中"),
    EMPLOYER_JOB_STATE_QUITED(2, "已离职");

    private Integer index;
    private String name;

    EmployerOnJobStateEnum(Integer index, String name) {
        this.index = index;
        this.name = name;
    }

    public static String getName(Integer index) {
        for (EmployerOnJobStateEnum c : EmployerOnJobStateEnum.values()) {
            if (c.getIndex().equals(index)) {
                return c.name;
            }
        }
        return null;
    }

    public static Integer getIndex(String name) {
        for (EmployerOnJobStateEnum c : EmployerOnJobStateEnum.values()) {
            if (c.getName().equals(name)) {
                return c.index;
            }
        }
        return null;
    }

    public String getName() {
        return name;
    }

    public Integer getIndex() {
        return index;
    }
}