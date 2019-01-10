package com.ssm.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.ssm.exception.CustomException;
import com.ssm.mapper.ItemsCustomMapper;
import com.ssm.mapper.ItemsMapper;
import com.ssm.pojo.Admin;
import com.ssm.pojo.Items;
import com.ssm.pojo.ItemsCustom;
import com.ssm.pojo.ItemsVo;
import com.ssm.pojo.Page;
import com.ssm.service.ItemsService;

public class ItemsServiceImpl implements ItemsService {
	
	@Autowired
	private ItemsCustomMapper itemsCustomMapper;
	@Autowired
	private ItemsMapper itemsMapper;
//	根据条件查询商品信息
	public List<ItemsCustom> findItemsList(ItemsVo itemsVo) throws Exception {
		// TODO Auto-generated method stub 
		return itemsCustomMapper.findItemsList(itemsVo);
	}
	
//	进入某个商品修改页面方法(根据Id查询商品信息)
	public ItemsCustom findItemsByid(Integer id) throws Exception {
		// TODO Auto-generated method stub
		Items items=itemsMapper.selectByPrimaryKey(id);
		if(items==null){
//			不new一个对象会出现未知错误,异常会向上抛，直到DispatcherServlet(前端控制器)去处理异常
			throw new CustomException("该商品不存在");
		}
		ItemsCustom itemsCustom = new ItemsCustom();
		//将items的属性拷贝到itemsCustom
		BeanUtils.copyProperties(items, itemsCustom);
		return itemsCustom;
	}
	
//	修改商品信息
	public void updateById(ItemsCustom itemsCustom) throws Exception {
		// TODO Auto-generated method stub
		itemsMapper.updateByPrimaryKeyWithBLOBs(itemsCustom);
	}
	
//	添加商品信息
	public void insertItems(ItemsCustom itemsCustom) throws Exception {
		// TODO Auto-generated method stub
		itemsMapper.insertSelective(itemsCustom);		
	}
	
//	根据商品Id删除商品信息
	public void deleteItemsById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		itemsMapper.deleteByPrimaryKey(id);
	}

//	分页根据条件查询商品信息
	public Page findItemsListPage(ItemsVo itemsVo,Page page) throws Exception {
		// TODO Auto-generated method stub
//		private int pageNum;//当前页码
//		private int itemPerPage;//查询当前一页中的项数
//		private int totalPage;//总的页数
//		private int totalItem;//查询处理的总的个数
//		private int fromItem;//从那一项开始查询
		if(page.getPageNum()<=0)//如果当前页码小于等于0，则把页码赋值为1
			page.setPageNum(1);
		if(page.getItemPerPage()<=0)//如果当前页中纪录数小于等于0项，则把该页的纪录数设置为10
			page.setItemPerPage(5);
		int t=itemsCustomMapper.findItemsCount(itemsVo);
		System.out.println("这个值是多少！！！！"+t);
		page.setTotalItem(itemsCustomMapper.findItemsCount(itemsVo));//totalCustomer()查询所有的纪录总数，将其赋值给totalItem
		int totalPage=page.getTotalItem()/page.getItemPerPage();//总的页数为=总的记录数/当前一页中的记录数
		if(page.getTotalItem()%page.getItemPerPage()!=0)//当取余不为0时，说明多出一页不足10条记录的页数所以总页数+1
			totalPage+=1;
		page.setTotalPage(totalPage);
		if(page.getPageNum()>page.getTotalPage())//如果当前页码大于总页数则将当前页码赋值为最大页数，即总页数的值
			page.setPageNum(page.getTotalPage());
		page.setFromItem((page.getPageNum()-1)*page.getItemPerPage());//即第一页从0项开始，第二页从1*每页的记录数开始		
//		mybatis分页参数
//		第一个参数设置从哪项开始查，第二个参数设置每页的最大限制
		RowBounds rowBounds =new RowBounds(page.getFromItem(),page.getItemPerPage());
		page.setItems(itemsCustomMapper.findItemsList(itemsVo, rowBounds));//customerDao.findCustomer(rowBounds)调用dao接口的分页查看所有用户信息
		return page;
	}
	
}
