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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="hContext" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html lang="en">
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
    
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
 
    
    <title>회원가입</title>
    
    
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar ftco-navbar-light site-navbar-target" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="../member/login.jsp"><span>B</span>ombom</a>
	      <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav nav ml-auto">
	          <li class="nav-item"><a href="#home-section" class="nav-link"><span>Home</span></a></li>
	          <li class="nav-item"><a href="#signup-section" class="nav-link"><span>SignUp</span></a></li>
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
	
	<section class="hero-wrap js-fullheight">
      <div class="overlay"></div>
	<!-- Sign Up -->
		<section class="ftco-about img ftco-section ftco-no-pt ftco-no-pb" id="signup-section">
			<div class="container-fluid px-md-5">
	    		<div class="row justify-content-center py-5 mt-5">
	          		<div class="col-md-12 heading-section text-center ftco-animate">
	           			 <h2 class="mb-4">User Sign Up</h2>
	           			 <div align="center">
							<form id="signUp_form" method="get" enctype="multipart/form-data">
							<input type="hidden" id="authority" name="authority" value="1">
							<input type="hidden" id="open" name="open" value="1">
							<table>
	                        <tbody>
	                        	<tr>
	                        	
	                        		<td>
		                            <input  type="text" class="form-control id" name="memberId" id="memberId" placeholder="Id"   autofocus>
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
                            		<input type="text" class="form-control nickname" name="name" id="name" placeholder="Your Nickname"  autofocus>
                        			</td>
		                        </tr>
                        		<tr>
	                        		<td>
                           			<input type="email" class="form-control email" name="email" id="email" placeholder="Email"  autofocus>
                        			</td>
		                        </tr>
                        		<tr>
	                        		<td>
									Date of Birth : <select name="birth1" id="birth1">
								       <option value="2010">2010</option>
								       <option value="2009">2009</option>
								       <option value="2008">2008</option>
								       <option value="2007">2007</option>
								       <option value="2006">2006</option>
								       <option value="2005">2005</option>
								       <option value="2004">2004</option>
								       <option value="2003">2003</option>
								       <option value="2002">2002</option>
								       <option value="2001">2001</option>
								       <option value="2000">2000</option>
								       <option value="1999">1999</option>
								       <option value="1998">1998</option>
								       <option value="1997">1997</option>
								       <option value="1996">1996</option>
								       <option value="1995">1995</option>
								       <option value="1994">1994</option>
								       <option value="1993">1993</option>
								       <option value="1992">1992</option>
								       <option value="1991">1991</option>
								       <option value="1990">1990</option>
								       <option value="1989">1989</option>
								     </select>년&nbsp;
								     <select name="birth2" id="birth2">
								       <option value="1">1</option>
								       <option value="2">2</option>
								       <option value="3">3</option>
								       <option value="4">4</option>
								       <option value="5">5</option>
								       <option value="6">6</option>
								       <option value="7">7</option>
								       <option value="8">8</option>
								       <option value="9">9</option>
								       <option value="10">10</option>
								       <option value="11">11</option>
								       <option value="12">12</option>
								     </select>월
								     <select name="birth3" id="birth3">
								       <option value="1">1</option>
								       <option value="2">2</option>
								       <option value="3">3</option>
								       <option value="4">4</option>
								       <option value="5">5</option>
								       <option value="6">6</option>
								       <option value="7">7</option>
								       <option value="8">8</option>
								       <option value="9">9</option>
								       <option value="10">10</option>
								       <option value="11">11</option>
								       <option value="12">12</option>
								       <option value="13">13</option>
								       <option value="14">14</option>
								       <option value="15">15</option>
								       <option value="16">16</option>
								       <option value="17">17</option>
								       <option value="18">18</option>
								       <option value="19">19</option>
								       <option value="20">20</option>
								       <option value="21">21</option>
								       <option value="22">22</option>
								       <option value="23">23</option>
								       <option value="24">24</option>
								       <option value="25">25</option>
								       <option value="26">26</option>
								       <option value="27">27</option>
								       <option value="28">28</option>
								       <option value="29">29</option>
								       <option value="30">30</option>
								       <option value="31">31</option>
								     </select>일<br><br>
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
									     </select>
									     - <input type="text" name="phone2" id="phone2" size="5" maxlength="4"> - <input type="text" name="phone3" id="phone3" size="5" maxlength="4"><br><br>
                        			</td>
		                        </tr>
		                        <tr>
	                        		<td>
				                        <label for="interestPosition">InterestPosition</label>
								          <select id="interestPosition" name="interestOption">
									         <option value="AI개발">AI개발</option>
									         <option value="마케팅">마케팅</option>
								       		 <option value="웹개발">영업</option>
									         <option value="웹개발">기술지원</option>
									         <option value="웹개발">인사</option>
									         <option value="웹개발">회계</option>
									         <option value="웹개발">웹개발</option>
									         <option value="앱개발">앱개발</option>
									      </select>
						        	</td>
		                        </tr>
		                        <tr>
		                        	<td>
		                        		<input type="file" name="mfile" id="mfile">
		                        	</td>
		                        </tr>
		                        <tr>
	                        		<td>
		                            <button onClick="javascript:bindEventHandler();" class="form-control btn btn-danger btn-sm" id="doInsertBtn">Sign Up</button>
		                        </td>
		                        </tr>
		                        </tbody>
	                     		</table>
                    		</form>
		                    
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>


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
    <!-- jQuery validator -->
