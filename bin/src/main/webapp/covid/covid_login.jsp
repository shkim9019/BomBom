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
	      <a class="navbar-brand" href="${hContext}/covid/covid_login.jsp"><span>B</span>ombom</a>
	      <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
         <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav nav ml-auto">
	          <li class="nav-item"><a href="#home-section" class="nav-link"><span>Home</span></a></li>
	          <li class="nav-item"><a href="#about-section" class="nav-link"><span>About</span></a></li>
	          <li class="nav-item"><a href="#License-section" class="nav-link"><span>License</span></a></li>
	          <li class="nav-item"><a href="#Skills-section" class="nav-link"><span>Skills</span></a></li>
	          <li class="nav-item"><a href="javascript:logout();" class="nav-link"><span>logout</span></a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    
	<section class="hero-wrap js-fullheight">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight justify-content-center align-items-center">
          <div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-center">
			
	<!-- login form -->
	<div class="container center">
		<div class="row justify-content-center">
		
		<form class="form-horizontal" action="${hContext}/covid/do_login.spring" method="post">
		
		  <div align="center"><h2>LOGIN</h2><br/></div>
		  <div class="form-group">
		    <label for="memberId" class="col-sm-6 control-label">ID</label>
		    <div class="col-sm-12">
		      	<input type="text" class="form-control" id="memberId" name="memberId" placeholder="ID">
		    </div>
		  </div>
		  <div class="form-group" >
		    <label for="password" class="col-sm-6 control-label">Password</label>
		    <div class="col-sm-12">
		      <input type="password" class="form-control" id="password" name="password" placeholder="PW">
		    </div>
		  </div>
		  <div class="form-group" >
		    <div class="col-sm-offset-2 col-sm-10">
		      <div class="checkbox">
		        <label>
		          <input type="checkbox"> Remember me
		        </label>
		      </div>
		    </div>
		  </div>
		  <div class="form-group" align="center" >
		    <div class="col-sm-offset-2 col-sm-10">
		      <input type="button" id="loginBtn" name="loginBtn" class="btn btn-primary btn-lg" value="로그인" />&nbsp;&nbsp;
		      <input type="button" onclick="javascript:goSignUp();" class="btn btn-primary btn-lg" value="회원가입">
		    </div>
		  </div>
		</form>
		</div>
	</div>
  	<!--// login form -->
          </div>
        </div>
      </div>
    </section>

  <footer class="ftco-footer ftco-footer-fixed" style="height: 18%;" >
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-8">
            <div class="ftco-footer-widget mb-4" >
              <h3 style="color: white;">About</h3>
              <p>Our project name is BomBom means spring and Spring Framework.<br/>Our goal is to build and operate a personal portfolio site.
            	<br/>Copyright &copy;<script>2020</script> 
	           All rights reserved | This project is made with 
	           <i class="icon-heart color-danger" aria-hidden="true"></i> 
	           by <a href="index.jsp" target="_blank">Bombom</a></p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="ftco-footer-widget mb-4">
            	<h3 style="color: white;">Contact me</h3>
                <ul class="list-unstyled">
	                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>phone: &nbsp; ${vo.phone}</a></li>
	                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>mail: &nbsp;${vo.email}</a></li>
	               
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
  

  	$("#loginBtn").on("click",function(){
		console.log("loginBtn");
		//ajax
		$.ajax({
		   type:"POST",
		   url:"${hContext}/covid/do_login.spring",
		   dataType:"html", 
		   data:{"memberId": $("#memberId").val(),
			     "password": $("#password").val()
		   },
		   success:function(data){ //성공
			   var parseData = $.parseJSON(data);
		   	   if(parseData.msgId =="1"){
					alert(parseData.msgMsg);
					location.href="${hContext}/covid/go_login.spring";
			   } else{
				    alert(parseData.msgMsg);
			   }
			   
		   },
		   error:function(xhr,status,error){
		      
		   },
		   complete:function(data){
		   
		   }   
		   
		  });//--ajax
  	});
	
	function goSignUp(){
		//console.log('확인');
		alert('회원가입페이지로 이동합니다.');
		location.href="${hContext}/covid/covid_sign_up.jsp";
	}

	function logout(){
		//console.log("goMypage");
		location.href="${hContext}/covid/logout.spring";
		
	}
	 
	</script>
</body>
</html>