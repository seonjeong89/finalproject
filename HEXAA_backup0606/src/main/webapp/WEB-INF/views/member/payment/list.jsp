<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
   <style>
      * {
         font-size: 14px;
      }
      
      label {
         margin-bottom: 0;
      }
      
      div.table1 {
         max-height: 310px;
         overflow-y: auto; 
      }
      
      div.table2 {
         max-height: 310px;
         overflow-y: scroll;
      }
      
      div.table3 {
         max-height: 310px;
         overflow-y: scroll;  
      }
      
      .table-head-fixed th {
         padding-top: 0.3em;
         padding-bottom: 0.3em;
      }
      .table-head-fixed td {
         padding-top: 0.3em;
         padding-bottom: 0.3em;
      }
      
       .card-body.p-0 .table thead>tr>th:first-of-type {
         padding-left: 12px;
      }
       .card-body.p-0 .table tbody>tr>td:first-of-type {
         padding-left: 12px;
      }
      .card-body.p-0 .table thead>tr>th:last-of-type {
         padding-right: 12px;
      }
       .card-body.p-0 .table tbody>tr>td:last-of-type {
         padding-right: 12px;
      }
      
      
      th, td {
         text-align: center;
      }
      #tb1 td, #td1 th {
         padding:0;
      }
      
      
      .alert {
         text-align: center;
      }
      .alert {
         font-size: 15px;
      }
      
      .alert-dismissible {
          padding-right: 0;
          padding-left: 0;
      }
   </style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- iamport.payment.js -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
   <section class="content-header">
      <div class="container-fluid">
         <div class="row md-2">
            <div class="col-sm-6" style="display: flex;">
               <h1 data-userId="${loginUser.id }">??????</h1>
               <!--                ??????????????? ?????? -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '??????') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                ??????????????? ???????????? ?????? -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '??????') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
               
            </div>
            
         </div>
      </div>
   </section>
