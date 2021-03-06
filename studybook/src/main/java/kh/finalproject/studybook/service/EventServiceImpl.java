package kh.finalproject.studybook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.studybook.domain.Event;
import kh.finalproject.studybook.dao.EventDAO;

@Service
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO dao;
	
	@Override
	public void insertEvent(Event event) {//이벤트 등록하기!!!!
		dao.insertEvent(event);		
	}

	@Override
	public Event getEventDetail(int num) {//글 내용보기
		return dao.getEventDetail(num);
	}

	@Override
	public int getEventListCount() {//이벤트 총 갯수 가져오기
		return dao.getEventListCount();
	}

	@Override
	public List<Event> getEventList(int page, int limit) {//글 목록 보기
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1)*limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getEventList(map);
	}

	@Override
	public int eventModify(Event modifyevent) {//이벤트 수정하기
		return dao.eventModify(modifyevent);
	}

	@Override
	public int eventDelete(int event_num) {//이벤트 삭제하기
		return dao.eventDelete(event_num);
	}

	@Override
	public String getEventWriter(int num) {//작성자 가져오기
		return dao.getEventWriter(num);
	}

	@Override
	public int getMainEventListCount() {
		return dao.getMainEventListCount();
	}

	@Override
	public List<Event> getMainEventList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1)*limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getMainEventList(map);
	}

	@Override
	public int getEventWriterNum(int num) {
		return dao.getEventWriterNum(num);
	}

	@Override
	public int getMonthEventListCount(String today) {
		return dao.getMonthEventListCount(today);
	}

	@Override
	public List<Event> getMonthEventList(int page, int limit, String today) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow = (page - 1)*limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("month", today);
		return dao.getMonthEventList(map);
	}

	@Override
	public int AdminEvent(int event_num) {
		return dao.AdminButton(event_num);
	}
	
	@Override
	public int AdminEvent2(int event_num) {
		return dao.AdminButton2(event_num);
	}

	@Override
	public List<Event> getSearchList(int index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 검색한다면
		if (index != -1) {
			//String[] search_field = new String[] { "MEM_KEY", "EVENT_NUM", "TITLE", "CONTENT" };
			map.put("search_field", index);
			map.put("search_word", "%" + search_word + "%");
		}
		// 검색 안한다면
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getSearchList(map);
	}

	@Override
	public int getEventListCount(int index, String search_word) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 검색한 경우
		if (index != -1) {
			//String[] search_field = new String[] { "MEM_KEY", "EVENT_NUM", "TITLE", "CONTENT" };
			map.put("search_field", index);
			map.put("search_word", "%" + search_word + "%");
		}
		System.out.println("RoomServiceImpl의 getSearchListCount");
		return dao.getSearchListCount(map);
	}

	
}
