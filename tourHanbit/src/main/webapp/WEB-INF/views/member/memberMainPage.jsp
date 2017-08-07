<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.mySlides {display:none}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}

.eventleft {
    width: 50%;
    float: left;
    padding: 20px;
	border: 1px solid gray;
	border-radius:6px;
 	}
 	.eventLeftIn{
 	width: 50%;
    float: left;
 	}

 .eventRight{
    width: 50%;
    float: left;
    padding: 10px;
	border: 1px solid gray;
	border-radius:6px;
	}
	.eventRightIn{
	width: 100%;
    float: left;
    
	}
	.eventRightInIn1{
	width: 35%;
    float: left;
    padding: 5px;

	}
	.eventRightInIn2{
	width: 300px;
    height: 110px;
    float: left;
	overflow: scroll;
	}
	.bar1{
	color: white;
	background-color:#337ab7;
	border-color:#2e6da4;
	width: 25%;
	float: left;
	padding: 8px;
    border-bottom-left-radius: 5px;
    border-top-left-radius: 5px;
    
}
.bar11{
	color: white;
	background-color:#337ab7;
	border-color:#2e6da4;
	width: 25%;
	float: left;
	padding: 8px;
    
}
.bar12{
	color: white;
	background-color:#337ab7;
	border-color:#2e6da4;
	width: 50%;
	float: left;
	padding: 8px;
    border-bottom-right-radius: 5px;
    border-top-right-radius: 5px;
}
.bar2{
	color: white;
	background-color:#337ab7;
	border-color:#2e6da4;
	padding: 8px;
    border-radius: 5px;
}
.container{
	padding-left: 100px;
	width:100%;
	}

.col-md-4{

}


</style>
</head>
<body>

<p>
			
			<div class="w3-content w3-display-container" >
			<c:forEach items="${main }" var="m">
				<a href="listSubPackage.do?item_key=${m.item_key }"><img class="mySlides w3-animate-fading" src="/tourapp/resources/img/${m.image01 }" style="height:400px;width:980px; border-radius: 3px;"></a>
			</c:forEach>
			  
			   <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
			    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
			    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
			    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
			    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
			    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
			  </div>
			</div>

			<script>
			//fading 자동 슬라이드 class="mySlides w3-animate-fading"
			
			var myIndex = 0;
			carousel();
			
			function carousel() {
			    var i;
			    var x = document.getElementsByClassName("mySlides");
			    for (i = 0; i < x.length; i++) {
			       x[i].style.display = "none";  
			    }
			    myIndex++;
			    if (myIndex > x.length) {myIndex = 1}    
			    x[myIndex-1].style.display = "block";  
			    setTimeout(carousel, 5000);    
			}
			
			//좌우 사진 눌러서 바뀜 슬라이드
			var slideIndex = 1;
			showDivs(slideIndex);
			
			function plusDivs(n) {
			  showDivs(slideIndex += n);
			}
			
			function currentDiv(n) {
			  showDivs(slideIndex = n);
			}
			
			function showDivs(n) {
			  var i;
			  var x = document.getElementsByClassName("mySlides");
			  var dots = document.getElementsByClassName("demo");
			  if (n > x.length) {slideIndex = 1}    
			  if (n < 1) {slideIndex = x.length}
			  for (i = 0; i < x.length; i++) {
			     x[i].style.display = "none";  
			  }
			  for (i = 0; i < dots.length; i++) {
			     dots[i].className = dots[i].className.replace(" w3-white", "");
			  }
			  x[slideIndex-1].style.display = "block";  
			  dots[slideIndex-1].className += " w3-white";
			}
			</script>

</p>

<script type="text/javascript">
	$(function() {
		var url=window.location.search;
		//alert("|"+url.slice(url.indexOf("=")+1, url.length)+"|");
		var page=url.slice(url.indexOf("=")+1, url.length);
		if(page=="inter"){
			$("#dom").css("color","#337ab7");
		}
		if(page=="dom"){
			$("#dom").css("color","#337ab7");
			$("#inter").html("국내");
		}

	$( "#draggable" ).draggable();
	
	var el=$('#draggable');
	var elpos=el.offset().top;
	$(window).scroll(function () {
	    var y=$(this).scrollTop();
	    if($("#stp").is(":checked")){
	    	//el.stop();
	    	$("#draggable").css({
	              position: 'absolute',
	              top: elpos,//this is important for exact place 
	              bottom: 'auto'
	          }); 
	    }else{
		    if(y<elpos){el.stop().animate({'top':0},500);}
		    else{el.stop().animate({'top':y-elpos+50},500);}
	    	
	    }
	    if($("#del").is(":checked")){
	    	el.fadeOut(100);
	    	//el.stop().animate({'top':-100},500);
	    }
	    
	    
		    
	});
	});
	
</script>



<span class="bar1"><font style="margin-left: 60px">BEST</font></span><span class="bar11"><font id="inter" style="margin-left: 60px">해외</font>  </span><span class="bar12" ><font id="dom" style="margin-left: 60px">국내</font></span>
	<p><br></p>
	<p>
		<div class="container" >
		<div class="row" >
		
			<c:forEach items="${best01 }" var="m">
		  <div class="col-md-4" style="height:300px;width:350px;padding-top: 5px;"  >
		    <div class="thumbnail">
		      <a href="listSubPackage.do?item_key=${m.item_key }">
		        <img src="/tourapp/resources/img/${m.image01 }" alt="Lights" style="height:250px;width:300px;">
		        <div class="caption">
		          <p>
		          <c:if test="${m.reser==20 }">
		          		<font color="red"><b>마감</b></font>
		          </c:if>

		          ${m.item_name }</p>
		        </div>
		      </a>
		    </div>
		  </div>
		  </c:forEach>
		  <c:if test="${empty page }">
		  <c:forEach items="${best02 }" var="m">
		  <div class="col-md-4" style="height:300px;width:350px;padding-top: 5px;"  >
		    <div class="thumbnail">
		      <a href="listSubPackage.do?item_key=${m.item_key }">
		        <img src="/tourapp/resources/img/${m.image01 }" alt="Lights" style="height:250px;width:300px;">
		        <div class="caption">
		          <p>
		          <c:if test="${m.reser==20 }">
		          		<font color="red"><b>마감</b></font>
		          </c:if>

		          ${m.item_name }</p>
		        </div>
		      </a>
		    </div>
		  </div>
		  </c:forEach>
		</c:if>
		  
		  
  </div>
</div>
</p>		

<p class="bar2"><font style="margin-left: 100px">EVENT</font>  </p>
	<c:forEach items="${event }" var="m" begin="0" end="0">
			<a href="listSubPackage.do?item_key=${m.item_key }"><div class="eventleft">
			<div class="eventLeftIn"><img src="/tourapp/resources/img/${m.image01 }"  id="event01" style="height:200px;width:250px;"></div>
			<div class="eventLeftIn" style="height:200px; overflow: scroll;">${m.intro_text}</div>
		  
		</div></a>
	</c:forEach>


<div class="eventRight">
	<c:forEach items="${event }" var="m" begin="1" end="2">
	<a href="listSubPackage.do?item_key=${m.item_key }"><div class="eventRightIn">
 	<div class="eventRightInIn1"><img id="event02" style="height:100px;width:180px;" src="/tourapp/resources/img/${m.image01 }"></div>
	<div class="eventRightInIn2">${m.intro_text}</div>
	</div></a>
	</c:forEach>
</div>


</body>
</html>