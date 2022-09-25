package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("orderDetail")
public class OrderDetailDTO {
	private int ono;
	private int pno;
	private int pprice;
	private int pcount;
	private int ptotalprice;
	
	public OrderDetailDTO() {
		super();
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public int getPcount() {
		return pcount;
	}

	public void setPcount(int pcount) {
		this.pcount = pcount;
	}

	public int getPtotalprice() {
		return ptotalprice;
	}

	public void setPtotalprice(int ptotalprice) {
		this.ptotalprice = ptotalprice;
	}

	@Override
	public String toString() {
		return "Ordered_DetaiDTO [ono=" + ono + ", pno=" + pno + ", pprice=" + pprice + ", pcount=" + pcount
				+ ", ptotalprice=" + ptotalprice + "]";
	}

	
	
}
