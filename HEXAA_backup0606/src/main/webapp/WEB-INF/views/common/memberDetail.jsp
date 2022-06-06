<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<title>회원상세정보</title>
</head>
<body>

	<div class="card card-dark card-outline col-sm-12" >
		<div class="card-header" style="">회원상세정보</div>
		<div class="card-body" style="border: 0.1px solid rgba(33, 33, 33, 0.1);">
			<div class="row" style="padding: 0px; margin: 0px;">
				<div class="col-sm-6" style="margin: 0px; border: 1px solid white; border-radius: 15px; height: 220px;">
					<div class="col-sm-12" style="border: 1px solid white; height: 30vh; text-align: center; padding-bottom: 5vh;">
						<div id="profile" style="border-radius: 100%; height: 40vh; width: 40vh; margin-left: 5vh; margin-top: 3vh;"></div>
					</div>
				</div>



				<div class="col-sm-6"
					style="padding: 5px; margin-top: 5px; border: 1px solid white; border-radius: 15px; height: 220px;">
					<div class="row">
						<div class="col-sm-12" style="height: 28vh; border: 1px solid white;">
									<table class="table table-head-fixed table-bordered">
										<tbody>
											<tr>
												<td style="background-color: rgb(32, 73, 105); color: white;">이름</td>
												<td style="display: flex;">
													<span style="margin-left: 45px;">${studentDetail.name }</span>&nbsp;&nbsp;&nbsp;
											      	<a class="nav-link" role="button" style="padding: 0px; margin-left: 5px;">
											        	<i data-id="${studentDetail.id }" class="fa-regular fa-paper-plane"></i>
											      	</a>
												</td>
											</tr>
											<tr>
												<td style="background-color: rgb(32, 73, 105); color: white;">전화번호</td>
												<td>${studentDetail.hp }</td>
											</tr>
											<tr>
												<td style="background-color: rgb(32, 73, 105); color: white;">반</td>
												<td>${studentDetail.zipCode }</td>
											</tr>
											<tr>
												<td style="background-color: rgb(32, 73, 105); color: white;">학교</td>
												<td>${studentDetail.schoolName }</td>
											</tr>
											<tr>
												<td style="background-color: rgb(32, 73, 105); color: white;">학년</td>
												<td>${studentDetail.grade }</td>
											</tr>
											<tr>
												<td style="background-color: rgb(32, 73, 105); color: white;">학부모</td>
												<td>${studentDetail.genderCode }</td>
											</tr>
											<tr>
												<td style="background-color: rgb(32, 73, 105); color: white;">전화번호</td>
												<td>${studentDetail.email }</td>
											</tr>
											
										</tbody>
									</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
window.onload=function(){

	$(".fa-paper-plane").on("click",function(){
		let studentId = $(this).attr("data-id");
		window.open('/common/noteReplyForm.do?noteSendUserId='+studentId+'&from=detail','pop_Notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=440,height=610,top=200,left=200');
	});
	
	let id = '${studentDetail.id }';
	
	//alert('get picture 실행 테스트');
	 $('div#profile').css({'background-image':'url('+"/manager/membermanagement/getPicture.do?id="+id+')',
         'background-position':'center',
         'background-size':'cover',
	     'background-repeat':'no-repeat'
         });
	 
}

</script>	
</body>
