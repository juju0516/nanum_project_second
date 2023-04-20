package com.ict.member.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.aids.model.vo.Req_AidsVO;
import com.ict.goods.model.vo.Goods_SaleVO;
import com.ict.member.model.vo.InquiryVO;
import com.ict.member.model.vo.MemberVO;
import com.ict.member.model.vo.PointVO;
import com.ict.project.model.vo.DonatorVO;
import com.ict.project.model.vo.Prj_RegiVO;
import com.ict.project.model.vo.RegularVO;
import com.ict.special.model.vo.Special_DonateVO;

@Repository
public class Member_DAO {
	@Autowired 
	private SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	private RegularVO regularVO;
	@Autowired
	private Goods_SaleVO goods_SaleVO;
	@Autowired
	private Req_AidsVO req_AidsVO;
	@Autowired
	private Special_DonateVO special_DonateVO;
	@Autowired
	private Prj_RegiVO prj_RegiVO;
	@Autowired
	private DonatorVO donatorVO;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public MemberVO getNickname_Name(String id) {
		return sqlSessionTemplate.selectOne("member.getnick_name", id);
	}
	public int getChangeNick(MemberVO mvo) {
		return sqlSessionTemplate.update("member.change_nick", mvo);
	}
	public int getChangeProf(MemberVO mvo) {
		return sqlSessionTemplate.update("member.update_prof", mvo);
	}
	
	public int getTotalCount() {
		return sqlSessionTemplate.selectOne("member.count");
	}
	public int getTotalCountInq() {
		return sqlSessionTemplate.selectOne("inquiry.count");
	}
	public int getTotalCountPoint() {
		return sqlSessionTemplate.selectOne("point.count");
	}
	public int getTotalCountRegular() {
		return sqlSessionTemplate.selectOne("regular.count");
	}
	public List<MemberVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("member.list", map) ;
	}
	public MemberVO getOneList(String id) {
		return sqlSessionTemplate.selectOne("member.onelist", id);
	}
	
	public int getMemberUpdate(MemberVO mvo) {
		return sqlSessionTemplate.update("member.update", mvo);
	}
	
	public int getInqInsert(InquiryVO iqvo) {
		return sqlSessionTemplate.insert("inquiry.insert", iqvo);
	}
	
	public List<InquiryVO> getInqList(int begin, int end) {
	Map<String, Integer> map = new HashMap<String, Integer>();
	map.put("begin", begin);
	map.put("end", end);
	return sqlSessionTemplate.selectList("inquiry.list", map);
	}
	
	public InquiryVO getInqOneList(int inquiry_idx) {
	    return sqlSessionTemplate.selectOne("inquiry.onelist_idx", inquiry_idx);
	}
	
	public int getDeleteInquiry(int inquiry_idx) {
		return sqlSessionTemplate.delete("inquiry.delete", inquiry_idx);
	}
	
	public int getPointInsert(PointVO pvo) {
		return sqlSessionTemplate.insert("point.insert_point", pvo);
	}
	
	public List<PointVO> getChangePointList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("point.point_list", map);
	}
	public List<RegularVO> getRegularList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("regular.regular_list", map);
	}
	public List<PointVO> getPointID(String id) {
		return sqlSessionTemplate.selectList("point.getpoint_id", id);
	}
	public List<RegularVO> getRegularID(String id) {
		return sqlSessionTemplate.selectList("regular.getreg_id", id);
	}
	
	public List<Goods_SaleVO> getGoodsList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("goods_sale.goods_list", map);
	}
	
	public List<Goods_SaleVO> getGoodsID(String id) {
		return sqlSessionTemplate.selectList("goods_sale.getgoods_id", id);
	}
	
	public int getTotalCountGoods() {
		return sqlSessionTemplate.selectOne("goods_sale.count");
	}
	
	public List<Req_AidsVO> getReqList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("req_aids.req_aids_list", map);
	}
	
	public List<Req_AidsVO> getReqID(String id) {
		return sqlSessionTemplate.selectList("req_aids.getreq_aids_id", id);
	}
	
	public int getTotalCountReq() {
		return sqlSessionTemplate.selectOne("req_aids.count");
	}
	
	public List<Special_DonateVO> getSpecList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("special.special_list", map);
	}
	
	public List<Special_DonateVO> getSpecID(String id) {
		return sqlSessionTemplate.selectList("special.getspecial_id", id);
	}
	
	public int getTotalCountSpec() {
		return sqlSessionTemplate.selectOne("special.count");
	}
	
	public List<Prj_RegiVO> getRegiList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("prj_regi.prj_regi_list", map);
	}
	
	public List<Prj_RegiVO> getRegiID(String id) {
		return sqlSessionTemplate.selectList("prj_regi.getprj_regi_id", id);
	}
	
	public int getTotalCountRegi() {
		return sqlSessionTemplate.selectOne("prj_regi.count");
	}
	
	public List<DonatorVO> getDNTList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("donator.donator_list", map);
	}
	
	public List<DonatorVO> getDNTID(String id) {
		return sqlSessionTemplate.selectList("donator.getdonator_id", id);
	}
	
	public int getTotalCountDNT() {
		return sqlSessionTemplate.selectOne("donator.count");
	}
	
}
