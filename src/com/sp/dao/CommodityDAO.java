package com.sp.dao;
import java.util.List;
import com.sp.bean.Commodity;

public interface CommodityDAO {
	public void addCommodity(Commodity commodity);
	public void updateCommodity(Commodity commodity);
	public void deleteCommodity(int commodityId);
	public List<Commodity>findAllCommodity();
	public Commodity findCommodityById(int commodityId);
	public Commodity findCommodityByType(int cType);
}
