package com.ict.story.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StoryController {
	
	@RequestMapping("story_introduce.do")
	public ModelAndView getIntroduce() {
		return new ModelAndView("story/story_introduce");
	}
	@RequestMapping("story_list.do")
	public ModelAndView getStoryList() {
		return new ModelAndView("story/story_list");
	}
	
	@RequestMapping("story_detail.do")
	public ModelAndView getStoryDetail() {
		return new ModelAndView("story/story_detail");
	}
	
	@RequestMapping("story_notice.do")
	public ModelAndView getNotice() {
		return new ModelAndView("story/story_notice");
	}
	
	@RequestMapping("story_notice_detail.do")
	public ModelAndView getNoticeDetail() {
		return new ModelAndView("story/story_notice_detail");
	}
	
	@RequestMapping("story_news.do")
	public ModelAndView getNews() {
		return new ModelAndView("story/story_news");
	}
	
	@RequestMapping("story_news_detail.do")
	public ModelAndView getNewsDetail() {
		return new ModelAndView("story/story_news_detail");
	}

}
