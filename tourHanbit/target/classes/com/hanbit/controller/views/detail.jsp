<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {
		var pageSize = 3;
		var start = 0;
		var end = start + pageSize;
		var arr2;
		var arr = [ "${i.image03 }", "${i.image04 }", "${i.image05 }",
				"${i.image06 }", "${i.image07 }", "${i.image08 }",
				"${i.image09 }", "${i.image10 }", "${i.image11 }", ]
		var city_id = $("#city_id").val();
		
		$.ajax({
			url:"weather.do",
			dataType:"json",
			type:"post",
			data: {"city":city_id},
			success: function(data){
			
				data = JSON.parse(data);
					var tr=$("<tr></tr>");
					var tr2=$("<tr></tr>");
					var tr3=$("<tr></tr>");
					var tr4=$("<tr></tr>");
					var tr5=$("<tr></tr>");
					var arr2=[0,8,16,24,32];
					$("<td colspan='5' style='color:#fff;background-color:#337ab7;'><h3>"+data.city.name+"  ���� ���� ����</h3></td>").appendTo(tr5);
					$.each(arr2,function(index,item){
						$("<td style='text-align:center;font-size: 20px'></td>").html(data.list[item].dt_txt.substring(0,11)).appendTo(tr);
						$("<td style='text-align:center;'></td>").html("<img src='http://openweathermap.org/img/w/"+data.list[item].weather[0].icon+".png' width='80'>").appendTo(tr2);
						$("<td style='text-align:center;'></td>").html("��� : "+data.list[item].main.temp).appendTo(tr3);
						$("<td style='text-align:center;'></td>").html("���� : "+data.list[0].main.humidity).appendTo(tr4);
					})
					$("#tb").append(tr5,tr,tr2,tr3,tr4);
				
				
				
			},
			error: function(data){
				alert("�������"+data)
			}
			
		})


		function listImage() {
		
			arr2 = arr.slice(start, end);
			$("#image02").attr("src","resources/"+arr2[0])
			$("#image03").attr("src","resources/"+arr2[1])
			$("#image04").attr("src","resources/"+arr2[2])
				
			
				}
		
		$("#image02").click(function(){
			$("#image01").attr("src",$("#image02").attr("src"));
		})
		$("#image03").click(function(){
			$("#image01").attr("src",$("#image03").attr("src"));
		})
		$("#image04").click(function(){
			$("#image01").attr("src",$("#image04").attr("src"));
		})
		
		
		$("#up").click(function(){
			
			start= start-pageSize;
			end= start+pageSize;
			
			if(start<0){
				start=arr.length-pageSize;
				end= start+pageSize;
			}
			
			listImage();
		})
		
		$("#down").click(function(){
		
			start= start+pageSize;
			end= start+pageSize;
			
			if(end>arr.length){
				start=0;
				end=start+pageSize;
			}
			listImage();
		})
		listImage();
	});
	function pro4(contentName){
		
		
		
		$("#content").attr("src","resources/"+contentName+".JPG");
	
		
	}
	 function fnMove(idx){
		 	
	        var position = $("#day"+idx).position();
	        $('html, body').animate({scrollTop : position.top}, 400);
	    }
	
	
	</script>
</head>
<body>
	<input type="hidden" id="city_id" value="${p.city_id }">
	
	<table width="100%">
		<tr>
			<td rowspan="5" width="60%" height="100%"><img id="image01"
				style="height: 400px; width: 630px;" src="resources/${i.image01 }" /></td>
			<td width="20%" height="10%" align="center" ><input type="button"  style="color:#fff;background-color:#337ab7;width: 200px;"  value="��"
				name="up" id="up"></td>
		</tr>
		<tr>
		
			<td width="20%" height="30%"><img id="image02"
				style="height: 120px; width: 200px;" 
				onclick="pro1()" /></td>
		</tr>
		<tr>
			<td width="20%" height="30%"><img id="image03"
				style="height: 120px; width: 200px;" 
				onclick="pro1()" /></td>
		</tr>
		<tr>
			<td width="20%" height="30%"><img id="image04"
				style="height: 120px; width: 200px;" 
				onclick="pro1(this.id)" /></td>
		</tr>
		<tr>
			<td width="20%" height="10%" align="center"><input type="button" value="��" style="color:#fff;background-color:#337ab7;width: 200px"
				name="down" id="down"></td>
		</tr>
	</table>
	<table id="tb" width="100%">
	</table>
	<table>
		<tr>
			<td colspan="2"><input type="image" style="height: 225px; width: 830px;"
				src="resources/����.JPG">
			<td>
		</tr>
		<tr>
			<td width="20%"><input type="image"
				style="height: 200px; width: 250px;" src="resources/${i.image02 }"></td>
			<td>${p.intro_text }</td> 
		</tr>
	</table>
	<table>
	<tr>
	
	</tr>
	</table> 
	
	<table width="30%">
		<tr>
		<c:forEach var="b" varStatus="s" items="${s }">
		<td><input type='button' value="${s.count }����"  style="color:#fff;background-color:#337ab7;width: 100px"
		onclick="fnMove('${s.count}')"></td>
		
		</c:forEach>
		</tr>
		</table>
		
		
		<c:forEach var="s" items="${s }" varStatus="status">
		<div id="day${status.count }"> ��    ${status.count } ����<br><br>${s.content }</div>
		<hr>
		</c:forEach>
		
		
		
		

	<table width="100%">
		<tr>
			<td><input type="image" name="content01"
				style="height: 55px; width: 120px;" src="resources/menu01.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content02"
				style="height: 55px; width: 120px;" src="resources/menu02.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content03"
				style="height: 55px; width: 120px;" src="resources/menu03.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content04"
				style="height: 55px; width: 120px;" src="resources/menu04.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content05"
				style="height: 55px; width: 120px;" src="resources/menu05.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content06"
				style="height: 55px; width: 120px;" src="resources/menu06.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content07"
				style="height: 55px; width: 120px;" src="resources/menu07.JPG"
				onclick="pro4(this.name)"></td>
		</tr>
		<tr>
			<td colspan="7"><input type="image" style="width: 830px"
				src="resources/content01.JPG" id="content"></td>
		</tr>
	</table>

</body>
</html>