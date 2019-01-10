package com.ssm.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.ssm.controller.validation.ValidGroup1;
import com.ssm.pojo.ItemsCustom;
import com.ssm.pojo.ItemsVo;
import com.ssm.pojo.Page;
import com.ssm.service.ItemsService;

@Controller
@RequestMapping("/items")
public class ItemsController {
	
	@Autowired
	private ItemsService itemsService;
//	根据条件查询商品信息
	@RequestMapping("/queryItemsList")
	public ModelAndView queryItemsList(ItemsVo itemsVo,HttpSession session) throws Exception{		
		List<ItemsCustom> itemsList  =itemsService.findItemsList(itemsVo);
		ModelAndView modelAndView =new ModelAndView();
		modelAndView.addObject("itemsList", itemsList );
		String adminname=(String) session.getAttribute("admin");
		modelAndView.addObject("adminname", adminname );
		modelAndView.setViewName("itemsList");
		return modelAndView;		
	}
////	按某个条件查询商品信息
//	@RequestMapping("/queryItems")
//	public String queryItems(Model model,ItemsVo itemsVo)throws Exception{	
//				List<ItemsCustom> itemsList= itemsService.findItemsByName(itemsVo);
//				model.addAttribute("itemsList", itemsList);
//				return "itemsList";						
//	}
	
//	分页查看所有商品信息
//	@RequestMapping("/queryCountItems")
//	public ModelAndView queryCountItems(Page page)throws Exception{
//		page = itemsService.findItemsListPage(page);
//		ModelAndView modelAndView =new ModelAndView();
//		modelAndView.addObject("page", page );
//		modelAndView.setViewName("customerListAll");
//		return modelAndView;		
//	}
	

//	分页根据条件查询商品信息
	@RequestMapping("/queryCountItems")///pageItemsList
	public String pageItemsList(Model model,ItemsVo itemsVo,Page page)throws Exception{	
//				List<ItemsCustom> itemsList= itemsService.findItemsByName(itemsVo);
//				model.addAttribute("itemsList", itemsList);
				page = itemsService.findItemsListPage(itemsVo, page);
				model.addAttribute("page", page);
				return "customerListAll";	
	}
	
//	进入某个商品的信息修改页面
	@RequestMapping("/queryeditItems")
	public ModelAndView queryItemsById(Integer id)throws Exception{		
		ItemsCustom itemsCustom = itemsService.findItemsByid(id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("itemsCustom", itemsCustom);
		modelAndView.setViewName("editItem");
		return modelAndView;		
	}
	
//	提交修改某个商品的信息
	@RequestMapping("/editItems")
	public String editItemsById(ItemsCustom itemsCustom,@RequestParam(value = "pictureFile") MultipartFile pictureFile,HttpServletRequest request)throws Exception{	
		if(!pictureFile.isEmpty() && pictureFile.getSize()>0){
			//文件的存储位置
			String filePath=request.getSession().getServletContext().getRealPath("/images");
			System.out.println(filePath);
			//文件的原始名称
			String originalFileName=pictureFile.getOriginalFilename();
			//新文件名称
			String newFileName=UUID.randomUUID() +originalFileName.substring(originalFileName.lastIndexOf("."));
			//新文件
			File file = new java.io.File(filePath+"/"+newFileName);
			if(!file.getParentFile().exists()){
				file.getParentFile().mkdirs();
			}
			//将文件存入images里
			pictureFile.transferTo(file);
			//将文件名称写入数据库
			itemsCustom.setPic(newFileName);
		}
		itemsService.updateById(itemsCustom);
		return "redirect:queryItemsList.action";		
	}
	
//	进入商品添加页面方法
	@RequestMapping("/insertPage")
	public String insertPage(){
		return "insertItems";
	}
	
//	添加商品信息
	@RequestMapping("/insertItems")
	public String insertItems(Model model,@Validated(value={ValidGroup1.class}) ItemsCustom itemsCustom,BindingResult bindingResult)throws Exception{
		if(bindingResult.hasErrors()){
			List<ObjectError> errors=bindingResult.getAllErrors();
			model.addAttribute("errors", errors);
			model.addAttribute("itemsCustom", itemsCustom);
			return "insertItems";
		}
		
		itemsService.insertItems(itemsCustom);
		return "redirect:queryItemsList.action";
	}
	
//	根据Id删除商品信息
	@RequestMapping("/deleteItemsById")
	public String deletItemsById(Integer id)throws Exception{
		itemsService.deleteItemsById(id);
		return "redirect:queryItemsList.action";
	}
	
//	批量删除商品信息
	@RequestMapping("/deleteItemsList")
	public String deleteItemsList(Model model,Integer[] delete_id)throws Exception{
		if(delete_id!=null){
			for(Integer id :delete_id){
				itemsService.deleteItemsById(id);
			}
			return "redirect:queryItemsList.action";
		}else{
			
			return "redirect:queryItemsList.action";
		}
		
	}
	
//	进入批量修改商品信息页面
	@RequestMapping("/editItemsListquery")
	public String editItemsList(Model model, Integer[] delete_id)throws Exception{
		if(delete_id!=null){
			List<ItemsCustom> itemsList=new ArrayList<ItemsCustom>();	
			for(Integer id :delete_id){
				ItemsCustom itemsCustom = itemsService.findItemsByid(id);
				itemsList.add(itemsCustom);
			}
			model.addAttribute("itemsList", itemsList);
			return "editItemsList";
		}else{
			return "redirect:queryItemsList.action";
		}
		
	}
//	提交批量修改商品信息
	@RequestMapping("/editItemsListSubmit")
	public String editItemsListSubmit(ItemsVo itemsVo,HttpServletRequest request)throws Exception{
		List<ItemsCustom> listCustoms=itemsVo.getItemsListCustom();
		for(ItemsCustom itemsCustom :listCustoms){
			MultipartFile pictureFile = itemsCustom.getPictureFile();
			if(!pictureFile.isEmpty() && pictureFile.getSize()>0){
				//文件的存储位置
				String filePath=request.getSession().getServletContext().getRealPath("/images");
				System.out.println(filePath);
				//文件的原始名称
				String originalFileName=pictureFile.getOriginalFilename();
				//新文件名称
				String newFileName=UUID.randomUUID() +originalFileName.substring(originalFileName.lastIndexOf("."));
				//新文件
				File file = new java.io.File(filePath+"/"+newFileName);
				if(!file.getParentFile().exists()){
					file.getParentFile().mkdirs();
				}
				//将文件存入images里
				pictureFile.transferTo(file);
				//将文件名称写入数据库
				itemsCustom.setPic(newFileName);
			}
			itemsService.updateById(itemsCustom);
		}
		return "redirect:queryItemsList.action";
	}
}
