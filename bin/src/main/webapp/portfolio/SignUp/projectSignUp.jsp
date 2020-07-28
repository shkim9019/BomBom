<%--
  /**
  * Class Name : 
  * Description : 
  * Modification Information
  *
  *   수정일                   수정자                      수정내용
  *  -------    --------    ---------------------------
  *  2020. 4. 29.            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.01.06
  *
  * Copyright (C) 2009 by KandJang  All right reserved.
  */
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="hContext" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html lang="en">
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
	      <a class="navbar-brand" href="index.jsp"><span>B</span>ombom</a>
	      <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav nav ml-auto">
	          <li class="nav-item"><a href="#home-section" class="nav-link"><span>Home</span></a></li>
	          <li class="nav-item"><a href="#about-section" class="nav-link"><span>About</span></a></li>
	          <li class="nav-item"><a href="#License-section" class="nav-link"><span>License</span></a></li>
	          <li class="nav-item"><a href="#Skills-section" class="nav-link"><span>Skills</span></a></li>
	          <li class="nav-item"><a href="#Projects-section" class="nav-link"><span>Projects</span></a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
	<div>
		<br/>
		<br/>
		<br/>
		<br/>
	</div>  
      <div class="container">
        	<hr/>
        	<p><h3>프로젝트 경험</h3></p>
        	<br/><br/>
       
         <div class="row d-flex no-gutters">
        <form action="${hContext}/portfoilo/upload.spring" method="post" enctype="multipart/form-data" name="uploadFrm">
				<c:choose>
					<c:when test="${videoFile != null}">
					<table>
					<tr>
						<td rowspan="4">
							<video src="${hContext}/resources/video/20200507151830_c66bf.avi" width='100' controls autoplay></video>
						</td>
						<td>
							프로젝트명
						</td>
						<td>
							${projectDb.pjtName}
						</td>
					</tr>
					<tr>
						<td>
							프로젝트 설명
						</td>
						<td>
							${projectDb.pjtInfo}
						</td>
						
					</tr>
					<tr>
						<td>
							프로젝트 기간
						</td>
						<td>
							${projectDb.pjtStart} - ${projectDb.pjtEnd}
						</td>
					</tr>	
					<tr>
						<td>
							깃허브 주소
						</td>
						<td>
							<a href="https://github.com/Taller88/SistAirlines" target="_blank">${projectDb.gitAddress}</a>
						</td>
					</tr>
					</table>
					</c:when>
				</c:choose>
				<table id="pjtForm">
				<tr>
					<td>
						<img alt="추가입력폼" width="20" height="20" src="${hContext}/resources/images/plus.png" id="plusInsert">
					</td>
				</tr>
				<tr>
					<td>
						프로젝트명
					</td>
					<td>
						<input type="text" id="pjtName" name="pjtName">
					</td>
				</tr>
				<tr>	
					<td>
						<p>프로젝트 설명<p>
					</td>
					<td>
						<textarea cols="50" rows="3" id="pjtInfo" name="pjtInfo"></textarea>
					</td>
				</tr>
				<tr>	
					<td>
						<p>프로젝트 기간 <p>
					</td>
					<td>
						<input type="date" id="pjtStart" name="pjtStart"> - <input type="date" id="pjtEnd" name="pjtEnd">
					</td>
				</tr>
				<tr>	
					<td>
						<p>프로젝트 깃 주소<p>
					</td>
					<td>
						<input type="text" id="gitAddress" name="gitAddress">
					</td>
				</tr>
				<tr>	
					<td>
						<p>프로젝트 시연영상<p>
					</td>
					<td>
						<input type="file" id="videoFile" name="videoFile">
					</td>
				</tr>
			</table>
			<table>
			<tr>
				<td colspan=2>
					<input class="btn btn-outline-primary" type="submit" value="입력"><br/>
					<button type="button" onclick="javascript:pjtInsert();" class="btn btn-primary btn-sm">검색</button>
				</td>
			</tr>
			
		</table>
			<input type="hidden" id="hiddenCnt">
		    </form>
		    <hr>
          </div>
							
	  </div><!-- //container -->
   
  

    <footer class="ftco-footer ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">About</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Links</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Home</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>About</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Services</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Projects</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Services</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Web Design</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Web Development</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Business Strategy</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Data Analysis</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Graphic Design</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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
	var cnt=1;
    $("#plusInsert").on("click", function(){
		console.log('This is plus button');
		var frm=document.uploadFrm;
		var html="";
		cnt+=1;
		console.log(cnt);
		html+="<tr><td colspan='2'><hr/><br/></td></tr>																														";
		html+="<tr>                                                                                                                     ";
		html+="	<td>                                                                                                                    ";
		html+="		프로젝트명                                                                                                              ";
		html+="	</td>                                                                                                                   ";
		html+="	<td>                                                                                                                    ";
		html+="		<input type='text' id='pjtName"+cnt+"' name='pjtName"+cnt+"'>                                                                     ";
		html+="	</td>                                                                                                                   ";
		html+="</tr>                                                                                                                    ";
		html+="<tr>	                                                                                                                    ";
		html+="	<td>                                                                                                                    ";
		html+="		<p>프로젝트 설명<p>                                                                                                      ";
		html+="	</td>                                                                                                                   ";
		html+="	<td>                                                                                                                    ";
		html+="		<textarea cols='50' rows='3' id='pjtInfo"+cnt+"' name='pjtInfo"+cnt+"'></textarea>                                                ";
		html+="	</td>                                                                                                                   ";
		html+="</tr>                                                                                                                    ";
		html+="<tr>	                                                                                                                    ";
		html+="	<td>                                                                                                                    ";
		html+="		<p>프로젝트 기간 <p>                                                                                                     ";
		html+="	</td>                                                                                                                   ";
		html+="	<td>                                                                                                                    ";
		html+="		<input type='date' id='pjtStart"+cnt+"' name='pjtStart"+cnt+"'> - <input type='date' id='pjtEnd"+cnt+"' name='pjtEnd"+cnt+"'>                   ";
		html+="	</td>                                                                                                                   ";
		html+="</tr>                                                                                                                    ";
		html+="<tr>	                                                                                                                    ";
		html+="	<td>                                                                                                                    ";
		html+="		<p>프로젝트 깃 주소<p>                                                                                                   ";
		html+="	</td>                                                                                                                   ";
		html+="	<td>                                                                                                                    ";
		html+="		<input type='text' id='gitAddress"+cnt+"' name='gitAddress"+cnt+"'>                                                               ";
		html+="	</td>                                                                                                                   ";
		html+="</tr>                                                                                                                    ";
		html+="<tr>	                                                                                                                    ";
		html+="	<td>                                                                                                                    ";
		html+="		<p>프로젝트 시연영상<p>                                                                                                   ";
		html+="	</td>                                                                                                                   ";
		html+="	<td>                                                                                                                    ";
		html+="		<input type='file' id='videoFile"+cnt+"' name='videoFile"+cnt+"'>                                                                 ";
		html+="	</td>                                                                                                                   ";
		html+="</tr>                                                                                                                    ";
		
		$("#pjtForm>tbody").append(html);
		

	});
		


    
		function pjtInsert() {
			console.log("pjtInsert");
			//console.log("doRetrieve()");
			var frm = document.signUp_pjt_frm;
			frm.action = "${hContext}/portfolio/do_insert.spring";
			frm.method="GET";
			frm.submit(); 
		}

	$("#uploadBtn").on("click", function(){
		console.log("uploadTest");
		var frm=document.uploadFrm;
		frm.hiddenCnt.value=cnt;
		frm.file01.value=$("#videoFile").value;
		frm.action = "${hContext}/portfoilo/upload.spring";
		frm.method="POST"
		frm.submit();
		
		});
		
    </script>
</body>
</html>