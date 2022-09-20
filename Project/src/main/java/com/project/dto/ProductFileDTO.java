package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("productFile")
public class ProductFileDTO {
	private int pno;
	private int fno;
	private String path;

	public ProductFileDTO() {
		super();
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "ProductFileDTO [pno=" + pno + ", fno=" + fno + ", path=" + path + "]";
	}
	
}
