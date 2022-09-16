package com.project.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("notice")
public class NoticeDTO {
	private int nno;
	private String nname;
	private String ncontent;
	private String ndate;
	
	public NoticeDTO() {
		super();
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNdate() {
		return ndate;
	}

	public void setNdate(String ndate) {
		this.ndate = ndate;
	}

	@Override
	public String toString() {
		return "BoardDTO [nno=" + nno + ", nname=" + nname + ", ncontent=" + ncontent + ", ndate=" + ndate + "]";
	}

	
	
}
