package com.meida.service;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;
import com.meida.model.Address;

/**
 * 
 * @author liuzhen
 * @version May 26, 2015 3:34:12 PM
 */
public class AddressService {

	private static String CACHE_NAME = "addressList";
	
	public static final AddressService service = new AddressService(); 
	
	private AddressService() {}

	public void saveOrUpdate(Long id, String receiver, String mobile, String address,
			Long ownerId) {
		Address model = new Address().set("receiver", receiver).set("mobile", mobile)
				.set("address", address).set("ownerId", ownerId)
				.set("updateTime", new Date());
		if(id != null) {
			model.set("id", id);
			model.update();
		} else model.save();
		CacheKit.remove(CACHE_NAME, ownerId);
	}

	public List<Address> list(Long ownerId) {
		return CacheKit.get(CACHE_NAME, ownerId,
				new IDataLoader() {
					public Object load() {
						return Address.dao.find("select * from blog");
					}
				});
	}
	
	public Address findById(Long id) {
		return Address.dao.findById(id);
	}
}
