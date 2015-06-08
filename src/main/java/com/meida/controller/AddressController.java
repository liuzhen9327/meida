package com.meida.controller;

import com.jfinal.core.Controller;
import com.meida.service.AddressService;

/**
 * 
 * @author liuzhen
 * @version May 29, 2015 3:47:26 PM
 */
public class AddressController extends Controller {

	public void list() {

	}

	public void add() {
	}

	public void save() {
		AddressService.service.saveOrUpdate(getParaToLong("id"),
				getPara("receiver"), getPara("mobile"), getPara("address"),
				getParaToLong("ownerId"));
	}
}
