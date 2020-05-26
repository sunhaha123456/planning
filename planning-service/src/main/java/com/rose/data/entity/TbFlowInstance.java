package com.rose.data.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_flow_instance")
public class TbFlowInstance extends BaseDataIdLong {

    @Column(name = "instance_name", columnDefinition = "VARCHAR(255) COMMENT '流程实例名称'")
    private String instanceName;

    @Transient
    private String nodeName;

    @Transient
    private Long userTaskId;

    @Column(name = "apply_content", columnDefinition = "VARCHAR(800) COMMENT '发起申请的内容'")
    private String applyContent;

    @Column(name = "template_id", columnDefinition = "BIGINT COMMENT '模板id'")
    private Long templateId;

    //@Column(name = "start_template_name", columnDefinition = "VARCHAR(255) COMMENT '启动时流程模板名称'")
    //private String startTemplateName;

    @Column(name = "start_user_id", columnDefinition = "BIGINT COMMENT '流程启动用户'")
    private Long startUserId;

    @Transient
    private String startUserName;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "start_time", columnDefinition="datetime COMMENT '流程实例启动时间'")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date startTime;

    //0已启动 1已完成 2用户撤回 3管理员冻结 4被审批者驳回
    @Column(name = "state", columnDefinition = "TINYINT DEFAULT 0 COMMENT '流程实例状态'")
    private Integer state;

    @Transient
    private String stateShow;

    // 正在处理的流程实例节点id
    // 注意：空：流程已经完成，没有需要操作的流程节点
    //      当前正在处理的节点，可能有一个，也可能有多个
    //      比如，流转三个节点 a、b、c，则值为 aId,bId,cId
    //            而a 已处理完成后，则值变为 bId,cId
    @Column(name = "handing_instance_node_ids", columnDefinition = "VARCHAR(255) COMMENT '当前正在处理的流程实例节点id'")
    private String handingInstanceNodeIds;

    //@Transient
    //private String handingInstanceNodeNames;

    @Transient
    private List<TbFlowInstanceFile> attachFileList;

    //@Transient
    //private List<TbFlowInstanceOperateHistory> operateHistory;
}