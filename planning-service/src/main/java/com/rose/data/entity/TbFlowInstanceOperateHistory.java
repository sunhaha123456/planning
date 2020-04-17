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
@Table(name = "tb_flow_instance_operate_history")
public class TbFlowInstanceOperateHistory extends BaseDataIdLong {

    @Column(name = "instance_id", columnDefinition = "BIGINT COMMENT '流程实例id'")
    private Long instanceId;

    @Column(name = "instance_name", columnDefinition = "VARCHAR(255) COMMENT '流程实例名称'")
    private String instanceName;

    @Column(name = "instance_node_id", columnDefinition = "BIGINT COMMENT '流程实例节点id'")
    private Long instanceNodeId;

    @Column(name = "instance_node_name", columnDefinition = "VARCHAR(255) COMMENT '流程实例节点名称'")
    private Long instanceNodeName;

    @Column(name = "operate_info", columnDefinition = "VARCHAR(500) COMMENT '流程实例操作info'")
    private String operateInfo;
}