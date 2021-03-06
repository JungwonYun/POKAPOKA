<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/game.css">
<meta charset="UTF-8">
<title>みんなのレビューコミュニティ！ぽかぽかゲーム！</title>
</head>
<body>
	<div class="game-wrapper">
		<div class="live-streaming-subtitle d-flex justify-content-start">
			<p>人気の生放送</p>
		</div>
		<div class="d-flex justify-content-center">
			<div class="live-streaming"></div>
		</div>
		<div class="search-box">
			<div class="input-group md-form form-sm poka-form pl-0">
				<input class="form-control my-0 py-1 poka-border" type="text"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="input-group-text red lighten-3" id="search-icon">
						<i class="fas fa-search" aria-hidden="true"></i>
					</button>
				</div>
			</div>
		</div>
		<div class="search-keyword">
			<c:if test="0 == 1">
				<span class="badge poka-main text-white"> test text <span
					class="xbtn badge badge-pill badge-danger">x</span>
				</span>
				<span class="badge poka-main text-white"> 키워드 <span
					class="xbtn badge badge-pill badge-danger">x</span>
				</span>
				<span class="badge poka-main text-white"> キーワード <span
					class="xbtn badge badge-pill badge-danger">x</span>
				</span>
			</c:if>
		</div>
		<div class="d-flex game-list justify-content-between">
			<c:forEach items="${list }" var="game">
				<div class="card game-item" style="width: 8rem;" id="${game.gno }">
					<img class="card-img-top" src="${game.game_img }">
					<div class="card-body">
						<p id="gameNm" class="card-text">${game.gameNm }</p>
						<%-- <p id="game_price" class="card-text">${game.game_price }</p> --%>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- 페이지 전송 시 사용할 전송 폼 -->
	<form action="#"></form>

	<!-- 내부 동작 스크립트 -->
	<script>
		$(function() {
			/* game-item 클릭 시 동작 */
			$('.game-item').on('click', function() {
				//$('form').append("<input type='hidden' name='gno' value='"+ $(this).attr('id') +"'>");
				$('form').attr('action', "/game/get/" + $(this).attr('id'));
				$('form').submit();
			});

		});//END Script
	</script>
</body>
</html>
<%@ include file="../include/footer.jsp"%>