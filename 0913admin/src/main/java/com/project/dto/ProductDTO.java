package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("Product")
public class ProductDTO {
	private int pno;
	private String pname;
	private int ctno;
	private int cbno;
	private String seller;
	private int price;
	private int ea;
	private String image;
	private String detail;
	private String maker;
	private String ctname;
	private String cbname;
	
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getEa() {
		return ea;
	}

	public void setEa(int ea) {
		this.ea = ea;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getCtname() {
		return ctname;
	}

	public void setCtname(String ctname) {
		this.ctname = ctname;
	}

	public String getCbname() {
		return cbname;
	}

	public void setCbname(String cbname) {
		this.cbname = cbname;
	}

	@Override
	public String toString() {
		return "ProductDTO [pno=" + pno + ", pname=" + pname + ", ctno=" + ctno + ", cbno=" + cbno + ", seller="
				+ seller + ", price=" + price + ", ea=" + ea + ", image=" + image + ", detail=" + detail + ", maker="
				+ maker + ", ctname=" + ctname + ", cbname=" + cbname + "]";
	}

	
	
}
