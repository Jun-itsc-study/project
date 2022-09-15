package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("qna")
public class QnaDTO {
	//qno, mno, qcontent, qdate, qstatus, qanswer, qtitle, qadate
	private int qno;
	private int mno;
	private String qcontent;
	private String qdate;
	private int qstatus;
	private String qanswer;
	private String qtitle;
	private String qadate;
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
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQadate() {
		return qadate;
	}
	public void setQadate(String qadate) {
		this.qadate = qadate;
	}
	@Override
	public String toString() {
		return "QnaDTO [qno=" + qno + ", mno=" + mno + ", qcontent=" + qcontent + ", qdate=" + qdate + ", qstatus="
				+ qstatus + ", qanswer=" + qanswer + ", qtitle=" + qtitle + ", qadate=" + qadate + "]";
	}
}