<section class="content">
      <div class="container-fluid">
         <div class="row">
            <div class="col-sm-12">
               <div class="card card-light card-outline">
                  <div class="card-header p-0 pt-1"   style="border-bottom-color:  white;">
                     <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                        <li class="nav-item"><a class="nav-link active"
                           id="custom-tabs-one-home-tab" data-toggle="pill"
                           href="#custom-tabs-one-home" role="tab"
                           aria-controls="custom-tabs-one-home" aria-selected="true" >?????? ??????</a></li>
                        <li class="nav-item"><a class="nav-link"
                           id="custom-tabs-one-profile-tab" data-toggle="pill"
                           href="#custom-tabs-one-profile" role="tab"
                           aria-controls="custom-tabs-one-profile" aria-selected="false">?????? ??????</a>
                        </li>
                     </ul>
                  </div>
                  <div class="card-body" style="padding-top: 5px; height: 420px;">
                  <div class="row">
                  <div class="col-sm-10"></div>
                  <div class="col-sm-2">
                  <select id="pStudentList" class="form-control" style="margin-bottom: 10px; margin-top: 10px;">
                           <option id="">??????</option>
                           <c:forEach items="${pStudentList}" var="payment">
                           <option id="${payment.studentId}" ${payment.studentId eq selectedStudentId ? 'selected':'' }>${payment.studentName}</option>
                           </c:forEach>
                        </select>
                  </div>
                  </div>
                     <div class="tab-content" id="custom-tabs-one-tabContent">
                        <div class="tab-pane fade active show table1" id="custom-tabs-one-home"
                        role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                           <table class="table table-head-fixed table-bordered">
                              <thead>
                                 <tr>
                                    <th>?????????</th>
                                    <th>?????????</th>
                                    <th>??????</th>
                          
                                    <th>?????? ??????</th>
                                    <th>?????? ?????????</th>
                                    
                                    <th>????????? ?????????
                                       <a href="#" data-toggle="tooltip" title="?????? ????????? ?????? ??????????????????. ?????? ?????? ?????? ???????????? ????????? ???????????????." style="color: black;">
                                            <i class="fa-solid fa-circle-question" id="lastpay" >
                                          </i> 
                                       </a>   
                                    </th>
                                    <th>?????? ????????? 
                                       <a href="#" data-toggle="tooltip" title="?????? ????????? ?????? ?????? ????????? ?????????. ????????? ???  ?????? ????????? ???????????????." style="color: black;">
                                          <i class="fa-solid fa-circle-question" id="payexpect">
                                          </i>
                                       </a>
                                    </th>


                                    <th>??????</th>
                                 </tr>
                                 
                              
                                 <c:if test="${not empty paymentList }">
                                 <c:forEach items="${paymentList }" var="payment">
                                 <tr>
                                      
                                    <td id="${payment.studentId}">${payment.studentName}</td>
                                    <td style="text-align:left;max-width: 180px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;" id="${payment.lessonassignmentId}">${payment.lessonName}</td>
                                    <td>
	                                 	<button id="${payment.lessonassignmentId }" type="button" class="btn btn-sm btn-light viewDetailBtn" >??????</button>
                                    </td>
                                    
                                    <td style="text-align: right;">
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${payment.lessonPrice}"/>???</td>
                                    <td>
                                    <div class="row">
                                    <input class="col-sm-6" type="number" name="text" size="10" min="1" max="12" value="1" style="width:100%; height100%; padding-right: 0px; margin: 0px;"  id="target" value="">
                                    <label class="col-sm-6" style="padding-left: 0px; padding-top:5px; margin: 0px;">??????</label>
                                    </div>
                                    </td>
                                    
                                    
                                     <c:if test="${not empty payment.paymentDate }">
                                     <td><fmt:formatDate value="${payment.paymentDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    
                                    <td>
                                    <fmt:parseDate var="startDateString" value="${payment.paymentDuedate}" pattern="yyyyMMdd" />
                                    <fmt:formatDate value="${startDateString }" pattern="yyyy-MM-dd" />
                                    </td>
                                    </c:if>
                                    <c:if test="${empty payment.paymentDate }" >   
                                      <td colspan="2">
                                      * ????????? ???????????? ???????????????.
                                      </td>
                                     </c:if>
                                    <td style="padding-top: 10px;"><button class="paymentBtn " type="button" style="border: 0px; background-color:#9674d3cf; color: white; border-radius: 4px;">??????</button></td>
                                  
                                  
                                    </tr>
                                  </c:forEach> 
                                 
                                   </c:if>   
                                   <c:if test="${empty paymentList }" >   
                                   <tr>
                                    <td><br></td>
                                    <td><br></td>
                                    <td><br></td>
                                    <td><br></td>
                                    <td><br></td>
                                    <td><br></td>
                                    <td><br></td>
                                 
                                 </tr>
                                 
                                   * ?????? ????????? ????????? ????????????. 
                                   </c:if>
                              </thead>
                           </table>      
                        </div>
                    
                     <div class="tab-pane fade table1" id="custom-tabs-one-profile"
                     role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
                        <table class="table table-head-fixed table-bordered">
                              <thead>
                                 <tr>
                                    <th>?????????</th>
                                    <th>?????????</th>
                                    <th>?????????</th>
                                    <th>????????????</th>
                                    <th>?????? ?????? ???</th>
                                    <th>????????????</th>
                                    
                                    
                                 </tr>
                                 <c:forEach items="${paymentList2 }" var="payment2">
                                 <tr>
                                     <td>${payment2.studentName}</td>
                                    <td style="text-align: left;">${payment2.lessonName}</td>
                                     <td><fmt:formatDate value="${payment2.paymentDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>

                                    <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${payment2.lessonPrice}"/>???</td>
                                    <td>${payment2.paymentMonths}??????</td>
                                    <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${payment2.paymentPrice}"/>???</td>
                                 </tr>   
                                 </c:forEach>
                              </thead>
                        </table>      
                     </div>
                  </div>
                  </div>
               </div>
            </div>

            <div class="col-sm-12">
      <section class="content">
         <div class="card">
            <div class="card-header" style="background-color: #9674d3cf; color:white;">
               <div>   
                  <h5 class="card-title">??????????????? 1?????? ????????? ??????</h5>
               </div>
               
               <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                     <i class="fas fa-minus"></i>
                  </button>
               </div>
               
            </div>
            <div class="card-body" style="font-size: 90%">
               ??? ??? ??????????????? 1/3 ?????? ???  : ?????? ????????? ???????????? 2/3??? ???????????? ?????? <br>
               ??? ??? ??????????????? 2/3 ?????? ???  : ?????? ????????? ???????????? 1/2??? ???????????? ?????? <br>
               ??? ??? ??????????????? 1/3 ?????? ???  : ???????????? ??????
            </div>
         </div>
      </section>
      
      
   </div>
   <div class="col-sm-12">
      <section class="content">
         <div class="card">
            <div class="card-header" style="background-color: #9674d3cf; color:white;">
               <h5 class="card-title">??????????????? 1?????? ????????? ??????</h5>
               <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                     <i class="fas fa-minus"></i>
                  </button>
               </div>
            </div>
            <div class="card-body" style="font-size: 90%">
               ??? ?????? ?????? ???  : ?????? ????????? ???????????? ?????? ?????? <br>
               ??? ???????????? ???   : ??????????????? ????????? ?????? ?????? ???????????? ???????????? (??????????????? 1?????? ????????? ????????? ????????? ?????? ????????? ??????) ????????? ?????? ????????? ?????? ????????? ????????? ??????
