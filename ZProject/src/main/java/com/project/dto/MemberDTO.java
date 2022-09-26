package com.project.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	private int mno;
	private String id;
	private String pwd;
	private String name;
	private Date birth; //String 으로 할지 Date할지 실행해보고 확정
	private String tel;
	private String postno;
	private String address1;
	private String address2;
	private int vno;
	private int mileage;
	private int totalmileage;
	private String vname; //등급명
	public MemberDTO() {
		super();
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
	public int getVno() {
		return vno;
	}
	public void setVno(int vno) {
		this.vno = vno;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public int getTotalmileage() {
		return totalmileage;
	}
	public void setTotalmileage(int totalmileage) {
		this.totalmileage = totalmileage;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	@Override
	public String toString() {
		return "MemberDTO [mno=" + mno + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth
				+ ", tel=" + tel + ", postno=" + postno + ", address1=" + address1 + ", address2=" + address2 + ", vno="
				+ vno + ", mileage=" + mileage + ", totalmileage=" + totalmileage + ", vname=" + vname + "]";
	}
	
	
	
}
