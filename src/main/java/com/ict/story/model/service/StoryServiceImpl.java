package com.ict.story.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.story.model.dao.StoryDAO;

@Service
public class StoryServiceImpl  implements StoryService{
	
	@Autowired
	StoryDAO storyDAO;



}
