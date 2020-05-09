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

    //@Column(name = "start_template_name", columnDefinition = "VARCHAR(255) COMMENT '启动时流程模板名称'")
    //private String startTemplateName;

    @Column(name = "start_user_id", columnDefinition = "BIGINT COMMENT '流程启动用户'")
    private Long startUserId;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "start_time", columnDefinition="datetime COMMENT '流程实例启动时间'")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date startTime;

    @Column(name = "remark_info", columnDefinition = "VARCHAR(500) COMMENT '启动时用户备注信息'")
    private String remarkInfo;

    //0已启动 1已完成 2用户作废 3管理员冻结
    @Column(name = "state", columnDefinition = "TINYINT DEFAULT 0 COMMENT '流程实例状态'")
    private Integer state;

    // 当前正在处理的流程实例节点id
    // 注意：空：流程已经走完了，没有需要操作的流程节点
    //@Column(name = "processing_instance_node_id", columnDefinition = "BIGINT COMMENT '当前正在处理的流程实例节点id'")
    //private Long processingInstanceNodeId;
}