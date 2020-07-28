<%--
  /**
  * Class Name : 
  * Description : 
  * Modification Information
  *
  *   수정일                   수정자                      수정내용
  *  -------    --------    ---------------------------
  *  2020. 5. 6.            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.01.06
  *
  * Copyright (C) 2009 by KandJang  All right reserved.
  */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 
<c:set var="hContext" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

em.error {
        color:#FF0000;
     font:100% arial,helvetica,clean,sans-serif;
     font-size:15px;
     font-weight:bold;  
    }
</style>
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

<body>
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
      
    <div>
        <br/>
        <br/>
        <br/>
    </div>   
    <!-- Sign Up -->
	    <section class="hero-wrap js-fullheight"> <!-- 파란배경 -->
	      <div class="overlay"></div>
            <div class="container-fluid px-md-5">
                <div class="row justify-content-center py-5 mt-5">
                    <div class="col-md-12 heading-section text-center ftco-animate">
                         <h2 class="mb-4">Sign Up</h2>
                         <div align="center">
                            <form action="${hContext}/covid/do_sign_up.spring" id="registerForm" name="registerForm" method="POST">
	                           	<table>
		                            <tbody>
		                                <tr>
		                                    <td>
		                                    <input  type="text" class="form-control id" name="memberId" id="memberId" placeholder="Id"  maxlength="15" autofocus>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                    <input type="password" class="form-control pass" name="password" id="password" placeholder="Password">
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                    <input type="password" class="form-control pass" name="passwordConfirm" id="passwordConfirm" placeholder="Confirm Password" >
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                    <input type="email" class="form-control email" name="email" id="email" placeholder="Email"  autofocus>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        Phone : <select name="phone1" id="phone1">
		                                           <option value="010">010</option>
		                                           <option value="011">011</option>
		                                           <option value="016">016</option>
		                                           <option value="017">017</option>
		                                           <option value="019">019</option>
		                                         </select>-
		                                         <input type="text" name="phone2" id="phone2" size="5" maxlength="4">
		                                         -
		                                         <input type="text" name="phone3" id="phone3" size="5" maxlength="4"><br><br>
		                                    </td>
		                                </tr>
		                                <tr>
                          				  <td>
                            				<input  type="submit" class="form-control btn btn-danger btn-sm"  value="회원가입" />
                            			 </td>
                            			</tr>
		                              </tbody>
	                                </table>
                            </form>
                            
                         
                        </div>
                    </div>
                </div>
            </div>
        </section> <!--// 파란배경 -->


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





<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/popper.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>
<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
<script src="<c:url value="/resources/js/aos.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.animateNumber.min.js"/>"></script>
<script src="<c:url value="/resources/js/scrollax.min.js"/>"></script>
<script src="<c:url value="/resources/js/main.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <!-- jQuery validator -->
<script src="<c:url value="/resources/js/jquery.validate.js"/>"></script>


    <script type="text/javascript">
         function bindEventHandler(){
             $("#registerForm").validate({
                 onfocus: true,
                 //서버전송여부
                 debug: false,
                  
                 rules: {
                	 memberId:{
                        //필수값
                        required: true,
                        //최소길이
                        minlength: 3
                     },password:{
                         //필수값
                         required: true,
                         //범위
                         rangelength: [4,12]
                     },passwordConfirm:{
                         //필수값
                         required: true,
                         //범위
                         rangelength: [4,12],

                         equalTo:"#password"
                     },email:{
                         //필수값
                         required: true,
                         //이메일형식
                         email: true
                     },phone1:{
                         //필수값
                         required: true,
                         //이메일형식
                         rangelength: [1,4]
                     },phone2:{
                         //필수값
                         required: true,
                         //이메일형식
                         rangelength: [3,4]
                     },phone3:{
                         //필수값
                         required: true,
                         //이메일형식
                         rangelength: [3,4]
                     }

                 },messages: {
                     //message
                     memberId:{
                        //필수값 
                        required: "아이디는 필수값 입니다.",
                        //최소길이
                        minlength: $.validator.format('{0}자 이상 입력하세요.')
                     },password:{
                         //필수값 
                         required: "비밀번호는 필수값 입니다.",
                         //최소길이
                         rangelength: $.validator.format('비밀번호는 {0}이상~{1}이하로 입력하세요.')
                     },passwordConfirm:{
                          //필수값 
                          required: "비밀번호확인을 입력하세요.",
                          //최소길이
                          rangelength: $.validator.format('비밀번호확인는 {0}이상~{1}이하로 입력하세요.'),
                          //pass==confirm_pass 
                          equalTo:"비밀번호 항목과 일치하지 않습니다."
                     },email:{
                         //필수값
                         required: "이메일은 필수값 입니다.",
                         //이메일형식
                         email:  "올바른 이메일 형식이 아닙니다."
                     },phone1:{
                    	 required: "<br>핸드폰번호는 필수값 입니다.",
                         //이메일형식
                         rangelength: $.validator.format('핸드폰를 형식에 맞게 입력해주세요.')
                     },phone2:{
                    	 required: "",
                         //이메일형식
                         rangelength: $.validator.format('')
                     },phone3:{
                    	 required: "<br>핸드폰번호는 필수값 입니다.",
                         //이메일형식
                         rangelength: $.validator.format('<br>핸드폰를 형식에 맞게 입력해주세요.')
                     }
                 },errorElement: "em"
                 ,errorPlacement: function ( error, element ) {
                     // Add the `help-block` class to the error element
                     error.addClass( "help-block" );

                     if ( element.prop( "type" ) === "checkbox" ) {
                         error.insertAfter( element.parent( "label" ) );
                     } else {
                         error.insertAfter( element );
                     }
                 },
                 highlight: function ( element, errorClass, validClass ) {
                     $( element ).parents(".col-lg-5").addClass( "has-error" ).removeClass( "has-success" );
                 },
                 unhighlight: function (element, errorClass, validClass) {
                     $( element ).parents(".col-lg-5").addClass( "has-success" ).removeClass( "has-error" );
                 },
               	 //서밋 헨들러
	             submitHandler:function(form){
	            	//ajax
	     			$.ajax({
	     			   type:"POST",
	     			   url:"${hContext}/covid/do_sign_up.spring",
	     			   dataType:"html", 
	     			   data:{"memberId": $("#memberId").val(),
	     				     "password": $("#password").val(),
	     				     "passwordConfirm": $("#passwordConfirm").val(),
	     				     "email": $("#email").val(),
	     				     "phone1": $("#phone1").val(),
	     				     "phone2": $("#phone2").val(),
	     				     "phone3": $("#phone3").val()
	     			   },
	     			   success:function(data){ //성공
	     			   	   console.log("data:" + data);
	     				   var parseData = $.parseJSON(data);
	     				   if(parseData.msgId =="1"){
	     						alert(parseData.msgMsg);
	     						goLogin();
	     			   	   }
	     				   
	     			   },
	     			   error:function(xhr,status,error){
	     			      
	     			   },
	     			   complete:function(data){
	     			   
	     			   }   
	     			   
	     			  });//--ajax

		         }

          });

         }
    
         $(document).ready(function(){
             //input validation
             bindEventHandler();
                
         });


		function goLogin(){
			//console.log('확인');
			alert('로그인 페이지로 이동합니다.');
			location.href="${hContext}/covid/covid_login.jsp";
		 }

		 
		function logout(){
	    		//console.log("goMypage");
	    		location.href="${hContext}/covid/logout.spring";
	    		
	    }
    </script>
  </body>
</html>












