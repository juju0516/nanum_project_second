package com.ict.review.model.service;

import java.util.List;

import com.ict.review.model.vo.ReviewVO;

public interface ReviewService {
	// 후기 리스트
	public int getTotalCount();
	public List<ReviewVO> getReviewList(int begin, int end);
	
	// 후기 글
	public int getReviewhit(String review_idx);
	public ReviewVO getReviewDetail(String review_idx);
	
	public int getReviewInsert(ReviewVO revo);
	public int getReviewUpdate(ReviewVO revo);
	public int getReviewDelete(String review_idx);
	
}
