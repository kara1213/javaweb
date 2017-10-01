package com.sp.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.sp.bean.Commodity;

import com.sp.util.DBConnection;

public class CommodityDAOImpl implements CommodityDAO {
	//添加
	public void addCommodity(Commodity commodity){
		Connection conn=DBConnection.getConnection();
		String addSQL="insert into commodity(commodityName,price,agio,image) value(?,?,?,?)";
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(addSQL);
			pstmt.setString(1,commodity.getCommodityName());
			pstmt.setDouble(2,commodity.getPrice());
			pstmt.setDouble(3,commodity.getAgio());
		
			pstmt.setString(4,commodity.getImage());
			
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
	}
	//更新
	public void updateCommodity(Commodity commodity){
		Connection conn=DBConnection.getConnection();
		String updateSQL="update commodity set commodityName=?,"+"price=?,agio=?where commodityId=?";
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(updateSQL);
			pstmt.setString(1,commodity.getCommodityName());
			pstmt.setDouble(2,commodity.getPrice());
			pstmt.setDouble(3,commodity.getAgio());
			
			pstmt.setInt(4,commodity.getCommodityId());
			
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
	}
	//删除
	public void deleteCommodity(int commodityId){
		Connection conn=DBConnection.getConnection();
		String updateSQL="delete from commodity where commodityId=?";
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(updateSQL);
			
			pstmt.setInt(1,commodityId);
			
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
	}
		/*
		//public void updateCommodity(Commodity commodity);
		//public void deleteCommodity(int commodityId);
		//public List<Commodity>findAllCommodity();
		public Commodity findCommodityById(int commodityId);
		*/
	//遍历
	public List<Commodity>findAllCommodity(){
		Connection conn=DBConnection.getConnection();
		String updateSQL="select * from commodity";
		PreparedStatement pstmt=null;
		List<Commodity>commodityList=new ArrayList<Commodity>();
		try{
			pstmt=conn.prepareStatement(updateSQL);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Commodity commodity=new Commodity();
				commodity.setCommodityId(rs.getInt(1));
				commodity.setCommodityName(rs.getString(2));
				commodity.setPrice(rs.getDouble(3));
				commodity.setAgio(rs.getDouble(4));
				commodity.setImage(rs.getString("image"));  ///
				commodityList.add(commodity); //添加到列表
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
		return commodityList;
	}
	//按id查询
	public Commodity findCommodityById(int commodityId){
		Connection conn=DBConnection.getConnection();
		String updateSQL="select * from commodity where commodityId=?";
		PreparedStatement pstmt=null;
		Commodity commodity=new Commodity();
		try{
			pstmt=conn.prepareStatement(updateSQL);
			pstmt.setInt(1,commodityId);//设置参数
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				
				commodity.setCommodityId(rs.getInt(1));
				commodity.setCommodityName(rs.getString(2));
				commodity.setPrice(rs.getDouble(3));
				commodity.setAgio(rs.getDouble(4));
		
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
		return commodity;
	}
	
	//按类型（cType-typeID）查询
	public Commodity findCommodityByType(int cType){
		Connection conn=DBConnection.getConnection();
		String updateSQL="select * from commodity where cType=?";
		PreparedStatement pstmt=null;
		Commodity commodity=new Commodity();
		try{
			pstmt=conn.prepareStatement(updateSQL);
			pstmt.setInt(1,cType);//设置参数
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				
				commodity.setCommodityId(rs.getInt(1));
				commodity.setCommodityName(rs.getString(2));
				commodity.setPrice(rs.getDouble(3));
				commodity.setAgio(rs.getDouble(4));
		
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConnection.close(pstmt);
			DBConnection.close(conn);
		}
		return commodity;
	}
	
}

	
	
	

