<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">자유 게시판</h1>
	</div>
</div>
<div class="cantainer mx-5">
	<div class="row justify-content-end mb-2">
		<span class="col-2 text-right"><button class="btn btn-poka-main" onclick="location.href='/board/add'">글쓰기</button></span>
	</div>
	<div class="row mb-3">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">No.</th>
					<th scope="col">제목</th>
					<th scope="col">등급</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
			 <c:forEach items="${list }" var="board">
			 <c:if test="${board.reportStatus ne 3}">
				<tr class="move">
					<td scope="row">${board.bno }</td>
					<td>${board.title }</td>
					<td><img src = "/resources/images/${board.user.grade.grade_img}" style="width:20px; height:20px;"></td>
					<td>${board.writer }</td>
					<td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
				</tr>
				</c:if>
			</c:forEach>
			</tbody>
		</table>
		</div>
		  <!-- 페이지 번호 표시 영역 -->
          <div aria-label="Page navigation example">
           		<ul class="pagination justify-content-center">
	               	<!-- 이전 표시 -->	
	               	<c:if test="${pageMaker.prev }">
						<li class="page-item">
							<a class="page-link" href="${pageMaker.startPage - 1 }" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
       						 	<span class="sr-only">Previous</span></a>
						</li>
					</c:if>
		
	              	<!-- 페이지 번호 -->
	              	<c:forEach begin="${pageMaker.startPage }"
 	              			   end="${pageMaker.endPage }" 
 	              			   var="num"> 
 	                 		<%-- 현재 페이지 번호가 pageNum과 같으면 active 표시  --%>
 							<li class="page-item 
								   ${pageMaker.cri.pageNum == num ? 'active' : '' }">		
							<a class="page-link" href="${num }">${num }</a>
							</li></c:forEach> 
	                 	
	               	<!-- 다음 표시	 -->
	               	<c:if test="${pageMaker.next }"> 
					<li class="page-item">
						<a class="page-link" href="${pageMaker.endPage + 1 }" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
	      					<span class="sr-only">Next</span>
						</a>
					</li></c:if>
              	</ul> 
              </div> 
              <!-- END 페이지 번호 표시 영역 -->
              
               <!-- 현재 페이지 번호 및 출력 게시물 수 전송 폼 -->
               <form id="actionForm" action="/board/list">
	               	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	               	<input type="hidden" name="amount"  value="${pageMaker.cri.amount }">
               </form>
				
				  <!-- 게시물 등록 결과 표시 Modal -->
                   <div class="modal fade" id="myModal" tabindex="-1" 
                   	 role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                       <div class="modal-dialog">
                           <div class="modal-content">
                               <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                               </div>
                               <div class="modal-body">
                               	글이 등록되었습니다.
                               </div>
                               <div class="modal-footer">
                                   <button type="button" 
                                   		class="btn btn-primary" data-dismiss="modal">
                                   		Close</button>
                               </div>
                           </div>	
                       </div>	 
                   </div><!-- END 게시물 등록 결과 표시 modal -->
	
</div>
<script>
$(function(){
	var result = '${result}';
	checkModal(result);
	
	//모달 창 재출력 막기
	history.replaceState({}, null, null);
	
	//모달창 표시
	function checkModal(result){
		//result 값이 있는 경우에만 표시
		if(result === '' || history.state) {
			return;
		}
		
		if(parseInt(result) > 0){
			$('.modal-body').html(result + '번 게시물이 등록되었습니다.');
		}
		
		$('#myModal').modal('show');
	};//END 모달창 표시
	
	
	$('#regBtn').on('click', function(){
		self.location="/board/register";
	});//END 등록 버튼 클릭 이벤트 처리
	
	
	//페이지 번호 클릭 이벤트 처리 -----------------------------------
	var actionFrm = $('#actionForm');
	
	$('.paginate_button a').on('click', function(e){
		e.preventDefault();
		
		//actionForm의 pageNum의 값을 클릭된 a 태그의 href 값으로 변경
		actionFrm.find("input[name='pageNum']")
				 .val($(this).attr('href'));
		actionFrm.submit();
	});	//END 페이지 번호 클릭 이벤트 처리
	
	
	//게시물의 제목 클릭 이벤트 처리 -----------------------------
	$('.move').on('click', function(e){
		e.preventDefault();
		
		actionFrm.append("<input type='hidden' name='bno' value='" + 
				$(this).children().eq(0).text() + "'>");	//첫번째 행인 No.의 값 가져오기
		actionFrm.attr('action', '/board/get');
		actionFrm.submit();		
	});	//END 게시물의 제목 클릭 이벤트 처리
	
});//END $
</script> 

<%@ include file="../include/footer.jsp"%>