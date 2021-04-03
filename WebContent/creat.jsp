<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>    
    <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <link href="bootstrap-datetimepicker/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>    
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
    <style>
        
    </style>
</head>
<body>
<form action="add.action" method="post">
	<table class="table table-hover table-dark">
	  <thead>
	    <tr>
	      <th scope="col" style="width:25%;">標題：<input type="text" name="message.title"  value="" /></th>
	      <th scope="col" style="width:25%;">公佈者：<input type="text" name="message.author"  value="" /></th>
	      <th scope="col" style="width:25%;">發佈日期：
		      <div class="controls input-append date form_date" style="display:inline;" data-date="" data-date-format="yyyy/mm/dd" data-link-field="dtp_input2" data-link-format="yyyy/mm/dd">
		           <input size="16" type="text" name="message.Start_date" value="2021/01/01" readonly="readonly">
		           <span class="add-on"><i class="icon-remove"></i></span>
		           <span class="add-on"><i class="icon-th"></i></span>
	   		 </div>
	      </th>
	      <th scope="col" style="width:25%;">截止日期：
	      	  <div class="controls input-append date form_date" style="display:inline;" data-date="" data-date-format="yyyy/mm/dd" data-link-field="dtp_input2" data-link-format="yyyy/mm/dd">
		           <input size="16" type="text" name="message.End_date" value="2021/01/01" readonly="readonly">
		           <span class="add-on"><i class="icon-remove"></i></span>
		           <span class="add-on"><i class="icon-th"></i></span>
	   		 </div>
	      </th>           
	    </tr>
	  </thead>
	</table>
	<input type="file" class="form-control" id="customFile" />
	<textarea name="message.message" contenteditable="true" id="TextArea1" cols="20" rows="2" class="ckeditor"></textarea>
	
	<div style="margin: 9px 0 0 9px;float:left; display:inline;">  	    	  
	    	<input id="fat-btn" class="btn btn-success" type="submit" value="發佈公告" >                  
	</div>
	<div style="margin: 9px 0 0 9px;float:left; display:inline;">    		    	  
	    	<a href="Welcome"><input id="fat-btn" class="btn btn-warning" type="button" value="回首頁" ></a>  	    
	</div>	
	
</form>
<script>
$('.form_datetime').datetimepicker({
	         //language:  'fr',
	         weekStart: 1,
	         todayBtn:  1,
	         autoclose: 1,
	         todayHighlight: 1,
	         startView: 2,
	         forceParse: 0,
	         showMeridian: 1
	     });
	     $('.form_date').datetimepicker({
	         language:  'zh-cn',
	         weekStart: 1,
	         todayBtn:  1,
	         autoclose: 1,
	         todayHighlight: 1,
	         startView: 2,
	         minView: 2,
	         forceParse: 0
	     });
	     $('.form_time').datetimepicker({
	         language:  'zh-cn',
	         weekStart: 1,
	         todayBtn:  1,
	         autoclose: 1,
	         todayHighlight: 1,
	         startView: 1,
	         minView: 0,
	         maxView: 1,
	         forceParse: 0
	     });
</script>
</body>
</html>