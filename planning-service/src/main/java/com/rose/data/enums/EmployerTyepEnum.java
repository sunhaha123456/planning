package com.rose.data.enums;

/**
 * 描述：员工类别 enum
 * @author sunpeng
 */
public enum EmployerTyepEnum {

    // tb_employer 表 employer_type 字段，如下：
    // 员工类别     0正式员工   1试用期员工  2实习期员工  3临时雇员

    EMPLOYER_TYPE_REGULAR(0, "正式员工"),
    EMPLOYER_TYPE_PROBATION(1, "试用期员工"),
    EMPLOYER_TYPE_INTERNSHIP(2, "实习期员工"),
    EMPLOYER_TYPE_TEMPORARY(3, "临时雇员");

    private Integer index;
    private String name;

    EmployerTyepEnum(Integer index, String name) {
        this.index = index;
        this.name = name;
    }

    public static String getName(Integer index) {
        for (EmployerTyepEnum c : EmployerTyepEnum.values()) {
            if (c.getIndex().equals(index)) {
                return c.name;
            }
        }
        return null;
    }

    public static Integer getIndex(String name) {
        for (EmployerTyepEnum c : EmployerTyepEnum.values()) {
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