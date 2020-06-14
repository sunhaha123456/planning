package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import com.rose.data.to.response.FlowChartResponse;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.List;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_flow_instance_node")
public class TbFlowInstanceNode extends BaseDataIdLong {

    @Column(name = "instance_id", columnDefinition = "BIGINT COMMENT '实例id'")
    private Long instanceId;

    @Column(name = "template_node_id", columnDefinition = "BIGINT COMMENT '模板节点id'")
    private Long templateNodeId;

    @Column(name = "node_name", columnDefinition = "VARCHAR(255) COMMENT '节点名称'")
    private String nodeName;

    // 第一层节点pid 0
    @Column(name = "pid", columnDefinition = "BIGINT DEFAULT 0 COMMENT '父节点id'")
    private Long pid;

    // 第一层节点：0，依次类推
    @Column(name = "node_level", columnDefinition = "INT DEFAULT 0 COMMENT '节点级别'")
    private Integer nodeLevel;

    // totalcode：parentNodeId1,parentNodeId2,parentNodeId3  一级节点是本身id
    @Column(name = "total_code", columnDefinition = "VARCHAR(1000) COMMENT '节点编码'")
    private String totalCode;

    @Column(name = "instruction", columnDefinition = "VARCHAR(255) COMMENT '说明'")
    private String instruction;

    // 执行方式 0抢占 1会签
    @Column(name = "operate_type", columnDefinition = "TINYINT DEFAULT 0 COMMENT '执行方式'")
    private Integer operateType;

    // 不使用节点状态，暂保留
    // 流程节点状态：0未到达 1正在进行中 2已完成
    //@Column(name = "state", columnDefinition = "TINYINT DEFAULT 0 COMMENT '流程节点状态'")
    //private Integer state;

    // 用于记录流程图的children
    @Transient
    private List<FlowChartResponse> children;

    @Transient
    private List<TbFlowInstanceNodeUserTask> userTaskList;
}