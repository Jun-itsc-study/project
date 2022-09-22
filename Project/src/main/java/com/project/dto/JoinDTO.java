package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("join")
public class JoinDTO {
	private MemberDetailDTO memberDetail;
	private MemberDTO member;
	private MemberVipDTO vip;
	private QnaDTO qna;
	private NoticeDTO notice;
	private ProductDTO product;
	private ProductDetailDTO productDetail;
	private ProductFileDTO productFile;
	private CategoryTopDTO categoryTop;
	private CategoryBotDTO categoryBot;
	private CartDTO cart;
	private OrderedDTO ordered;
	private OrderDetailDTO oDetail;
	
	public JoinDTO() {
		super();
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
	public NoticeDTO getNotice() {
		return notice;
	}
	public void setNotice(NoticeDTO notice) {
		this.notice = notice;
	}
	public ProductDTO getProduct() {
		return product;
	}
	public void setProduct(ProductDTO product) {
		this.product = product;
	}
	public ProductDetailDTO getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(ProductDetailDTO productDetail) {
		this.productDetail = productDetail;
	}
	public ProductFileDTO getProductFile() {
		return productFile;
	}
	public void setProductFile(ProductFileDTO productFile) {
		this.productFile = productFile;
	}
	public CategoryTopDTO getCategoryTop() {
		return categoryTop;
	}
	public void setCategoryTop(CategoryTopDTO categoryTop) {
		this.categoryTop = categoryTop;
	}
	public CategoryBotDTO getCategoryBot() {
		return categoryBot;
	}
	public void setCategoryBot(CategoryBotDTO categoryBot) {
		this.categoryBot = categoryBot;
	}
	public CartDTO getCart() {
		return cart;
	}
	public void setCart(CartDTO cart) {
		this.cart = cart;
	}
	public OrderedDTO getOrdered() {
		return ordered;
	}
	public void setOrdered(OrderedDTO ordered) {
		this.ordered = ordered;
	}
	public OrderDetailDTO getoDetail() {
		return oDetail;
	}
	public void setoDetail(OrderDetailDTO oDetail) {
		this.oDetail = oDetail;
	}
	
	
}
