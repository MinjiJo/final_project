<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 캘린더 css 불러오기 -->
	<link rel="stylesheet" href="resources/css/jsCalendar.css">
	<!-- main css 불러오기 -->
	<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
	<!-- 카카오지도 services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96ef4dc13ca9a8b7e395102cddc78d5f&libraries=services"></script>
	<!-- 카카오지도 api 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96ef4dc13ca9a8b7e395102cddc78d5f"></script>
	<!-- 캘린더 js 불러오기 -->
	<script src="resources/js/jsCalendar.js"></script>
	<!-- main js 불러오기 -->
	<script src="resources/js/main.js"></script>
</head>
<body>
<input type="hidden" name="date" id="date" value="">
<input type="hidden" name="starttime" id="starttime" value="">
<input type="hidden" name="endtime" id="endtime" value="">
<input type="hidden" name="MIN_MEMBER" id="MIN_MEMBER" value="">
<input type="hidden" name="MAX_MEMBER" id="MAX_MEMBER" value="">
	<div id="m_main_header">
		<div class="container">
			<div class="row">
				<div class="col-md">
					<p class="m_header_text">"<span class="m_month"></span>월 스터디<br>공간 예약 서두르세요!"</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md">
					<div class="m_main_header_column">
						<div class="m_main_select">
							<div class="m_write" id="m_write_date">
								<div>
									<i class="far fa-calendar-alt"></i>
									모임 날짜
								</div>
								<i class="fas fa-chevron-down"></i>
							</div>
							<div id="my-calendar" class="e_calendar"></div>
	            		</div>
						<div class="m_main_select">
							<div class="m_write" id="m_write_starttime">
								<i class="far fa-clock"></i>
								START
								<i class="fas fa-chevron-down"></i>
							</div>
							<div id="m_main_starttime">
								<ul>
									<li>9시</li>
									<li>10시</li>
									<li>11시</li>
									<li>12시</li>
									<li>13시</li>
									<li>14시</li>
									<li>15시</li>
									<li>16시</li>
									<li>17시</li>
									<li>18시</li>
									<li>19시</li>
									<li>20시</li>
									<li>21시</li>
								</ul>
				        	</div>
						</div>
						<div class="m_main_select">
							<div class="m_write" id="m_write_endtime">
								<i class="far fa-clock"></i>
								END
								<i class="fas fa-chevron-down"></i>
							</div>
							<div id="m_main_endtime">
								<ul>
									<li>10시</li>
									<li>11시</li>
									<li>12시</li>
									<li>13시</li>
									<li>14시</li>
									<li>15시</li>
									<li>16시</li>
									<li>17시</li>
									<li>18시</li>
									<li>19시</li>
									<li>20시</li>
									<li>21시</li>
									<li>22시</li>
								</ul>
				        	</div>
						</div>
						<div class="m_main_select">
							<div class="m_write" id="m_write_count">
								<i class="fas fa-user"></i>
								인원
								<i class="fas fa-chevron-down"></i>
							</div>
							<div id="m_main_count">
								<ul>
									<li>4명 이하</li>
									<li>4명 이상</li>
									<li>8명 이상</li>
									<li>12명 이상</li>
								</ul>
				        	</div>
						</div>
						<button id="m_main_search" class="m_main_select" onclick="search()">검색</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div id="j_main_room" class="container">
				
	</div>
	
	<div class="container"  id="j_main_event">
		<div class="row">
			<div class="col-md-center j_event_title">UPCOMING EVENT</div>
		</div>
		
		<%-- 이벤트 있는 경우 --%>
		<c:if test="${event_listcount > 0}">
			<div class="row j_event_more_div">
				<div class="j_event_more" onClick="javascript:location.href='event_list.eve'">더보기</div>
			</div>
			
			<!-- Carousel -->
			<div class="row">
				<div class="container">
	            <div class="row blog">
	                <div class="col-md-12">
	                    <div id="blogCarousel" class="carousel slide" data-ride="carousel">
	             
	             			<c:if test="${!empty eventlist2}">
								<!-- event 좌우 버튼 -->
								<ol class="carousel-indicators">
		                            <li data-target="#blogCarousel" data-slide-to="0" class="active"></li>
		                            <li data-target="#blogCarousel" data-slide-to="1"></li>
		                        </ol>
		                        
	                        <!-- Carousel items -->
	                        <div class="carousel-inner">
	                            <div class="carousel-item active">
	                            	<div class="row">
	                            	<c:forEach var="list" items="${eventlist}" varStatus="status">
	                                	<div class="col-md-4">
		                               		<div class="j_event" onclick="javascript:location.href='EventDetailAction.eve?event_num=${list.event_num}'">
			                                   	<img class="col-md j_event_img" src="resources/upload/${list.event_pic}">
			                                    <div class="col-md j_event_inner">
					                                <div class="j_event_name">${list.title}</div>
					                                <br><br><br>
					                                <div class="j_event_date">
						                                <c:set var="event_date" value="${list.event_date}"/>
						                                ${fn:substring(event_date,0,10)},
													</div>
					                                <div class="j_event_date">${list.event_room}</div>
				                                </div>
		                                    </div>
	                                    </div>
	                                <c:if test="${status.last}">
	                                	<c:if test="${status.count%3==1}">
	                                		<div class="col-md-4"></div>
	                                		<div class="col-md-4"></div>
	                                	</c:if>
	                                	<c:if test="${status.count%3==2}">
	                                		<div class="col-md-4"></div>
	                                	</c:if>
	                                	<c:if test="${status.count%3==0}">
	                                		</div>
	                                	</c:if>
	                                </c:if>
	                                </c:forEach>
	                                <!--.row-->
	                            </div>
	                            <!--.item-->
		                        
	                            <div class="carousel-item">
	                            	<div class="row">
	                                <c:forEach var="list" items="${eventlist2}" varStatus="status">
	                                	<div class="col-md-4">
		                               		<div class="j_event" onclick="javascript:location.href='EventDetailAction.eve?event_num=${list.event_num}'">
			                                   	<img class="col-md j_event_img" src="resources/upload/${list.event_pic}">
			                                    <div class="col-md j_event_inner">
					                                <div class="j_event_name">${list.title}</div>
					                                <br><br><br>
					                                <div class="j_event_date">
						                                <c:set var="event_date" value="${list.event_date}"/>
						                                ${fn:substring(event_date,0,10)},
					                                </div>
					                                <div class="j_event_date">${list.event_room}</div>
				                                </div>
		                                    </div>
	                                    </div>
	                                <c:if test="${status.last}">
	                                	<c:if test="${status.count%3==1}">
	                                		<div class="col-md-4"></div>
	                                		<div class="col-md-4"></div>
	                                	</c:if>
	                                	<c:if test="${status.count%3==2}">
	                                		<div class="col-md-4"></div>
	                                	</c:if>
	                                	<c:if test="${status.count%3==0}">
	                                		</div>
	                                	</c:if>
	                                </c:if>
	                                </c:forEach>
	                                <!--.row-->
	                            </div>
	                            </c:if>
	                            <!--.item-->
	                            </div>
	                        <!--.carousel-inner-->
	                    </div>
	                    <!--.Carousel-->
	                </div>
	            </div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${event_listcount == 0}">
			<div class="row">
				<div class="col-md-center">
					<font>등록된 이벤트가 없습니다.</font>
				</div>
			</div>
		</c:if>
	</div>
	
	<br>
	<br>
	
	<%-- 찾아오시는 길 --%>
	<div class="container" id="j_main_root">
		<div class="row">
			<div class="col-md-center j_event_title">찾아오시는 길</div>
		</div>
		<div class="row">
			<div class="col-md-8" id="j_map"></div>
			<div class="col-md-4">
				<p class="j_room_name">스터디북</p>
				<p class="j_address">
					<br>
					<br>
					서울특별시 중구 남대문로 120 대일빌딩 2F, 3F
					<br>
					<br>
					T: 1544-9970 / F: 02-722-0858
					<br>
					<br>
					<br>
					버스 : 우리은행 종로지점 정류장
					<br>
					<br>
					지선버스 163 / 172 / 201 / 262 / 401 / 406 / 701 / 704 / N15 / N62
					<br>
					<br>
					마을버스 7017 / 7021 / 7022
					<br>
					<br>
					간선버스 8110
					<br>
					<br>
					지하철 2호선 을지로입구역 3번출구 100M / 1호선 종각역 4번, 5번 출구 200M
				</p>
			</div>
		</div>
	</div>
</body>
</html>
