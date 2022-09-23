package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("cart")
public class CartDTO {
	private int cno;
	private int mno;
	private int pno;
	private int cea;
	
	
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

	public int getCea() {
		return cea;
	}

	public void setCea(int cea) {
		this.cea = cea;
	}

	@Override
	public String toString() {
		return "장바구니 [cno=" + cno + ", mno=" + mno + ", pno=" + pno + ", cea=" + cea + "]";
	}
	
}
