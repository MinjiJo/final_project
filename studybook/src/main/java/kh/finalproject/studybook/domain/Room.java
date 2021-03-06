package kh.finalproject.studybook.domain;

public class Room {
	private int ROOM_CODE;
	private String ROOM_NAME;
	private String ROOM_INFO;
	private String ROOM_TYPE;
	private int MIN_MEMBER;
	private int MAX_MEMBER;
	private int MIN_HOUR;
	private int HOUR_COST;
	private String ROOM_INTRO;
	private String FAC_INTRO;
	private String HASHTAG;
	//db에 없는 값(gallery filename)
	private String FILE_NAME;
	private String reserve_date;
	private String start_time;
	private String end_time;

	public String getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	
	public int getROOM_CODE() {
		return ROOM_CODE;
	}
	public void setROOM_CODE(int rOOM_CODE) {
		ROOM_CODE = rOOM_CODE;
	}
	public String getROOM_NAME() {
		return ROOM_NAME;
	}
	public void setROOM_NAME(String rOOM_NAME) {
		ROOM_NAME = rOOM_NAME;
	}
	public String getROOM_INFO() {
		return ROOM_INFO;
	}
	public void setROOM_INFO(String rOOM_INFO) {
		ROOM_INFO = rOOM_INFO;
	}
	public String getROOM_TYPE() {
		return ROOM_TYPE;
	}
	public void setROOM_TYPE(String rOOM_TYPE) {
		ROOM_TYPE = rOOM_TYPE;
	}
	public int getMIN_MEMBER() {
		return MIN_MEMBER;
	}
	public void setMIN_MEMBER(int mIN_MEMBER) {
		MIN_MEMBER = mIN_MEMBER;
	}

	
	public int getMAX_MEMBER() {
		return MAX_MEMBER;
	}
	public void setMAX_MEMBER(int mAX_MEMBER) {
		MAX_MEMBER = mAX_MEMBER;
	}
	public int getMIN_HOUR() {
		return MIN_HOUR;
	}
	public void setMIN_HOUR(int mIN_HOUR) {
		MIN_HOUR = mIN_HOUR;
	}
	public int getHOUR_COST() {
		return HOUR_COST;
	}
	public void setHOUR_COST(int hOUR_COST) {
		HOUR_COST = hOUR_COST;
	}
	public String getROOM_INTRO() {
		return ROOM_INTRO;
	}
	public void setROOM_INTRO(String rOOM_INTRO) {
		ROOM_INTRO = rOOM_INTRO;
	}
	public String getFAC_INTRO() {
		return FAC_INTRO;
	}
	public void setFAC_INTRO(String fAC_INTRO) {
		FAC_INTRO = fAC_INTRO;
	}
	public String getHASHTAG() {
		return HASHTAG;
	}
	public void setHASHTAG(String hASHTAG) {
		HASHTAG = hASHTAG;
	}
	public String getFILE_NAME() {
		return FILE_NAME;
	}
	public void setFILE_NAME(String fILE_NAME) {
		FILE_NAME = fILE_NAME;
	}
	
	
	
}