<!--                         &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; -->
                                 
            </div>
         </div>
      </section>
      
      
      <div id="parentEmail" style="display: none;">
                     ${loginUser.parentEmail}
               </div>
      <div id="parentName" style="display: none;">
                    ${loginUser.parentName}
               </div>

      
   </div>
</div>
</div>

</section>

<script>

   var button = document.querySelector("#lastpay");
   button.addEventListener("mouseover", hovered, false);
   function hovered(e) {
       console.log("Hovered!");
   }
	$(function () {
        $('[data-toggle="tooltip"]').tooltip()
      });
   
</script>   

<script>   


var v1_1 = 'custom-tabs-one-profile-tab';
var v1_2 = 'custom-tabs-one-home-tab';
var v2_1 = 'custom-tabs-one-profile';
var v2_2 = 'custom-tabs-one-home';


var v_active='${active}';
window.onload=function(){
   
	$(".viewDetailBtn").on("click",function(){
		let lessonAssignmentId = $(this).attr("id"); 
	 	OpenWindow('/common/lesson/detail.do?lessonAssignmentId='+lessonAssignmentId,'?????? ????????????',800,700);
		 
	 });
	
   if(v_active == v1_1){
      $('#'+ v1_1).addClass("active")
      $('#'+ v1_2).removeClass("active")
      $('#'+ v2_1).addClass("active show")
      $('#'+ v2_2).removeClass("active show")
      
   }else {
      $('#'+ v1_1).removeClass("active")
      $('#'+ v1_2).addClass("active")   
      $('#'+ v2_1).removeClass("active show")
      $('#'+ v2_2).addClass("active show")   
   }
   
   $("#pStudentList").on("change",function(){
      var pStudentId =  $("#pStudentList option:selected").attr("id");
      
      
      console.log(pStudentId);
      
      
   window.location.href='/member/payment/list.do?studentId='+pStudentId+'&active='+$(".nav-link.active").attr("id");
     // console.log("ppp",$(".nav-link.active").attr("id"));
   
     
   });
   
   var button = document.querySelector("#lastpay");
   button.addEventListener("mouseover", hovered, false);
   function hovered(e) {
       console.log("Hovered!");
   }
   $(function () {
        $('[data-toggle="tooltip"]').tooltip()
      })
   
   $(".paymentBtn").on("click",function(){
      var unitPrice = $(this).parent().parent().children().eq(3).text().trim().replace("???","").replace(",","");
      console.log(unitPrice);
       var monthsList = $(this).parent().parent().children().eq(4).children().children().val();
      console.log(monthsList);
   /*     var monthsList =  $("#monthsList option:selected").val();  */
      
      var totalPrice = unitPrice * monthsList;



	  console.log(totalPrice);

//       console.log(this);
      console.log(unitPrice);
      console.log(monthsList);
       	console.log(totalPrice);
      
       requestPay(totalPrice,$(this));
  //    payTest(totalPrice,$(this));
   });
   

    
};

</script>

 
<script>
<%--       function payTest(totalPrice,obj){
         let abc = '${loginUser.id}';
       let msg = '????????? ?????????????????????.';
/*  var pStudentId =  $("#pStudentList option:selected").attr("id");  */
      var pStudentId =  obj.parent().parent().children().eq(0).attr("id"); 
      console.log(pStudentId);
      var lessonAssignmentId =  obj.parent().parent().children().eq(1).attr("id");
      
      console.log(lessonAssignmentId);
      var paymentMonths = obj.parent().parent().children().eq(5).children().children().val();
   /*  var paymentDate = obj.parent().parent().children().eq(2).children().children().val();
    console.log(paymentDate);  
   var paymentDuedate = paymentDate + (paymentMonths*30); 
     console.log(paymentDuedate); 
       */
      // ??????????????? ???????????? ???????????? DB??? ???????????? ??????
     // ??????????????? ??????????????? ???????????? ?????? ?????????.
     $.ajax({
        url: "<%=request.getContextPath()%>/member/payment/regist",
        anyne:true,
        type: "POST",
        data: JSON.stringify ({
           "paymentId": "50",
           "paymentPrice": "55",
           
            "parentId": abc,
            "studentId": pStudentId,
            "lessonassignmentId": lessonAssignmentId,
             "paymentDuedate":"20220427",
            "paymentMonths" : paymentMonths
           
        }),
        contentType:"application/json; charset=UTF-8",
        dataType: "json",
        success: function (result) {
           if (result.insertResult == "success") {
              $("form[role='form']").submit();
              console.log(msg);
              
           } else {
              alert("DB????????????");
              return false;
           }
        }
     });
         
      }
    --%>
   
    
