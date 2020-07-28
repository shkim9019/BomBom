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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="hContext" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html lang="en" style="height: 100%">
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
    
    <style type="text/css">
	.commentTable tbody{border-color: blue;}
	
	.commentTable {
  	width: 100%;
  	margin-bottom: 1rem;
  	color: #212529; }
  
 	.commentTable th{
    padding: 2px;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
    padding-top: 5px;
     }
  
 	.commentTable tr{
    padding-bottom: 15px;
     }
  
  
	</style>
    
    
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" style="height: 100%">
	  
	  
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar ftco-navbar-light site-navbar-target" id="ftco-navbar" style="height:10%">
	    <div class="container">
	      <div>
	     	 <a class="navbar-brand" href="${hContext}/portfolio/toHome.spring"><span>B</span>ombom</a>
	     	 <%--  <div align="left"> 
		      	<table> 
		        	<tbody>
		        		<tr>
		        			<td>phone:&nbsp; ${memberVO.phone}</td>
		        		</tr>
		        		<tr>
		        			<td>mail: &nbsp;${memberVO.email}</td>
		        		</tr>
		        	</tbody>
		        </table>
	    	  </div>  --%>
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
	       	  <li class="nav-item"><a href="javascript:logOut();" class="nav-link"><span>LogOut</span></a></li>
    		  <li class="nav-item"><a href="javascript:mypage();" class="nav-link"><span>myPage</span></a></li>
	        </ul>
	      </div>
	    </div>    
	  </nav>
	  <section class="hero-wrap "  style="height: 82%;">
      <div class="overlay" style="height: 82%;"></div>
      <div class="container" style="height: 82%;">
        <div class="row no-gutters slider-text js-fullheight justify-content-center align-items-center">
          <div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-center">
          	<div class="text text-center">
          		<span class="subheading">Hey! I am</span>
		  			<h1>${memberVO.name}</h1>
			  			<h2> 
						  <span
						     class="txt-rotate"
						     data-period="1000"
						     data-rotate='[  "Now,", "Let me", "introduce myself"  ]'>
						  </span>
						</h2>
				</div>
            </div>
          </div>
        </div>
      </div>
      <div class="mouse" style="height: 20%;">
				<a href="#about-section" class="mouse-icon">
					<div class="mouse-wheel"><span class="ion-ios-arrow-round-down"></span></div>
				</a>
			</div>
    </section>
    <!-- About -->
  <!-- About -->
    <section class="ftco-about img ftco-section ftco-no-pt ftco-no-pb" id="about-section">
    	<div class="container">
    		<div class="row d-flex no-gutters">
    			<div class="col-md-2 col-lg-2">
    			</div>
    			<div class="col-md-4 col-lg-4 d-flex">
    				<div class="img-about img d-flex align-items-stretch">
    					<div class="overlay"></div>
		    				<div class="img d-flex align-self-stretch align-items-center" style="width: 100%; height: 500px; line-height: 600px; float: right ">
							    <img src="${hContext}/resources/images/${fileVO.saveNm}.${fileVO.ext }" style="width: 100%; max-width: 320px; float: right; " />
							</div>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-6 pl-md-5 py-5">
    				<div class="row justify-content-start pb-3">
		          <div class="col-md-12 heading-section ftco-animate">
		            <h2 class="mb-4">About Me</h2>
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
<%--     	<div class="container">
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
 	   </div>  --%>
    </section>
	<!--// About -->
	
	<!-- Projects -->
    <section class="ftco-about img ftco-section ftco-no-pt ftco-no-pb" id="Projects-section">
    	<div class="container-fluid px-md-5">
    		<div class="row justify-content-center py-5 mt-5">
          		<div class="col-md-10 heading-section text-center ftco-animate">
           			 <h2 class="mb-4">Projects</h2>
           			 <div align="center">
           				 <p>이 곳에서는 그동안 배우고 적용한 프로젝트를 볼 수 있는 곳입니다. 해당하는 버튼을 클릭하면 소스와,시연영상을 보실 수 있습니다.</p>
           			 </div>
           			 <div class="row col-md-12">
           			 	<c:choose>
           			 		<c:when test="${pjtList.size()>0}">
           			 			<c:forEach var="i" begin="0" end="${pjtList.size()-1}" >
           			 				<div class="row col-lg-4 mb-4  ml-lg-2  py-lg-2 shadow ">
           			 					<h5 class="text-primary" ><b>${i+1}차 프로젝트</b></h5>
	       			 					<a href="${pjtList.get(i).gitAddress }">
	                                		<video src="${hContext}/resources/video/${pjtFileList.get(i).savePNm}.${pjtFileList.get(i).ext}" width="250" height="250" ></video>
	                                    </a>
	                                    <table >
	                                    	<tbody>
	                                    		<tr>
	                                    			<td align="left"><b>subject</b></td>
	                                    			<td align="left">${pjtList.get(i).pjtName}</td>
	                                    		</tr>
	                                    		<tr>
	                                    			<td align="left"><b>설명</b></td>
	                                    			<td align="left">${pjtList.get(i).pjtInfo}</td>
	                                    		</tr>
	                                    		<tr>
	                                    			<td align="left"><b>사용 툴</b></td>
	                                    			<td align="left">${pjtList.get(i).pjtTool}</td>
	                                    		</tr>
	                                    		<tr>
	                                    			<td align="left"><b>프로젝트 기간</b></td>
	                                    			<td align="left">${pjtList.get(i).pjtStart}-${pjtList.get(i).pjtEnd}</td>
	                                    		</tr>
	                                    		 <tr>
					                           	    <td colspan="2" align="right">
					                           	        <a href="${pjtList.get(i).gitAddress}">
					                           	      	  <input type="button" class="btn btn-outline-primary" value="소스보기"/>
					                           	        </a> &nbsp;&nbsp;
					                           	  	  <input type="button" onclick="javascript:popup('${pjtList.get(i).gitAddress}');" class="btn btn-outline-primary" value="영상보기"/>  
					                           	    </td>
					                             </tr>
	                                    	</tbody>
	                                    </table>
	                                </div>  
           			 			</c:forEach>
           			 		</c:when>
           			 	</c:choose>
           			 </div>
           			 
<%--            			 <div align="center">
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
	                		data가 있는 경우
	                		<c:when test="${pjtList.size()>0}">
	                			<c:forEach var="i" begin="0" end="${pjtList.size()-1}" >
		                		<tr>
	                              <td><h5 class="text-primary" ><b>프로젝트 목록</b></h5></td>
	                           </tr>
	                           <tr>
	                              <td rowspan="4">
	                                  <a href="${pjtList.get(i).gitAddress }">
	                                 	<video src="${hContext}/resources/video/${pjtFileList.get(i).savePNm}.${pjtFileList.get(i).ext}" width="170" height="170" align="top"/>
	                                 </a>  
	                              </td>
	                              <td>
	                              	<p><b> subject:</b></p>
	                              </td>
	                              <td>
	                              	<p> ${pjtList.get(i).pjtName}</p>
	                              </td>
	                           </tr>
	                           <tr>
	                           	  <td>
	                           	  	<p><b> 설명:</b></p>
	                           	  </td>
	                           	  <td>
	                           	  	<p>${pjtList.get(i).pjtInfo}</p>
	                           	  </td>
	                           </tr>
	                           <tr>
	                           	  <td>
	                           	  	<p><b> 사용 툴:</b></p>
	                           	  </td>
	                           	  <td>
	                           	  	<p>${pjtList.get(i).pjtTool}</p>
	                           	  </td>
	                           </tr>
	                           
	                           <tr>
	                           	  <td>
	                           	  	<p><b>프로젝트 기간</b></p>
	                           	  </td>
	                           	  <td>
	                           	  	<p>${pjtList.get(i).pjtStart}-${pjtList.get(i).pjtEnd}</p>
	                           	  </td>
	                           </tr>
	                           <tr>
	                           	  <td colspan="2" align="center">
	                           	      <a href="${pjtList.get(i).gitAddress}">
	                           	      	<input type="button" class="btn btn-outline-primary" value="소스보기"/>
	                           	      </a> &nbsp;&nbsp;
	                           	  	  <input type="button" onclick="javascript:popup('${pjtList.get(i).gitAddress}');" class="btn btn-outline-primary" value="영상보기"/>  
	                           	  </td>
	                           </tr>
	                           <tr>
	                        	<td><br/></td>
	                        	</tr>
		                	    </c:forEach>
	                		</c:when>
	                		data가 없는 경우
	                		<c:otherwise>
	                			<tr>
	                				<td colspan="99">등록된 게시글이 없습니다</td>
	                			</tr>
	                		</c:otherwise>
	                	</c:choose>
	                        </tbody>
	                     </table>
           			 </div> --%>
           		</div>
           	</div>
        </div>
    </section>
	<!--// Projects -->
	
    <!-- Skills -->
     <section class="ftco-about img ftco-section ftco-no-pt ftco-no-pb" id="Skills-section">
		<div class="container-fluid px-md-5">
    		<div class="row justify-content-center py-5 mt-5">
          		<div class="col-md-10 heading-section text-center ftco-animate">
           			 <h2 class="mb-4">Skills</h2> 
           			  <div class="row progress-circle mb-5">
                                        
					  	      <c:choose>
						          <c:when test="${skillList.size()>0}">
						              <c:forEach var="i" begin="0" end="${skillList.size()-1 }">
						               <div class="col-lg-3 mb-3">
			                              <div class="bg-white rounded-lg shadow p-3">
                        
						                <h2 class="h5 font-weight-bold text-center mb-3">${skillList.get(i).sName}</h2>
		                                <!-- Progress bar 1 -->
		                                <div class="progress mx-auto" data-value='${skillList.get(i).sMarstery}'>
		                                    <span class="progress-left">
		                                         <span class="progress-bar border-primary"></span>
		                                    </span>
		                                    <span class="progress-right">
		                                        <span class="progress-bar border-primary"></span>
		                                    </span>
		                                    <div class="progress-value w-100 h-100 rounded-circle d-flex align-items-center justify-content-center">
		                                        <div class="h2 font-weight-bold">${skillList.get(i).sMarstery}<sup class="small">%</sup></div>
		                                    </div>
		                                </div>
		                                       <!-- Demo info -->
			                               <div class="col text-center mt-3">
                                              <p class="font-weight-bold text-center mb-3 ">${skillList.get(i).sContent}</p>
			                                </div>
			                                <!-- END -->
			                              </div>
			                            </div>
		                               </c:forEach>
		                             
                                       
						          </c:when>
						          <c:otherwise>
                                   <h2 class="text-center">등록된 게시글이 없습니다</h2>
                                </c:otherwise>
                              </c:choose>
                              </div>
                              <c:choose><c:when test="${skillList.size()>0}">
						       <div class="row col-lg-14 mb-14">
                                       <c:forEach var="i" begin="0" end="${skillList.size()-1 }">
                                       
                                                <div class="col-md-${skillList.size()} animate-box">
                                                        <div class="progress-wrap ftco-animate">
                                                            <h3>${skillList.get(i).sName}</h3>
                                                            <br/>
                                                            <div class="progress">
                                                                <div class="progress-bar color-1" role="progressbar" aria-valuenow="${skillList.get(i).sMarstery}"
                                                                aria-valuemin="0" aria-valuemax="100" style="width:${skillList.get(i).sMarstery}%">
                                                                <span>${skillList.get(i).sMarstery}%</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                       </c:forEach>
                                      </div>
						        <!-- END -->
                                </c:when> 
                           </c:choose>
						 </div>
						   						    
					  	</div>
					  	
           		  </div>
           	 </div>
         </div>    	
    </section>
    <!-- //Skills -->	
    
    <!-- License -->
     <section class="ftco-about img ftco-section ftco-no-pt ftco-no-pb" id="License-section">
     	<form action="${hContext}/portfolio/do_retrieve_lic.spring"  name="license_frm" method="GET" class="form-inline">
			<div class="container-fluid px-md-5">
	    		<div class="row justify-content-center py-5 mt-5">
	          		<div class="col-md-10 heading-section text-center ftco-animate">
	           			 <h2 class="mb-4">License</h2>
						 <div class="row">
						 	<c:choose>
						 		<c:when test="${licList.size()>0 }">
						 			<c:forEach var="vo" items="${licList}" >
									 	<div class="col-md-3 text-center d-flex ftco-animate">
									 		<div class="services-1 shadow" style="padding: 10;margin: 10">
									 			<span class="icon">
									 				<i class="flaticon-analysis"></i>
									 			</span>
									 			<div class="desc px-md-3 " >
									 				<!--  <input type="hidden" name="memberId" id="memberId" value="${vo.memberId}" />-->
									 				<table id="licFrm">
									 					<tbody>
															<tr>
									 						    <td colspan="2"><input type="hidden" name="memberId" id="memberId" value="${vo.memberId}"/>
									 							</td> 
									 						</tr>
									 						<tr align="center" >
									 							<td colspan="2" name="lName" value="${vo.lName }" >
									 								<h3><b><c:out value="${vo.lName }" /></b></h3><br>
									 							</td>
									 						</tr>
									 						<tr>
									 							<td width="80"><b>자격분류: </b></td>
									 							<td width="150" id="lGroup" name="lGroup"><c:out value="${vo.lGroup}" /></td>
									 						</tr>
									 						<tr>
									 							<td><b>자격등급: </b></td>
									 							<td id="lGrade" name="lGrade"><c:out value="${vo.lGrade}" /></td>
									 						</tr>
									 						<tr>
									 							<td><b>자격번호: </b></td>
									 							<td id="lNum" name="lNum"><c:out value="${vo.lNum }"  /></td>
									 						</tr>
									 						<tr>
									 							<td><b>취득일자: </b></td>
									 							<td id="lDate" name="lDate"><c:out value="${vo.lDate }" /></td>
									 						</tr>
									 						<tr>
									 							<td><b>발행기관:</b> </td>
									 							<td id="lOrgan" name="lOrgan"><c:out value="${vo.lOrgan }" /></td>
									 						</tr>
									 						<c:if test="${vo.memberId == sessionVO.memberId}">
										 						<tr>
										 							<td colspan="2" align="center">
										 								<br/>
	  			 						 								<button type="button"  class="licDelBtn btn btn-primary" id="licDel" name="licDel" >삭제</button>
										 							    <button type="button" class="licUpdate btn btn-primary" id="licUpdate" name="licUpdate" >수정</button> 
										 							</td>
										 						</tr>
									 						</c:if>
									 					</tbody>
									 				</table>
									 			</div>
									 		</div>
									 	</div>
									 </c:forEach>
							 	</c:when>
							 	<c:otherwise>
		                			<tr>
		                				<td colspan="99">등록된 자격증이 없습니다</td>
		                			</tr>
	                			</c:otherwise>
						 	</c:choose>	
						 </div>
	           	    </div>
	           	</div>
	        </div>  
        </form>
     </section>  
    <!-- //License -->

	<!-- Recommend -->
	<section class="ftco-about img ftco-section ftco-no-pt ftco-no-pb" id="Recommends-section">
    	<div class="container-fluid px-md-5">
    		<div class="row justify-content-center py-5 mt-5">
          		<div class="col-md-12 heading-section text-center ftco-animate">
           			 <h2 class="mb-4">Recommend</h2>
           			  <h4 class="mb-4">${memberVO.name}님의 관심분야: '<b>${memberVO.interestOption}</b>'</h4>
           			 <div align="center">
	           			 <table>
	                        <tbody>
	                        <tr>
	                        	<td><br/></td>
	                        </tr>
	                         <tr>
	                        	<td><hr/></td>
	                        </tr>
	                        <c:choose>
	                		<%-- data가 있는 경우 --%>
	                		<c:when test="${recommendList.size()>0}">
	                			<c:forEach var="i" begin="0" end="${recommendList.size()-1 }">
	                		
		                		<tr>
		                		  <td>
	                              	<h5 class="text-primary" >
	                              	<a href="${urlList.get(i)}">
	                              			<b>${companyList.get(i)}</b>
	                              	</a>
	                              	</h5>
	                              </td>
	                           </tr>

		                		<tr>
	                              <td><h6><b>${recommendList.get(i)}</b></h5></td>
	                           </tr>
	                           <tr>
	                              <td><hr/></td>
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
    <section class="ftco-section contact-section ftco-no-pb" id="contact-section">
      <div class="container">
      	<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h1 class="big big-2">Contact</h1>
            <h2 class="mb-4">Contact Me</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
          </div>
        </div>

        <div class="row d-flex contact-info mb-5">
          <div class="col-md-6 col-lg-3 d-flex ftco-animate">
          	<div class="align-self-stretch box text-center p-4 shadow">
          		<div class="icon d-flex align-items-center justify-content-center">
          			<span class="icon-map-signs"></span>
          		</div>
          		<div>
	          		<h3 class="mb-4">Address</h3>
		            <p>198 West 21th Street, Suite 721 New York NY 10016</p>
		          </div>
	          </div>
          </div>
          <div class="col-md-6 col-lg-3 d-flex ftco-animate">
          	<div class="align-self-stretch box text-center p-4 shadow">
          		<div class="icon d-flex align-items-center justify-content-center">
          			<span class="icon-phone2"></span>
          		</div>
          		<div>
	          		<h3 class="mb-4">Contact Number</h3>
		            <p><a href="tel://${memberVO.phone}">+ ${memberVO.phone}</a></p>
	            </div>
	          </div>
          </div>
          <div class="col-md-6 col-lg-3 d-flex ftco-animate">
          	<div class="align-self-stretch box text-center p-4 shadow">
          		<div class="icon d-flex align-items-center justify-content-center">
          			<span class="icon-paper-plane"></span>
          		</div>
          		<div>
	          		<h3 class="mb-4">Email Address</h3>
		            <p><a href="mailto:${memberVO.email}">${memberVO.email}</a></p>
		          </div>
	          </div>
          </div>
          <div class="col-md-6 col-lg-3 d-flex ftco-animate">
          	<div class="align-self-stretch box text-center p-4 shadow">
          		<div class="icon d-flex align-items-center justify-content-center">
          			<span class="icon-globe"></span>
          		</div>
          		<div>
	          		<h3 class="mb-4">Website</h3>
		            <p><a href="#">yoursite.com</a></p>
	            </div>
	          </div>
          </div>
        </div>

<%--         <div class="row no-gutters block-9">
          <div class="col-md-6 order-md-last d-flex">
            <form action="#" class="bg-light p-4 p-md-5 contact-form">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Name">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Email">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Subject">
              </div>
              <div class="form-group">
                <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>

          <div class="col-md-6 d-flex">
          	<div class="img" style="background-image: url(${hContext}/resources/images/about.jpg);"></div>
          </div>
        </div> --%>
      </div>
    </section>
    
     <!-- Comment -->
     <section class="ftco-about img ftco-section" style="min-height: 100%;" >
    <!-- commentfrm -->
    <div class="container">
   	<form id="commentfrm" name="commentfrm" >
        <div >
	    	<!-- 입력 From -->
            <div>
                <table class="">     
                               
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="2" cols="30" id="cContent" name="cContent" placeholder="댓글을 입력하세요"></textarea>
                            <input type="hidden" id="portfolioId" name="portfolioId" placeholder="아이디" value="${memberVO.memberId}" />
                            <input type="hidden" id="regId" name="regId" placeholder="아이디" value="${sessionVO.memberId}" />
                            <input type="hidden" name="pageNum" id="pageNum" value="${vo.pageNum }">
                            <input type="hidden" id="searchWord" name="searchWord" value="${memberVO.memberId}">
						
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                        	<button type="button" class="btn pull-right btn-primary" id="doInsert"  >등록</button>
                        </td>
                    </tr>
                </table>
            </div>
        	<!-- 입력 From --> 
        </div>
        
    	<table class="commentTable" style="width: 1100px; " >
    		<input type="hidden" id="sessionID" value="${sessionVO.memberId}" />
 				<!-- Data있는 경우 -->
 				<c:choose>
 					<c:when test="${list.size()>0 }">
					<c:forEach var="vo" items="${list }">
						<tbody >
							<tr>
								<th colspan="3"><c:out value="${vo.regId }"></c:out></th>
							</tr>
							<tr style=" border: 0px; ">
								<td align="left" style="padding-bottom: 15px"><c:out value="${vo.cContent }"></c:out></td>
								<td ><input type="hidden" maxlength="20" class="cNo form-control input-sm" id="cNo" name="cNo" value="${vo.cNo}" /></td>
								<td align="right" style="padding-bottom: 15px"><c:out value="${vo.regDt }"></c:out></td>
							
							</tr>
							<tr >
							<c:if test="${vo.regId == sessionVO.memberId}">
							   	<td colspan="3" align="right" style="padding-bottom: 15px" >
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
    	</form>
    	</div>
    	<!-- comment frm -->
    </section>
	<!-- Comment -->
    
		

    <footer class="ftco-footer ftco-footer-fixed" style="height: 18%;" >
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-8">
            <div class="ftco-footer-widget mb-4" >
              <h3 style="color: white;">About</h3>
              <p>Our project name is BomBom means spring and Spring Framework.<br/>Our goal is to build and operate a personal portfolio site.
            	<br/> <br/>Copyright &copy;<script>2020</script> 
	           All rights reserved | This project is made with 
	           <i class="icon-heart color-danger" aria-hidden="true"></i> 
	           by <a href="index.jsp" target="_blank">Bombom</a></p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="ftco-footer-widget mb-4">
            	<h3 style="color: white;">Contact me</h3>
                <ul class="list-unstyled">
	                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>phone: &nbsp; ${memberVO.phone}</a></li>
	                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>mail: &nbsp;${memberVO.email}</a></li>
	               
                </ul>
            </div>
          </div>
          </div>
        </div>
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
  <script type="text/javascript">
	function logOut(){
		alert('로그아웃합니다.');
		location.href="${hContext }/portfolio/logout.spring";

		}
  //조회버튼 클릭 시
  function licRetrieve() {
      var frm = document.license_frm;
      frm.action="${hContext}/portfolio/toHome.spring";
      frm.submit();
   }

  function popup(gitAddress){
	  
      var url = "${hContext}/portfolio/searchVideo.spring?gitAddress="+gitAddress;
      var name = "popup test";
      var option = "width = 500, height = 500, top = 200, left = 200, location = no"
      window.open(url, name, option);
  }


//Comment--------------------------------------------------------------------------  
  function cmtRetrieve(){
  	//console.log('cmtRetrieve');
  	
  	var frm = document.commentfrm;
  	frm.pageNum.value = 1;
  	frm.searchWord.value=$("#searchWord").val();
  	frm.portfolioId.value=$("#portfolioId").val();
  	frm.regId.value=$("#sessionID").val();
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
  	 
  	 var tbody = doUpdate.parent().parent().parent();
       var tr = tbody.children();
       var td = tbody.children().children();
       var regId = td.eq(0).text().trim();
       var cNo = tr.eq(1).find("#cNo").attr("value");
       var cContent = td.eq(2).text().trim();

       
  	 console.log("regId:"+regId);
  	 console.log("cNo:"+cNo);
  	 console.log("cContent:"+cContent);

           var html = "";
           var tbody = doUpdate.parent().parent().parent();
           var removeTbody = tbody.eq(0);
  	    removeTbody.empty();


  	    html += '<tbody>																												';
  		html += '	<tr style="border-top: 5px; margin-top: 5px;">                                                                      ';
  		html += '		<th>';
  		html +=regId;
  		html += '</th><td></td>																								';
  		html += '	</tr>                                                                                                               ';
  		html += '	<tr><td colspan="2" align="right">                                                                                                                 ';
  		html += '		<textarea style="width: 1100px" rows="2" cols="30" name="message" id="message" placeholder="'+cContent+'" value=\"${vo.cContent}\"  ></textarea>      ';
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


  //삭제
   $(".doDelete").on("click", function() {


   	var doDelete = $(this);
  	 
  	var tbody = doDelete.parent().parent().parent();
      var tr = tbody.children();
      var td = tbody.children().children();
      var cNoDel = tr.eq(1).find("#cNo").attr("value");
   	console.log("#doDelete");
   	console.log("cNoDel:"+cNoDel);
   	

   	//u_id null check
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
   			"cNo" : cNoDel
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


    
//Comment--------------------------------------------------------------------------  
    
//License------------------------------
 	//수정
	  $(".licUpdate").on("click",function(event){
		 console.log("수정");
		 var licUpdate = $(this);
	     var tdArr = new Array();
	
	     licUpdate.each(function(i){
				 var tr = licUpdate.parent().parent().parent().eq(i);
		         var td = tr.children().children();
		         var lName = td.eq(1).text();
			     var lGroup = td.eq(3).text();
			     var lGrade = td.eq(5).text();
			     var lNum = td.eq(7).text();
			     var lDate = td.eq(9).text();
			     var lOrgan=td.eq(11).text();
	
			     tdArr.push(lName);
			     tdArr.push(lGroup);
			     tdArr.push(lGrade);
			     tdArr.push(lNum);
			     tdArr.push(lDate);
			     tdArr.push(lOrgan);
	      }); //--raio.each
	
	     var lName = tdArr[0];
	     
	     var lGroup = tdArr[1];
	     var lGrade = tdArr[2]; 
	     var lNum = tdArr[3];
	     var lDate = tdArr[4];
	     var lOrgan= tdArr[5];
		
	     //ajax
	     $.ajax({
	      type:"GET",
	      url:"${hContext}/portfolio/go_update.spring",
	      dataType:"html", 
	      data:{ //"memberId":"sohyun1234"
	             "memberId":$("#memberId").val(),
	             "lName" : lName.trim(),
	             "lGroup": lGroup.trim(),
	             "lGrade": lGrade.trim(),
	             "lNum": lNum.trim(),
	             "lDate": lDate.trim(),
	             "lOrgan": lOrgan.trim() 
	      },
	      success:function(data){ //성공
		          console.log("data:"+data); 
		          console.log("memberId= "+$("#memberId").val());
		          console.log("lName= "+lName.trim()); 
		          var html = "";
		          var tbody = licUpdate.parent().parent().parent();
		          var removeTbody = tbody.eq(0);
			      removeTbody.empty();
			      
			      html+='<tbody>                                                                                                                    ';
			      html+='	<tr>                                                                                                                      ';
			      html+='		<td rowspan="2">                                                                                                      ';
			      html+='			<input type="hidden" name="memberIdU" id="memberIdU" value="${vo.memberId}"/>                                       ';
			      html+='		</td>                                                                                                                 ';
			      html+='	</tr>                                                                                                                     ';
			      html+='	<tr>';  
			      html+='		<td><input type="text" id="lNameU" name="lNameU" size="15"  maxlength="10" readonly="readonly" value="';
				  html+= lName.trim();
				  html+='"/>';
			      html+='<hr/>                                                                                                 ';
			      html+='		</td>                                                                                                                 ';
			      html+='	</tr>                                                                                                                     ';
			      html+='	<tr>                                                                                                                      ';
			      html+='		<td>자격분류: </td>                                                                    ';
			      html+='		<td>                                                                                                                  ';
				  html+='			<input type="text" id="lGroupU" name="lGroupU" size="15"  maxlength="10" value="';
				  html+=lGroup.trim();
				  html+='"/>	';
			      html+='		</td>                                                                                                                 ';
			      html+='	</tr>                                                                                                                     ';
			      html+='	<tr>                                                                                                                      ';
			      html+='		<td>자격등급: </td>                                                                                                      ';
			      html+='		<td>                                                                                                                  ';
			      html+='			<input type="text" id="lGradeU" name="lGradeU" size="15"  maxlength="10" value="';
				  html+=lGrade.trim();
				  html+='"/>	';
			      html+='		</td>                                                                                                                 ';
			      html+='		</tr>                                                                                                                 ';
			      html+='	<tr>                                                                                                                      ';
			      html+='		<td>자격번호: </td>                                                                                                      ';
			      html+='		<td>                                                                                                                  ';
			      html+='			<input type="text" id="lNumU" name="lNumU" size="15"  maxlength="10" value="';
				  html+=lNum.trim();
				  html+='"/>	';
			      html+='		</td>                                                                                                                 ';
			      html+='	</tr>                                                                                                                     ';
			      html+='	<tr>                                                                                                                      ';
			      html+='		<td>취득일자: </td>                                                                                                      ';
			      html+='		<td>                                                                                                                  ';
			      html+='			<input type="text" id="lDateU" name="lDateU" size="15"  maxlength="10" value="';
				  html+=lDate.trim();
				  html+='"/>	';
				  html+='		</td>                                                                                                                 ';
			      html+='	</tr>                                                                                                                     ';
			      html+='	<tr>                                                                                                                      ';
			      html+='		<td>발행기관: </td>                                                                                                      ';
			      html+='		<td>                                                                                                                  ';
			      html+='			<input type="text" id="lOrganU" name="lOrganU" size="15"  maxlength="10" value="';
				  html+=lOrgan.trim();
				  html+='"/>	';
			      html+='		</td>                                                                                                                 ';
			      html+='	</tr>                                                                                                                     ';
			      html+='	<tr>                                                                                                                      ';
			      html+='		<td colspan="2">                                                                                                      ';
			      html+='			<button type="button"  class="licCan btn btn-primary" id="licCan" name="licCan" >수정취소</button>                   ';
			      html+='			<button type="button" class="licUpdateEnd btn btn-primary" id="licUpdateEnd" name="doUpdate" >수정완료</button>              ';
			      html+='		</td>                                                                                                                 ';
			      html+='	</tr>                                                                                                                     ';
			      html+='</tbody>                                                                                                                   ';                                                                                                                                                            
			      tbody.append(html); 																							
	      },
	      error:function(xhr,status,error){
	        alert("error:"+error);
	      },
	      complete:function(data){
	      
	      }   
	      
	     });//--ajax 

     
	  });//--수정  

	  //수정취소버튼
	  $(document).on("click",".licCan",function(){
		  licRetrieve();
	    });

	  //수정완료버튼
	  $(document).on("click",".licUpdateEnd",function(){//댓글수정완료버튼
	  		 var lName = $("#lNameU").val();
		     var lGroup = $("#lGroupU").val();
		     var lGrade = $("#lGradeU").val(); 
		     var lNum = $("#lNumU").val();
		     var lDate = $("#lDateU").val();
		     var lOrgan= $("#lOrganU").val();   

			 console.log("수정전------------------")
		     console.log("lName: "+lName);
		     console.log("lGroup: "+lGroup);
		     console.log("lGrade: "+lGrade);
		     console.log("lNum: "+lNum);
		     console.log("lDate: "+lDate);
		     console.log("lOrgan: "+lOrgan);
		     console.log("//수정전------------------")
		      

		     if($("#lGroupU").val()==null || $("#lGroupU").val().length<=0 ||$("#lGroupU").val()=='undefined'){
					$("#lGroupU").focus();
					alert("자격분류를 입력하세요.");
					return;
				}

		     if($("#lGradeU").val()==null || $("#lGradeU").val().length<=0 || $("#lGradeU").val()=='undefined'){
					$("#lGradeU").focus();
					alert("자격등급을 입력하세요.");
					return;
				}

		     if($("#lNumU").val()==null || $("#lNumU").val().length<=0 ||  $("#lNumU").val()=='undefined'){
					$("#lNumU").focus();
					alert("자격번호 입력하세요.");
					return;
				}
				
		     if( $("#lDateU").val()==null ||  $("#lDateU").val().length<=0|| $("#lDateU").val()=='undefined'){
					$("#lDateU").focus();
					alert("취득일을 입력하세요.");
					return;
				}

		     if($("#lOrganU").val()==null || $("#lOrganU").val().length<=0|| $("#lOrganU").val()=='undefined'){
					$("#lOrganU").focus();
					alert("발행기관을 입력하세요.");
					return;
				}

		     if(confirm("수정 하시겠습니까?")==false) return;
			
		     //ajax
		     $.ajax({
		      type:"POST",
		      url:"${hContext}/portfolio/do_update.spring",
		      dataType:"html", 
		      data:{ //"memberId":"sohyun1234"
		             "memberId":$("#memberId").val(),
		             "lName" : lName.trim(),
		             "lGroup": lGroup.trim(),
		             "lGrade": lGrade.trim(),
		             "lNum": lNum.trim(),
		             "lDate": lDate.trim(),
		             "lOrgan": lOrgan.trim() 
		      },
		      success:function(data){ //성공
			      console.log("수정성공후우우우우");
			      console.log("lName: "+lName.trim());
			      console.log("lGroup: "+lGroup.trim());
				     console.log("lGrade: "+lGrade);
				     console.log("lNum: "+lNum);
				     console.log("lDate: "+lDate);
				     console.log("lOrgan: "+lOrgan);
		    	  alert("수정되었습니다.");
		    	  licRetrieve();
		      },
		      error:function(xhr,status,error){
		        alert("error:"+error);
		      },
		      complete:function(data){
		      
		      }   
		      
		     });//--ajax
			  
		  });
		//--수정완료버튼

		
		//do_retieve 
		function mypage() {

         location.href="${hContext}/portfolio/mypage_retrieve.spring";
         
      }
	      

 	//삭제
	 $(".licDelBtn").on("click",function(){
		 console.log("삭제");
		 var rowData = new Array();	 
		 var tdArr = new Array();	// 배열 선언
		 var licDelBtn = $(this);

		 var tr = licDelBtn.parent().parent().parent();
      	 var td = tr.children().children();
     	 rowData.push(tr.text());

	      var lName = td.eq(1).text();
	      console.log("lName="+lName);
	      tdArr.push(lName);

		  //confirm
     	  if(confirm(lName.trim()+"을(를) 삭제 하시겠습니까?")==false) return;
	       
		   //ajax
		   $.ajax({
		    type:"POST",
		    url:"${hContext}/portfolio/do_delete_license.spring",
		    dataType:"html", 
		    data:{ //"memberId":"sohyun1234"
		           "memberId":$("#memberId").val()
		          ,"lName" : lName.trim()
		    },
		    success:function(data){ //성공
		     //console.log("data:"+data);  
		     var parseData = $.parseJSON(data);
					 if(parseData.msgId=="1"){
							alert(parseData.msgMsg);
							licRetrieve();
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
	
//--License----------------------------

  </script> 
  </body>
</html>