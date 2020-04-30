package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_flow_instance_node_file")
public class TbFlowInstanceNodeFile extends BaseDataIdLong {

    @Column(name = "instance_id", columnDefinition = "BIGINT COMMENT '实例id'")
    private Long instanceId;

    @Column(name = "node_id", columnDefinition = "BIGINT COMMENT '节点id'")
    private Long nodeId;

    @Column(name = "file_id", columnDefinition = "BIGINT COMMENT '文件id'")
    private Long fileId;
}