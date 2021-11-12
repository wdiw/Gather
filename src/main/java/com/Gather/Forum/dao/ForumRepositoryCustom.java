package com.Gather.Forum.dao;

import java.util.List;
import java.util.Set;

import com.Gather.Forum.model.ForumBean;

public interface ForumRepositoryCustom {
	
	//標題搜尋
	List<ForumBean> findforumBytitle(Set<String> forumtitles);
	
	
}
