package com.ayll.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ayll.Vo.Nurse;
import com.ayll.Vo.Order;


public class NurseDao {
	
	Dbmanage dbmanage = new Dbmanage();
	Connection conn = null;
	Statement sta = null;
	ResultSet rs = null;
	static int ID = 935799;
	
	
	public Nurse judgeUserPassword(String nurseName) {
		
		Nurse nurse = null;

		try {
		
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM nurse_information WHERE nurse_id = '" +
					nurseName + "'";
		
			rs = sta.executeQuery(sql);
		
			while(rs.next()) {
			
				nurse = new Nurse();
				nurse.setNurseID(rs.getString("nurse_id"));
			}
			
			return nurse;
		} catch (SQLException e) {
		
			e.printStackTrace();
			return null;
		} finally {
		
			dbmanage.close(rs, sta, conn);
		}
	}
	
	public boolean addIndent(Order order) {
		
		String orderID = "a" + ID++;
		order.setOrderID(orderID);
		
		try {
			
			conn = dbmanage.initDB(); 
			sta = conn.createStatement();
			
			String sql = "INSERT INTO nurse_indent(order_id,user_name,nurse_id,order_time,order_state,address,req,pay)VALUES('" +
					order.getOrderID() + "','" +
					order.getUserName() + "','" +
					order.getNurseID() + "','" +
					order.getOrderTime() + "','" +
					order.getOrderState() + "','" +
					order.getAddress() + "','" +
					order.getRequire() + "','" +
					order.getPay() + "')";
			
			sta.executeUpdate(sql);
			
			return true;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		} finally {
			
			dbmanage.closeDB(sta, conn);
		}
	}
	
public ArrayList<Order> getAllOrder(String nurseID) {
		
		ArrayList<Order> orderList = new ArrayList<Order>();
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM nurse_indent WHERE nurse_id = '" + nurseID +"'";
			
			rs = sta.executeQuery(sql);
			
			while(rs.next()) {
				
				Order order = new Order();
				order.setOrderID(rs.getString("order_id"));
				order.setUserName(rs.getString("user_name"));
				order.setNurseID(rs.getString("nurse_id"));
				order.setOrderTime(rs.getString("order_time"));
				order.setOrderState(rs.getString("order_state"));
				order.setAddress(rs.getString("address"));
				order.setRequire(rs.getString("req"));
				order.setPay(rs.getString("pay"));
				orderList.add(order);
			}
			
			return orderList;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		} finally {
			
			dbmanage.close(rs, sta, conn);
		}
	}
	
	public ArrayList<Order> getOrederByState(String state, String nurseID) {
		
		ArrayList<Order> orderList = new ArrayList<Order>();
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM nurse_indent WHERE order_state = '" + state +"' AND nurse_id = '" + nurseID +"'";
			
			rs = sta.executeQuery(sql);
			
			while(rs.next()) {
				
				Order order = new Order();
				order.setOrderID(rs.getString("order_id"));
				order.setUserName(rs.getString("user_name"));
				order.setNurseID(rs.getString("nurse_id"));
				order.setOrderTime(rs.getString("order_time"));
				order.setOrderState(rs.getString("order_state"));
				order.setAddress(rs.getString("address"));
				order.setRequire(rs.getString("req"));
				order.setPay(rs.getString("pay"));
				orderList.add(order);
			}
			
			return orderList;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		} finally {
			
			dbmanage.close(rs, sta, conn);
		}
		
	}
	
	public Nurse getNurseByID(String ID) {
		
		Nurse nurse = new Nurse(); 
		
		try {
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM nurse_information WHERE Nurse_id = '" + ID + "'";
			
			rs = sta.executeQuery(sql);
			
			while(rs.next()) {
				nurse.setNurseID(rs.getString("nurse_id"));
				nurse.setNursename(rs.getString("nurse_name"));
				nurse.setNurseage(rs.getInt("nurse_age"));
				nurse.setNursekind(rs.getString("nurse_kind"));
				nurse.setNurseedu(rs.getString("nurse_edu"));
				nurse.setNurseArea(rs.getString("nurse_area"));
				nurse.setNurseyear(rs.getInt("nurse_year"));
				nurse.setIsbook(rs.getBoolean("isbook"));
				nurse.setInformation(rs.getString("infor"));
				nurse.setStar(rs.getInt("star"));
				nurse.setPicture(rs.getString("picture"));
				nurse.setReward(rs.getString("reward"));
				nurse.setService(rs.getInt("service"));
				nurse.setAttitude(rs.getInt("attitude"));
				nurse.setKnowledge(rs.getInt("knowledge"));
				nurse.setComplete(rs.getInt("complete"));
			}
			
			return nurse;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		} finally {
			
			dbmanage.close(rs, sta, conn);
		}
	}
	
	public boolean deleteOrder(String orderID) {
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "DELETE FROM nurse_indent WHERE order_id ='" + orderID + "'";
			
			sta.executeUpdate(sql);
			return true;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		} finally {
			
			dbmanage.closeDB(sta, conn);
		}
	}
	
	public boolean cancelOrder(String orderID) {
		
		String state = "取消预约";
		
		try {
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "UPDATE nurse_indent,user_indent set nurse_indent.order_state = '" + state + "',user_indent.order_state = '"+ state +
					     "' WHERE nurse_indent.order_id = '" + orderID + "' AND nurse_indent.order_id = '" + orderID + "'";
			
			sta.executeUpdate(sql);
			return true;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		} finally {
			
			dbmanage.closeDB(sta, conn);
		}
	}
	
	public boolean agreeOrder(String orderID) {
		
		String state = "已预约";
		
		try {
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "UPDATE nurse_indent,user_indent set nurse_indent.order_state = '" + state + "',user_indent.order_state = '"+ state +
						 "' WHERE nurse_indent.order_id = '" + orderID + "' AND nurse_indent.order_id = '" + orderID + "'";
			
			sta.executeUpdate(sql);
			
			return true;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		} finally {
			
			dbmanage.closeDB(sta, conn);
		}
	}
	
	public boolean accomplishOrder(String orderID) {
		
		String state = "已完成";
		
		try {
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "UPDATE nurse_indent,user_indent set nurse_indent.order_state = '" + state + "',user_indent.order_state = '"+ state +
						 "' WHERE nurse_indent.order_id = '" + orderID + "'";
			
			sta.executeUpdate(sql);
			
			return true;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		} finally {
			
			dbmanage.closeDB(sta, conn);
		}
	}
}
