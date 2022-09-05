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
	private String address;
	private int vno;
	private int mileage;
	private String vname; //등급명
	

	//기본생성자
	public MemberDTO() {
		super();
	}
	
	//setter getter
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getVname() {
		return vname;
	}
	
	public void setVname(String vname) {
		this.vname = vname;
	}

	@Override
	public String toString() {
		return "MemberDTO [mno=" + mno + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", date=" + birth + ", tel="
				+ tel + ", address=" + address + ", vno=" + vno + ", mileage=" + mileage + ", vname=" + vname + "]";
	}
	
	
}
