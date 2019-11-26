<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
   
<%@ include file="../../includes/header.jsp" %>
<%@ include file="../../includes/nav.jsp" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<link rel="stylesheet" href="/resources/css/user/prd_view.css">

<div id="contentWrap">
   <div id="content">
      <div id="productDetail">

      <div class="loc-navi">
         <div class="loc-r">
            <a href="/" class="loc-home">HOME</a> &gt; <a
               href="http://localhost:8090/user/shop/category00">이어폰/헤드폰</a> &gt;
                  <a href="http://localhost:8090/user/shop/category01">이어폰</a>
            </div>
      </div> <br> <br>

      <div class="page-body">
         <div class="thumb-info">
               <div class="thumb-wrap">
                  <div class="thumb">
                      <img class="detail_image" id="lens_img" src="${list.p_thumbImg}"
                           border="0" width="300"><br> <br> <br> <br> <br> <br> <br> 
                        <!-- <span style="font-family: Noto Sans KR, sans-serif; font-weight: 300; 
                           font-size: 20pt; color: #000; float: left;">REVIEW</span> <br> <br> -->
                     </div>
                  </div>
                  
            <!-- .thumb-wrap -->
                  <form name="form1" method="post" id="form1">
                     <input type="hidden" name="brandcode" value="044018000011">
                     <input type="hidden" name="branduid" value="326543"> 
                     <input type="hidden" name="xcode" value="001"> 
                     <input type="hidden" name="mcode" value="001"> 
                     <input type="hidden" name="typep" value="Y"> 
                    <input type="hidden" name="ordertype"> 
                    <input type="hidden" name="opts"> 
                    <input type="hidden" name="mode"> 
                    <input type="hidden" name="optioncode"> 
                    <input type="hidden" name="optiontype"> 
                    <input type="hidden" name="optslist">
                     <input type="hidden" id="price" name="price" value="169,000">
                     <input type="hidden" id="disprice" name="disprice" value="">
                     <input type="hidden" id="price_wh" name="price_wh" value="169,000">
                     <input type="hidden" id="disprice_wh" name="disprice_wh" value="">
                     <input type="hidden" id="option_type_wh" name="option_type_wh" value="PS"> 
                    <input type="hidden" id="prd_hybrid_min" name="prd_hybrid_min" value="1"> 
                    <input type="hidden" name="MOBILE_USE" value="NO"> 
                    <input type="hidden" name="product_type" id="product_type" value="NORMAL"> 
                    <input type="hidden" name="multiopt_direct" value="Y"> 
                    <input type="hidden" name="collbasket_type" value="A"> 
                    <input type="hidden" name="package_chk_val" value="0"> 
                    <input type="hidden" name="miniq" id="miniq" value="1"> 
                    <input type="hidden" name="maxq" id="maxq" value="2147483647"> 
                    <input type="hidden" name="cart_free" value=""> 
                    <input type="hidden" name="opt_type" value="PS"> 
                    <input type="hidden" name="hybrid_op_price" id="hybrid_op_price" value=""> 
                    <input type="hidden" name="spcode">
                    <input type="hidden" name="spcode2">
                    <input type="hidden" id="regular_price" name="regular_price" value="169,000">
                     <input type="hidden" id="discount_price" name="discount_price" value=""> 
                    <input type="hidden" id="discount_type" name="discount_type" value=""> 
                    <input type="hidden" name="uid" value="326543"> 
                    <input type="hidden" id="option_type" name="option_type" value="PS">

                     <div class="info">
                        <h3 class="tit-prd">
                           <span style="font-family: Noto Sans KR, sans-serif; 
                              font-weight: 400; font-size: 20pt; color: #939393;">
                              <c:out value="${list.p_brand}" /><br></span>
                        </h3>
                        
                        <span style="font-family: Noto Sans KR, sans-serif; 
                           font-weight: 500; font-size: 20pt; color: #000;">
                        <c:out value="${list.p_name}" />
                        </span>

                        <div class="subname"></div>

                        <div class="hash_tag">
                           <a href="JavaScript:go_hashtag('옵션할인')">
                              <span style="color: rgb(255, 255, 255); font-size: 12px; font-weight: bold; line-height: 35px; 
                                 background-color: rgb(177, 121, 177); padding: 7px;">#옵션할인</span></a> &nbsp; 
                            <a href="JavaScript:go_hashtag('20만원대이어폰')">
                               <span style="color: rgb(255, 255, 255); font-size: 12px; font-weight: bold; line-height: 35px; 
                                  background-color: rgb(177, 121, 177); padding: 7px;">#20만원대이어폰</span></a> &nbsp; 
                            <a href="JavaScript:go_hashtag('커널형이어폰')">
                               <span style="color: rgb(255, 255, 255); font-size: 12px; font-weight: bold; line-height: 35px; 
                                  background-color: rgb(177, 121, 177); padding: 7px;">#커널형이어폰</span></a> &nbsp; 
                            <a href="JavaScript:go_hashtag('DD이어폰')">
                               <span style="color: rgb(255, 255, 255); font-size: 12px; font-weight: bold; line-height: 35px; 
                                  background-color: rgb(177, 121, 177); padding: 7px;">#DD이어폰</span></a> &nbsp;
                        </div>
                        <hr class="hr">
                        <div class="table-opt">
                           <table>
                                 <tbody>
                                    <tr>
                                       <th scope="row" class="th"><div class="tb-leftleft">판매가격</div><br></th>
                                          <td class="price"><div class="tb-left"><fmt:formatNumber pattern="###,###,###"
										value="${list.p_price }" /></div></td>
                                       </tr>

                                       <tr>
                                          <th scope="row"><div class="tb-leftleft">제품정보</div> <br></th>
                                          <td><div class="tb-left"><c:out value="${list.p_contents}" /></div></td>
                                       </tr>

                                       <tr>
                                          <th scope="row"><div class="tb-leftleft">제조사</div> <br></th>
                                          <td><div class="tb-left"><c:out value="${list.p_brand}" /></div></td>
                                       </tr>
                                       
                                       <tr>
                                         <th scope="row"><div class="tb-leftleft">상품문의</div> <br></th>
                                          <td><div class="tb-left">032-876-3332 ㅣear_fun@naver.com</div></td>
                                       </tr>

                                       <tr>
                                          <c:if test="${list.p_stock != 0}">
                                             <th scope="row"><div class="tb-leftleft">구입수량</div> <br></th>
                                             <td><div class="tb-left">
                                                   <img src="../../resources/img/images/minus.jpg" class="minus"> 
                                                   <input type="number" class="c_stock" 
                                                      min="1" max="${list.p_stock}" value="1" readonly="readonly" /> 
                                                   <img src="../../resources/img/images/plus.jpg" class="plus">
                                                </div></td>
                                          </c:if>
                                          
                                          <c:if test="${list.p_stock == 0}">
                                             <th scope="row">
                                                <p class="soldout">품절 또는 판매가 중지된 상품입니다.</p></th>
                                          </c:if>
                                       </tr>
                                       
                                       <tr>
                                          <td colspan="3">
                                             <table cellpadding="0" cellspacing="0" border="0">
                                                   <tbody class="twoBtn">
                                                      <tr>
                                                         <td width="240">
                                                            <a href="javascript:g_detail_cart_add_pc('buy')">
                                                               <img src="../../resources/img/images/buy.jpg" border="0"></a>
                                                            </td>
                                                            
                                                         <td width="20"></td>
                                                         <td width="240">
                                                            <a href="javascript:g_detail_cart_add_pc('add')" class="btCart">
                                                            <img src="../../resources/img/images/cart.jpg" border="0"></a></td>
                                                      </tr>
                                                   </tbody>
                                             </table>
                                          </td>
                                       </tr>
                                    </tbody>
                              </table>
                           </div>
                           <br>
                           <!-- .table-opt -->

                        </div>
                        <!-- .info -->
                     </form>
               </div>


            <!-- .thumb-info -->
            <div id="reply">
            <section class="sectionPadding contents02">
               <div class="innerContainer">
                  <header class="sectionTitle">
                     <h1>상품 후기</h1>
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
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                     <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
                     <input type="hidden" name="amount" value="${pageMaker.cri.amount }"> 
                     <input type="hidden" name="type" value="${pageMaker.cri.type }">
                     <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> 
                     <input type="hidden" name="p_no" value="${list.p_no}" />
                        
                              <div class="input-area">
                        <textarea name="r_contents" id="r_contents"
                           placeholder="(이쪽을 클릭하시면 리뷰를 작성할 수 있습니다.)"
                           style="font-family: Noto Sans KR, sans-serif; 
                           font-weight: 500; font-size: 12pt; color: #000;"></textarea>
                     </div>
                  
                           <div class="input-area">
                        <button type="submit" id="reply_btn">등록하기</button> <br> <br> <br>
                                    
                                    <script>
                                       var csrfHeaderName = "${_csrf.headerName}";
                                       var csrfTokenValue = "${_csrf.token}";
                                             $(".btCart").click(function(){
                                               var p_no = ${list.p_no};
                                                var c_stock = $(".c_stock").val();
                                                   
                                                var data = {
                                                     p_no : p_no,
                                                     c_stock : c_stock
                                                };
                                                
                                                $.ajax({
                                                    url : "/user/shop/addCart",
                                                    type : "post",
                                                    data : data,
                                                    beforeSend : function(xhr){
                                                         xhr.setRequestHeader(
                                                         csrfHeaderName, csrfTokenValue);
                                                   },
                                                    success : function(result){
                                                        alert("장바구니에 담겼습니다.");
                                                        $(".c_stock").val("1");
                                                    },
                                                    error : function(){
                                                        alert("로그인 후 이용할 수 있습니다.");
                                                    }
                                                });
                                          });
                                    </script>
                                    
                                    <script>
                                       $(document).on("click", ".plus", function(){
                                            var num = $(".c_stock").val();
                                             var plusNum = Number(num) + 1;
                                        
                                             if (plusNum >= ${list.p_stock}) {
                                                 $(".c_stock").val(num);
                                            } else {
                                                 $(".c_stock").val(plusNum);          
                                            }
                                          });
                                   </script>
                                   
                                    <script>
                                          $(document).on("click", ".minus", function(){

                                          var num = $(".c_stock").val();
                                             var minusNum = Number(num) - 1;
                                          
                                             if (minusNum <= 0) {
                                                 $(".c_stock").val(num);
                                             } else {
                                                 $(".c_stock").val(minusNum);          
                                             }
                                          });
                                    </script>
                                    
                                    <script>
                                       $("#reply_btn").click(function () {
                                          var formObj = $(".reply-form form[role='form']");
                                          var p_no = $("#p_no").val();
                                            var r_contents = $("#r_contents").val()
                                            var data = {
                                                 p_no : p_no,
                                                 r_contents : r_contents
                                            };

                                            $.ajax({
                                                url : "/user/shop/shopView",
                                                  type : "post",
                                                 data : data,
                                                 success : var p_no = ${list.p_no};
                                                     $.getJSON("/user/shop/replyList" + "?p_no=" + p_no, 
                                                        function (data) {
                                                           var str = "";

                                                           $(data).each(function() {
                                                               var r_date = new Date(this.r_date);
                                                                r_date = r_date.toLocaleDateString("ko-US")

                                                               str += "<li data-p_no='" + this.p_no + "'>"
                                                                     + "<div class='user-info'>"
                                                                     + "<span class='u_name'>" + this.u_name   + "&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp" + "</span>"
                                                                     + "<span class='date'>"   + r_date + "</span>"
                                                                     + "</div>"
                                                                     + "<div class='r_contents'>" + this.r_contents + "</div>"
                                                                     /* + "<hr>" */
                                                                     + "</li>";
                                                            });

                                                            $("section.reply-list ul").html(str);
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
                           <ol></ol>
                        
                           <script>
                              var p_no = ${list.p_no};
                              $.getJSON("/user/shop/replyList" + "?p_no=" + p_no, 
                                 function (data) {
                                       var str = "";

                                       $(data).each(function () {
                                          var r_date = new Date(this.r_date);
                                          r_date = r_date.toLocaleDateString("ko-US")

                                          str += "<li data-p_no='" + this.p_no + "'>"
                                          + "<div class='userInfo'>"
                                             + "<span class='u_name'>" + this.u_name   + "&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp" +"</span>"
                                             + "<span class='date'>"   + r_date + "</span>"
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
         </div>
         <!-- .page-body -->
      </div>
      <!-- #productDetail -->
   </div>
   <!-- #content -->
</div>

<%@ include file="../../includes/footer.jsp" %>