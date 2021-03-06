<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html> 
<html>
<head>

<meta charset="UTF-8">
<title>notice list for admin</title>

<style>
* {
	box-sizing: border-box;
	font-family: "맑은 고딕";   
}

body {
	background-color: #f2f2f2;
}

.contentwrap {
	margin-top: 0px;
	display: flex;
	justify-content: center;
}
.contentarea {
	background-color:white;
	width:50%;
	min-width: 420px;
	height:870px;
}

.titlewrap {
	clear:both;
}


.s_title {
	margin-top: 50px;
	margin-bottom: 20px;
	font-size: 32px;
	text-align: center;
}

.none_title {
	margin-top: 50px;
	margin-bottom: 35px;
	font-size: 14px;
	text-align: center;
	color:#7F56D2;
}

.s_desc {
	margin-top: 30px;
	margin-bottom: 0px;
	font-size: 12px;
	text-align: center;
}

.s_desc2 {
	margin-top: 0px;
	margin-bottom: 50px;
	font-size: 12px;
	text-align: center;
}

.s_container {
	display: flex;
	justify-content: center;
	width: 949px;
    height: 520px;
}

.tablewrap {
	width:60%;
}

.table {
	width: 100%;
}

.table td, .table th {
    padding: 7px;
    vertical-align: top;
    border-top: 0px;
    border-bottom: 1px solid #dee2e6;
}

.numtd {
    width: 50px;
    line-height: 30px;
    font-size: 12px;
}

.center-block {
	display: flex;
	justify-content: center; /*가운데 정렬*/
}

/*제목*/
.title {
	font-size:14px;
	text-decoration:none;
	color:#333333;
	margin-top:17px;
	margin-bottom:10px;
}
.title:hover {
	text-decoration:none;
	color:#7F56D2;
}

/*날짜*/
.datediv {
	margin-top:0px;
	margin-bottom:7px;
}

.date {
	font-size:12px;
	color:#7F7F7F;
}
.rows {
	text-align: right;
}
.row {
	height: 0
}
.gray {
	color: gray 
}

.page-link {
	border: 1px solid white;
}

.writebutton {
	margin:0px;
	padding:0px;
}

.writebtn {
	position:absolute;
	top: 120px;
	left: 69%;
	width:85px;
	height:35px;
	line-height:35px;
	background-color: #7F56D2;
	border: 0px;
	border-radius:5px;
	text-decoration: none;
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	color: #ffffff;	
	margin-top: 30px;
	margin-bottom: 0px;
}


.float-right {
	float:right
}

.col {
	margin-top: 50px;
}

.page-link {
    z-index: 2;
    color: #7F56D2;
    text-decoration: none;
    background-color: #ffffff; 
    border-color: #ffffff; 
    font-size:12px;
}

.page-link:hover {
    z-index: 2;
    color: #56D7D6;
    text-decoration: none;
    background-color: #ffffff; 
    border-color: #ffffff; 
}

