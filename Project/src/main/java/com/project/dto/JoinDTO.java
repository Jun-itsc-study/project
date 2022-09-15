package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("join")
public class JoinDTO {
	private MemberDetailDTO memberDetail;
	private MemberDTO member;
	private MemberVipDTO vip;
	private QnaDTO qna;
	
	public JoinDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDetailDTO getMemberDetail() {
		return memberDetail;
	}
	public void setMemberDetail(MemberDetailDTO memberDetail) {
		this.memberDetail = memberDetail;
	}
	public MemberDTO getMember() {
		return member;
	}
	public void setMember(MemberDTO member) {
		this.member = member;
	}
	public MemberVipDTO getVip() {
		return vip;
	}
	public void setVip(MemberVipDTO vip) {
		this.vip = vip;
	}
	public QnaDTO getQna() {
		return qna;
	}
	public void setQna(QnaDTO qna) {
		this.qna = qna;
	}
	
	
}
