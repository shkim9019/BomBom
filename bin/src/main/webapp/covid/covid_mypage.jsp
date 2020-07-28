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
	      <a class="navbar-brand" href="${hContext}/covid/covid_index.jsp"><span>B</span>ombom</a>
	      <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav nav ml-auto">
	          <li class="nav-item"><a href="${hContext}/covid/covid_index.jsp" class="nav-link"><span>Home</span></a></li>
	          <li class="nav-item"><a href="#" class="nav-link"><span>About</span></a></li>
	          <li class="nav-item"><a href="#" class="nav-link"><span>License</span></a></li>
	          <li class="nav-item"><a href="#" class="nav-link"><span>Skills</span></a></li>
	          <li class="nav-item"><a href="javascript:logout();" class="nav-link"><span>logout</span></a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
	<section class="ftco-section" id="services-section">
    	<div class="container-fluid px-md-5">
    		<div class="row justify-content-center py-5 mt-5">
         	  <div class="col-md-12 heading-section text-center ftco-animate">
            	 <h2 class="mb-4">관심약국 리스트</h2>
            	 <form action="${hContext}/covid/do_mail.spring" name="mail_frm" method="post">
            	 	<input type="hidden" id="parmName" name="parmName">
            	 	<input type="hidden" id="parmCode" name="parmCode">
            	 </form>
            	 
            	 <form action="${hContext}/covid/do_delete.spring" name="delete_frm" method="post">
            	 	<input type="hidden" id="deleteName" name="deleteName">
            	 	<input type="hidden" id="deleteCode" name="deleteCode">
            	 </form>
          	  </div>
        	</div>
        	
	        <div class="row">
	        	<c:choose>
	        		<c:when test="${pList.size()>0}">
	        			<c:forEach var="vo" items="${pList}">
	        				<div class="col-md-4 text-center d-flex ftco-animate" >
	        					<a class="services-1 shadow">
	        						<div align="right">
	        							<table id="listTableDel">
	        								<tr>
	        									<td><input type="button" class="btn btn-primary" value="x"></td>
		        								<td><p hidden="">${vo.pName}</p>
		        									<p hidden="">일렬번호:${vo.pCode}</p>
		        								</td>
		        							</tr>
		        						</table>
		        					</div>
		        					
			        				<span class="icon">
										<i class="flaticon-flasks"></i>
									</span>
									<div align="center">
	        						<table id="listTable">
	        							<tr>
	        								<td><div align="center"><h2>${vo.pName}</h2></div>
	        									<div align="center"><p>일렬번호:${vo.pCode}</p></div>
												<div align="right"><p>${vo.pAddr}</p></div>
												<p>${vo.pRemainStat}</p>
											</td>
										</tr>
									</table>
									</div>
								</a>
							</div>	
						</c:forEach>
					</c:when>
				</c:choose>
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
	                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>phone: &nbsp; ${memberVO.phone}</a></li>
	                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>mail: &nbsp;${memberVO.email}</a></li>
	               
                </ul>
            </div>
          </div>
          </div>
        </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="24px" height="20px"><circle class="path-bg" cx="12" cy="12" r="11" fill="none" stroke-width="2" stroke="#eeeeee"/><circle class="path" cx="12" cy="12" r="11" fill="none" stroke-width="2" stroke-miterlimit="5" stroke="#F96D00"/></svg></div>






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
    	$("#listTableDel>tbody").on("click","tr",function(event){  
    		//console.log("ss");
    		var pTR = $(this); //tr
			var pTR_Children = pTR.children();
			var data = pTR_Children.eq(1).text();
			
			var codeIndex = data.trim().indexOf(":");
			var index = data.trim().indexOf("국");
			
			console.log(data.trim());
			if(confirm(data.substring(0,index+1) + "을 관심약국에서 삭제하시겠습니까?")==false) return;

			document.getElementById("deleteName").value = data.substring(0,index+1);
			document.getElementById("deleteCode").value = data.substring(codeIndex+1,codeIndex+9);

			//ajax
			$.ajax({
			   type:"POST",
			   url:"${hContext}/covid/do_delete.spring",
			   dataType:"html", 
			   data:{"deleteName": document.getElementById("deleteName").value,
				     "deleteCode": document.getElementById("deleteCode").value
			},
			success:function(data){ //성공
			   	   console.log("data:" + data);		//지금은 그냥 문자열일뿐임
			  	   var parseData = $.parseJSON(data);
			   	   if(parseData.msgId =="1"){
						alert(parseData.msgMsg);
						goMypage();
			   	   }
			   },
			   error:function(xhr,status,error){
			       alert("error:"+error);
			   },
			   complete:function(data){
			   
			   }   
			   
			});//--ajax
			
			
    	});	

    
    	$("#listTable>tbody").on("click","tr",function(event){  	
			//console.log("ss");
			var pTR = $(this); //tr
			var pTR_Children = pTR.children();
			var data = pTR_Children.eq(0).text();
			//console.log(data.trim());
			//console.log(data.trim().indexOf(":"));
			var codeIndex = data.trim().indexOf(":");
			data.substring(codeIndex+1,codeIndex+9);
			//console.log(data.substring(codeIndex+1,codeIndex+9));
			//console.log(data.trim().indexOf("국"));
			var index = data.trim().indexOf("국");
			//console.log(data.substring(0,index+1));
			document.getElementById("parmName").value = data.substring(0,index+1);
			document.getElementById("parmCode").value = data.substring(codeIndex+1,codeIndex+9);
			if(confirm(data.substring(0,index+1) + "의 재고 현황을 메일로 보내시겠습니까?")==false) return;


			//ajax
			$.ajax({
			   type:"POST",
			   url:"${hContext}/covid/do_mail.spring",
			   dataType:"html", 
			   data:{"parmName": document.getElementById("parmName").value,
				     "parmCode": document.getElementById("parmCode").value
			},
			success:function(data){ //성공
			   	   console.log("data:" + data);		//지금은 그냥 문자열일뿐임
			  	   var parseData = $.parseJSON(data);
			   	   if(parseData.msgId =="1"){
						alert(parseData.msgMsg);
						goMypage();
			   	   }
			   },
			   error:function(xhr,status,error){
			       alert("error:"+error);
			   },
			   complete:function(data){
			   
			   }   
			   
			});//--ajax



        });	

    	function goMypage(){
    		//console.log("goMypage");
    		var frm = document.mail_frm;
    		frm.action = "${hContext}/covid/go_mypage.spring";
    		frm.submit();
    	}

    	function logout(){
    		//console.log("goMypage");
    		location.href="${hContext}/covid/logout.spring";
    		
    	}
    </script>
</body>
</html>