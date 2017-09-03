package com.ayll.Vo;

public class Order {
	
	private String orderID;
	
	private String userName;
	
	private String nurseID;
	
	private String orderTime;
	
	private String orderState;
	
	private String address;
	
	private String require;
	
	private String pay;

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNurseID() {
		return nurseID;
	}

	public void setNurseID(String nurseID) {
		this.nurseID = nurseID;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRequire() {
		return require;
	}

	public void setRequire(String require) {
		this.require = require;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	@Override
	public String toString() {
		return "Order [orderID=" + orderID + ", userName=" + userName + ", nurseID=" + nurseID + ", orderTime="
				+ orderTime + ", orderState=" + orderState + ", address=" + address + ", require=" + require + ", pay="
				+ pay + "]";
	}
	
	
}
