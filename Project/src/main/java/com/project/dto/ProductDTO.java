package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("product")
public class ProductDTO {
	private int pno;
	private String pname;
	private int ctno;
	private int cbno;
	private String seller;
	
	public ProductDTO() {
		super();
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
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

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	@Override
	public String toString() {
		return "ProductDTO [pno=" + pno + ", pname=" + pname + ", ctno=" + ctno + ", cbno=" + cbno + ", seller="
				+ seller + "]";
	}
	
}
