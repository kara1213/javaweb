package com.sp.factory;
import com.sp.dao.CommodityDAO;
import com.sp.dao.CommodityDAOImpl;

public class CommodityDAOFactory {
	public static CommodityDAO getCommodityDAOInstance(){
		return new CommodityDAOImpl();
	}

}
