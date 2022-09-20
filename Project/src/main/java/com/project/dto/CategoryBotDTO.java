package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("categoryBot")
public class CategoryBotDTO {
	private int ctno;
	private int cbno;
	private String cbname;
	
	public CategoryBotDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCtno() {
		return ctno;
	}
	public void setCtno(int ctno) {
		this.ctno = ctno;
	}
	public int getCbno() {
		return cbno;
	}
	public void setCbno(int cbno) {
		this.cbno = cbno;
	}
	public String getCbname() {
		return cbname;
	}
	public void setCbname(String cbname) {
		this.cbname = cbname;
	}
	@Override
	public String toString() {
		return "CategoryBotDTO [ctno=" + ctno + ", cbno=" + cbno + ", cbname=" + cbname + "]";
	}
	
	
}