<script src="<c:url value="/resources/js/jquery.validate.js"/>"></script>

    <script type="text/javascript">
		function signUp() {
			//console.log("doRetrieve()");
			var frm = document.signUp_frm;
			frm.action = "${hContext}/member/signUp.spring";
			frm.submit();
		}

		function test(){
			 var form = $('#signUp_form')[0];

      	    // Create an FormData object 
              var data = new FormData(form);
         	//ajax
             $.ajax({
                 type : "POST",
                 url : "${hContext}/portfolio/SignUp/doInsertMember.spring",
                 dataType : "html",
                 data : data, 
                 enctype: 'multipart/form-data',
                 contentType: false,
                 processData: false,   
                 success : function(data) { //성공
                 	goLoginPage();
                     console.log("data:" + data);
                     var parseData = $.parseJSON(data);
                     if (parseData.msgId == "1") {
                         alert(parseData.msgMsg);
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

			}
		 function bindEventHandler(){
	            $("#signUp_form").validate({
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
	                    },name:{
	                    	//필수값
	                        required: true,
	                        //최소길이
	                        minlength: 2
	                    },phone2:{
	                    	//필수값
	                        required: true,
	                        //최소길이
	                        minlength: 4
	                    },phone3:{
	                    	//필수값
	                        required: true,
	                        //최소길이
	                        minlength: 4
	                    }

	                },messages: {
	                    //message
	                    memberId:{
	                       //필수값 
	                       required: "&nbsp;아이디는 필수값 입니다.",
	                       //최소길이
	                       minlength: $.validator.format('{0}자 이상 입력하세요.')
	                    },password:{
	                        //필수값 
	                        required: "&nbsp;비밀번호는 필수값 입니다.",
	                        //최소길이
	                        rangelength: $.validator.format('비밀번호는 {0}이상~{1}이하로 입력하세요.')
	                    },passwordConfirm:{
	                         //필수값 
	                         required: "&nbsp;비밀번호확인을 입력하세요.",
	                         //최소길이
	                         rangelength: $.validator.format('비밀번호확인는 {0}이상~{1}이하로 입력하세요.'),
	                         //pass==confirm_pass 
	                         equalTo:"비밀번호 항목과 일치하지 않습니다."
	                    },email:{
	                        //필수값
	                        required: "&nbsp;이메일은 필수값 입니다.",
	                        //이메일형식
	                        email:  "올바른 이메일 형식이 아닙니다."
	                    },name:{
	                    	//필수값 
	                        required: "&nbsp;이름은 필수값 입니다.",
	                        //최소길이
	                        minlength: $.validator.format('{0}자 이상 입력하세요.')
	                    },phone2:{
	                    	//필수값 
	                        required: "&nbsp;전화번호는 필수값 입니다.",
	                        //최소길이
	                        minlength: $.validator.format('{0}자 이상 입력하세요.')
	                    },phone3:{
	                    	//필수값 
	                        required: "&nbsp;전화번호는 필수값 입니다.",
	                        //최소길이
	                        minlength: $.validator.format('{0}자 이상 입력하세요.')
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
						test();
			        }
	         });

	       }
		
		//등록 --------------validation 전
	     /* $("#doInsertBtn").on("click", function() {
			//값 null check
			if ($("#memberId").val() == "" || $("#memberId").val() == false) {
                alert("아이디를 입력 하세요.");
                $("#memberId").focus();
                return false;
            }
			if ($("#password").val() == "" || $("#password").val() == false) {
                alert("패스워드를 입력 하세요.");
                $("#password").focus();
                return false;
            }
			if($("password") != $("passwordConfirm")){
		        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
		        $("#passwordConfirm").focus();
		        return; 
		    }
			if ($("#name").val() == "" || $("#name").val() == false) {
                alert("이름을 입력 하세요.");
                $("#name").focus();
                return false;
            }
			if ($("#email").val() == "" || $("#email").val() == false) {
                alert("이메일을 입력 하세요.");
                $("#email").focus();
                return false;
            }
			if ($("#birth1").val() == "" || $("#birth1").val() == false) {
                alert("생년월일을 입력 하세요.");
                $("#birth1").focus();
                return false;
            }
			//confirm
            if (confirm("등록 하시겠습니까?") == false)return false;
          //ajax
            $.ajax({
                type : "GET",
                url : "${hContext}/portfolio/SignUp/doInsertMember.spring",
                dataType : "html",
                async : false,
                data : {
                    "memberId" : $("#memberId").val(),
                    "password" : $("#password").val(),
                    "name" : $("#name").val(),
                    "email" : $("#email").val(),
                    "birth": $("#birth1").val()+"-"+$("#birth2").val()+"-"+$("#birth3").val(),
                    "phone": $("#phone1").val()+$("#phone2").val()+$("#phone3").val(),
                    "authority" : "1",
                    "interestOption" : $("#interestPosition").val(),
                    "open" : "1"
                },
                success : function(data) { //성공
                	goLoginPage();
                    console.log("data:" + data);
                    var parseData = $.parseJSON(data);
                    if (parseData.msgId == "1") {
                        alert(parseData.msgMsg);
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

        }); */

	   /*   $("#memberTable>tbody").on("click", "tr", function() {
			 //console.log("#memberTable>tbody");
			 var trArray =$(this).children();
			 var orgNm =  trArray.eq(0).text();
			 //console.log("orgNm:"+orgNm);
			 var saveNm =  trArray.eq(1).text();
			 //console.log("saveNm:"+saveNm);

			 var frm = document.fileDown;
			 frm.orgNm.value = orgNm;
			 frm.saveNm.value = saveNm;
			 frm.submit();
			 //$("#saveFileNm").val(saveFileNm);
			 
		}); */



		function goLoginPage(){
			alert('회원가입 되었습니다. 로그인해주세요.');
			location.href="${hContext}/portfolio/member/login.jsp";

			};

		
		$(document).ready(function(){
            //input validation
            bindEventHandler();
               
        });
		
	        
     </script>
    
</body>
</html>