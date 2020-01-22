package kh.finalproject.studybook.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Event;
import kh.finalproject.studybook.domain.Event_comment;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertEvent(Event event) {//이벤트 등록하기!!!!
		sqlSession.insert("event.insertEvent", event);		
	}

	public Event getEventDetail(int num) {//글 내용보기
		return sqlSession.selectOne("event.detail", num);
	}
	
	public int getEventListCount() {//이벤트 총 갯수 가져오기
		return sqlSession.selectOne("event.count");
	}

	public int eventDelete(int num) {//이벤트 삭제하기
		return sqlSession.delete("event.delete", num);
	}

	public List<Event> getEventList(HashMap<String, Integer> map) {//글 목록 보기
		return sqlSession.selectList("event.list", map);
	}

	public int eventModify(Event modifyevent) {//수정하기
		return sqlSession.update("event.modifyEvent", modifyevent);
	}

	public String getEventWriter(int num) {//작성자 가져오기
		return sqlSession.selectOne("event.event_writer", num);
	}

	public int getMainEventListCount() {//메인화면 이벤트 총 갯수 가져오기
		return sqlSession.selectOne("event.main_count");
	}

	public List<Event> getMainEventList(HashMap<String, Integer> map) {
		return sqlSession.selectList("event.main_list", map);
	}

	public int getEventWriterNum(int num) {
		return sqlSession.selectOne("event.event_writer_num", num);
	}
	
	/** Comment 관련*/
	public int getEventListCount(int event_num) {
		return sqlSession.selectOne("event_comment.count", event_num);
	}

	public int Event_commentsInsert(Event_comment co) {
		return sqlSession.insert("event_comment.insert", co);
	}

	public List<Event_comment> getEvent_commentList(int event_num) {
		return sqlSession.selectList("event_comment.getList", event_num);
	}

	public int Event_commentsDelete(int event_com_num) {
		return sqlSession.delete("event_comment.delete", event_com_num);
	}

	public int Event_commentsUpdate(Event_comment co) {
		return sqlSession.update("event_comment.update", co);
	}
	
}
