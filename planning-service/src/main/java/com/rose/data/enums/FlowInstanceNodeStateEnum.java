//package com.rose.data.enums;
//
///**
// * 描述：流程实例节点状态 enum
// * @author sunpeng
// */
//public enum FlowInstanceNodeStateEnum {
//
//    // tb_flow_instance_node 表 state 字段，如下：
//    // 流程实例节点状态:
//    // 0未到达 1正在进行中 2已完成
//
//    NOT_ARRIVED (0, "未到达"),
//    HAVE_HANDING(1, "进行中"),
//    HAVE_FINISH(2, "已完成");
//
//    private Integer index;
//    private String name;
//
//    FlowInstanceNodeStateEnum(Integer index, String name) {
//        this.index = index;
//        this.name = name;
//    }
//
//    public static String getName(Integer index) {
//        for (FlowInstanceNodeStateEnum c : FlowInstanceNodeStateEnum.values()) {
//            if (c.getIndex().equals(index)) {
//                return c.name;
//            }
//        }
//        return null;
//    }
//
//    public static Integer getIndex(String name) {
//        for (FlowInstanceNodeStateEnum c : FlowInstanceNodeStateEnum.values()) {
//            if (c.getName().equals(name)) {
//                return c.index;
//            }
//        }
//        return null;
//    }
//
//    public String getName() {
//        return name;
//    }
//
//    public Integer getIndex() {
//        return index;
//    }
//}