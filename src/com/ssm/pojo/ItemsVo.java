package com.ssm.pojo;

import java.util.List;

public class ItemsVo {
	private ItemsCustom itemsCustom;
	private List<ItemsCustom> itemsListCustom;

	public ItemsCustom getItemsCustom() {
		return itemsCustom;
	}

	public void setItemsCustom(ItemsCustom itemsCustom) {
		this.itemsCustom = itemsCustom;
	}

	public List<ItemsCustom> getItemsListCustom() {
		return itemsListCustom;
	}

	public void setItemsListCustom(List<ItemsCustom> itemsListCustom) {
		this.itemsListCustom = itemsListCustom;
	}

}
