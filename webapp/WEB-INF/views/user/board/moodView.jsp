<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/nav.jsp"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/user/brd_view.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.20/css/dataTables.semanticui.min.css" />

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.20/js/dataTables.semanticui.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js"></script>

<!-- sidebar-wrapper  -->
<!-- <main class="page-content">
   <div class="container-fluid"> -->
<div id="contentWrap">
	<div id="content">
		<div id="earFunListDetail">

			<article id="container" class="mnTheme mnMAlbum pgMAlbum">
				<header class="sectionPadding pgTitle noneLNB">
					<div class="innerContainer">
						<h1>
							<c:out value="${list.m_caption}" />
						</h1>
						<div class="btns">
							<div class="loc-navi">
								<div class="loc-r">
									<a href="/" class="loc-home">HOME</a> &gt; <a
										href="http://localhost:8090/user/board/moodList">상황별 음악</a>
								</div>
							</div>
						</div>
					</div>
				</header>

				<section class="sectionPadding summaryInfo summaryMPDAlbum">
					<div class="innerContainer">
						<div class="basicInfo" id="basicInfoArea">
							<div class="thumbnails" style="background-color: #526255;">
								<span class="bg"></span> <span class="mask"></span>

								<div class="albumArt">
									<span class="cover"></span> <span class="album"> <img
										src="${list.m_thumbImg}">
									</span>
								</div>
							</div>

							<table class="info">
								<caption>정보</caption>
								<tbody>
									<tr>
										<th scope="row">제목</th>
										<td><c:out value="${list.m_caption}" /></td>
									</tr>
									<tr>
										<th scope="row">등록일</th>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${list.regDate}" /></td>
									</tr>
									<tr>
										<th scope="row">조회수</th>
										<td><c:out value="${list.viewCnt}" /></td>
									</tr>
								</tbody>
							</table>


							<div class="tag" id="esAlbumTagArea"
								style="visibility: visible; position: absolute;">
								<a
									href="https://music.bugs.co.kr/musicpd?tag_id=5414&amp;wl_ref=S_mab_02_01"
									class="hyrend"><span>#국내</span></a> <a
									href="https://music.bugs.co.kr/musicpd?tag_id=211&amp;wl_ref=S_mab_02_01"
									class="hyrend"><span>#인디</span></a> <a
									href="https://music.bugs.co.kr/musicpd?tag_id=11138&amp;wl_ref=S_mab_02_01"
									class="hyrend"><span>#국내 인디</span></a> <a
									href="https://music.bugs.co.kr/musicpd?tag_id=5727&amp;wl_ref=S_mab_02_01"
									class="hyrend"><span>#밤/새벽</span></a> <a
									href="https://music.bugs.co.kr/musicpd?tag_id=1377&amp;wl_ref=S_mab_02_01"
									class="hyrend"><span>#몽환적인</span></a> <a
									href="https://music.bugs.co.kr/musicpd?tag_id=18815&amp;wl_ref=S_mab_02_01"
									class="hyrend"><span>#밤샘작업</span></a>
							</div>
						</div>
						<!-- basicInfoArea End -->

						<!-- etcInfo Start -->
						<div class="etcInfo">
							<span class="likeBtn"> <a href="javascript:;"
								class="btnNormal like"
								onclick="bugs.wiselog.area('S_mab_02_04');onClickLike('35860', this)">
									<span>좋아요 <em>4</em></span>
							</a> <span id="recommend_layer_area"></span>
							</span>

							<script type="text/javascript">
                        function goBottomCommentArea() {
                           var pos = $("#comments:not(.commentsBside)")
                              .offset().top;
                           var cHeight = $("#header").height();
                           $(window).scrollTop(pos - cHeight);
                        }
                     </script>

							<div class="comment">
								<h3>댓글</h3>
								<p class="total">
									<span cmt_disp_comment_count="onlyone"></span>개
								</p>

								<div class="preview" id="basicInfoCommentPrev"></div>

								<div class="preview nodata" id="basicInfoCommentPrevNone"
									style="display: none;"></div>
							</div>

							<div class="share">
								<h3>공유</h3>
								<p>
									<a
										href="javascript:bugs.facebook2.esAlbum('35860', '밤을 부르는 Dreamlike Music #4 (국내)', 'COCO');"
										onclick="bugs.wiselog.area('S_mab_02_03');" class="facebook"
										aria-label="새창">페이스북 공유하기</a> <a
										href="javascript:bugs.twitter.esAlbum('35860', '밤을 부르는 Dreamlike Music #4 (국내)', 'COCO');"
										onclick="bugs.wiselog.area('S_mab_02_03');" class="twitter"
										aria-label="새창">트위터 공유하기</a> <a
										href="javascript:bugs.kakao.story2('https://music.bugs.co.kr/musicpd/albumview/35860');"
										onclick="bugs.wiselog.area('S_mab_02_03');" class="kakaostory"
										aria-label="새창">카카오스토리 공유하기</a> <a href="javascript:"
										onclick="bugs.layermenu.openShareUrlLayer('ESALBUM',this,'35860', event);"
										class="link" aria-label="새창">링크 공유하기</a>
								</p>
							</div>

							<script>
                        function commonSnsShare(snsType) {
                           if (snsType == "FACEBOOK") {
                              bugs.sns.facebook(bugsSnsParam);
                           } else if (snsType == "TWITTER") {
                              bugs.sns.twitter(bugsSnsParam);
                           } else if (snsType == "KAKAOSTORY") {
                              bugs.sns.kakaostory(bugsSnsParam);
                           }
                        }
                     </script>
						</div>
						<!-- 기타 정보 -->
					</div>
				</section>

				<!-- 이벤트 -->
				<section class="sectionPadding contents">
					<div class="innerContainer">
						<header class="sectionTitle">
							<h1>수록곡</h1>
							<p class="desc" id="totalTrackCnt">
								<%-- ${pageMaker.total} --%>
							</p>
						</header>

						<div id="ESALBUM35860">
							<table class="list trackList ">
								<caption>곡 목록</caption>
								<thead>
									<tr>
										<th scope="col" class="no">번호</th>
										<th scope="col" class="title">곡</th>
										<th scope="col" class="artist">아티스트</th>
										<th scope="col" class="album">앨범</th>
										<!-- <th scope="col" class="action mv"><span>영상</span></th>
                              <th scope="col" class="action etc"><span>기타</span></th> -->
									</tr>
								</thead>

								<tbody>
									<tr>
										<td class="no">1</td>
										<td scope="left">
											<p class="title" adult_yn="N">
												<c:out value="${list.m_title01}" />
											</p>
										</td>
										<td class="left">
											<p class="artist" adult_yn="N">
												<c:out value="${list.m_artist01}" />
											</p>
										</td>
										<td class="left">
											<p class="album" adult_yn="N">
												<c:out value="${list.m_album01}" />
											</p>
										</td>
									</tr>

									<tr>
										<td class="no">2</td>
										<td scope="left">
											<p class="title" adult_yn="N">
												<c:out value="${list.m_title02}" />
											</p>
										</td>
										<td class="left">
											<p class="artist" adult_yn="N">
												<c:out value="${list.m_artist02}" />
											</p>
										</td>
										<td class="left">
											<p class="album" adult_yn="N">
												<c:out value="${list.m_album02}" />
											</p>
										</td>
									</tr>

									<tr>
										<td class="no">3</td>
										<td scope="left">
											<p class="title" adult_yn="N">
												<c:out value="${list.m_title03}" />
											</p>
										</td>
										<td class="left">
											<p class="artist" adult_yn="N">
												<c:out value="${list.m_artist03}" />
											</p>
										</td>
										<td class="left">
											<p class="album" adult_yn="N">
												<c:out value="${list.m_album03}" />
											</p>
										</td>
									</tr>

									<tr>
										<td class="no">4</td>
										<td scope="left">
											<p class="title" adult_yn="N">
												<c:out value="${list.m_title04}" />
											</p>
										</td>
										<td class="left">
											<p class="artist" adult_yn="N">
												<c:out value="${list.m_artist04}" />
											</p>
										</td>
										<td class="left">
											<p class="album" adult_yn="N">
												<c:out value="${list.m_album04}" />
											</p>
										</td>
									</tr>

									<tr>
										<td class="no">5</td>
										<td scope="left">
											<p class="title" adult_yn="N">
												<c:out value="${list.m_title05}" />
											</p>
										</td>
										<td class="left">
											<p class="artist" adult_yn="N">
												<c:out value="${list.m_artist05}" />
											</p>
										</td>
										<td class="left">
											<p class="album" adult_yn="N">
												<c:out value="${list.m_album05}" />
											</p>
										</td>
									</tr>

									<tr>
										<td class="no">6</td>
										<td scope="left">
											<p class="title" adult_yn="N">
												<c:out value="${list.m_title06}" />
											</p>
										</td>
										<td class="left">
											<p class="artist" adult_yn="N">
												<c:out value="${list.m_artist06}" />
											</p>
										</td>
										<td class="left">
											<p class="album" adult_yn="N">
												<c:out value="${list.m_album06}" />
											</p>
										</td>
									</tr>

									<tr>
										<td class="no">7</td>
										<td scope="left">
											<p class="title" adult_yn="N">
												<c:out value="${list.m_title07}" />
											</p>
										</td>
										<td class="left">
											<p class="artist" adult_yn="N">
												<c:out value="${list.m_artist07}" />
											</p>
										</td>
										<td class="left">
											<p class="album" adult_yn="N">
												<c:out value="${list.m_album07}" />
											</p>
										</td>
									</tr>

									<tr>
										<td class="no">8</td>
										<td scope="left">
											<p class="title" adult_yn="N">
												<c:out value="${list.m_title08}" />
											</p>
										</td>
										<td class="left">
											<p class="artist" adult_yn="N">
												<c:out value="${list.m_artist08}" />
											</p>
										</td>
										<td class="left">
											<p class="album" adult_yn="N">
												<c:out value="${list.m_album08}" />
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</section>

				<section class="sectionPadding contents">
					<div class="innerContainer">
						<header class="sectionTitle">
							<h1>리스트 소개</h1>
						</header>

						<div class="mPDAlbumContents top">
							<p>
								<c:out value="${list.m_contents}" />
							</p>
						</div>
					</div>
				</section>

				<div id="reply">
					<section class="sectionPadding contents02">
						<div class="innerContainer">
							<header class="sectionTitle">
								<h1>한마디</h1>
							</header>
						</div>
					</section>

					<c:if test="${user == null}">
						<p style="margin-left: 40px;">
							댓글을 남기시려면 <a href="/user/login">로그인</a>&nbsp;해주세요
						</p>
					</c:if>

					<c:if test="${user != null}">
						<section class="reply-form">
							<form role="form" method="post" autocomplete="off">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="pageNum"
									value="${pageMaker.cri.pageNum}"> <input type="hidden"
									name="amount" value="${pageMaker.cri.amount }"> <input
									type="hidden" name="type" value="${pageMaker.cri.type }">
								<input type="hidden" name="keyword"
									value="${pageMaker.cri.keyword }"> <input type="hidden"
									name="m_no" value="${list.m_no}" />

								<div class="input-area">
									<textarea name="r_contents" id="r_contents"
										placeholder="(이쪽을 클릭하시면 리뷰를 작성할 수 있습니다.)"
										style="font-family: Noto Sans KR, sans-serif; font-weight: 500; font-size: 12pt; color: #000;"></textarea>
								</div>

								<div class="input-area">
									<button type="submit" id="reply_btn">등록하기</button>
									<br> <br> <br>
									<script>
                                       $("#reply_btn").click(function () {
                                 var formObj = $(".reply-form form[role='form']");
                                            var m_no = $("#m_no").val();
                                            var r_contents = $("#r_contents").val()
                                            var data = {
                                                m_no : m_no,
                                                r_contents : r_contents
                                             };
                                             $.ajax({
                                                url : "/user/board/moodView",
                                               type : "post",
                                              data : data,
                                               success : var m_no = ${list.m_no};
                                                $.getJSON("/user/board/moodReplyList" + "?m_no="   + m_no,
                                                   function (data) {
                                                       var str = "";

                                                        $(data).each(function() {
                                                           var r_date = new Date(this.r_date);
                                                            r_date = r_date.toLocaleDateString("ko-US")

                                                            str += "<li data-m_no='" + this.m_no + "'>"
                                                                + "<div class='userInfo'>"
                                                                  + "<span class='u_name'>" + this.u_name   + "&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp" + "</span>"
                                                                  + "<span class='date'>"   + r_date + "&nbsp&nbsp&nbsp" + "</span>"
                                                                  + "<span class='report'>" + "<img src='../../../resources/img/images/alarm.png'>" + "</span>"
                                                                  + "</div>"
                                                                  + "<div class='replyContent'>" + this.r_contents + "</div>"
                                                                  + "<hr>"
                                                                  + "</li>";
                                                            });

                                                            $("section.reply-list ol").html(str);
                                                         });
                                                });
                                                });
                                          </script>
								</div>
							</form>
						</section>
					</c:if>

					<section class="reply-list">
						<section class="sectionPadding contents02">
							<ol>
								<%-- <c:forEach items="${reply}" var="reply">
                                  <li>
                                       <div class="userInfo">
                                           <span class="u_name">${reply.u_name}</span>
                                           <span class="date">
                                              <fmt:formatDate value="${reply.r_date}" 
                                                 pattern="yyyy-MM-dd" /></span>
                                       </div>
                                       <div class="replyContent">${reply.r_contents}</div>
                                  </li>
                                 </c:forEach> --%>
							</ol>

							<script>
                              var m_no = ${list.m_no};
                              $.getJSON("/user/board/moodReplyList" + "?m_no=" + m_no, function(data) {
                              var str = "";

                                $(data).each(function () {
                                    var r_date = new Date(this.r_date);
                                    r_date = r_date.toLocaleDateString("ko-US")
                                    
                                     str += "<li data-m_no='" + this.m_no + "'>"
                                        + "<div class='userInfo'>"
                                          + "<span class='u_name'>" + this.u_name   + "&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp" +"</span>"
                                          + "<span class='date'>" + r_date + "&nbsp&nbsp&nbsp" + "</span>"
                                          + "<span class='report'>" + "<img src='../../../resources/img/images/alarm.png'>" + "</span>"
                                          + "</div>"
                                           + "<div class='replyContent'>" + this.r_contents + "</div>"
                                         + "<hr>" 
                                         + "</li>";
                                     });

                                   $("section.reply-list ol").html(str);
                                 });
                           </script>

						</section>
					</section>


				</div>
				<!-- reply -->


			</article>
		</div>
		<!-- .page-body -->
	</div>
	<!-- #productDetail -->
</div>
<!-- #content -->



<%@ include file="../../includes/footer.jsp"%>