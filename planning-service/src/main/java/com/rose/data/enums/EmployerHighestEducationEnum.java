package com.rose.data.enums;

/**
 * 描述：员工学历 enum
 * @author sunpeng
 */
public enum EmployerHighestEducationEnum {

    // tb_employer 表 highest_education 字段，如下：
    // 最高学历     0小学 1初中 2高中 3中专 4高职 5大专 6本科 7硕士研究生 8博士研究生

    EDUCATION_PRIMARY_SCHOOL(0, "小学"),
    EDUCATION_MIDDLE(1, "初中"),
    EDUCATION_HIGH(2, "高中"),
    EDUCATION_MIDDLE_SPECIAL(3, "中专"),
    EDUCATION_VOCATIONAL(4, "高职"),
    EDUCATION_BIG_SPECIAL(5, "大专"),
    EDUCATION_UNDERGRADUATE(6, "本科"),
    EDUCATION_MASTER(7, "硕士研究生"),
    EDUCATION_doctor(8, "博士研究生");

    private Integer index;
    private String name;

    EmployerHighestEducationEnum(Integer index, String name) {
        this.index = index;
        this.name = name;
    }

    public static String getName(Integer index) {
        for (EmployerHighestEducationEnum c : EmployerHighestEducationEnum.values()) {
            if (c.getIndex().equals(index)) {
                return c.name;
            }
        }
        return null;
    }

    public static Integer getIndex(String name) {
        for (EmployerHighestEducationEnum c : EmployerHighestEducationEnum.values()) {
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