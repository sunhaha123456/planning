package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.Table;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_flow_instance_node")
public class TbFlowInstanceNode extends BaseDataIdLong {

}