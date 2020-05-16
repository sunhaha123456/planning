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

    @Column(name = "instance_name", columnDefinition = "VARCHAR(255) COMMENT '流程名称'")
    private String instanceName;

    // 当是对整个流程进行操作时，比如：冻结、撤回、删除等，instanceNodeId = 0
    @Column(name = "instance_node_id", columnDefinition = "BIGINT COMMENT '流程实例节点id'")
    private Long instanceNodeId;

    @Column(name = "instance_node_name", columnDefinition = "VARCHAR(255) COMMENT '流程节点名称'")
    private String instanceNodeName;

    @Column(name = "operate_user_id", columnDefinition = "BIGINT COMMENT '操作用户id'")
    private Long operateUserId;

    @Transient
    private String operateUserUserName;

    @Column(name = "operate_info", columnDefinition = "VARCHAR(500) COMMENT '流程实例操作info'")
    private String operateInfo;
}