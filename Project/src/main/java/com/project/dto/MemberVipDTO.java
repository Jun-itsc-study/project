package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("vip")
public class MemberVipDTO {
	private int vno;
	private String vname;
	private int vcondition;
	private int vpercent;
	public MemberVipDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getVpercent() {
		return vpercent;
	}
	public void setVpercent(int vpercent) {
		this.vpercent = vpercent;
	}
	public int getVno() {
		return vno;
	}
	public void setVno(int vno) {
		this.vno = vno;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public int getVcondition() {
		return vcondition;
	}
	public void setVcondition(int vcondition) {
		this.vcondition = vcondition;
	}
	@Override
	public String toString() {
		return "MemberVipDTO [vno=" + vno + ", vname=" + vname + ", vcondition=" + vcondition + ", vpercent=" + vpercent
				+ "]";
	}
	

}
