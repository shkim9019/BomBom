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
    
    <!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="${hContext}/resources/css/bootstrap/bootstrap-grid.css">
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
 
 
       <style>
      .buttons {
          background-color: #2E64FE;
          border: none;
          color: white;
          padding: 10px 16px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 10px;
          margin: 2px 1px;
          cursor: pointer;
          position: right;
      }
      .activity {
         width: 535px;
      }
      </style>
    
    <title>My page</title>
    
    
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
             <li class="nav-item"><a href="#skills-section" class="nav-link"><span>Skills</span></a></li>
             <li class="nav-item"><a href="#license-section" class="nav-link"><span>License</span></a></li>
             <li class="nav-item"><a href="#Projects-section" class="nav-link"><span>Projects</span></a></li>
             <li class="nav-item"><a href="${hContext}/portfolio/do_retrieve.spring" class="nav-link"><span>Portfolio List</span></a></li>
             <li class="nav-item"><a href="${hContext }/portfolio/logout.spring" class="nav-link"><span>LogOut</span></a></li>
           </ul>
         </div>
       </div>
     </nav>
     
   <div>
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>
   </div>  

   <!-- Skills -->
    <section class="ftco-section ftco-no-pt ftco-no-pb ftco-counter img" id="skills-section">
       <div class="container-fluid px-md-5">
          <div class="row d-md-flex align-items-center">
              <div class="col-md-8 d-flex justify-content-center counter-wrap ftco-animate">
             <div class="block-18 shadow">
                <div class="page-header">
                     <h2>Skill List</h2>
                        <form action="${hContext}/portfolio" id="skillUp_frm" name="skillUp_frm" method="POST">
                         <input type="hidden" name="hiddenId" id="hiddenId">
                         <!-- Grid영역 -->
                            <div class="table-responsive">
                               <table class="table table-hover" id="skillTable">
                                   <!-- hidden-sm hidden-xs 숨기기 -->
                                  <thead class="bg-primary">
                                  </thead>
                                   <tbody >
                                             <!-- Data있는 경우 -->
                                              <c:choose>
                                                 <c:when test="${list1.size()>0 }">
                                                          <table class="col-lg-12 table table-hover">
                                                          <tbody >
                                                             <tr>
                                                                <td style="display:none;">${list1.get(i).memberId}</td>
                                                             </tr>
                                                             <tr>
                                                             	   <td><p class="mb-4 col-md-3"><b>Skill Name</b></p></td>
                                                                   <td><p class="mb-4 col-md-3"><b>Marstery</b></p></td>
                                                                   <td><p class="mb-4 col-md-6"><b>Activity History</b></p></td>
                                                             </tr>
                                                             <c:forEach var="i" begin="0" end="${list1.size()-1}">
                                                             <tr id="skilModifylDiv">
                                                                   <td>${list1.get(i).sName }</td>
                                                                   <td>${list1.get(i).sMarstery }</td>
                                                                   <td>${list1.get(i).sContent }</td>
                                                                   <td >
                                                                     <!--  <input type="button" class="buttons skillUpdate" value="Modify"> -->
                                                                      <input type="button" class="buttons" value="Update" onclick="skillUpdate('${list1.get(i).sName }','${list1.get(i).memberId}','${list1.get(i).sMarstery }','${list1.get(i).sContent }')">
                                                                      <input type="button" class="buttons" value="Delete" onclick="skillDelete('${list1.get(i).sName }','${list1.get(i).memberId}')">
                                                                   </td>
                                                             </tr> 
                                                             </c:forEach>
                                                             </tbody>
                                                          </table>
                                                 </c:when>
                                                  <c:otherwise>
                                                       <tr><td colspan="99">등록된 스킬이 없습니다.</td></tr>
                                                    </c:otherwise>
                                              </c:choose>
                                            </tbody>
                                     </table>
                                  <input type="button"  id="skillAdd" name="skillAdd" class="buttons" value="Add">
                                  </div>
                                  <!--// Grid영역 -->    
                                 </form>   
                                </div>
                              </div>
                            </div>
              <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate" id="skilAddlDiv">
            </div> 
            </div>  
        </div>
    </section>
   <!--// Skills -->
   
<!-- license -->
      <section class="ftco-section ftco-no-pt ftco-no-pb ftco-counter img" id="license-section">
         <div class="container-fluid px-md-5">
          <div class="row d-md-flex align-items-center">
             <div class="col-md-8 d-flex justify-content-center counter-wrap ftco-animate">
             <div class="block-18 shadow">
                <div class="page-header">
                      <h2>License List</h2>
                         <form action="${hContext}/portfolio" id="licenseRetrieve_frm" name="licenseRetrieve_frm" method="get">
                            <input type="hidden" name="hiddenId" id="hiddenId">
                            <!-- Grid영역 -->
                               <div class="table-responsive">
                                  <table class="table table-hover" id="licenseTable">
                                      <!-- hidden-sm hidden-xs 숨기기 -->
                                     <thead class="bg-primary">
                                     </thead>
                                     <tbody>
                                             <!-- Data있는 경우 -->
                                              <c:choose>
                                                 <c:when test="${list2.size()>0 }">
                                                          <table class="col-lg-12 table table-hover">
                                                             <tbody>
                                                             <tr>
                                                                <td style="display:none;">${list2.get(i).memberId}</td>
                                                             </tr>
                                                                <tr>
                                                                   <td><p class="mb-4 col-lg-2"><b>License Name</b></p></td>
                                                                   <td><p class="mb-4 col-lg-2"><b>License Classification</b></p></td>
                                                                   <td><p class="mb-4 col-lg-1"><b>Type of License</b></p></td>
                                                                   <td><p class="mb-4 col-lg-1"><b>License Number</b></p></td>
                                                                   <td><p class="mb-4 col-lg-2"><b>Date of Acquisition</b></p></td>
                                                                   <td><p class="mb-4 col-lg-2"><b>Issuing Agency</b></p></td>
                                                                   <td><p class="mb-4 col-lg-2"></p></td>
                                                                </tr>
                                                                 <c:forEach var="i" begin="0" end="${list2.size()-1}">
                                                                <tr>
                                                                   <td>${list2.get(i).lName }</td>
                                                                   <td>${list2.get(i).lGroup }</td>
                                                                   <td>${list2.get(i).lGrade }</td>
                                                                   <td>${list2.get(i).lNum }</td>
                                                                   <td>${list2.get(i).lDate }</td>
                                                                   <td>${list2.get(i).lOrgan }</td>
                                                                   <td >
                                                                      <input type="button" class="buttons licUpdate" value="Modify">
                                                                      <input type="button" class="buttons" value="Delete" onclick="licDelete('${list2.get(i).lName }','${list2.get(i).memberId}')">
                                                                   </td>
                                                                </tr>
                                                                </c:forEach>
                                                             </tbody>
                                                          </table>
                                                 </c:when>
                                                 <c:otherwise>
                                                    <tr><td colspan="99">등록된 자격증이 없습니다.</td></tr>
                                                 </c:otherwise>
                                              </c:choose>
                                          </tbody>
                                     </table>
                                     <input type="button"  id="licAdd" name="licAdd" class="buttons" value="Add" />
                                  </div>
                                  <!--// Grid영역 -->   
                                  </form> 
                                      </div>
                                    </div>
                                  </div>
               <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate" id="licAddlDiv">
               </div>
            </div>
         </div>
      </section>
   <!--// license --> 
   
 <!-- Project -->
    <section class="ftco-section ftco-no-pt ftco-no-pb ftco-counter img" id="Projects-section">
       <div class="container-fluid px-md-5">
          <div class="row d-md-flex align-items-center">
             <div class="col-md-8 d-flex justify-content-center counter-wrap ftco-animate">
             <div class="block-18 shadow">
                <div class="page-header">
                      <h2>Project List</h2>
                         <form action="${hContext}/portfolio" id="projectUp_frm" name="projectUp_frm" method="POST">
                            <input type="hidden" name="hiddenId" id="hiddenId">
                            <!-- Grid영역 -->
                               <div class="table-responsive">
                                  <table class="table table-hover" id="projectTable">
                                      <!-- hidden-sm hidden-xs 숨기기 -->
                                     <thead class="bg-primary">
                                     </thead>
                                     <tbody>
                                          <!-- Data있는 경우 -->
                                        <c:choose>
                                           <c:when test="${list3.size()>0 }">
                                                 <table class="col-lg-12 table table-hover">
                                                   <tbody>
                                                      <tr>
                                                            <td style="display:none;">${list3.get(i).memberId}</td>
                                                        </tr>
                                                      <tr>
                                                         <td><p class="mb-4 col-lg-3"><b>Project Name</b></p></td>
                                                         <td><p class="mb-4 col-lg-5"><b>Project Description</b></p></td>
                                                         <td><p class="mb-4 col-lg-1"><b>Project startDate</b></p></td>
                                                         <td><p class="mb-4 col-lg-1"><b>Project endDate</b></p></td>
                                                         <td><p class="mb-4 col-lg-2"><b>Github Address</b></p></td>
                                                      </tr>
                                                      <c:forEach var="i" begin="0" end="${list3.size()-1}">
                                                      <tr>
                                                         <td>${list3.get(i).pjtName }</td>
                                                         <td>${list3.get(i).pjtInfo }</td>
                                                         <td>${list3.get(i).pjtStart }</td>
                                                         <td>${list3.get(i).pjtEnd }</td>
                                                         <td>${list3.get(i).gitAddress }</td>
                                                         <td >
                                                         <input type="button" class="buttons projectUpdate" value="Modify">
                                                         <input type="button" class="buttons" value="Delete" onclick="projectDelete('${list3.get(i).gitAddress }','${list3.get(i).memberId}')">
                                                         </td>
                                                      </tr> 
                                                     </c:forEach>        
                                                   </tbody>
                                                </table>
                                           </c:when>
                                           <c:otherwise>
                                              <tr><td colspan="99">등록된 프로젝트가 없습니다.</td></tr>
                                           </c:otherwise>
                                        </c:choose>
                                       </tbody>
                                     </table>
                                  </div>
                                     <input type="button" id="projectAdd" name="projectAdd" class="buttons" value="Add" />
                                  <!--// Grid영역 -->    
                                       </form>   
                                      </div>
                                    </div>
                                  </div>
          
                <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate" id="projectAddlDiv">
              </div>
            </div>
        </div>
    </section>
   <!--// Project -->

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
   
   
    <script type="text/javascript">

    //그리드 click: ID값을 서버로 ajax 전송:/member/do_select_one.do
      $("#memberTable>tbody").on("click","tr", function(){
         console.log("#memberTable>tbody"+ $(this));
         var tds = $(this).children();
         console.log("tds:"+ tds.text());
         var memberId = tds.eq(1).text();
         console.log("memberId:"+ memberId);
   
         var frm = document.skillRetrieve_frm;
         frm.hiddenId.value = memberId;
         frm.pageNum.value = 1;
         frm.searchWord.value= memberId;
         frm.submit();
         
   
      });








      

