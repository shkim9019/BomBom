<%--
  /**
  * Class Name : 
  * Description : 
  * Modification Information
  *
  *   수정일                   수정자                      수정내용
  *  -------    --------    ---------------------------
  *  2020. 4. 23.            최초 생성
  *
  * author 실행환경 개발팀
  * since 2020.04.23
  *]
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
	      <a class="navbar-brand" href="${hContext}/covid/covid_index.jsp"><span>B</span>ombom</a>
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
	
	
	<form action="${hContext}/covid/go_mypage.spring" name="mypage_frm" method="post" >
		<div class="container">
  			<div class="row">
				<div class="col-12" align="right">
					<input type="button" onclick="javascript:goMypage();" class="btn btn-primary btn-lg" value="마이페이지이동"  >
				</div>
			</div>
		</div>
	</form>
	
	<%-- <form action="${hContext}/covid/logout.spring" name="logout_frm" method="get"  >
		<div class="container">
  			<div class="row">
				<div class="col-12" align="right">
					<input type="button" onclick="javascript:logout();" class="btn btn-primary btn-lg" value="로그아웃"  >
				</div>
			</div>
		</div>
	</form> --%>
	
  	<div class="container">
  		<div class="row">
  			<div class="col-12">
				<form action="${hContext}/covid/do_retrieve.spring" name="addr_frm" method="get" class="bg-light p-4 p-md-5 contact-form">
					<div class="form-group">
						<h3>공적마스크 약국검색</h3>
						<input type="text" id="address" name="address" class="col-lg-5 col-sm-5 col-xs-5 form-control" readonly="readonly" style="display:inline-block"/> 
						<input type="button" onclick="searchKakaoAddress();" class="col-lg-3 col-sm-3 col-xs-3 btn btn-primary btn-lg" value="주소검색" />
						<input type="button" onclick="javascript:doRetrieve();" class="col-lg-3 col-sm-3 col-xs-3 btn btn-primary btn-lg" value="조회하기" " >
					</div>
					<input type="hidden" id="lng" name="lng"/> 
					<input type="hidden" id="lat" name="lat"/> 
				</form>
			</div>
		</div>
	</div>
	
	<input type="hidden" id="result" name="result"/>

	<form action="${hContext}/covid/do_insert.spring" name="search_frm" method="post">
		<input type="hidden" id="searchlng" name="searchlng"/>
		<input type="hidden" id="searchlat" name="searchlat"/>
	</form>
	

	<!-- 지도 -->
	<div class="container">
  		<div class="row">
  			<div class="col-12">
				<div id="map" style="width:100%;height:390px;"></div>
			</div>
		</div>
	</div>
	
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


<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8cf8a1a7823a9d120196415d8320f427&libraries=services"></script>
<script>
	//카카오 주소 검색 (daum)
	function searchKakaoAddress(){
	   //console.log("----- 주소 검색 시작 -----");
	   
	   new daum.Postcode({
	        oncomplete: function(data) {
	           console.log("searching result", data);
	           var address = data.address;
	           document.getElementById("address").value =address;	//위에 hidden input type에 저장됨
	           getLatLng(data.address);
	        }
	    }).open();
	   
	}

	
	//주소로 좌표 구하기		address에 도로명 주소들어감 
	function getLatLng(address){
	   //주소-좌표 변환 객체를 생성합니다
	   var geocoder = new kakao.maps.services.Geocoder();
	      
	   // 주소로 좌표를 검색합니다
	   geocoder.addressSearch(address, function(result, status) {
	       // 정상적으로 검색이 완료됐으면 
	        if (status === kakao.maps.services.Status.OK) {
	        /*   console.log("map result", result);
		         console.log("y", result[0].y);
		         console.log("x", result[0].x);
		         console.log("status+", status); */
	         
	         document.getElementById("lng").value = result[0].x;
	         document.getElementById("lat").value = result[0].y;

	       } 
	   }); 
	}

	function doRetrieve(){
		//console.log("doRetrieve");
		var frm = document.addr_frm;
		if($("#address").val() == null || $("#address").val() == "" ||
				$("#lng").val() == null || $("#lng").val() == "" ||
				$("#lat").val() == null || $("#lat").val() == ""){
			alert("주소검색 후 조회해 주세요");
		}else{
			frm.lng.value = $("#lng").val();
			frm.lat.value = $("#lat").val();
			frm.action = "${hContext}/covid/do_retrieve.spring";
			frm.submit();
		}
	}
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng("${currentLat}", "${currentLng}"), // 지도의 중심좌표
	    level: 4 // 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var positions = [
	<c:forEach var="vo" items="${list}">
	{
	    title: '${vo.pName}', 
	    latlng: new kakao.maps.LatLng("${vo.pLat}", "${vo.pLng}"),
	    markImg: '${vo.pRemainStat}',
	    addr: '${vo.pAddr}'
	},  
	</c:forEach>
	]; 

	
	//마커 이미지의 이미지 주소입니다
	var imageSrc = ""; 
	
	for (var i = 0; i < positions.length; i ++) {

		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new kakao.maps.Size(24, 35); 
	
		// 마커 이미지를 생성합니다    
		if(positions[i].markImg =='plenty'){
			imageSrc = "${hContext}/resources/images/markger_green.png"; 
		} else if(positions[i].markImg =='some'){
			imageSrc = "${hContext}/resources/images/markger_orange.png"; 
		} else if(positions[i].markImg =='few'){
			imageSrc = "${hContext}/resources/images/markger_red.png"; 
		} else if(positions[i].markImg =='empty'){
			imageSrc = "${hContext}/resources/images/markger_gray.png"; 
		} 
		
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    map: map, // 마커를 표시할 지도
		    position: positions[i].latlng, // 마커를 표시할 위치
		    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		    image : markerImage // 마커 이미지 
		});
		
		kakao.maps.event.addListener(marker, 'click', makeOverListener(marker));
		
	}//for

	function makeOverListener(marker) {
	    return function() {
	       //console.log(marker.mc);
	       //마커의 위도경도와 api의 위도경도가 같으면 그 vo를 찾아서 db에 insert하면 됨
	       //console.log(marker);
	       //console.log(marker.mc);
		   //console.log(marker.getPosition());
		   //console.log(marker.getPosition().Ga.toFixed(7));
		   //console.log(marker.getPosition().Ha.toFixed(7));
		   
		   document.getElementById("searchlng").value = marker.getPosition().Ga.toFixed(7);
		   document.getElementById("searchlat").value = marker.getPosition().Ha.toFixed(7);


		 	//ajax
			$.ajax({
			   type:"POST",
			   url:"${hContext}/covid/do_insert.spring",
			   dataType:"html", 
			   data:{"searchlng": $("#searchlng").val(),
				     "searchlat": $("#searchlat").val()
			   },
			   success:function(data){ //성공
			   	   //console.log("data:" + data);
				   var parseData = $.parseJSON(data);
			   	   if(parseData.msgId =="1"){
						alert(parseData.msgMsg);
						
				   } else{
					    alert(parseData.msgMsg);
				   }
			   },
			   error:function(xhr,status,error){
			       alert("error:"+error);
			   },
			   complete:function(data){
			   
			   }   
			   
			  });//--ajax
		   
		   
	    };
	}

	function goMypage(){
		//console.log("goMypage");
		var frm = document.mypage_frm;
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