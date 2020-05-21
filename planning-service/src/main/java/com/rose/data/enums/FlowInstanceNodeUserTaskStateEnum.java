package com.rose.data.enums;

/**
 * 描述：流程实例节点用户任务状态 enum
 * @author sunpeng
 */
public enum FlowInstanceNodeUserTaskStateEnum {

    // tb_flow_instance_node_user_task 表 state 字段，如下：
    // 流程实例节点用户任务状态:
    // 0待操作（需要操作，但未操作）
    // 1已操作（需要操作，且已操作）
    // 2已被抢占（抢占模式下，需要操作，但被别人抢到操作了）

    WAITINT_OPERATE(0, "待操作"),
    HAVE_OPERATE(1, "已操作"),
    HAVE_CAPTURE(2, "已被抢占");

    private Integer index;
    private String name;

    FlowInstanceNodeUserTaskStateEnum(Integer index, String name) {
        this.index = index;
        this.name = name;
    }

    public static String getName(Integer index) {
        for (FlowInstanceNodeUserTaskStateEnum c : FlowInstanceNodeUserTaskStateEnum.values()) {
            if (c.getIndex().equals(index)) {
                return c.name;
            }
        }
        return null;
    }

    public static Integer getIndex(String name) {
        for (FlowInstanceNodeUserTaskStateEnum c : FlowInstanceNodeUserTaskStateEnum.values()) {
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