.gradiant {
	background: #7F56D2;
	background: -webkit-linear-gradient(legacy-direction(to right), #7F56D2 0%, #56D7D6 100%);
	background: -webkit-gradient(linear, left top, right top, from(#7F56D2), to(#56D7D6));
	background: -webkit-linear-gradient(left, #7F56D2 0%, #56D7D6 100%);
	background: -o-linear-gradient(left, #7F56D2 0%, #56D7D6 100%);
	background: linear-gradient(to right, #7F56D2 0%, #56D7D6 100%);
}

.gradiant:hover {
	background: #56D7D6;
	background: -webkit-linear-gradient(legacy-direction(to right), #56D7D6 0%, #7F56D2 100%);
	background: -webkit-gradient(linear, left top, right top, from(#56D7D6), to(#7F56D2));
	background: -webkit-linear-gradient(left, #56D7D6 0%, #7F56D2 100%);
	background: -o-linear-gradient(left, #56D7D6 0%, #7F56D2 100%);
}
</style>


<script>

	function go(page) {
		var limit = $('#viewcount').val();
		var data = "limit=" + limit + "&state=ajax&page=" + page;
		ajax(data);
	}
	
	function setPaging(href, digit) {
		output += "<li class=page-item>";
		gray = "";
		if (href == "") {
			gray = "gray";
		}
		anchor = "<a class='page-link " + gray + "'" 
	           + href + ">"
				+ digit + "</a></li>";
		output += anchor;
	}
	
	function ajax(data) {
		console.log(data)
		output = "";
		$
				.ajax({
					type : "POST",
					data : data,
					//url: 'NoticeList.bo', //요청 전송 url - 처리해야할 주소
					url : 'NoticeListAjax.bo', //ajax로 바꾸기
					dataType : "json",
					cache : false,
					success : function(data) {
						$("#viewcount").val(data.limit);
						$("table").find("font")
								.text("글 개수 : " + data.listcount);
						if (data.listcount > 0) { // 총갯수가 0개이상인 경우
							$("tbody").remove();
							var num = data.listcount - (data.page - 1) * data.limit;
							console.log(num)
							output = "<tbody>";
							$(data.noticelist)
									.each(
											function(index, item) {
												output += '<tr><td>' + (num--)
														+ '</td>'
												img = "";
												output += "<td><div>" + blank
														+ img
												output += ' <a href="./NoticeDetailAction.bo?num='
														+ item.NOTICE_NUM
														+ '&page='
														+ data.page
														+ '">'
												output += item.NOTICE_TITLE
														+ '</a></div></td>'
												output += '<td><div>'
														+ item.NOTICE_DATE
														+ '</div></td></tr>'
											})
							output += "</tbody>"
							$('table').append(output)//table 완성
							$(".pagination").empty(); //페이징 처리
							output = "";
							digit = '이전&nbsp;'
							href = "";
							if (data.page > 1) {
								href = 'href=javascript:go(' + (data.page - 1)
										+ ')';
							}
							setPaging(href, digit);
							for (var i = data.startpage; i <= data.endpage; i++) {
								digit = i;
								href = "";
								if (i != data.page) {
									href = 'href=javascript:go(' + i + ')';
								}
								setPaging(href, digit);
							}
							digit = '다음&nbsp;';
							href = "";
							if (data.page < data.maxpage) {
								href = 'href=javascript:go(' + (data.page + 1)
										+ ')';
							}
							setPaging(href, digit);
							$('.pagination').append(output)
						}//if(data.listcount) end
						else {
							$(".container table").remove();
							$(".center-block").remove();
							$('.container').append(
									"<font size=5>등록된 글이 없습니다.</font>");
						}
					}, //success end
					error : function() {
						console.log('에러')
					}
				})// ajax end
	} // fucntion ajax end
	$(function() {
		$("#viewcount").change(function() {
			go(1);//보여줄 페이지를 1페이지로 설정합니다.
		});// change end
		$("button").click(function() {
			location.href = "NoticeWrite.bo";
		})
	})
</script>
</head>

<body>


	<div class=writebutton>
	<c:if test="${member.key== '999' }">
		<button type="button" class="writebtn gradiant">공지 쓰기</button>
	</c:if>
	</div>

 
<div class=contentwrap>
<div class=contentarea>
	
<div class=lineforbutton>	
	<div class=title_wrap>
	<p class=s_title>공 지 사 항</p> 	
	<p class=s_desc>스터디북 이용에 대한 안내입니다.</p>
	<p class=s_desc2>문의는 admin@studybook.com 으로 부탁드려요.</p>
	</div>
	<div class="container_wrap">
	<div class=s_container>
	
	<div class=tablewrap>
	
<%-- 게시글이 있는 경우 --%>
		<c:if test="${listcount > 0 }">
			<table class="table">
				<thead></thead>
				<tbody>
					<c:set var="num" value="${listcount-(page-1)*7 }" />
					<c:forEach var="b" items="${noticelist }">
						<tr class=tr>
							<td class=numtd><c:out value="${num }" /> 
								<c:set var="num" value="${num-1 }" /></td>
							<td class=titletd>
							<c:if test="${member.key!= '999' }">
								<div>
									<a href="NoticeDetailAction.bo?num=${b.NOTICE_NUM }" class=title>${b.NOTICE_TITLE }</a>
								</div>
							</c:if>	
							<c:if test="${member.key== '999' }">
								<div>
									<a href="noticedetailadmin.bo?num=${b.NOTICE_NUM }" class=title>${b.NOTICE_TITLE }</a>
								</div>
							</c:if>	
								<div class=datediv><span class=date>${b.NOTICE_DATE }</span></div>
							</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
			
			</div>
			</div>
			<div class="center-block">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${page<=1 }">
								<li class="page-item"><a class="page-link" href="#"><</a></li>
							</c:if>
							
							<c:if test="${page>1 }">
								<li class="page-item"><a
									href="noticeadmin.bo?page=${page-1 }" class="page-link"><</a>
									&nbsp;</li>
							</c:if>

							<c:forEach var="a" begin="${startpage }" end="${endpage }">
								<c:if test="${a==page }">
									<li class="page-item"><a class="page-link" href="#">${a }</a>
									</li>
								</c:if>
								
								<c:if test="${a!=page }">
									<li class="page-item"><a href="noticeadmin.bo?page=${a}"
										class="page-link">${a }</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${page>=maxpage }">
								<li class="page-item"><a class="page-link" href="#">></a></li>
							</c:if>
							<c:if test="${page<maxpage }">
								<li class="page-item"><a class="page-link"
									href="noticeadmin.bo?page=${page+1}">></a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>

		</c:if>
		
<!--  게시글이 없는 경우 -->
		<c:if test="${listcount== 0 }">
			<p class=none_title>등록된 공지사항이 없습니다.</p>
		</c:if>
		<br>

		
	</div>
</div>

	
</div>	
</div>
</body>
</html>