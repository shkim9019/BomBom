
<%--
  /**
  * Class Name : 
  * Description : 
  * Modification Information
  *
  *   수정일                   수정자                      수정내용
  *  -------    --------    ---------------------------
  *  2020. 3. 10.            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.01.06
  *
  * Copyright (C) 2009 by KandJang  All right reserved.
  */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set  var="hContext" value="${pageContext.request.contextPath }"></c:set>
<c:if test="${maxPageNo == null}"><c:set var="maxPageNo" value="1"></c:set></c:if>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>Bombom</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${hContext}/resources/css/open-iconic-bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="${hContext}/resources/css/animate.css">
  <link rel="stylesheet" type="text/css" href="${hContext}/resources/css/owl.carousel.min.css">
  <link rel="stylesheet" type="text/css" href="${hContext}/resources/css/owl.theme.default.min.css">
  <link rel="stylesheet" type="text/css" href="${hContext}/resources/css/magnific-popup.css">
  <link rel="stylesheet" type="text/css" href="${hContext}/resources/css/aos.css">
  <link rel="stylesheet" type="text/css" href="${hContext}/resources/css/ionicons.min.css">
  <link rel="stylesheet" type="text/css" href="${hContext}/resources/css/flaticon.css">
  <link rel="stylesheet" type="text/css" href="${hContext}/resources/css/icomoon.css">
  <link rel="stylesheet" type="text/css" href="${hContext}/resources/css/style.css">
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	   <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar ftco-navbar-light site-navbar-target" id="ftco-navbar">
	    <div class="container">
	      <div>
	     	 <a class="navbar-brand" href="${hContext}/portfolio/toHome.spring"><span>B</span>ombom</a>
	     	  <div align="left"> 
		      	
	    	  </div> 
	      </div>
	      <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav nav ml-auto">
	          <li class="nav-item"><a href="${hContext}/portfolio/do_retrieve.spring" class="nav-link"><span>Portfolio List</span></a></li>
	       	  <li class="nav-item"><a href="javascript:logOut();" class="nav-link"><span>LogOut</span></a></li>
    		  <li class="nav-item"><a href="javascript:mypage();" class="nav-link"><span>myPage</span></a></li>
	        </ul>
	      </div>
	    </div>    
	  </nav>
	  
	  <br/><br/><br/>
	  
	  
	  
  	<!-- div container -->
  	<div class="container">
  	    <!-- div title -->
  	    <div class="page-header">
  	    	<h1>Portfolio List</h1>
  	    </div>
    	<form action="${hContext}/portfolio/do_select_one.spring" id="selectOne_frm" name="selectOne_frm" method="get">
            <input type="hidden" name="pageNum" id="pageNum" value="${param.pageNum }">
   			<input type="hidden" id="searchWord" name="searchWord" value="${param.searchWord }" />      
    		<input type="hidden" name="hiddenId" id="hiddenId">
    	</form>
    	<!-- Grid영역 -->
    	<div class="table-responsive">
    		<table class="table table-hover" id="memberTable">
    		    <!-- hidden-sm hidden-xs 숨기기 -->
    			<thead class="bg-primary">
    			</thead>
    			<tbody>
    				<!-- Data있는 경우 -->
    				<c:choose>
    					<c:when test="${list.size()>0 }">
    						<c:forEach var="i" begin="0" end="${list.size()-1}">
    							<tr>
			    					<td class="text-center"><img src="../resources/images/${fileList.get(i).saveNm}.${fileList.get(i).ext}" width="180" height="200" /></td>
			    					<td class="text-left" style="display:none;">${list.get(i).memberId}</td>
			    					<td class="text-left col-sm-12">
			    					<table>
			    						<tr>
			    							<td>
			    								<h6 class="mb-4"><b>Name</b></h6>
			    							</td>	
			    							<td>
			    								<span>${list.get(i).name }</span>
			    							</td>
			    							<td>
			    								<h6><b>Birth</b></h6>
			    							</td>
			    							<td>
			    								${list.get(i).birth }
			    							</td>
			    						</tr>
			    						<tr>
			    							<td>
			    								<h6><b>Email</b></h6>
			    							</td>
			    							<td>
			    								${list.get(i).email }
			    							</td>
			    							<td>
			    								<h6><b>Phone</b></h6>
			    							</td>
			    							<td>
			    								${list.get(i).phone }
			    							</td>
			    						</tr>
			    					
			    					</table>
			    					</td>
		    					</tr>
	    					</c:forEach>
    					</c:when>
    					<c:otherwise>
    						<tr><td colspan="99">등록된 게시글이 없습니다.</td></tr>
    					</c:otherwise>
    				</c:choose>
    			</tbody>
    		</table>
    	</div>
    	<!--// Grid영역 -->    	
    </div>
    <!--// div container -->
    
    
    

  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${hContext}/resources/js/jquery.min.js"></script>
  <script src="${hContext}/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${hContext}/resources/js/popper.min.js"></script>
  <script src="${hContext}/resources/js/bootstrap.min.js"></script>
  <script src="${hContext}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${hContext}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${hContext}/resources/js/jquery.stellar.min.js"></script>
  <script src="${hContext}/resources/js/owl.carousel.min.js"></script>
  <script src="${hContext}/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${hContext}/resources/js/aos.js"></script>
  <script src="${hContext}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${hContext}/resources/js/scrollax.min.js"></script>
  <script src="${hContext}/resources/js/main.js"></script>


    <script type="text/javascript">
		
		//숫자만 입력:text numberOnly    
	    $("input:text[numberOnly]").on("keyup", function() {
	        $(this).val($(this).val().replace(/[^0-9]/g,""));
	    });

		//그리드 click: ID값을 서버로 ajax 전송:/member/do_select_one.do
		$("#memberTable>tbody").on("click","tr", function(){
			console.log("#memberTable>tbody"+ $(this));
			var tds = $(this).children();
			console.log("tds:"+ tds.text());
			var memberId = tds.eq(1).text();
			console.log("memberId:"+ memberId);

			var frm = document.selectOne_frm;
			frm.hiddenId.value = memberId;
			frm.pageNum.value = 1;
			frm.searchWord.value= memberId;
			frm.submit();
			

		});

		function logOut(){
			alert('로그아웃합니다.');
			location.href="${hContext }/portfolio/logout.spring";

			}
		function mypage() {

	         location.href="${hContext}/portfolio/mypage_retrieve.spring";
	         
	      }
		   
		function doRetrieve(){
			//console.log('doRetrieve');
			var frm = document.member_frm;
			frm.pageNum.value = 1;
			frm.memberId.value =memberId;
			frm.action = "${hContext}/portfolio/do_retrieve.spring";
			frm.submit();
		}

		
		
		$("#searchWord").on("keydown",function(key) {
			console.log('searchWord keydown:'+key.keyCode);
			if(key.keyCode ==13){
				doRetrieve();
			}
		});
	
    </script>
  </body>
</html>