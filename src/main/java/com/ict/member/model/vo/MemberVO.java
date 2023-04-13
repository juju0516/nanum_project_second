package com.ict.member.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private int		member_idx;
	private String	login_type;
	private int		kakao_login_idx;
	private String	id;
	private String	pw;
	private String	name;
	private String	birth;
	private String	gender;
	private String	phone;
	private String	email;
	private String	nickname;
	private String	address;
	private String	p_f_name;
	private int		cur_point;
	private String	tag;
	private String	tag_open;
	private String	s_history_open;
	private String	join_date;
	private String	leave_date;
	private String	m_state;
	private String	manager_id;
	private String last_address;
	//
	private MultipartFile f_param;
	
	public MultipartFile getF_param() {
		return f_param;
	}
	public void setF_param(MultipartFile f_param) {
		this.f_param = f_param;
	}
	//
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getLogin_type() {
		return login_type;
	}
	public void setLogin_type(String login_type) {
		this.login_type = login_type;
	}
	public int getKakao_login_idx() {
		return kakao_login_idx;
	}
	public void setKakao_login_idx(int kakao_login_idx) {
		this.kakao_login_idx = kakao_login_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getP_f_name() {
		return p_f_name;
	}
	public void setP_f_name(String p_f_name) {
		this.p_f_name = p_f_name;
	}
	public int getCur_point() {
		return cur_point;
	}
	public void setCur_point(int cur_point) {
		this.cur_point = cur_point;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getTag_open() {
		return tag_open;
	}
	public void setTag_open(String tag_open) {
		this.tag_open = tag_open;
	}
	public String getS_history_open() {
		return s_history_open;
	}
	public void setS_history_open(String s_history_open) {
		this.s_history_open = s_history_open;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	public String getLeave_date() {
		return leave_date;
	}
	public void setLeave_date(String leave_date) {
		this.leave_date = leave_date;
	}
	public String getM_state() {
		return m_state;
	}
	public void setM_state(String m_state) {
		this.m_state = m_state;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getLast_address() {
		return last_address;
	}
	public void setLast_address(String last_address) {
		this.last_address = last_address;
	}
	
}
