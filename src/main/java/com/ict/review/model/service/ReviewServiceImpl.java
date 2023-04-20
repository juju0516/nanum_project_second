package com.ict.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.review.model.dao.ReviewDAO;
import com.ict.review.model.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	ReviewDAO reviewDAO;
	
	@Override
	public int getTotalCount() {
		return reviewDAO.getTotalCount();
	}
	
	@Override
	public List<ReviewVO> getReviewList(int begin, int end) {
		return reviewDAO.getReviewList(begin, end);
	}
	
	@Override
	public int getReviewhit(String id) {
		return reviewDAO.getReviewhit(id);
	}
	
	@Override
	public ReviewVO getReviewDetail(String review_idx) {
		return reviewDAO.getReviewDetail(review_idx);
	}
	
	@Override
	public int getReviewInsert(ReviewVO revo) {
		return reviewDAO.getReviewInsert(revo);
	}
	
	@Override
	public int getReviewUpdate(ReviewVO revo) {
		return reviewDAO.getReviewUpdate(revo);
	}
	
	@Override
	public int getReviewDelete(String review_idx) {
		return reviewDAO.getReviewDelete(review_idx);
	}
}
