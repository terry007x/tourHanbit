<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		var d_date_str;
		var a_date_str;
		
		var today = $.datepicker.formatDate('yy-mm-dd', new Date());
		
		$("#d_date_str").datepicker({
			dateFormat: "yy-mm-dd",
			numberOfMonths: 3,
			changeMonth: true, 
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			onSelect : function()
			{
				d_date_str=$(this).val();
				if(d_date_str<today){
					alert(today+"이후로 선택하세요.");
					$("#d_date_str").datepicker('setDate',today);
				}
			}
		});
		$( "#a_date_str" ).datepicker({
	    	dateFormat : "yy-mm-dd",
			numberOfMonths :3,
			changeMonth: true, 
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        onSelect: function() { 
	        	a_date_str = $(this).val();
	        	if(d_date_str>a_date_str){
	        		alert("출발일 "+$("#d_date_str").val()+" 이후로 선택하세요.");
	        		$(this).datepicker('setDate', $("#d_date_str").val());
	        	};
	        }
	    });
		$("#btn_submit").click(function(){
			var item_key= $("#item_key").val();
			var item_key_sub=item_key+"_"+d_date_str;
			
			var check_date=0;
			$(".oldItem_key_sub").each(function(idx){
				if($(this).val()==item_key_sub)
				{
					check_date=1;
					alert("이미 존재하는 출발일자 입니다.");
					
				}
			})
			if(check_date==0)
			{
				$("#insert_form").submit();
			}
			else{
				return false;
				
			}
		})
		
	
		
		
	});
</script>

</head>
<body>
<h2>서브 패키지 등록</h2>
<hr>

<form action="adminInsertSubItem.do" method="post" id="insert_form">
<table>
	<tr>
		<td>상품번호 : <input type="text" value="${item_key }" name="item_key" id="item_key" readonly="readonly"></td>
	</tr>
	<tr>
		<td>가격 : <input type="text" name="price_sub"></td>
	</tr>
	<tr>
		<c:forEach var="sc" items="${subCount }">
			<input type="hidden" value="${sc.item_key_sub }" class="oldItem_key_sub">
		</c:forEach>
		<td>기간 : <input type="text" name="d_date_str" id="d_date_str"></td>
		<td>시간: <input type="text" name="d_date_str_time" size="3"></td>
		<td><label>&nbsp<font color="#337ab7"><b> ~ </b></font>&nbsp</label></td>
		<td><input type="text" name="a_date_str" id="a_date_str"></td>
		<td>시간: <input type="text" name="a_date_str_time" size="3"></td>
	</tr>
	<tr>
		<td>항공기 : 
			<select name="airplane">
				<option value="대한항공">대한항공</option>
				<option value="아시아나">아시아나</option>
				<option value="진에어">진에어</option>
				<option value="에어부산">에어부산</option>
				<option value="제주항공">제주항공</option>
				<option value="네덜란드항공">네덜란드항공</option>
				<option value="제주항공">제주항공</option>
				<option value="이스타항공">이스타항공</option>
				<option value="세부퍼시픽">세부퍼시픽</option>
				<option value="호주에어">호주에어</option>
				<option value="에어프랑스">에어프랑스</option>
				<option value="러시아항공">러시아항공</option>
				<option value="필리핀항공">필리핀항공</option>
			</select> 
		</td>
	</tr>
	<tr>
		<td><button type="button" id="btn_submit">등록</button></td>
	</tr>
</table>
</form>
</body>
</html>