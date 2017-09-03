package com.ayll.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ayll.Vo.Evaluate;
import com.ayll.Vo.Evaluates;
import com.ayll.Vo.Nurse;
import com.ayll.Vo.Order;
import com.ayll.Vo.User;

public class UserDao {
	
	Dbmanage dbmanage = new Dbmanage();
	Connection conn = null;
	Statement sta = null;
	ResultSet rs = null;
	static int ID = 935799; 
	
	public void insertUser(User user) {
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "INSERT INTO user_information(user_tel,user_name,user_password,user_sex,user_image)VALUES('" +
						user.getTel() + "','" +
						user.getUsername() + "','" +
						user.getPassword() + "','" +
						user.getSex() + "','" +
						user.getUserimage() + "')";
			
			sta.executeUpdate(sql);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			dbmanage.closeDB(sta, conn);
		}
	}
	
	public void addInterest(String userName, String interest) {
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "INSERT INTO user_interest(user_name,user_ite)VALUES('" +
					userName + "','" +
					interest + "')";
			
			sta.executeUpdate(sql);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			dbmanage.closeDB(sta, conn);
		}
	}
	
	public User judgeUserPassword(String userName, String userPassword) {
		
		User user = null;

		try {
		
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM user_information WHERE (user_name = '" +
					userName + "' or user_tel = '" + userName + "') AND user_password = '" + userPassword + "'";
		
			rs = sta.executeQuery(sql);
		
			while(rs.next()) {
			
				user = new User();
				user.setUsername(rs.getString("user_name"));
				user.setUserimage(rs.getString("user_image"));
			}
			
			return user;
		} catch (SQLException e) {
		
			e.printStackTrace();
			return null;
		} finally {
		
			dbmanage.close(rs, sta, conn);
		}
	}
	
	public ArrayList<Nurse> userRecommend(String userName) {
			
			ArrayList<Nurse> list1 = new ArrayList<Nurse>();
			ArrayList<Nurse> list2 = new ArrayList<Nurse>();
			
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT user_ite FROM user_interest WHERE user_name = '" + userName + "'";
			
			rs = sta.executeQuery(sql);
			
			while(rs.next()) {
				
				if(rs.getString("user_ite") != null) {
					
					String [] kind = rs.getString("user_ite").split("_");
					
					for (int i = 0; i < kind.length; i++) {
						
						list2 = getNurse(kind[i]);
						
						int length = (list2.size() >= 4) ? 4 : list2.size(), j = 0;
						
						for (Nurse nurse : list2) {
							
							list1.add(nurse);
							
							if ( ++j >= length)
								break;
						}
					}
				}
			}
			
			return list1;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		} finally {
			
			dbmanage.close(rs, sta, conn);
		}
	}
	
	public ArrayList<Nurse> getNurse(String kind) {
		
		ArrayList<Nurse> list = new ArrayList<Nurse>();
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM nurse_information WHERE nurse_kind = '" + kind + "' AND star >= '" + 4 + "'";
			
			rs = sta.executeQuery(sql);
			
			while(rs.next()) {
				
				Nurse nurse = new Nurse();
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
				list.add(nurse);
			}
			
			return list;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		} 
	}
	
	public ArrayList<Nurse> getNurseByKind(String kind) {
		
		ArrayList<Nurse> list = new ArrayList<Nurse>();
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM nurse_information WHERE nurse_kind = '" + kind + "'";
			
			rs = sta.executeQuery(sql);
			
			while(rs.next()) {
				
				Nurse nurse = new Nurse();
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
				list.add(nurse);
			}
			
			return list;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		} 
	}
	
	public ArrayList<Nurse> getRecommendByKind(String kind) {
		
		ArrayList<Nurse> list = new ArrayList<Nurse>();
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM nurse_information WHERE nurse_kind = '" + kind + "' AND star >= '" + 4 + "'";
			
			rs = sta.executeQuery(sql);
			
			while(rs.next()) {
				
				Nurse nurse = new Nurse();
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
				list.add(nurse);
			}
			
			return list;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		} 
	}
	
	public User judgeUserExist(String userTel) {
		
		User user = null;
	
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SElECT * FROM user_information WHERE user_tel = '" + userTel + "'";
			
			rs = sta.executeQuery(sql);
			
			while(rs.next()) {
				
				user = new User();
				user.setTel(userTel);
			}
			
			return user;
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
	
	public boolean addIndent(Order order) {
		
		Dbmanage dbmanage = new Dbmanage();
		Connection conn = null;
		Statement sta = null;
		String orderID = "a" + ID++;
		order.setOrderID(orderID);
		
		try {
			
			conn = dbmanage.initDB(); 
			sta = conn.createStatement();
			
			String sql = "INSERT INTO user_indent(order_id,user_name,nurse_id,order_time,order_state,address,req,pay)VALUES('" +
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
	
	public User findUser(String userName) {
		
		User user = null;
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM user_information WHERE user_name = '" + userName + "'";
			
			rs = sta.executeQuery(sql);
			
			while(rs.next()) {
				
				user = new User();
				user.setUserimage(rs.getString("user_image"));
				user.setUsername(rs.getString("user_name"));
				user.setSex(rs.getString("user_sex"));
			}
			
			return user;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		} finally {
			
			dbmanage.close(rs, sta, conn);
		}
	}
	
	public String getuserImage(String userName) {
		
		String s = null;
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM user_information WHERE user_name = '" + userName + "'";
			
			rs = sta.executeQuery(sql);
			
			while(rs.next()) {
				
				s = rs.getString("user_image");
			}
			
			return s;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		} finally {
			
			dbmanage.close(rs, sta, conn);
		}
	}
	
	public ArrayList<Order> getAllOrder(String userName) {
		
		ArrayList<Order> orderList = new ArrayList<Order>();
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM user_indent WHERE user_name = '" + userName + "'";
			
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
	
	public boolean deleteOrder(String orderID) {
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "DELETE FROM user_indent WHERE order_id ='" + orderID + "'";
			
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
		
		String state = "È¡ÏûÔ¤Ô¼";
		
		try {
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "UPDATE nurse_indent,user_indent set nurse_indent.order_state = '" + state + 
					     "',user_indent.order_state = '"+ state + "' WHERE user_indent.order_id = '" + 
					     orderID + "' AND nurse_indent.order_id = '" + orderID + "'";
			
			sta.executeUpdate(sql);
			return true;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		} finally {
			
			dbmanage.closeDB(sta, conn);
		}
	}
	
	public Order getOrderByID(String orderID) {
		
		Order order = null;
		
		try {
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM user_indent WHERE order_id = '" + orderID +"'";
			
			rs = sta.executeQuery(sql);
			
			return order;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		} finally {
			
			dbmanage.closeDB(sta, conn);
		}	
	}
	
	public ArrayList<Order> getOrederByState(String state, String userName) {
		
		ArrayList<Order> orderList = new ArrayList<Order>();
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM user_indent WHERE order_state = '" + state +"' AND user_name ='" + userName + "'";
			
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
	
	public ArrayList<Nurse> Search(String s) {

		ArrayList<Nurse> nurses = new ArrayList<Nurse>();

		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "select * from nurse_information where nurse_name like" + "'%" + s + "%'" + "OR nurse_kind =" + "'" + s + "'" + 
			             " OR nurse_edu =" + "'" + s + "'" + "OR nurse_area like" + "'%" + s + "%'" + "OR star =" + "'" + s + "'";
			
			rs = sta.executeQuery(sql);
			
			while(rs.next())
			{
				Nurse nurse = new Nurse();
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
				nurses.add(nurse);
			}
			return nurses;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		} finally {
			
			dbmanage.close(rs,sta,conn);
		}
	}
	
	public void InsertEvaluate(Evaluate evaluate) {

		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "INSERT INTO evaluate (num, id, clientName,content,level,date)VALUES('" +
						(sum() + 1) + "','" +
						evaluate.getId() + "','" +
						evaluate.getClientName() + "','" +
						evaluate.getContent() + "','" +
						evaluate.getLevel() + "','"+
						evaluate.getDate() + "')";
			
			sta.executeUpdate(sql);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			dbmanage.closeDB(sta, conn);
		}
	}
	
	public Evaluates getEvaluates(String id) {
		
		Evaluates evaluates = new Evaluates();
		Evaluate evaluate = null;
		
		try {
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "SELECT * FROM evaluate WHERE id = '" + id +"'";		
			rs = sta.executeQuery(sql);
			
			while(rs.next()) {
				
				evaluate = new Evaluate(rs.getString("id"), rs.getString("clientName"),rs.getString("level"), rs.getString("content"), rs.getString("date"));
				evaluates.add(evaluate);
			}
			
			return evaluates;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		} finally {
			
			dbmanage.close(rs, sta, conn);
		}
	}
	
	public int sum() throws SQLException {
		
		String sql = "SELECT * FROM evaluate";
		rs = sta.executeQuery(sql);
		
		int sum  = 0;
		while ( rs.next() ) {
			sum++;
		}
		return sum;
	}
	
	public boolean find(String name,String phone){
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "select * from user_information";
			
			rs = sta.executeQuery(sql);
			
			while(rs.next()) {
				
				if(name.equals( rs.getString("user_name"))){
					if(phone.equals(rs.getString("user_tel")) ){
						return true;
					}
				}
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			dbmanage.close(rs,sta,conn);
		}
		return false;
	}
	
	public void userdo(String name,String psd1){
		
		try {
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
		
			sta.executeUpdate("update user_information set user_password ='"+psd1+"' where user_name = '"+name+"'");
			
		} catch (SQLException e){
			
			e.printStackTrace();
		} finally {
			
			dbmanage.closeDB(sta, conn);
		}
	}
	
	public void collect(String username,String nurseID){

		try{
			
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			sta.executeUpdate("insert into collection(user,ayi) value('" + username +"','"+ nurseID +"')");
			
			
		} catch(SQLException e) {
				
				e.printStackTrace();
		} finally {
			
			dbmanage.closeDB(sta, conn);
		}
	}
	
	public ArrayList<String> getAllCollection(String userName) {

		ArrayList<String> list = new ArrayList<String>();

		try {
			conn = dbmanage.initDB();
			sta = conn.createStatement();
			
			String sql = "select * from collection where user = '" + userName + "'";
			
			rs = sta.executeQuery(sql);
			
			while(rs.next()) {
				
				String s = rs.getString("ayi");
				list.add(s);
			}
			
			return list;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		} finally {
			
			dbmanage.close(rs,sta,conn);
		}
	}
}
