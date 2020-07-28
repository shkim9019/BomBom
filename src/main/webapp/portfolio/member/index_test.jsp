

<%--
  /**
  * Class Name : 
  * Description : 
  * Modification Information
  *
  *   수정일                   수정자                      수정내용
  *  -------    --------    ---------------------------
  *  2020. 4. 27.            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.01.06
  *
  * Copyright (C) 2009 by KandJang  All right reserved.
  */
--%>
<%@page import="com.sist.spring.cmn.SearchVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	//페이지 사이즈
	String pageSize="20";
	//페이지 num
	String pageNum="1";
	//검색구분
	String searchDiv="";
	//검색어
	String searchWord="";

	SearchVO search = (SearchVO) request.getAttribute("param");
	if(null != search){
		pageSize = String.valueOf(search.getPageSize());
		pageNum = String.valueOf(search.getPageNum());
		searchDiv = String.valueOf(search.getSearchDiv());
		searchWord = String.valueOf(search.getSearchWord());
	}
	

%>
<c:set var="hContext" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Bombom</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="${hContext}/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${hContext}/resources/css/animate.css">
    
    <link rel="stylesheet" href="${hContext}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${hContext}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${hContext}/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="${hContext}/resources/css/aos.css">

    <link rel="stylesheet" href="${hContext}/resources/css/ionicons.min.css">
    
    <link rel="stylesheet" href="${hContext}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${hContext}/resources/css/icomoon.css">
    <link rel="stylesheet" href="${hContext}/resources/css/style.css">
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
	          <li class="nav-item"><a href="#about-section" class="nav-link"><span>About</span></a></li>
	          <li class="nav-item"><a href="#Projects-section" class="nav-link"><span>Projects</span></a></li>
	          <li class="nav-item"><a href="#Skills-section" class="nav-link"><span>Skills</span></a></li>
	          <li class="nav-item"><a href="#License-section" class="nav-link"><span>License</span></a></li>
	          <li class="nav-item"><a href="#Recommends-section" class="nav-link"><span>Recommends</span></a></li>
	          <li class="nav-item"><a href="${hContext}/portfolio/do_retrieve.spring" class="nav-link"><span>Portfolio List</span></a></li>
	       	  <li class="nav-item"><a href="${hContext }/portfolio/logout.spring" class="nav-link"><span>LogOut</span></a></li>
    		  <li class="nav-item"><a href="javascript:mypage();" class="nav-link"><span>myPage</span></a></li>
	        </ul>
	      </div>
	    </div>    
	  </nav>
	  
	  <br/><br/><br/>
	  
	  <section class="hero-wrap js-fullheight">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight justify-content-center align-items-center">
          <div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-center">
          	<div class="text text-center">
          		<span class="subheading">Hey! I am</span>
		  				<h1>Bombom</h1>
			  				<h2> 
								  <span
								     class="txt-rotate"
								     data-period="1000"
								     data-rotate='[  "Now,", "Let me", "introduce myself"  ]'></span>
								</h2>
							</div>
            </div>
          </div>
        </div>
      </div>
      <div class="mouse">
				<a href="#" class="mouse-icon">
					<div class="mouse-wheel"><span class="ion-ios-arrow-round-down"></span></div>
				</a>
			</div>
    </section>
    <!-- About -->
    <section class="ftco-about img ftco-section ftco-no-pt ftco-no-pb" id="about-section">
    	<div class="container">
    		<div class="row d-flex no-gutters">
    			<div class="col-md-6 col-lg-6 d-flex">
    				<div class="img-about img d-flex align-items-stretch">
    					<div class="overlay"></div>
	    				<div class="img d-flex align-self-stretch align-items-center" style="background-image:url(${hContext}/resources/images/${fileVO.saveNm}.${fileVO.ext });">
	    				</div>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-6 pl-md-5 py-5">
    				<div class="row justify-content-start pb-3">
		          <div class="col-md-12 heading-section ftco-animate">
		            <h2 class="mb-4">About Me</h2>
		            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
		            <ul class="about-info mt-4 px-md-0 px-2">
		            	<li class="d-flex"><span>Name:</span> <span>${memberVO.name }</span></li>
		            	<li class="d-flex"><span>Date of birth:</span> <span>${memberVO.birth }</span></li>
		            	<li class="d-flex"><span>Email:</span> <span>${memberVO.email }</span></li>
		            	<li class="d-flex"><span>Phone: </span> <span>${memberVO.phone }</span></li>
		            </ul>
		          </div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>
	<!--// About -->
	
    <section class="ftco-section ftco-partner">
    	<div class="container">
    		<div class="row">
    			<div class="col-sm ftco-animate">
    				<a href="#" class="partner"><img src="${hContext}/resources/images/partner-1.png" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-sm ftco-animate">
    				<a href="#" class="partner"><img src="${hContext}/resources/images/partner-2.png" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-sm ftco-animate">
    				<a href="#" class="partner"><img src="${hContext}/resources/images/partner-3.png" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-sm ftco-animate">
    				<a href="#" class="partner"><img src="${hContext}/resources/images/partner-4.png" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-sm ftco-animate">
    				<a href="#" class="partner"><img src="${hContext}/resources/images/partner-5.png" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    		</div>
    	</div>
    </section>
	
	<!-- Projects -->
    <section class="ftco-about img ftco-section ftco-no-pt ftco-no-pb" id="Projects-section">
    	<div class="container-fluid px-md-5">
    		<div class="row justify-content-center py-5 mt-5">
          		<div class="col-md-12 heading-section text-center ftco-animate">
           			 <h2 class="mb-4">Projects</h2>
           			 <div align="center">
	           			 <table>
	                        <tbody>
	                        <tr>
	                        	<td colspan="3">
	                        		<small>이 곳에서는 그동안 배우고 적용한 프로젝트를 볼 수 있는 곳입니다. <br>해당하는 버튼을 클릭하면 소스와,시연영상을 보실 수 있습니다.</small>
	                        	</td>
	                        </tr>
	                        <tr>
	                        	<td><br/></td>
	                        </tr>
	                        <c:choose>
	                		<%-- data가 있는 경우 --%>
	                		<c:when test="${pjtList.size()>0}">
	                			<c:forEach var="vo" items="${pjtList}">
		                		<tr>
	                              <td><h5 class="text-primary" ><b>1차 프로젝트</b></h5></td>
	                           </tr>
	                           <tr>
	                              <td rowspan="4">
	                                  <a href="https://github.com/shkim9019/eHRGit0101">
	                                 	<img src="${hContext}/resources/images/image_1.jpg" width="170" height="170" align="top">
	                                 </a>  
	                              </td>
	                              <td>
	                              	<p><b> subject:</b></p>
	                              </td>
	                              <td>
	                              	<p> ${vo.pjtName}</p>
	                              </td>
	                           </tr>
	                           <tr>
	                           	  <td>
	                           	  	<p><b> 설명:</b></p>
	                           	  </td>
	                           	  <td>
	                           	  	<p>${vo.pjtInfo}</p>
	                           	  </td>
	                           </tr>
	                           <tr>
	                           	  <td>
	                           	  	<p><b> 사용 툴:</b></p>
	                           	  </td>
	                           	  <td>
	                           	  	<p>${vo.pjtTool}</p>
	                           	  </td>
	                           </tr>
	                           
	                           <tr>
	                           	  <td>
	                           	  	<p><b>프로젝트 기간</b></p>
	                           	  </td>
	                           	  <td>
	                           	  	<p>${vo.pjtStart}-${vo.pjtEnd}</p>
	                           	  </td>
	                           </tr>
	                           <tr>
	                           	  <td colspan="2" align="center">
	                           	      <a href="${vo.gitAddress}">
	                           	      	<input type="button" class="btn btn-outline-primary" value="소스보기"/>
	                           	      </a> &nbsp;&nbsp;
	                           	  	  <input type="button" class="btn btn-outline-primary" value="영상보기"/>  
	                           	  </td>
	                           </tr>
	                           <tr>
	                        	<td><br/></td>
	                        	</tr>
		                	    </c:forEach>
	                		</c:when>
	                		<%-- data가 없는 경우 --%>
	                		<c:otherwise>
	                			<tr>
	                				<td colspan="99">등록된 게시글이 없습니다</td>
	                			</tr>
	                		</c:otherwise>
	                	</c:choose>
	                        </tbody>
	                     </table>
           			 </div>
           		</div>
           	</div>
        </div>
    </section>
	<!--// Projects -->
	
    <!-- Skills -->
     <section class="ftco-about img ftco-section ftco-no-pt ftco-no-pb" id="Skills-section">
		<div class="container-fluid px-md-5">
    		<div class="row justify-content-center py-5 mt-5">
          		<div class="col-md-12 heading-section text-center ftco-animate">
           			 <h2 class="mb-4">Skills</h2> 
					  	<div class="row progress-circle mb-5">
					  		<div class="col-lg-4 mb-4">
						      <div class="bg-white rounded-lg shadow p-4">
						        <h2 class="h5 font-weight-bold text-center mb-4">CSS</h2>

						        <!-- Progress bar 1 -->
						        <div class="progress mx-auto" data-value='90'>
						            <span class="progress-left">
                       					 <span class="progress-bar border-primary"></span>
						            </span>
						            <span class="progress-right">
                        				<span class="progress-bar border-primary"></span>
						            </span>
						            <div class="progress-value w-100 h-100 rounded-circle d-flex align-items-center justify-content-center">
						                <div class="h2 font-weight-bold">90<sup class="small">%</sup></div>
						            </div>
						        </div>
						        <!-- END -->

						        <!-- Demo info -->
						        <div class="row text-center mt-4">
						          <div class="col-6 border-right">
						            <div class="h4 font-weight-bold mb-0">28%</div><span class="small text-gray">Last week</span>
						          </div>
						          <div class="col-6">
						            <div class="h4 font-weight-bold mb-0">60%</div><span class="small text-gray">Last month</span>
						          </div>
						        </div>
						        <!-- END -->
						      </div>
						    </div>
						    
						    <div class="col-lg-4 mb-4">
						      <div class="bg-white rounded-lg shadow p-4">
						        <h2 class="h5 font-weight-bold text-center mb-4">HTML</h2>

						        <!-- Progress bar 1 -->
						        <div class="progress mx-auto" data-value='80'>
						          <span class="progress-left">
                      				  <span class="progress-bar border-primary"></span>
						          </span>
						          <span class="progress-right">
                      				  <span class="progress-bar border-primary"></span>
						          </span>
						          <div class="progress-value w-100 h-100 rounded-circle d-flex align-items-center justify-content-center">
						            <div class="h2 font-weight-bold">80<sup class="small">%</sup></div>
						          </div>
						        </div>
						        <!-- END -->

						        <!-- Demo info -->
						        <div class="row text-center mt-4">
						          <div class="col-6 border-right">
						            <div class="h4 font-weight-bold mb-0">28%</div><span class="small text-gray">Last week</span>
						          </div>
						          <div class="col-6">
						            <div class="h4 font-weight-bold mb-0">60%</div><span class="small text-gray">Last month</span>
						          </div>
						        </div>
						        <!-- END -->
						      </div>
						    </div>

						    <div class="col-lg-4 mb-4">
						      <div class="bg-white rounded-lg shadow p-4">
						        <h2 class="h5 font-weight-bold text-center mb-4">jQuery</h2>

						        <!-- Progress bar 1 -->
						        <div class="progress mx-auto" data-value='75'>
						          <span class="progress-left">
                        				<span class="progress-bar border-primary"></span>
						          </span>
						          <span class="progress-right">
                     				    <span class="progress-bar border-primary"></span>
						          </span>
						          <div class="progress-value w-100 h-100 rounded-circle d-flex align-items-center justify-content-center">
						            <div class="h2 font-weight-bold">75<sup class="small">%</sup></div>
						          </div>
						        </div>
						        <!-- END -->

						        <!-- Demo info -->
						        <div class="row text-center mt-4">
						          <div class="col-6 border-right">
						            <div class="h4 font-weight-bold mb-0">28%</div><span class="small text-gray">Last week</span>
						          </div>
						          <div class="col-6">
						            <div class="h4 font-weight-bold mb-0">60%</div><span class="small text-gray">Last month</span>
						          </div>
						        </div>
						        <!-- END -->
						      </div>
						    </div>
					  	</div>
					  	<div class="row">
					  		<div class="col-md-6 animate-box">
									<div class="progress-wrap ftco-animate">
										<h3>Photoshop</h3>
										<div class="progress">
										 	<div class="progress-bar color-1" role="progressbar" aria-valuenow="90"
										  	aria-valuemin="0" aria-valuemax="100" style="width:90%">
										    <span>90%</span>
										  	</div>
										</div>
									</div>
								</div>
								<div class="col-md-6 animate-box">
									<div class="progress-wrap ftco-animate">
										<h3>jQuery</h3>
										<div class="progress">
										 	<div class="progress-bar color-2" role="progressbar" aria-valuenow="85"
										  	aria-valuemin="0" aria-valuemax="100" style="width:85%">
										    <span>85%</span>
										  	</div>
										</div>
									</div>
								</div>
								<div class="col-md-6 animate-box">
									<div class="progress-wrap ftco-animate">
										<h3>HTML5</h3>
										<div class="progress">
										 	<div class="progress-bar color-3" role="progressbar" aria-valuenow="95"
										  	aria-valuemin="0" aria-valuemax="100" style="width:95%">
										    <span>95%</span>
										  	</div>
										</div>
									</div>
								</div>
								<div class="col-md-6 animate-box">
									<div class="progress-wrap ftco-animate">
										<h3>CSS3</h3>
										<div class="progress">
										 	<div class="progress-bar color-4" role="progressbar" aria-valuenow="90"
										  	aria-valuemin="0" aria-valuemax="100" style="width:90%">
										    <span>90%</span>
										  	</div>
										</div>
									</div>
								</div>
								<div class="col-md-6 animate-box">
									<div class="progress-wrap ftco-animate">
										<h3>WordPress</h3>
										<div class="progress">
										 	<div class="progress-bar color-5" role="progressbar" aria-valuenow="70"
										  	aria-valuemin="0" aria-valuemax="100" style="width:70%">
										    <span>70%</span>
										  	</div>
										</div>
									</div>
								</div>
								<div class="col-md-6 animate-box">
									<div class="progress-wrap ftco-animate">
										<h3>SEO</h3>
										<div class="progress">
										 	<div class="progress-bar color-6" role="progressbar" aria-valuenow="80"
										  	aria-valuemin="0" aria-valuemax="100" style="width:80%">
										    <span>80%</span>
										  	</div>
										</div>
									</div>
								</div>
					  	</div>
           		  </div>
           	 </div>
         </div>    	
    </section>
    <!-- //Skills -->	
    
    
    
    <!-- License -->
     <section class="ftco-about img ftco-section ftco-no-pt ftco-no-pb" id="License-section">
		<div class="container-fluid px-md-5">
    		<div class="row justify-content-center py-5 mt-5">
          		<div class="col-md-12 heading-section text-center ftco-animate">
           			 <h2 class="mb-4">License</h2>
					 <div class="row">
					 	<div class="col-md-4 text-center d-flex ftco-animate">
					 		<a href="#License-section" class="services-1 shadow">
					 			<span class="icon">
					 				<i class="flaticon-analysis"></i>
					 			</span>
					 			<div class="desc">
					 				<h3 class="mb-5">정보처리기사</h3>
					 				<p>자격 분류:</p>
					 				<p>자격 종류:</p>
					 				<p>자격증 번호:</p>
					 				<p>자격증 취득일:</p>
					 			</div>
					 		</a>
					 	</div>
					 	<div class="col-md-4 text-center d-flex ftco-animate">
					 		<a href="#License-section" class="services-1 shadow">
					 			<span class="icon">
					 				<i class="flaticon-flasks"></i>
					 			</span>
					 			<div class="desc">
					 				<h3 class="mb-5">컴퓨터 활용 1급</h3>
									<p>자격 분류:</p>
					 				<p>자격 종류:</p>
					 				<p>자격증 번호:</p>
					 				<p>자격증 취득일:</p>
					 			</div>
					 		</a>
					 	</div>
					 	<div class="col-md-4 text-center d-flex ftco-animate">
					 		<a href="#License-section" class="services-1 shadow">
					 			<span class="icon">
					 				<i class="flaticon-ideas"></i>
					 			</span>
					 			<div class="desc">
					 				<h3 class="mb-5">컴퓨터 활용 2급</h3>
					 				<p>자격 분류:</p>
					 				<p>자격 종류:</p>
					 				<p>자격증 번호:</p>
					 				<p>자격증 취득일:</p>
					 			</div>
					 		</a>
					 	</div>
					 </div>
           	    </div>
           	</div>
        </div>  
     </section>  

