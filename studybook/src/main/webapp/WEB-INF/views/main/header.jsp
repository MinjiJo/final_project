<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 스크립트 import -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   
<!-- fontawesome css import -->
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
   integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
   crossorigin="anonymous" />

<!-- Favicon -->
<link rel="shortcut icon" href="resources/icon/pavicon.png">

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/header.css" />

<!-- js -->
<script src="resources/js/header.js"></script>

<!-- title -->
<c:if test="${!empty id }">
<title>StudyBook | ${id} </title>
</c:if>
<c:if test="${empty id }">

<script>
$(document).ready(function(){
   
   $("#menu_login").click(function(){
      location.href="login.mem";
   })
   
   $("#menu_update").click(function(){
      location.href="update.mem";
   })
   
})

</script>

<title>StudyBook</title>
</c:if>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
   <a class="navbar-brand" href="main.net">StudyBook</a>
   
   <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
         <li class="nav-item"><a class="nav-link" href="#">Q&A</a></li>
         <li class="nav-item"><a class="nav-link" href="#">이벤트 홍보</a></li>
         <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
      </ul>
   </div>   
      <ul class="nav navbar-nav navbar-right j_header__column">
         <li class="nav-item" id="menu_icon"><i class="fas fa-bars"></i></li>
      </ul>
   <div class="menu">
      <a href="#" class="close"><i class="fas fa-arrow-right"></i></a>
      <div class="j_menu__header">
         <div class="j_menu_member">
               <div id="j_menu_profile"> <!-- 연수 : 프로필 사진 부분 다시 보기 -->
                  <c:if test="${member.profile == null}">
                  <img src="resources/image/profile/default.png">
                  </c:if>
                  <c:if test="${member.profile!= null}">
                  <img src="resources/${member.profile}">
                  </c:if>
               </div>
          	<c:if test="${member.email==null}">
               <p id="menu_login" class="j_menu_login"><a href="login.mem">로그인이 필요합니다.</a></p>
            </c:if>
            <c:if test="${member.email!=null}">
               <div class="j_menu_login">
                  <div class="j_menu_name">[${member.name}]</div>
                  <div id="menu_update" class="j_menu_reg"><a href="#">프로필 관리</a></div>
               </div>
            </c:if>
         </div>
      </div>
      <div class="j_menu_orgs">
         <div class="j_menu_org" onClick="#">
            <div><i class="far fa-list-alt"></i></div>
            <div>예약 관리</div>
         </div>
         <div class="j_menu_org" onClick="#">
            <div><i class="far fa-edit"></i></div>
            <div>후기 관리</div>
         </div>
      </div>
      <div class="j_menu_event" onClick="#">이 달의 이벤트</div>
      <div>
         <ul>

            <li class="j_menu_list" onClick="javascript:location.href='/studybook/main.net';">스터디북 홈<i class="fas fa-chevron-right"></i></li>
            <li class="j_menu_list" onClick="#">공지사항<i class="fas fa-chevron-right"></i></li>
            <li class="j_menu_list" onClick="javascript:location.href='/studybook/event_list.eve';">이벤트 홍보<i class="fas fa-chevron-right"></i></li>

         </ul>
      </div>
      <div class="j_menu_bottom">
         <div></div>
         <div>
         <c:if test="${member.email==null}">
         <span></span>
         </c:if>
         <c:if test="${member.email!=null}">
         <a href="logout.mem">로그아웃</a>
         </c:if>
         </div>
         <div>Powered by STUDYBOOK</div>
      
      <c:if test="${id=='admin'}">
         <div id="j_menu_center" class="j_menu_event" onClick="javascript:location.href='/studybook/admin'">관리자 센터로 이동</div>
      </c:if>
      </div>
   </div>

</nav>