//     function addMonth(date, month) {

    	  
//     	  // month??? ?????? ??????
//     	  let addMonthLastDate = new Date(
//     	    addMonthFirstDate.getFullYear(),
//     	    addMonthFirstDate.getMonth() + 1
//     	    , 0
//     	  );
    	  
//     	  let result = addMonthFirstDate;
//     	  if(date.getDate() > addMonthLastDate.getDate()) 
//     	  {
//     	    result.setDate(addMonthLastDate.getDate());
//     	  } 
//     	  else 
//     	  {
//     	    result.setDate(date.getDate());
//     	  }
    	  
//     	  return result;
//     	}

//     	let janLastDate = new Date(paymentDate);
//     	document.write('------- ?????? ????????? -------<br>');
//     	document.write('???????????? : ' + janLastDate.toLocaleString() + '<br>');
//     	document.write('1??? ??? : ' + addMonth(janLastDate, 1).toLocaleString() + '<br>');
    
    
    
   function requestPay(totalPrice,obj){
      var parentEmail = $("#parentEmail").text().trim();
      var parentName = $("#parentName").text().trim();
      
     
	   let abc = '${loginUser.id}';
      let msg = '????????? ?????????????????????.';
      var pStudentId =  obj.parent().parent().children().eq(0).attr("id"); 
     /*  console.log(pStudentId); */
      var lessonAssignmentId =  obj.parent().parent().children().eq(1).attr("id");
      
     /*  console.log(lessonAssignmentId); */
      var paymentMonths = obj.parent().parent().children().eq(4).children().children().val();
    var paymentDate = obj.parent().parent().children().eq(5).children().children().val();
	//     console.log(paymentDate);  
    var paymentDuedate = moment().add(paymentMonths, 'M').format('YYYYMMDD');
	//      console.log(paymentDuedate); 
      
      
            IMP.init('imp68238428');   //???????????? ???????????????
            //?????? ???????????? ??????????????? ??????
            IMP.request_pay({
               pg: 'html5_inicis',
               pay_method: 'card',
               name: '???????????? ????????? ??????',
                  
               amount: totalPrice, 
               buyer_email: parentEmail,
   
               buyer_name: parentName
            }, function (rsp) {
            	console.log(rsp);
            	let dataSet = {
         				 "paymentId": rsp.merchant_uid,
                        "paymentPrice": rsp.paid_amount,
                       /*   "paymentDate": '${payment.paymentDate}', */
                         "parentId": abc,
                         "studentId": pStudentId,
                         "lessonassignmentId": lessonAssignmentId,
                          "paymentDuedate": paymentDuedate,
                         "paymentMonths" : paymentMonths
         		}
         
         		console.log(dataSet);
               if (rsp.success) {
                  let msg = '????????? ?????????????????????.';
                  msg += rsp.buyer_name;
                  msg += rsp.paid_amount;
                  
                  $('#paymentNo').val(rsp.merchant_uid);
                  $('#totalPrice').val(rsp.paid_amount);
   
                  // ??????????????? ???????????? ???????????? DB??? ???????????? ??????
                  // ??????????????? ??????????????? ???????????? ?????? ?????????.
                  $.ajax({
                     url: "<%=request.getContextPath()%>/member/payment/regist",
                     anyne:true,
                     type: "POST",
                     data: JSON.stringify(dataSet),
                     contentType:"application/json; charset=UTF-8",
                     dataType: "json",
                     success: function (result) {

//                         if (result.insertResult == "success") {
//                            $("form[role='form']").submit();
//                            console.log(msg);
//                            console.log(paymentId);
//                            alert("????????? ?????????????????????.");
//                       	/* 	location.reload(); */
//                         } else {
                        	
//                            alert("DB????????????");
//                            return false;
//                         }

                          Swal.fire({
      				        icon: 'success',
      				        title: '????????? ?????? ???????????????!'
      				        
      				    });
                           setTimeout(function() {
       				    	location.reload();
       			    		}, 2000);

                     }
                  });
               } else {
                  alert("??????");
                  let msg = '????????? ?????????????????????.';
                  msg += '\n???????????? : ' + rsp.error_msg;
               }
               console.log(msg);
              
            }); 
            
         }
   </script> 