<div>
    <!-- commentfrm -->
   	<form id="commentfrm" name="commentfrm" >
      <div class="container">
        <div >
	    	<!-- 입력 From -->
            <div>
                <table class="table" id="portfolioTable">     
                               
                    <tr>
                        <td>
                            <textarea style="width: 1000px" rows="2" cols="30" id="cContent" name="cContent" placeholder="댓글을 입력하세요"></textarea>
                            <input type="hidden" id="portfolioId" name="portfolioId" placeholder="아이디" value="${memberVO.memberId}" />
                            <input type="hidden" id="regId" name="regId" placeholder="아이디" value="${sessionVO.memberId}" />
                            <input type="hidden" name="pageNum" id="pageNum" value="${vo.pageNum }">
                            <input type="hidden" id="searchWord" name="searchWord" value="${memberVO.memberId}">
						
                        </td>
                        <td align="left">
                        	<button type="button" class="btn pull-right btn-primary" id="doInsert"  >등록</button>
                        </td>
                    </tr>
                </table>
            </div>
        	<!-- 입력 From --> 
        	
        </div>
        
        
        <div class="table-responsive">
        
    	<table class="" id="memberTable" style="width: 1100px;" >
    		<input type="hidden" id="sessionID" value="${sessionVO.memberId}">
 				<!-- Data있는 경우 -->
 				<c:choose>
 					<c:when test="${list.size()>0 }">
					<c:forEach var="vo" items="${list }">
						<tbody>
							<tr style="border-top: 5px; margin-top: 5px;">
								<td><c:out value="${vo.regId }"></c:out></td>
								<td align="right"><c:out value="${vo.regDt }"></c:out></td>
							</tr>
							<tr>
								<td><input type="hidden" maxlength="20" class="form-control input-sm" id="cNo" name="cNo" value="${vo.cNo}" />${vo.cNo}</td>
								<td><c:out value="${vo.cContent }"></c:out></td>
							</tr>
							<tr>
							<c:if test="${vo.regId == sessionVO.memberId}">
							   	<td colspan="2" align="right">
		                           	<button type="button" class="btn pull-right btn-primary doUpdate" id="doUpdate" >수정</button>
		                           	<button type="button" class="btn pull-right btn-primary doDelete" id="doDelete" >삭제</button>
	                           	</td>
	                       	</c:if>
	                       	</tr>
							 
			 			</tbody>
					</c:forEach>
 					</c:when>
 					<c:otherwise>
 						<tr><td colspan="99">등록된 게시글이 없습니다.</td></tr>
 					</c:otherwise>
 				</c:choose>
 			</table>
    	</div>
    	</form>
    	<!-- comment frm -->
