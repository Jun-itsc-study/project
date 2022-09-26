package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("qna")
public class QnaDTO {
	private int qno;
	private int mno;
	private String qcontent;
	private String qdate;
	private int qstatus;
	private String qanswer;
	private String id;
	private String qtitle;
	
	public QnaDTO() {
		super();
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public String getQdate() {
		return qdate;
	}

	public void setQdate(String qdate) {
		this.qdate = qdate;
	}

	public int getQstatus() {
		return qstatus;
	}

	public void setQstatus(int qstatus) {
		this.qstatus = qstatus;
	}

	public String getQanswer() {
		return qanswer;
	}

	public void setQanswer(String qanswer) {
		this.qanswer = qanswer;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	@Override
	public String toString() {
		return "QnaDTO [qno=" + qno + ", mno=" + mno + ", qcontent=" + qcontent + ", qdate=" + qdate + ", qstatus="
				+ qstatus + ", qanswer=" + qanswer + ", id=" + id + ", qtitle=" + qtitle + "]";
	}

}
