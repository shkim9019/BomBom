<%--
  /**
  * Class Name : 
  * Description : 
  * Modification Information
  *
  *   수정일                   수정자                      수정내용
  *  -------    --------    ---------------------------
  *  2020. 5. 5.            최초 생성
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
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link href="${hContext}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>




<div class="container">

	<!-- 검색영역 -->
    	<div class="row">
    		<div class="col-md-12 text-right">
	    		<form action="${hContext}/comment/do_retrieve.spring" name="commentfrm" method="get" class="form-inline">
	    			<!-- pageNum -->
	    			<input type="hidden" name="pageNum" id="pageNum" value="${param.pageNum }">
	    			<div class="form-group">
	    				

	    				<input type="text"  class="form-control input-sm"  
	    				id="searchWord" value="${param.searchWord }" name="searchWord" placeholder="검색어">
	    				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
	    				<button type="button" onclick="javascript:doRetrieve();" class="btn btn-primary btn-sm">조회</button> 
	    						
	    			</div>
	    		</form>
    		</div>
    	</div>
    	<!--// 검색영역 -->
            <!-- 입력 From -->
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="cContent" name="cContent" placeholder="댓글을 입력하세요"></textarea>
                            <input type="hidden" maxlength="20" class="form-control input-sm" id="memberId" name="memberId" placeholder="아이디" value="" />
                            <div align="right">
                            	<button type="button" class="btn pull-right btn-success" id="doInsert" >등록</button>
                            	<button type="button" class="btn pull-right btn-success" id="doUpdate" >수정</button>
	                            <input type="checkbox"  id="open" name="open"  value="1">비밀댓글
	                			
	                			
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- 입력 From -->   
    </form>
</div>

<%-- <!-- 댓글 -->
<div id="comment">
  <ol class="commentList">
    <c:forEach items="${list}" var="commentList">
      <li>
        <p>
        작성자 : ${commentList.memberId}<br />
        작성 날짜 :  <fmt:formatDate value="${commentList.regDate}" pattern="yyyy-MM-dd" />
        </p>

        <p>${commentList.cContent}</p>
      </li>
    </c:forEach>   
  </ol>
</div> --%>

	<div class="table-responsive">
    	<table class="table" id="memberTable">
		<tbody>
 				<!-- Data있는 경우 -->
 				<c:choose>
 					<c:when test="${list.size()>0 }">
 						<c:forEach var="vo" items="${list }">
   					<tr>
   						<td>
   							<div align="left">
                            	<label>${vo.regId }</label>
                            </div>
   							<label style="width: 1100px" rows="3" cols="30">${vo.cContent }</label>
                            <div align="right">
                            	<label>${vo.regDt }</label>
                            </div>
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






    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${hContext}/resources/js/bootstrap.min.js"></script>
    <!-- page -->
    <script src="${hContext}/resources/js/jquery.bootpag.min.js"></script>
    
<script type="text/javascript">


/*
 * 댓글 등록하기(Ajax)
 */
/* function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url:"${hContext}/comment/add.spring",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#c_content").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
} */

 //등록
$("#doInsert").on("click", function() {
	//console.log("#doUpdate");
	//값  Null check
	if($("#cContent").val() == "" || $("#cContent").val() == false){
		alert("내용을 입력 하세요.");
		$("#c_content").focus();
		return;
	}

	//confirm
	if(confirm("댓글을 등록 하시겠습니까?")==false)return;
	
	//ajax
	$.ajax({
	   type:"POST",
	   url:"${hContext}/comment/add.spring",
	   dataType:"html",
	   data:{
		   "cContent": $("#cContent").val()
	   },
	   success:function(data){ //성공
	      console.log("data:"+data);
	      var parseData = $.parseJSON(data);
	      if(parseData.msgId == "1"){
			 alert(parseData.msgMsg);
			 //doRetrieve();
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


   function doRetrieve(){
	//console.log('doRetrieve');
	var frm = document.commentfrm;
	frm.pageNum.value = 1;
	frm.action = "${hContext}/comment/do_retrieve.spring";
	frm.submit();
} 
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
/* $(function(){
    
    getCommentList();
    
});
  */
/**
 * 댓글 불러오기(Ajax)
 */
/* function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='/board/commentList.do'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].member_id+"</strong></h6>";
                    html += data[i].c_content + "<tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
} */
 
</script>
 
</body>
</html>