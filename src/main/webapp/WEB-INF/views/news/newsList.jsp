<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="../include/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>ゲームニュース</title>
</head>
<body>
	<div id="wrapper" style="margin: 2rem">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header" style="margin-bottom: 2rem">
						<strong>最新ニュース</strong>
					</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<table width="100%" class="table table-bordered table-hover">
								<thead class="thead-dark">
									<tr>
										<th class="col-xl-2">No.</th>
										<th class="col-xl-7">タイトル</th>
										<th class="col-xl-3">投稿日</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="news">
										<tr>
											<td id="newsNo">${news.newsNo}</td>
											<td id="title">${news.title}</td>
											<td id="regDate">${news.regDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- 내부 동작 스크립트 -->
	<script>
		$(function() {
			//타이틀 클릭 시 동작.
			$('#title').on('click',fun ction(){
				console.log("clicked");
			});
		});//END Script
	</script>
</body>
</html>
<%@ include file="../include/footer.jsp"%>