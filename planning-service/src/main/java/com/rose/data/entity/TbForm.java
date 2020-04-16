package com.rose.data.entity;

import com.rose.common.data.base.BaseDataIdLong;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.Table;

@ToString(callSuper = true)
@lombok.Data
@Entity
@Table(name = "tb_form")
public class TbForm extends BaseDataIdLong {

}