package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("cart")
public class CartDTO {
	private int cno;
	private int mno;
	private int pno;
	private int ea;
	
	
	public CartDTO() {
		super();
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getEa() {
		return ea;
	}

	public void setEa(int ea) {
		this.ea = ea;
	}

	@Override
	public String toString() {
		return "장바구니 [cno=" + cno + ", mno=" + mno + ", pno=" + pno + ", ea=" + ea + "]";
	}
	
}
