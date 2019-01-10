package com.ssm.service;

import java.util.List;

import com.ssm.pojo.Admin;
import com.ssm.pojo.Items;
import com.ssm.pojo.ItemsCustom;
import com.ssm.pojo.ItemsVo;
import com.ssm.pojo.Page;

public interface ItemsService {
//	根据条件查询商品信息
	public List<ItemsCustom> findItemsList(ItemsVo itemsVo)throws Exception;
//	进入某个商品修改页面查询某个商品信息方法(根据Id查找商品信息)
	public ItemsCustom findItemsByid(Integer id)throws Exception;
//	修改某个商品信息方法
	public void updateById(ItemsCustom itemsCustom)throws Exception;
//	添加商品信息
	public void insertItems(ItemsCustom itemsCustom)throws Exception;
//	删除商品信息
	public void deleteItemsById(Integer id)throws Exception;
//	分页根据条件查询商品信息
	public Page findItemsListPage(ItemsVo itemsVo,Page page)throws Exception;
}
