package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("categoryTop")
public class CategoryTopDTO {
	private int ctno;
	private String ctname;
	public CategoryTopDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCtno() {
		return ctno;
	}
	public void setCtno(int ctno) {
		this.ctno = ctno;
	}
	public String getCtname() {
		return ctname;
	}
	public void setCtname(String ctname) {
		this.ctname = ctname;
	}
	@Override
	public String toString() {
		return "CategoryTopDTO [ctno=" + ctno + ", ctname=" + ctname + "]";
	}
	
	
}