//skill------------------------------
    //조회버튼 클릭 시
      function skillRetrieve() {
          var frm = document.skillUp_frm;
          frm.action="${hContext}//portfolio/mypage_retrieve.spring";
          frm.submit();
       }

       //수정
        function skillUpdate(sName, memberId,sMarstery,sContent){
		 //confirm
       // if(confirm(sName+"를 업데이트 하시겠습니까?")==false) return;
   
           
           
           var html = '';
           
           //ajax
           $.ajax({
            type:"GET",
            url:"${hContext}/skill/do_select_one.spring",
            dataType:"html", 
            data:{ 
                   "memberId": memberId,
                   "sName" : sName,
                   "sMarstery": sMarstery,
                   "sContent": sContent
            },
            success:function(data){ //성공
                console.log("data:"+data);  
                var html = '';
               // var tbody = $(skilModifylDiv);
               var tr = $(this).parent().parent();
               var removeTr = tr.eq(2);
               removeTr.empty();
               // var removeTbody = tbody.eq(0);
            //    tbody.empty();
   
               html+='       <tr>                                                                                                           ';
               html+='         <td ><input type="text" id="sNameU" name="sNameU"  maxlength="10" readonly="readonly" value="';
               html+=            sName.trim();
               html+='           "/>                                                                                                        ';
               html+='          </td>                                                                                                      ';
               html+='          <td ><input type="text" id="sMarsteryU" name="sMarsteryU" value="';
               html+=            sMarstery.trim();
               html+='            "/>                                                                                                       ';
               html+='          </td>                                                                                                      ';
               html+='           <td ><input type="text" id="sContentU" name="sContentU"  value="';
               html+=             sContent.trim();
               html+='            "/>                                                                                                       ';
               html+='           </td>                                                                                                     ';
               html+='      	<td>                                                                                               ';
               html+='         <button type="buttons"  class=" skillCan buttons" id="skillCan" name="skillCan" >Cancellation</button>           ';
               html+='         <button type="buttons" class="doUpdate buttons" id="doUpdate" name="doUpdate" >Completed</button>             ';
               html+='      	</td>                                                                                                          ';
               html+='    </tr>                                                                                                             ';              

               //tr.append(html);
               $("#skilModifylDiv").html(html);
               $("#skilModifylDiv").show();
            },
            error:function(xhr,status,error){
              alert("error:"+error);
            },
            complete:function(data){
            
            }   
            
           });//--ajax
               
            }//--수정  

           //수정취소버튼
           $(document).on("click",".skillCan",function(){
                history.go(0);
             });
      
           //수정완료버튼
           $(document).on("click",".doUpdate",function(){//댓글수정완료버튼
              console.log("doUpdate");
                 var memberId = $("#memberIdU").val();
                 var sName = $("#sNameU").val();
                 var sMarstery = $("#sMarsteryU").val();
                 var sContent = $("#sContentU").val(); 
                 
           if($("#sMarsteryU").val()==null || $("#sMarsteryU").val().length<=0 ||$("#sMarsteryU").val()=='undefined'){
               $("#sMarsteryU").focus();
               alert("스킬등급를 입력하세요.");
               return;
            }
      
           if($("#sContentU").val()==null || $("#sContentU").val().length<=0 || $("#sContentU").val()=='undefined'){
               $("#sContentU").focus();
               alert("커멘츄을 입력하세요.");
               return;
            }
      
           if(confirm("수정 하시겠습니까?")==false) return;
            
         //ajax
           $.ajax({
            type:"POST",
            url:"${hContext}/skill/do_update.spring",
            dataType:"html", 
            data:{ //"memberId":"sohyun1234"
                   "memberId": memberId.trim(),
                   "sName" : sName.trim(),
                   "sMarstery": sMarstery.trim(),
                   "sContent": sContent.trim()
            },
            success:function(data){ //성공
                   console.log("수정성공후우우우우");
                    console.log("sName: "+sName);
                   console.log("sMarstery: "+sMarstery);
                 console.log("sContent: "+sContent);
               alert("수정되었습니다.");
               location.href="${hContext}/portfolio/mypage_retrieve.spring";
            },
            error:function(xhr,status,error){
              alert("error:"+error);
            },
            complete:function(data){
            
            }   
            
           });//--ajax 
           
        });
      //--수정완료버튼
    
    //삭제
   function skillDelete(sName, memberId){
		 //confirm
        if(confirm(sName+"을(를) 삭제 하시겠습니까?")==false) return;
        
       //ajax
       $.ajax({
        type:"POST",
        url:"${hContext}/skill/do_delete.spring",
        dataType:"html", 
        data:{ //"memberId":"sohyun1234"
               "memberId":memberId,
               "sName" : sName
        },
        success:function(data){ //성공
         //console.log("data:"+data);  
         var parseData = $.parseJSON(data);
              if(parseData.msgId=="1"){
                   alert(parseData.msgMsg);
                   location.href="${hContext}/portfolio/mypage_retrieve.spring";
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

	}


     //스킬 전역변수
     var skillCnt = 0;
     var html='';

     //스킬 추가 버튼 클릭 시
     $("#skillAdd").on("click",function(){
            html="";
            html+='   <div class="block-18 shadow" id="divSkill">  																						                                                                       ';
            html+='     <input type="button" class="buttons" value="delete" style="float:right;" onclick="skillbtnMinus2()"                                                                                                                                     ';                                                                                                                                                                                         
            html+='       <h2 class="mb-4">Add Skills</h2>                                                                                                                                                                                       ';
            html+='       <div align="center">                                                                                                                                                                                                   ';
            html+='         <form action="${hContext}/skill/do_insert.spring" name="skillInsertForm" id="skillInsertForm" method="post">                                                                                                        ';
            html+='         <table id="skillForm" >                                                                                                                                                                                             ';
            html+='            <tr>                                                                                                                                                                                                            ';
            html+='               <td>                                                                                                                                                                                                        ';
            html+='                  <table>                                                                                                                                                                                                 ';
            html+='                     <tr>                                                                                                                                                                                                ';
            html+='                       <td>                                                                                                                                                                                              ';
            html+='                         <img alt="추가입력폼" width="20" height="20" src="${hContext}/resources/images/plus.png" id="skillPlusInsert">                                                                                    ';
            html+='                       </td>                                                                                                                                                                                             ';
            html+='                     </tr>                                                                                                                                                                                               ';
            html+='                          <tr>                                                                                                                                                                                          ';
            html+='                        <td>                                                                                                                                                                                             ';
            html+='                          <p>Programming Language</p>                                                                                                                                                                   ';
            html+='                        </td>                                                                                                                                                                                            ';
            html+='                        <td>                                                                                                                                                                                             ';
            html+='                          <select id="sName" name="skillList[0].sName">                                                                                                                                                 ';
            html+='                            <option value="Java">Java</option>                                                                                                                                                         ';
            html+='                            <option value="C">C</option>                                                                                                                                                               ';
            html+='                            <option value="Python">Python</option>                                                                                                                                                     ';
            html+='                            <option value="C++">C++</option>                                                                                                                                                           ';
            html+='                            <option value="C#">C#</option>                                                                                                                                                             ';
            html+='                            <option value="Visual Basic.NET">Visual Basic.NET</option>                                                                                                                                 ';
            html+='                            <option value="JavaScript">JavaScript</option>                                                                                                                                             ';
            html+='                            <option value="PHP">PHP</option>                                                                                                                                                           ';
            html+='                            <option value="SQL">SQL</option>                                                                                                                                                           ';
            html+='                            <option value="R">R</option>                                                                                                                                                               ';
            html+='                            <option value="Swift">Swift</option>                                                                                                                                                       ';
            html+='                            <option value="Go">Go</option>                                                                                                                                                             ';
            html+='                            <option value="Ruby">Ruby</option>                                                                                                                                                         ';
            html+='                            <option value="Assmbler">Assmbler</option>                                                                                                                                                 ';
            html+='                            <option value="PL/SQL">PL/SQL</option>                                                                                                                                                     ';
            html+='                            <option value="Perl">Perl</option>                                                                                                                                                         ';
            html+='                            <option value="Objective-C">Objective-C</option>                                                                                                                                           ';
            html+='                            <option value="MATLAB">MATLAB</option>                                                                                                                                                     ';
            html+='                            <option value="Visual Basic">Visual Basic</option>                                                                                                                                         ';
            html+='                            <option value="Scratch">Scratch</option>                                                                                                                                                   ';
            html+='                          </select>                                                                                                                                                                                     ';
            html+='                        </td>                                                                                                                                                                                            ';
            html+='                     </tr>                                                                                                                                                                                               ';
            html+='                     <tr>                                                                                                                                                                                                ';
            html+='                        <td>                                                                                                                                                                                             ';
            html+='                          <p>Mastership Level</p>                                                                                                                                                                       ';
            html+='                        </td>                                                                                                                                                                                            ';
            html+='                        <td>                                                                                                                                                                                             ';
            html+='                         <input type="range" id="sMarstery" name="skillList[0].sMarstery" name="points" step="1" value="0" oninput="document.getElementById(\'checkMastery0\').innerHTML=this.value;">                    ';
            html+='                         &nbsp&nbsp<b><span id="checkMastery0"></span>%</b>                                                                                                                                             ';
            html+='                        </td>                                                                                                                                                                                            ';
            html+='                     </tr>                                                                                                                                                                                               ';
            html+='                     <tr>                                                                                                                                                                                                ';
            html+='                        <td>                                                                                                                                                                                             ';
            html+='                          <p>Activity content</p>                                                                                                                                                                       ';
            html+='                        </td>                                                                                                                                                                                            ';
            html+='                        <td>                                                                                                                                                                                             ';
            html+='                          <p><textarea rows="10" cols="40" name="skillList[0].sContent" id="sContent" style="width:100%"></textarea></p>                                                                                                   ';
            html+='                        </td>                                                                                                                                                                                            ';
            html+='                     </tr>                                                                                                                                                                                               ';
            html+='                                                                                                                                                                                                                          ';
            html+='                  </table>                                                                                                                                                                                                ';
            html+='               </td>                                                                                                                                                                                                       ';
            html+='            </tr>                                                                                                                                                                                                           ';
            html+='                                                                                                                                                                                                                             ';
            html+='            <tbody id="skillbody">                                                                                                                                                                                          ';
            html+='            </tbody>                                                                                                                                                                                                        ';
            html+='            </table>                                                                                                                                                                                                        ';
            html+='         <table>                                                                                                                                                                                                             ';
            html+='            <tr>                                                                                                                                                                                                            ';
            html+='               <td >                                                                                                                                                                                              ';
            html+='                  <button type="button" onclick="javascript:skillInsert();" class="btn btn-primary btn-sm">Submit</button>                                                                                                ';
            html+='               </td>                                                                                                                                                                                                       ';
            html+='            </tr>                                                                                                                                                                                                           ';
            html+='         </table>                                                                                                                                                                                                            ';
            html+='         </form>                                                                                                                                                                                                             ';
            html+='      </div>                                                                                                                                                                                                                  ';
            html+='   </div>                                                                                                                                                                                                                      ';
   
   
   
            $("#skilAddlDiv").append(html);

     });



     //스킬 (+) 클릭 이벤트
     $(document).on("click","#skillPlusInsert",function(){
           console.log('this is plus button');
           var frm = document.uploadFrm;
           html = '';
           skillCnt+=1;
           console.log(skillCnt);
   
           html+='<tr id="tr_1'+skillCnt+'">';
           html+='<td>';
           html+='<table>';
   
           
           html+='<tr ><td colspan="2"><hr/><br/></td></tr>                                                                                             ';
           html+='                     <tr>                                                                                                                                                                                                ';
           html+='                       <td>                                                                                                                                                                                              ';
           html+='                         <img alt="추가입력폼" width="20" height="20" src="${hContext}/resources/images/plus.png" id="skillPlusInsert">                                                                                    ';
           html+='                       </td>                                                                                                                                                                                             ';
           html+='                     </tr>                                                                                                                                                                                               ';
           html+='          <tr>                                                                                                         ';
           html+='       <td>                                                                                                                          ';
           html+='          <p>Programming Language</p>                                                                                                ';
           html+='       </td>                                                                                                                         ';
           html+='       <td>                                                                                                                          ';
           html+='          <select id="sName'+skillCnt+'" name="skillList['+skillCnt+'].sName">                                                       ';
           html+='             <option value="Java">Java</option>                                                                                      ';
           html+='             <option value="C">C</option>                                                                                            ';
           html+='             <option value="Python">Python</option>                                                                                  ';
           html+='             <option value="C++">C++</option>                                                                                        ';
           html+='             <option value="C#">C#</option>                                                                                          ';
           html+='             <option value="Visual Basic.NET">Visual Basic.NET</option>                                                              ';
           html+='             <option value="JavaScript">JavaScript</option>                                                                          ';
           html+='             <option value="PHP">PHP</option>                                                                                        ';
           html+='             <option value="SQL">SQL</option>                                                                                        ';
           html+='             <option value="R">R</option>                                                                                            ';
           html+='             <option value="Swift">Swift</option>                                                                                    ';
           html+='             <option value="Go">Go</option>                                                                                          ';
           html+='             <option value="Ruby">Ruby</option>                                                                                      ';
           html+='             <option value="Assmbler">Assmbler</option>                                                                              ';
           html+='             <option value="PL/SQL">PL/SQL</option>                                                                                  ';
           html+='             <option value="Perl">Perl</option>                                                                                      ';
           html+='             <option value="Objective-C">Objective-C</option>                                                                        ';
           html+='             <option value="MATLAB">MATLAB</option>                                                                                  ';
           html+='             <option value="Visual Basic">Visual Basic</option>                                                                      ';
           html+='             <option value="Scratch">Scratch</option>                                                                                ';
           html+='          </select>                                                                                                                  ';
           html+='       </td>                                                                                                                         ';
           html+='    </tr>                                                                                                                            ';
           html+='    <tr>                                                                                                               ';
           html+='       <td>                                                                                                                          ';
           html+='          <p>Mastership Level</p>                                                                                                    ';
           html+='       </td>                                                                                                                         ';
           html+='       <td>                                                                                                                          ';
           html+='				<input type="range" id="sMarstery'+skillCnt+'" name="skillList['+skillCnt+'].sMarstery" name="points" step="1" value="0" oninput="document.getElementById(\'checkMastery'+skillCnt+'\').innerHTML=this.value;">                    ';
	       html+='				&nbsp&nbsp<b><span id="checkMastery'+skillCnt+'"></span>%</b>                                                                                                                                             ';
	       html+='       </td>                                                                                                                         ';
           html+='    </tr>                                                                                                                            ';
           html+='    <tr>                                                                                                               ';
           html+='       <td>                                                                                                                          ';
           html+='          <p>Activity content</p>                                                                                                    ';
           html+='       </td>                                                                                                                         ';
           html+='       <td>                                                                                                                          ';
           html+='          <p><textarea rows="10" cols="40" name="skillList['+skillCnt+'].sContent" id="sContent'+skillCnt+'" style="width:100%"></textarea></p>         ';
           html+='       </td>                                                                                                                         ';
           html+='    </tr>                                                                                                                            ';
           html+='      <tr >                                                                                                             ';
           html+='         <td>                                                                                                                        ';
           html+='            <img alt="삭제입력폼" align="left" width="20" height="20" src="${hContext}/resources/images/minus.png" onClick="skillbtnMinus(\'tr_1'+skillCnt+'\');">      ';      
           html+='         </td>                                                                                                                       ';
           html+='      </tr>                                                                                                                          ';
   
           html+='</tr>';
           html+='</td>';
           html+='</table>';
           
           $("#skillbody").append(html);

            });//--skillPlusBtn



    // 스킬 (-) 버튼 클릭 이벤트
    function skillbtnMinus(btnId){
       console.log('this is minus button');

        $("#"+btnId).empty();
    }

    function skillbtnMinus2(){
        console.log('this is minus button');

         $("#divSkill").remove();
     }
      
//--skill----------------------------

//license----------------------------

    //수정버튼
   $(".licUpdate").on("click",function(){
      //console.log("licUpdate click");
      var licUpdate = $(this);
      var tr = licUpdate.parent().parent().parent();
      var td = tr.children().children();
      var memberId = td.eq(0).text();
      var lName= td.eq(8).text();
      var lGroup = td.eq(9).text();
      var lGrade = td.eq(10).text();
      var lNum = td.eq(11).text();
      var lDate = td.eq(12).text();
      var lOrgan = td.eq(13).text();

      console.log("memberId= "+memberId);
      console.log("lName= "+lName);
      console.log("lGroup= "+lGroup);
      console.log("lGrade= "+lGrade);
      console.log("lNum= "+lNum);
      console.log("lDate= "+lDate);
      console.log("lOrgan= "+lOrgan);
      
      //ajax
        $.ajax({
         type:"GET",
         url:"${hContext}/portfolio/go_update.spring",
         dataType:"html", 
         data:{ //"memberId":"sohyun1234"
                "memberId":memberId.trim(),
                "lName" : lName.trim(),
                "lGroup": lGroup.trim(),
                "lGrade": lGrade.trim(),
                "lNum": lNum.trim(),
                "lDate": lDate.trim(),
                "lOrgan": lOrgan.trim() 
         },
         success:function(data){ //성공
                console.log("data:"+data);  
                var html = "";
                var tbody = licUpdate.parent().parent().parent();
                var removeTbody = tbody.eq(0);
               removeTbody.empty();
               
               html+='<tbody>                                                                                                             ';
               html+='   <tr>                                                                                                               ';
               html+='      <td><input type="hidden" id="memberIdU" name="memberIdU" size="15"   value="';
               html+=memberId.trim();
               html+='" /> ';
               html+='</td>                                      ';
               html+='   </tr>                                                                                                              ';
               html+='   <tr>                                                                                                               ';
               html+='      <td><p class="mb-4"><b>License Name</b></p></td>                                                              ';
               html+='      <td><p class="mb-4"><b>License Classification</b></p></td>                                                   ';
               html+='      <td><p class="mb-4"><b>Type of License</b></p></td>                                                          ';
               html+='      <td><p class="mb-4"><b>License Number</b></p></td>                                                           ';
               html+='      <td><p class="mb-4"><b>Date of Acquisition</b></p></td>                                                      ';
               html+='      <td><p class="mb-4"><b>Issuing Agency</b></p></td>                                                           ';
               html+='   </tr>                                                                                                              ';
               html+='   <tr>                                                                                                               ';
               html+='      <td>                                                                                                           ';
               html+='         <input type="text" id="lNameU" name="lNameU" size="15"  readonly="readonly" maxlength="10" value="';
               html+=lName.trim();
               html+='" />                                                                                         ';
               html+='      </td>                                                                                                          ';
               html+='      <td>                                                                                                           ';
               html+='         <input type="text" id="lGroupU" name="lGroupU" size="15"  maxlength="10" value="';
               html+=lGroup.trim();
               html+='" />                                                                                         ';
               html+='      </td>                                                                                                          ';
               html+='      <td>                                                                                                           ';
               html+='         <input type="text" id="lGradeU" name="lGradeU" size="15"  maxlength="10" value="';
               html+=lGrade.trim();
               html+='" />                                                                                       ';
               html+='      </td>                                                                                                          ';
               html+='      <td>                                                                                                           ';
               html+='         <input type="text" id="lNumU" name="lNumU" size="15"  maxlength="10" value="';
               html+=lNum.trim();
               html+='" />                                                                                         ';
               html+='      </td>                                                                                                          ';
               html+='      <td>                                                                                                           ';
               html+='         <input type="text" id="lDateU" name="lDateU" size="15"  maxlength="10" value="';
               html+=lDate.trim();
               html+='" />                                                                                        ';
               html+='      </td>                                                                                                          ';
               html+='      <td>                                                                                                           ';
               html+='         <input type="text" id="lOrganU" name="lOrganU" size="15"  maxlength="10" value="';
               html+=lOrgan.trim();
               html+='" />                                                                                         ';
               html+='      </td>                                                                                                          ';
               html+='      <td >                                                                                               ';
               html+='         <button type="buttons"  class="licCan buttons" id="licCan" name="licCan" >Cancellation</button>                                                     ';
               html+='         <button type="buttons" class="dolicUpdate buttons" id="dolicUpdate" name="dolicUpdate" >Completed</button>                                                     ';
               html+='      </td>                                                                                                          ';
               html+='   </tr>                                                                                                              ';
               html+='</tbody>                                                                                                            ';                                                                                                                                                          
               tbody.append(html);                                                                      
         },
         error:function(xhr,status,error){
           alert("error:"+error);
         },
         complete:function(data){
         
         }   
         
        });//--ajax 

      }); //--수정버튼


      //수정취소버튼
      $(document).on("click",".licCan",function(){
          history.go(0);
       });

      //수정완료버튼
      $(document).on("click",".dolicUpdate",function(){
          var memberId=$("#memberIdU").val();
          var lName = $("#lNameU").val();
           var lGroup = $("#lGroupU").val();
           var lGrade = $("#lGradeU").val(); 
           var lNum = $("#lNumU").val();
           var lDate = $("#lDateU").val();
           var lOrgan= $("#lOrganU").val(); 

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
                   "memberId" : memberId.trim(),
                   "lName" : lName.trim(),
                   "lGroup" : lGroup.trim(),
                   "lGrade" : lGrade.trim(),
                   "lNum": lNum.trim(),
                   "lDate": lDate.trim(),
                   "lOrgan": lOrgan.trim() 
            },
            success:function(data){ //성공
               console.log("수정성공후우우우우");
               console.log("lName: "+lName.trim());
               console.log("lGroup: "+lGroup.trim());
               console.log("lGrade: "+lGrade.trim());
               console.log("lNum: "+lNum.trim());
               console.log("lDate: "+lDate.trim());
               console.log("lOrgan: "+lOrgan.trim());
               alert("수정되었습니다.");
               history.go(0);
            },
            error:function(xhr,status,error){
              alert("error:"+error);
            },
            complete:function(data){
            
            }   
            
           });//--ajax


         });//--수정완료버튼

      
      //삭제
      function licDelete(lName, memberId){

         //confirm
            if(confirm(lName+"을(를) 삭제 하시겠습니까?")==false) return;
             
           //ajax
          $.ajax({
              type:"POST",
              url:"${hContext}/portfolio/do_delete_license.spring",
              dataType:"html", 
              data:{ //"memberId":"sohyun1234"
                     "memberId":memberId,
                     "lName" : lName
              },
              success:function(data){ //성공
                     //console.log("data:"+data);  
                        var parseData = $.parseJSON(data);
                   if(parseData.msgId=="1"){
                        alert(parseData.msgMsg);
                        history.go(0);
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

         }

         
     //자격증 추가 버튼 클릭 시 div 추가
     $("#licAdd").on("click",function(){
         html="";
         html+='<div class="block-18 shadow" id="divLicense">                                                                                                                                                                           ';
         html+='     <input type="button" class="buttons" value="delete" style="float:right;" onclick="licensebtnMinus2()"                                                                                                                                     ';
         html+='   <h2 class="mb-4">Add License</h2>                                                                                                                                                                      ';
         html+='   <div align="center">                                                                                                                                                                                   ';
         html+=' <form action="${hContext}/portfolio/do_insert_license.spring" name="licenseInsertForm" id="licenseInsertForm" method="post">                                                                           ';
         html+=' <table id="licenseForm">                                                                                                                                                                               ';
         html+='   <tr>                                                                                                                                                                                                   ';
         html+='      <td>                                                                                                                                                                                               ';
         html+='         <table>                                                                                                                                                                                        ';
         html+='             <tr>                                                                                                                                                                                      ';
         html+='               <td>                                                                                                                                                                                   ';
         html+='               <img alt="추가입력폼" width="20" height="20" src="${hContext}/resources/images/plus.png" id="licensePlusInsert">                                                                           ';
         html+='               </td>                                                                                                                                                                                  ';
         html+='             </tr>                                                                                                                                                                                     ';
         html+='                  <tr>                                                                                                                                                                                ';
         html+='                    <td>                                                                                                                                                                             ';
         html+='                     <input  type="text" class="form-control lName" name="licenseList[0].lName" id="lName" placeholder="Qualification Name" >                                                        ';
         html+='                    </td>                                                                                                                                                                            ';
         html+='                  </tr>                                                                                                                                                                               ';
         html+='                  <tr>                                                                                                                                                                                ';
         html+='                    <td>                                                                                                                                                                             ';
         html+='                      <label for="Qualification classification">Qualification classification</label>                                                                                                ';
         html+='                       <select id="lGroup" name="licenseList[0].lGroup">                                                                                                                            ';
         html+='                        <option value="국가기술자격">National Technical qualification</option>                                                                                                          ';
         html+='                        <option value="국가전문자격">National Professional qualification</option>                                                                                                       ';
         html+='                        <option value="민간자격">Private qualification</option>                                                                                                                       ';
         html+='                        <option value="해외자격">Overseas qualification</option>                                                                                                                      ';
         html+='                       </select>                                                                                                                                                                    ';
         html+='                   </td>                                                                                                                                                                             ';
         html+='                    </tr>                                                                                                                                                                            ';
         html+='                    <tr>                                                                                                                                                                             ';
         html+='                      <td>                                                                                                                                                                          ';
         html+='                        <label for="TypeOfLicense">Type of license</label>                                                                                                                         ';
         html+='                       <select id="lGrade" name="licenseList[0].lGrade">                                                                                                                            ';
         html+='                        <option value="기사">기사</option>                                                                                                                                            ';
         html+='                        <option value="기능사">기능사</option>                                                                                                                                          ';
         html+='                        <option value="1급">1급</option>                                                                                                                                             ';
         html+='                        <option value="2급">2급</option>                                                                                                                                             ';
         html+='                        <option value="기타">기타</option>                                                                                                                                            ';
         html+='                       </select>                                                                                                                                                                    ';
         html+='                   </td>                                                                                                                                                                             ';
         html+='                    </tr>                                                                                                                                                                            ';
         html+='                    <tr>                                                                                                                                                                             ';
         html+='                      <td>                                                                                                                                                                          ';
         html+='                       <input type="text" class="form-control lNum" name="licenseList[0].lNum" id="lNum" placeholder="License Number" >                                                             ';
         html+='                      </td>                                                                                                                                                                         ';
         html+='                    </tr>                                                                                                                                                                            ';
         html+='                    <tr>                                                                                                                                                                             ';
         html+='                      <td>                                                                                                                                                                          ';
         html+='                        <input type="text" class="form-control lDate" name="licenseList[0].lDate" id="lDate" placeholder="Date of Acquisition(yyyymmdd)" >                                         ';
         html+='                      </td>                                                                                                                                                                         ';
         html+='                    </tr>                                                                                                                                                                            ';
         html+='                    <tr>                                                                                                                                                                             ';
         html+='                      <td>                                                                                                                                                                          ';
         html+='                        <input type="text" class="form-control lOrgan" name="licenseList[0].lOrgan" id="lOrgan" placeholder="Issuing Agency"  >                                                    ';
         html+='                      </td>                                                                                                                                                                         ';
         html+='                    </tr>                                                                                                                                                                            ';
         html+='                                                                                                                                                                                                     ';
         html+='                        </table>                                                                                                                                                                   ';
         html+='                     </td>                                                                                                                                                                          ';
         html+='                  </tr>                                                                                                                                                                              ';
         html+='                                                                                                                                                                                                     ';
         html+='                                                                                                                                                                                                     ';
         html+='                  <tbody id="licensebody">                                                                                                                                                           ';
         html+='                  </tbody>                                                                                                                                                                            ';
         html+='                  </table>                                                                                                                                                                            ';
         html+='                <table>                                                                                                                                                                               ';
         html+='                  <tr>                                                                                                                                                                               ';
         html+='                     <td >                                                                                                                                                                 ';
         html+='                        <button type="button" onclick="javascript:licenseInsert();" class="btn btn-primary btn-sm">Submit</button>                                                                 ';
         html+='                     </td>                                                                                                                                                                          ';
         html+='                  </tr>                                                                                                                                                                              ';
         html+='                </table>                                                                                                                                                                              ';
         html+='   </form>                                                                                                                                                                                                ';
         html+=' </div>                                                                                                                                                                                                 ';
         html+='</div>                                                                                                                                                                                                  ';
   
   
         $("#licAddlDiv").append(html);
     });
      //--자격증 추가 버튼 클릭 이벤트
      
      var licenseCnt = 0;
      
         //자격증 (+)버튼
       $(document).on("click","#licensePlusInsert",function(){
         console.log('this is plus button');
         var frm = document.uploadFrm;
         var html = '';
         licenseCnt+=1;
         console.log(licenseCnt);
   
         html+='<tr id="tr_2'+licenseCnt+'">';
         html+='<td>';
         html+='<table>';
                                                                                                                                                                                                                          
         html+='  <tr><td colspan="2"><hr/><br/></td></tr>                                                                                                                                                              ';
         html+='             <tr>                                                                                                                                                                                      ';
         html+='               <td>                                                                                                                                                                                   ';
         html+='               <img alt="추가입력폼" width="20" height="20" src="${hContext}/resources/images/plus.png" id="licensePlusInsert">                                                                           ';
         html+='               </td>                                                                                                                                                                                  ';
         html+='             </tr>                                                                                                                                                                                     ';
         html+='  <tr>                                                                                                                                                                                                  ';
         html+='      <td>                                                                                                                                                                                              ';
         html+='       <input  type="text" class="form-control lName" name="licenseList['+licenseCnt+'].lName" id="lName'+licenseCnt+'" placeholder="Qualification Name"   autofocus>                                   ';
         html+='      </td>                                                                                                                                                                                             ';
         html+='   </tr>                                                                                                                                                                                                ';
         html+='   <tr>                                                                                                                                                                                                 ';
         html+='      <td>                                                                                                                                                                                              ';
         html+='         <label for="Qualification classification">Qualification classification</label>                                                                                                                 ';
         html+='          <select id="lGroup'+licenseCnt+'" name="licenseList['+licenseCnt+'].lGroup">                                                                                                                  ';
         html+='            <option value="국가기술자격">National Technical qualification</option>                                                                                                                         ';
         html+='            <option value="국가전문자격">National Professional qualification</option>                                                                                                                      ';
         html+='            <option value="민간자격">Private qualification</option>                                                                                                                                       ';
         html+='            <option value="해외자격">Overseas qualification</option>                                                                                                                                      ';
         html+='          </select>                                                                                                                                                                                     ';
         html+='     </td>                                                                                                                                                                                              ';
         html+='      </tr>                                                                                                                                                                                             ';
         html+='      <tr>                                                                                                                                                                                              ';
         html+='         <td>                                                                                                                                                                                           ';
         html+='            <label for="TypeOfLicense">Type of license</label>                                                                                                                                          ';
         html+='          <select id="lGrade'+licenseCnt+'" name="licenseList['+licenseCnt+'].lGrade">                                                                                                                  ';
         html+='            <option value="기사">기사</option>                                                                                                                                                            ';
         html+='            <option value="기능사">기능사</option>                                                                                                                                                         ';
         html+='            <option value="1급">1급</option>                                                                                                                                                             ';
         html+='            <option value="2급">2급</option>                                                                                                                                                             ';
         html+='            <option value="기타">기타</option>                                                                                                                                                            ';
         html+='          </select>                                                                                                                                                                                     ';
         html+='     </td>                                                                                                                                                                                              ';
         html+='      </tr>                                                                                                                                                                                             ';
         html+='      <tr>                                                                                                                                                                                              ';
         html+='         <td>                                                                                                                                                                                           ';
         html+='          <input type="text" class="form-control lNum" name="licenseList['+licenseCnt+'].lNum" id="lNum'+licenseCnt+'" placeholder="License Number"  autofocus>                                         ';
         html+='         </td>                                                                                                                                                                                          ';
         html+='      </tr>                                                                                                                                                                                             ';
         html+='      <tr>                                                                                                                                                                                              ';
         html+='         <td>                                                                                                                                                                                           ';
         html+='            <input type="text" class="form-control lDate" name="licenseList['+licenseCnt+'].lDate" id="lDate'+licenseCnt+'" placeholder="Date of Acquisition(yyyymmdd)"  autofocus>                     ';
         html+='         </td>                                                                                                                                                                                          ';
         html+='      </tr>                                                                                                                                                                                             ';
         html+='      <tr>                                                                                                                                                                                              ';
         html+='         <td>                                                                                                                                                                                           ';
         html+='            <input type="text" class="form-control lOrgan" name="licenseList['+licenseCnt+'].lOrgan" id="lOrgan'+licenseCnt+'" placeholder="Issuing Agency"  autofocus>                                 ';
         html+='         </td>                                                                                                                                                                                          ';
         html+='      </tr>                                                                                                                                                                                             ';
         html+='    </tr>                                                                                                                                                                                               ';
         html+='      <tr >                                                                                                                                                                                             ';
         html+='         <td>                                                                                                                                                                                           ';
         html+='            <img alt="삭제입력폼" align="left" width="20" height="20" src="${hContext}/resources/images/minus.png" onClick="licensebtnMinus(\'tr_2'+licenseCnt+'\');">                                     ';      
         html+='         </td>                                                                                                                                                                                          ';
         html+='      </tr>                                                                                                                                                                                             ';
         
         
         html+='</tr>';
         html+='</td>';
         html+='</table>';
         
         $("#licensebody").append(html);

       });
       
       // 자격증 (-) 버튼 클릭 이벤트
       function licensebtnMinus(btnId){
          console.log('this is minus button');
           $("#"+btnId).empty();
       }
       function licensebtnMinus2(){
           console.log('this is minus button');

            $("#divLicense").remove();
        }

//--licesnse------------------------------


//project------------------------------

       //수정
        $(".projectUpdate").on("click",function(){
        
          var projectUpdate = $(this);
          var tr = projectUpdate.parent().parent().parent();
          var td = tr.children().children();
          var memberId = td.eq(0).text();
           var pjtName = td.eq(6).text();
          var pjtInfo = td.eq(7).text();
          var pjtStart = td.eq(8).text();
          var pjtEnd = td.eq(9).text();
          var gitAddress = td.eq(10).text();
   
         console.log("memberId= "+memberId);
         console.log("pjtName= "+pjtName);
         console.log("pjtInfo= "+pjtInfo);
         console.log("pjtStart= "+pjtStart);
         console.log("pjtEnd= "+pjtEnd);
         console.log("gitAddress= "+gitAddress);   
            
           
           //ajax
            $.ajax({
            type:"GET",
            url:"${hContext}/project/do_select_one.spring",
            dataType:"html", 
            data:{ //"memberId":"sohyun1234"
                  "memberId":memberId.trim(),
                  "pjtName" : pjtName.trim(),
                  "pjtInfo": pjtInfo.trim(),
                  "pjtStart": pjtStart.trim(),
                  "pjtEnd": pjtEnd.trim(),
                  "gitAddress": gitAddress.trim()
            },
            success:function(data){ //성공
                  console.log("data:"+data);  
                  var html = "";
                  var tbody = projectUpdate.parent().parent().parent();
                  var removeTbody = tbody.eq(0);
               removeTbody.empty();
               
               html+='<tbody>                                                                                                             ';
               html+='   <tr>                                                                                                               ';
               html+='      <td><input type="hidden" id="memberIdU" name="memberIdU" size="15"   value="';
               html+=memberId.trim();
               html+='" /> ';
               html+='</td>                                      ';
               html+='   </tr>                                                                                                              ';
               html+='   <tr>                                                                                                              ';
               html+='       <td><p class="mb-4 col-lg-3"><b>Project Name</b></p></td>                                                      ';
               html+='       <td><p class="mb-4 col-lg-3"><b>Project Description</b></p></td>                                               ';
               html+='       <td><p class="mb-4 col-lg-4"><b>Project Period</b></p></td>                                                    ';
               html+='       <td><p class="mb-4 col-lg-2"><b>Github Address</b></p></td>                                                    ';
               html+='   </tr>                                                                                                             ';
               html+='   <tr>                                                                                                               ';
               html+='      <td>                                                                                                           ';
               html+='         <input type="text" id="pjtNameU" name="pjtNameU" size="15"  readonly="readonly" maxlength="10" value="';
               html+=pjtName.trim();
               html+='" />                                                                                         ';
               html+='      </td>                                                                                                          ';
               html+='      <td>                                                                                                           ';
               html+='         <input type="text" id="pjtInfoU" name="pjtInfoU" size="15"  maxlength="10" value="';
               html+=pjtInfo.trim();
               html+='" />                                                                                         ';
               html+='      </td>                                                                                                          ';
               html+='      <td>                                                                                                           ';
               html+='         <input type="text" id="pjtStartU" name="pjtStartU" size="15"  maxlength="10" value="';
               html+=pjtStart.trim();
               html+='" />                                                                                       ';
               html+='      </td>                                                                                                          ';
               html+='      <td>                                                                                                           ';
               html+='         <input type="text" id="pjtEndU" name="pjtEndU" size="15"  maxlength="10" value="';
               html+=pjtEnd.trim();
               html+='" /> ';
               html+='      </td>                                                                                                          ';
               html+='      <td>                                                                                                           ';
               html+='         <input type="text" id="gitAddressU" name="gitAddressU" size="15"  maxlength="10" value="';
               html+=gitAddress.trim();
               html+='" />                                                                                         ';
               html+='      </td>                                                                                                          ';
               html+='      <td >                                                                                               ';
               html+='         <button type="buttons"  class="pjtCan buttons" id="pjtCan" name="pjtCan" >Cancellation</button>                                                     ';
               html+='         <button type="buttons" class="pjtUpdate buttons" id="pjtUpdate" name="pjtUpdate" >Completed</button>                                                     ';
               html+='      </td>                                                                                                          ';
               html+='   </tr>                                                                                                              ';
               html+='</tbody>                                                                                                            ';                                                                                                                                                          
               tbody.append(html);   
         },
         error:function(xhr,status,error){
            alert("error:"+error);
         },
         complete:function(data){
         
         }   
         
         });//--ajax 
         
         }); //--수정버튼
         
         //수정취소버튼
            $(document).on("click",".pjtCan",function(){
               history.go(0);
            });
            
         //수정완료버튼
            $(document).on("click",".pjtUpdate",function(){
               var memberId=$("#memberIdU").val();
               var pjtName = $("#pjtNameU").val();
               var pjtInfo = $("#pjtInfoU").val();
               var pjtStart = $("#pjtStartU").val(); 
               var pjtEnd = $("#pjtEndU").val();
               var gitAddress = $("#gitAddressU").val();
               
               if($("#pjtInfoU").val()==null || $("#pjtInfoU").val().length<=0 ||$("#pjtInfoU").val()=='undefined'){
                  $("#pjtInfoU").focus();
                  alert("프로젝스설명을 입력하세요.");
                  return;
                  }
   
               if($("#pjtStartU").val()==null || $("#pjtStartU").val().length<=0 || $("#pjtStartU").val()=='undefined'){
                  $("#pjtStartU").focus();
                  alert("시작일을 입력하세요.");
                  return;
                  }
   
               if($("#pjtEndU").val()==null || $("#pjtEndU").val().length<=0 ||  $("#pjtEndU").val()=='undefined'){
                  $("#pjtEndU").focus();
                  alert("종료일을 입력하세요.");
                  return;
                  }
               
               if( $("#gitAddressU").val()==null ||  $("#gitAddressU").val().length<=0|| $("#gitAddressU").val()=='undefined'){
                  $("#gitAddressU").focus();
                  alert("깃주소를 입력하세요.");
                  return;
                  }
                  
               if(confirm("수정 하시겠습니까?")==false) return;
               
               //ajax
               $.ajax({
                  type:"POST",
                  url:"${hContext}/project/do_update.spring",
                  dataType:"html", 
                  data:{ //"memberId":"sohyun1234"
                     "memberId" : memberId.trim(),
                     "pjtName" : pjtName.trim(),
                     "pjtInfo": pjtInfo.trim(),
                     "pjtStart": pjtStart.trim(),
                     "pjtEnd": pjtEnd.trim(),
                     "gitAddress": gitAddress.trim() 
                  },
                  success:function(data){ //성공
                  console.log("수정성공후우우우우");
                  console.log("pjtName: "+pjtName.trim());
                  console.log("pjtInfo: "+pjtInfo.trim());
                  console.log("pjtStart: "+pjtStart.trim());
                  console.log("pjtEnd: "+pjtEnd.trim());
                  console.log("gitAddress: "+gitAddress.trim());
   
                  alert("수정되었습니다.");
                  skillRetrieve();
                  },
                  error:function(xhr,status,error){
                  alert("error:"+error);
                  },
                  complete:function(data){
                  
                  }   
                  
               });//--ajax
         
         
            });//--수정완료버튼
            
            //삭제
            function projectDelete(gitAddress, memberId){
               //confirm
                  if(confirm(gitAddress+"Project를 삭제 하시겠습니까?")==false) return;
                  
               //ajax
               $.ajax({
                  type:"POST",
                  url:"${hContext}/project/do_delete.spring",
                  dataType:"html", 
                  data:{ //"memberId":"sohyun1234"
                        "memberId" : memberId,
                        "gitAddress" : gitAddress
                  },
                  success:function(data){ //성공
                        //console.log("data:"+data);  
                           var parseData = $.parseJSON(data);
                     if(parseData.msgId=="1"){
                           alert(parseData.msgMsg);
                           history.go(0);
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
            
               }


         //프로젝트 추가 버튼 클릭 시
         $("#projectAdd").on("click", function(){
             
               html="";
               html+='<div class="block-18 shadow" id="divProject">                                                                                                                                                                 ';
               html+='     <input type="button" class="buttons" value="delete" style="float:right;" onclick="projectbtnMinus2()"                                                                                                                                     ';
               html+='   <h2 class="mb-4">Add Project</h2>                                                                                                                                                            ';
               html+='   <div align="center">                                                                                                                                                                         ';
               html+='      <form action="${hContext}/portfoilo/upload.spring" method="post" enctype="multipart/form-data" name="projectInsetForm" id="projectInsetForm">                                            ';
               html+='      <table id="pjtForm">                                                                                                                                                                     ';
               html+='         <tr>                                                                                                                                                                                 ';
               html+='            <td>                                                                                                                                                                             ';
               html+='               <table>                                                                                                                                                                      ';
               html+='                  <tr>                                                                                                                                                                     ';
               html+='                     <td>                                                                                                                                                                  ';
               html+='                       <img alt="추가입력폼" width="20" height="20" src="${hContext}/resources/images/plus.png" id="pjtPlusInsert">                                                           ';
               html+='                     </td>                                                                                                                                                                 ';
               html+='                  </tr>                                                                                                                                                                    ';
               html+='                  <tr>                                                                                                                                                                     ';
               html+='                     <td>                                                                                                                                                                  ';
               html+='                       Project Name                                                                                                                                                       ';
               html+='                     </td>                                                                                                                                                                 ';
               html+='                     <td>                                                                                                                                                                  ';
               html+='                       <input type="text" id="pjtName" name="projectList[0].pjtName">                                                                                                     ';
               html+='                     </td>                                                                                                                                                                 ';
               html+='                  </tr>                                                                                                                                                                    ';
               html+='                  <tr>                                                                                                                                                                     ';
               html+='                     <td>                                                                                                                                                                  ';
               html+='                       <p>Project Description<p>                                                                                                                                          ';
               html+='                     </td>                                                                                                                                                                 ';
               html+='                     <td>                                                                                                                                                                  ';
               html+='                       <textarea cols="40" rows="3" id="pjtInfo" name="projectList[0].pjtInfo"></textarea>                                                                                ';
               html+='                     </td>                                                                                                                                                                 ';
               html+='                  </tr>                                                                                                                                                                    ';
               html+='                  <tr>                                                                                                                                                                     ';
               html+='                     <td>                                                                                                                                                                  ';
               html+='                       <p>Project Period<p>                                                                                                                                               ';
               html+='                     </td>                                                                                                                                                                 ';
               html+='                     <td>                                                                                                                                                                  ';
               html+='                       <input type="date" id="pjtStart" name="projectList[0].pjtStart"> - <input type="date" id="pjtEnd" name="projectList[0].pjtEnd">                                    ';
               html+='                     </td>                                                                                                                                                                 ';
               html+='                  </tr>                                                                                                                                                                    ';
               html+='                  <tr>                                                                                                                                                                     ';
               html+='                     <td>                                                                                                                                                                  ';
               html+='                       <p>Github Address<p>                                                                                                                                               ';
               html+='                     </td>                                                                                                                                                                 ';
               html+='                     <td>                                                                                                                                                                  ';
               html+='                       <input type="text" id="gitAddress" name="projectList[0].gitAddress">                                                                                               ';
               html+='                     </td>                                                                                                                                                                 ';
               html+='                  </tr>                                                                                                                                                                    ';
               html+='                  <tr>                                                                                                                                                                     ';
               html+='                     <td>                                                                                                                                                                  ';
               html+='                       <p>Project DemonstrationVideo<p>                                                                                                                                   ';
               html+='                     </td>                                                                                                                                                                 ';
               html+='                     <td>                                                                                                                                                                  ';
               html+='                       <input type="file" id="videoFile" name="videoFile">                                                                                                                                 ';
               html+='                     </td>                                                                                                                                                                 ';
               html+='                  </tr>                                                                                                                                                                    ';
               html+='                                                                                                                                                                                             ';
               html+='           </table>                                                                                                                                                                           ';
               html+='          </td>                                                                                                                                                                               ';
               html+='         </tr>                                                                                                                                                                                 ';
               html+='                                                                                                                                                                                               ';
               html+='          <tbody id="projectbody">                                                                                                                                                            ';
               html+='          </tbody>                                                                                                                                                                            ';
               html+='          </table>                                                                                                                                                                            ';
               html+='       <table>                                                                                                                                                                                 ';
               html+='       <tr>                                                                                                                                                                                    ';
               html+='         <td >                                                                                                                                                                       ';
               html+='            <button type="button" onclick="javascript:pjtInsert();" class="btn btn-primary btn-sm">Submit</button>                                                                            ';
               html+='         </td>                                                                                                                                                                                ';
               html+='       </tr>                                                                                                                                                                                   ';
               html+='     </table>                                                                                                                                                                                   ';
               html+='</form>                                                                                                                                                                                       ';
               html+='</div>                                                                                                                                                                                        ';
               html+='</div>       ';

            $("#projectAddlDiv").append(html);
            });




            var projectCnt = 0;
            //프로젝트 (+)버튼
            $(document).on("click","#pjtPlusInsert", function(){
               console.log('This is plus button');
               var frm=document.uploadFrm;
               var html = '';
               projectCnt+=1;
               console.log(projectCnt);
  
                html+='<tr id="tr_3'+projectCnt+'">';
                html+='<td>';
                html+='<table>';
  
                html+='<tr><td colspan="2"><hr/><br/></td></tr>                                                                                                                                                                  ';
                html+='                  <tr>                                                                                                                                                                     ';
                html+='                     <td>                                                                                                                                                                  ';
                html+='                       <img alt="추가입력폼" width="20" height="20" src="${hContext}/resources/images/plus.png" id="pjtPlusInsert">                                                           ';
                html+='                     </td>                                                                                                                                                                 ';
                html+='                  </tr>                                                                                                                                                                    ';
                html+='<tr>                                                                                                                                                                                                      ';
                html+='   <td>                                                                                                                                                                                                   ';
                html+='      Project Name                                                                                                                                                                                        ';
                html+='   </td>                                                                                                                                                                                                  ';
                html+='   <td>                                                                                                                                                                                                   ';
                html+='      <input type="text" id="pjtName'+projectCnt+'" name="projectList['+projectCnt+'].pjtName">                                                                                                           ';
                html+='   </td>                                                                                                                                                                                                  ';
                html+='</tr>                                                                                                                                                                                                     ';
                html+='<tr>                                                                                                                                                                                                      ';
                html+='   <td>                                                                                                                                                                                                   ';
                html+='      <p>Project Description<p>                                                                                                                                                                           ';
                html+='   </td>                                                                                                                                                                                                  ';
                html+='   <td>                                                                                                                                                                                                   ';
                html+='      <textarea cols="50" rows="3" id="pjtInfo'+projectCnt+'" name="projectList['+projectCnt+'].pjtInfo"></textarea>                                                                                      ';
                html+='   </td>                                                                                                                                                                                                  ';
                html+='</tr>                                                                                                                                                                                                     ';
                html+='<tr>                                                                                                                                                                                                      ';
                html+='   <td>                                                                                                                                                                                                   ';
                html+='      <p>Project Period<p>                                                                                                                                                                                ';
                html+='   </td>                                                                                                                                                                                                  ';
                html+='   <td>                                                                                                                                                                                                   ';
                html+='      <input type="date" id="pjtStart'+projectCnt+'" name="projectList['+projectCnt+'].pjtStart"> - <input type="date" id="pjtEnd'+projectCnt+'" name="projectList['+projectCnt+'].pjtEnd">               ';
                html+='   </td>                                                                                                                                                                                                  ';
                html+='</tr>                                                                                                                                                                                                     ';
                html+='<tr>                                                                                                                                                                                                      ';
                html+='   <td>                                                                                                                                                                                                   ';
                html+='      <p>Github Address<p>                                                                                                                                                                                ';
                html+='   </td>                                                                                                                                                                                                  ';
                html+='   <td>                                                                                                                                                                                                   ';
                html+='      <input type="text" id="gitAddress'+projectCnt+'" name="projectList['+projectCnt+'].gitAddress">                                                                                                     ';
                html+='   </td>                                                                                                                                                                                                  ';
                html+='</tr>                                                                                                                                                                                                     ';
                html+='<tr>                                                                                                                                                                                                      ';
                html+='   <td>                                                                                                                                                                                                   ';
                html+='      <p>Project DemonstrationVideo<p>                                                                                                                                                                    ';
                html+='   </td>                                                                                                                                                                                                  ';
                html+='   <td>                                                                                                                                                                                                   ';
                html+='      <input type="file" id="videoFile'+projectCnt+'" name="projectList['+projectCnt+'].videoFile">                                                                                                       ';
                html+='   </td>                                                                                                                                                                                                  ';
                html+='</tr>                                                                                                                                                                                                     ';
                html+='      <tr >                                                                                                                                                                                               ';
                html+='         <td>                                                                                                                                                                                             ';
                html+='            <img alt="삭제입력폼" align="left" width="20" height="20" src="${hContext}/resources/images/minus.png" onClick="licensebtnMinus(\'tr_3'+projectCnt+'\');">                                         ';      
                html+='         </td>                                                                                                                                                                                            ';
                html+='      </tr>                                                                                                                                                                                               ';
               
              
                html+='</tr>';
                html+='</td>';
                html+='</table>';  
                                                                                                                                                                        
                $("#projectbody").append(html);

              });


              
            function projectbtnMinus(btnId){
               console.log('this is minus button');
                $("#"+btnId).empty();
            }
            function projectbtnMinus2(){
                console.log('this is minus button');

                 $("#divProject").remove();
             }
//--project----------------------------  

     
     
        function projectUpdate() {
       console.log("projectUpdate");
       var frm = document.projectUp_frm;
       frm.action = "${hContext}/";
       frm.method = "POST";
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

     
     function skillInsert() {
        console.log("skillInsert");
          var frm = document.skillInsertForm;
          frm.action = "${hContext}/skill/do_insert.spring";
          frm.method="GET";
          frm.submit(); 
          
     }




     function licenseInsert() {
        console.log("licenseInsert");
        var frm = document.licenseInsertForm;
        frm.action = "${hContext}/portfolio/license_insert.spring";
        frm.method="POST";
        frm.submit(); 
        
    }


    
      
     function pjtInsert() {
        console.log("pjtInsert");
        var pjtFrm = document.projectInsetForm;
        pjtFrm.action = "${hContext}/portfolio/do_insert.spring";
        pjtFrm.method="POST";
        pjtFrm.submit(); 
        
     }
          
    </script>
   
</body>
</html>