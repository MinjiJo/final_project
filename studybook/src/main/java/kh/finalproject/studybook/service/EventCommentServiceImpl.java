package kh.finalproject.studybook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.studybook.dao.EventDAO;
import kh.finalproject.studybook.domain.Event_comment;

@Service
public class EventCommentServiceImpl implements EventCommentService {
	@Autowired
	private EventDAO dao;

	@Override
	public List<Event_comment> getEvent_commentList(int event_num) {
		return dao.getEvent_commentList(event_num);
	}
	
	@Override
	public int Event_commentsInsert(Event_comment co) {
		return dao.Event_commentsInsert(co);
	}

	@Override
	public int Event_commentsDelete(int event_com_num) {
		return dao.Event_commentsDelete(event_com_num);
	}

	@Override
	public int Event_commentsUpdate(Event_comment co) {
		return dao.Event_commentsUpdate(co);
	}

	@Override
	public int Event_commentReply(Event_comment co) {
		return dao.Event_commentReply(co);
	}

	@Override
	public String getEvent_commentWriter(int mem_key) {
		return dao.Event_commentWriter(mem_key);
	}


}
