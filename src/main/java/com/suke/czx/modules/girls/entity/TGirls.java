package com.suke.czx.modules.girls.entity;


import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;


/**
 * 
 * 
 * @author qixianchuan
 * @email qixianchuan@163.com
 * @date 2019-07-03 13:46:10
 */
@Data
@TableName("t_girls")
@EqualsAndHashCode(callSuper = true)
public class TGirls extends Model<TGirls> implements Serializable {
	private static final long serialVersionUID = 1L;

		//主键
		@TableId
		private Integer id;
		//姓名
		private String name;
		//年龄
		private Integer age;
		//住址
		private String address;
		//电话
		private String phone;
		//备注
		private String remark;
	
}
