package com.project.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("ordered")
public class OrderedDTO {
	private int ono;
	private int mno;
	private int nmno;
	private int dno;
	private String postno;
	private String address1;
	private String address2;
	private int oea;
	private int totalprice;
	private Date odate;
	
	public OrderedDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getNmno() {
		return nmno;
	}

	public void setNmno(int nmno) {
		this.nmno = nmno;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getPostno() {
		return postno;
	}

	public void setPostno(String postno) {
		this.postno = postno;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public int getOea() {
		return oea;
	}

	public void setOea(int oea) {
		this.oea = oea;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public Date getOdate() {
		return odate;
	}

	public void setOdate(Date odate) {
		this.odate = odate;
	}

	@Override
	public String toString() {
		return "OrderedDTO [ono=" + ono + ", mno=" + mno + ", nmno=" + nmno + ", dno=" + dno + ", postno=" + postno
				+ ", address1=" + address1 + ", address2=" + address2 + ", oea=" + oea + ", totalprice=" + totalprice
				+ ", odate=" + odate + "]";
	}


	
}