</div>
    	
    	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	    <script src="${hContext}/resources/js/bootstrap.min.js"></script>
	    <!-- page -->
	    <script src="${hContext}/resources/js/jquery.bootpag.min.js"></script>
	    
<script type="text/javascript">





function cmtRetrieve(){
	//console.log('cmtRetrieve');
	
	var frm = document.commentfrm;
	frm.pageNum.value = 1;
	frm.searchWord.value=$("#searchWord").val();
	frm.portfolioId.value=$("#portfolioId").val();
	frm.regId.value=$("#regId").val();
	frm.action = "${hContext}/portfolio/do_mem_Comment.spring";
	frm.submit();
} 

//등록
$("#doInsert").on("click", function() {
	//값  Null check
	if($("#cContent").val() == "" || $("#cContent").val() == false){
		alert("내용을 입력 하세요.");
		$("#cContent").focus();
		return;
	}

	console.log("#regId:" + $("#regId").val(), "#cContent:" + $("#cContent").val()  );
	
	//confirm
	if(confirm("댓글을 등록 하시겠습니까?")==false)return;

	// name이 같은 체크박스의 값들을 배열에 담는다.
   
	
	//ajax
	$.ajax({
	   type:"GET",
	   url:"${hContext}/comment/do_insert.spring",
	   dataType:"html",
	   data:{
		   "cNo": $("#cNo").val(),
		   "cContent": $("#cContent").val(),
		   "regId": $("#regId").val(),
		   "portfolioId": $("#portfolioId").val()
	   },
	   success:function(data){ //성공
	      console.log("data:"+data);
	      var parseData = $.parseJSON(data);
	      if(parseData.msgId == "1"){
			 alert(parseData.msgMsg);
			 alert('댓글이 등록되었습니다.')
			 cmtRetrieve();
		  }else{
			 alert(parseData.msgMsg);
		  }
	      
	   },
	   error:function(xhr,status,error){
	      alert("error:"+error);
	   },
	   complete:function(data){
	   
	   }   
	   
	});//--ajax
	
}); 


