<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<title>HEXA System</title>

	
<head>
</head>

<body>
	
   <iframe id="ifr" name="ifr" src="" frameborder="0" style="width:100%;height:85vh;"></iframe>
  
   
   
   
	<script>	
		function goPage(url,mCode){
			$('iframe[name="ifr"]').attr("src",url);
			
// 			HTML5 지원브라우저에서 사용 가능
			if (typeof(history.pushState) == 'function') {
			    //현재 주소를 가져온다.
			    var renewURL = location.href;
			    //현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
			    renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);
			    
			    if (mCode != 'M000000') {
			        renewURL += "?mCode="+mCode;
			    }
// 			    //페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
			    history.pushState(mCode, null, renewURL);
			 
			} else {
			    location.hash = "#"+mCode;
			}
		}
	</script>
	
	<script>
		window.onload=function(){
			goPage('<%=request.getContextPath()%>/parent/main.do');
		}
		
		function locationreloadss(id) {
			/* location.href = "/parent/index.do?id="+id; */
			console.log("test");
		};
	</script>
	
	
</body>








