package com.rose.data.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_flow_instance")
public class TbFlowInstance extends BaseDataIdLong {

    @Column(name = "instance_name", columnDefinition = "VARCHAR(255) COMMENT '流程实例名称'")
    private String instanceName;

    @Column(name = "template_id", columnDefinition = "BIGINT COMMENT '模板id'")
    private Long templateId;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "start_time", columnDefinition="datetime COMMENT '流程实例启动时间'")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date startTime;

    // 0：已启动（启动流程且未完成）
    // 1：冻结（启动流程未完成时冻结）
    // 2：已完成（流程已走完）     以完成的流程不允许删除
    @Column(name = "state", columnDefinition = "TINYINT DEFAULT 0 COMMENT '流程实例状态'")
    private Integer state;

    // 当前需要操作的流程实例节点id
    // -1 表示 流程已经走完了，已无需要操作的流程节点
    // 其中，流程被冻结时，不会重置成 -1
    @Column(name = "current_need_operate_instance_node_id", columnDefinition = "BIGINT COMMENT '当前需要操作的流程实例节点id'")
    private Long currentNeedOperateInstanceNodeId;
}