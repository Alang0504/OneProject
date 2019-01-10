package com.ssm.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.ssm.pojo.Admin;
import com.ssm.pojo.ItemsCustom;
import com.ssm.pojo.ItemsVo;

public interface ItemsCustomMapper {
//	根据条件查询商品信息
	public List<ItemsCustom> findItemsList(ItemsVo itemsVo)throws Exception;
//	根据条件查询商品总数
	public int findItemsCount(ItemsVo itemsVo)throws Exception;
//	分页根据条件查询商品信息
	public List<ItemsCustom> findItemsList(ItemsVo itemsVo,RowBounds rowBounds)throws Exception;
}
