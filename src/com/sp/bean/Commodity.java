package com.sp.bean;

public class Commodity {

	private int commodityId;
	private String commodityName;
	private double price;
	private double agio;//折扣

	private int cType;//类型  =typeID
	
	private String image;//图片地址  如“images/itemA.jpg”
	
	public int getCommodityId() {
		return this.commodityId;
	}
	public void setCommodityId(int commodityid) {
		commodityId = commodityid;
	}
	public String getCommodityName() {
		return commodityName;
	}
	public void setCommodityName(String commodityname) {
		this.commodityName = commodityname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double Price) {
		this.price = Price;
	}
	public double getAgio() {
		return agio;
	}
	public void setAgio(double Agio) {
		this.agio = Agio;
	}
	public int getCType() {
		return this.cType;
	}
	public void setCType(int CType) {
		cType = CType;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String Image) {
		this.image = Image;
	}

	
}