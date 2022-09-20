package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("productDetail")
public class ProductDetailDTO {
	private int pno;
	private int price;
	private int ea;
	private String image;
	private String detail;
	private String maker;

	public ProductDetailDTO() {
		super();
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
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

	@Override
	public String toString() {
		return "ProductDetailDTO [pno=" + pno + ", price=" + price + ", ea=" + ea + ", image=" + image + ", detail="
				+ detail + ", maker=" + maker + "]";
	}
	
}
