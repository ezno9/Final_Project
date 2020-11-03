<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd");
	String today_server = format.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공부합시당</title>		
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#total').hide();
	$('#selectTime').hide();
	
	$(document).on('click', '#startBtn', function(){
		var memberid = $('#memberid').val();
		
		$.ajax({
			type : 'POST',
			url : 'startTimer.do',
			data : {
				memberid : memberid
			},
			success: function(data) {
				$('#state').html(data + " 공부 중...");
				$('#selectTime').hide();
				$('#total').hide();
				$('#startBtn').attr('disabled', true);
				$('#endBtn').attr('disabled', false);
			},
			error: function(){
				alert("시작 실패");
			}
		});
	});
	
	
	
	$(document).on('click', '#endBtn', function(){
		var memberid = $('#memberid').val();
		
		$.ajax({
			type : 'POST',
			url : 'endNrecordTimer.do',
			data : {
				memberid : memberid
			},
			success: function(data) {
				$('#state').html(data + " 휴식 중!");
				$('#selectTime').hide();
				$('#total').hide();
				$('#startBtn').attr('disabled', false);
				$('#endBtn').attr('disabled', true);
			},
			error: function() {
				alert("종료 실패");
			}
		});
	});
	
	
/* 	$(document).on('click', '#recordBtn', function(){
		var memberid = $('#memberid').val();
		
		$.ajax({
			type:'POST',
			url:'recordTimer.do',
			data : {
				memberid : memberid
			},
			success: function(data) {
				$('#state').html(data + " 공부 종료 ");
				$('#selectTime').html("공부 시간을 조회했습니다.");
				$('#total').show();
			},
			error: function() {
				alert("등록 실패");
			}
			
		});

	}); */
	
	$(document).on('click', '#selectBtn', function(){
		var memberid = $('#memberid').val();
		$.ajax({
			type:'POST',
			url : 'showSum.do',
			data : {
				memberid : memberid
			},
			success: function(map){
				console.log(map);
				
				if(map.ifnull) {
					$('#selectTime').show().html("오늘은 아직 공부하지 않으셨네요!");
				} else if( !map.ifnull ){
					if(map.same_date) {
						$('#selectTime').show().html("공부 시간을 조회했습니다.");
						$('#total').show();
						$('#time').html(map.total);
					} else {
						$('#selectTime').show().html("날짜가 다름 ");
					}
					
				}
			},
			error: function() {
				$('#selectTime').html("공부한 시간이 존재하지 않습니다.");
			}
			
		});
	});
	
});

</script>
<style>

</style>
</head>
<body>
		 
		<div id="today_server">오늘 날짜 : <%=today_server %> 입니다.</div>
		<input type="hidden" id="memberid" name="memberid" value="userA">
		<input type="button" id="startBtn" name="startBtn" value="공부 시작"> 
		<input type="button" id="endBtn" name="endBtn" value="공부 끝!" >
		<!--  
		<input type="button" id="recordBtn" name="recordBtn" value="저장하기">-->
		<input type="button" id="selectBtn" name="selectBtn" value="얼마나 공부했을까?">
		<div id="state">공부합시다!</div>
		<div id="selectTime"></div>
		<div id="total" >
			<span id="time">${sdto.total_t }</span>
			<span id="time_txt">분째 공부 중!</span>
		</div>
</body>
</html>