package com.ict.review.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.review.model.vo.ReviewVO;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public int getTotalCount() {
		return sqlSessionTemplate.selectOne("review.review_count");
	}
	
	public List<ReviewVO> getReviewList(int begin, int end){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("review.review_list", map);
	}
	
	public int getReviewhit(String review_idx) {
		return sqlSessionTemplate.update("review.review_hitup", review_idx);
	}
	
	public ReviewVO getReviewDetail(String review_idx) {
		return sqlSessionTemplate.selectOne("review.review_detail", review_idx);
	}
	
	public int getReviewInsert(ReviewVO revo) {
		return sqlSessionTemplate.insert("review.review_insert", revo);
	}
	
	public int getReviewUpdate(ReviewVO revo) {
		return sqlSessionTemplate.update("review.review_update", revo);
	}
	
	public int getReviewDelete(String review_idx) {
		return sqlSessionTemplate.delete("review.review_delete", review_idx);
	}
}