$(".doUpdate").on("click",function(event){
	 var doUpdate = $(this);
	 
	 var tr = doUpdate.parent().parent().parent();
     var td = tr.children().children();
     var regId = td.eq(0).text().trim();
     var cNo = td.eq(2).text().trim();
     var cContent = td.eq(3).text().trim();

     
	 console.log("regId:"+regId);
	 console.log("cNo:"+cNo);
	 console.log("cContent:"+cContent);

         var html = "";
         var tbody = doUpdate.parent().parent().parent();
         var removeTbody = tbody.eq(0);
	    removeTbody.empty();


	    html += '<tbody>																												';
		html += '	<tr><td>                                                                     ';
		html += '	<input type="hidden" maxlength="20" class="form-control input-sm" id="cNo" name="cNo" value="${vo.cNo}" /> ';
		html += '	</td></tr>                                                       									               ';
		html += '	<tr style="border-top: 5px; margin-top: 5px;">                                                                      ';
		html += '		<td>';
		html +=regId;
		html += '</td><td></td>																								';
		html += '	</tr>                                                                                                               ';
		html += '	<tr><td colspan="2" align="right">                                                                                                                 ';
		html += '		<textarea style="width: 1000px" rows="2" cols="30" name="message" id="message" placeholder="'+cContent+'" value=\"${vo.cContent}\"  ></textarea>      ';
		html += '	</td></tr>                                                                                                               ';
		html += '	<tr style="border-bottom: 1px; margin-bottom: 5px;">                                                                ';
		html += '		<td colspan="2" align="right">                                                                                  ';
		html += '			<button type="button"  class="noUpdate btn btn-primary" id="noUpdate" name="noUpdate" >수정취소</button>       ';
		html += '			<button type="button" onclick="javascipt:updateTest(\''+cNo+'\');" class="modCom btn btn-primary" id="modCom" name="modCom" >수정완료</button>       		 ';
		html += '		</td>                                                                                                           ';
		html += '	</tr>	                                                                                                            ';
		html += '</tbody>	                                                                                                            ';                                                   
	    tbody.append(html); 
	          


 });//--수정  



 
 function updateTest(cno){
		
		console.log(cno);
		
		$.ajax({
			 type:"GET",
			 url:"${hContext}/comment/do_update.spring",
			 dataType:"html", 
			 data:{ //"memberId":"sohyun1234"
					 "cNo": cno,
					 "regId": $("#sessionID").val().trim(),
			         "cContent" :$("#message").val().trim(),
			         "portfolioId": $("#portfolioId").val().trim()
			        
			 },
			 success:function(data){ //성공
				 cmtRetrieve();
			 },
			 error:function(xhr,status,error){
			   alert("error:"+error);
			 },
			 complete:function(data){
			 
			 }   
			 
			});//--ajax 

				
	   };


	   

 $(document).on("click",".noUpdate",function(){//수정취소버튼
	
	event.preventDefault();
	cmtRetrieve();
});  





