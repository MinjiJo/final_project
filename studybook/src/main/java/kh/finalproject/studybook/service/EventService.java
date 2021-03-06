package kh.finalproject.studybook.service;

import java.util.List;
import kh.finalproject.studybook.domain.Event;


public interface EventService {
	//이벤트 등록하기!!!!
	public void insertEvent(Event event);
	//글 내용 보기
	public Event getEventDetail(int num);
	//글 개수 구하기
	public int getEventListCount();
	//글 목록 보기
	public List<Event> getEventList(int page, int limit);
	//글 수정
	public int eventModify(Event modifyevent);
	//글 삭제
	public int eventDelete(int event_num);
	//글쓴이 가져오기
	public String getEventWriter(int num);
	//메인 화면 글 개수 구하기
	public int getMainEventListCount();
	//메인 화면 이벤트 리스트 구하기
	public List<Event> getMainEventList(int page, int limit);
	//작성자 키 값 가져오기
	public int getEventWriterNum(int num);
	//이번달 이벤트 글 개수 구하기
	public int getMonthEventListCount(String today);
	//이번달 이벤트 리스트 구하기
	public List<Event> getMonthEventList(int page, int limit, String today);
	//반려
	public int AdminEvent(int event_num);
	//관리자 전용 리스트 뽑아 오기
	public List<Event> getSearchList(int index, String search_word, int page, int limit);
	public int getEventListCount(int index, String search_word);
	//승인
	public int AdminEvent2(int event_num);
}