/*  $(document).on("click",".modCom",function(){//댓글수정완료버튼

	 var cContent = $("#message").val();

     console.log("수정전------------------")
     console.log("cNo: "+cNo);
     console.log("cContent: "+cContent);
     console.log("//수정전------------------")
     
     if($("#message").val()==null || $("#message").val().length<=0 ||$("#message").val()=='undefined'){
			$("#message").focus();
			alert("내용을 입력하세요.");
			return;
		}

	    
     //ajax
     
     $.ajax({
       type:"GET",
       url:"${hContext}/comment/do_update.spring",
       dataType:"html",
       data:{
             //"cNo":cNo1,
	  		 "cNo": $("#cNo").val(),
             "cContent":cContent

       },
       success:function(data){ //성공
    	   console.log("수정성공");
	      console.log("cNo: "+cNo);
	      console.log("cContent: "+cContent);

	      alert("수정되었습니다.");
    	   cmtRetrieve();
         
       },
       error:function(xhr,status,error){
        alert("error:"+error);
       },
       complete:function(data){
       
       }   
     
     });//--ajax   
     
 });  

  */
   


//삭제
$(".doDelete").on("click", function() {
	//console.log("#doDelete");

	//u_id null check
	console.log("#cNo:" + $("#cNo").val()  );
	if ($("#cNo").val() == "" || $("#cNo").val() == false) {
		alert("삭제 데이터를 선택 하세요.");
		return;
	} 

	//confirm
	if (confirm("삭제 하시겠습니까?") == false)
		return;

	//ajax
	$.ajax({
		type : "POST",
		url : "${hContext}/comment/do_delete.spring",
		dataType : "html",
		data : {
			"cNo" : $("#cNo").val()
		},
		success : function(data) { //성공
			console.log("data:" + data);
			//{"msgId":"1","msgMsg":"j_hr0000002님이 삭제 되었습니다.","num":0,"totalCnt":0}   
			var parseData = $.parseJSON(data);
			if (parseData.msgId == "1") {
				alert(parseData.msgMsg);
				cmtRetrieve();
			} else {
				alert(parseData.msgMsg);
			}

		},
		error : function(xhr, status, error) {
			alert("error:" + error);
		},
		complete : function(data) {

		}

	});//--ajax 

});



</script>
	    
    	
        
        
       
    </footer>
    
  

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
    
  </body>
</html>