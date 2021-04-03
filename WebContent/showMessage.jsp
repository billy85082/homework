<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <style>
        #box{font-family:Microsoft JhengHei;}
        #show{margin-top: 1%}
        #show_1{text-align: center;}
        #show_2{background: black;color: white}
        #show_push{background:#000088;color: white}
        #show_tile,#show_startDate{background: #B94FFF;}
        #show_autor,#show_EndDate{background: #D28EFF;}
        #show_tile,#show_autor,#show_startDate,#show_EndDate,#show_push{padding-top: 1%;padding-bottom: 1%;}
        #show_tile,#show_autor,#show_startDate,#show_push{float: left;width: 20%;}
    </style>
</head>
<body>
	<s:iterator value='message'>
		<table class="table table-hover table-dark">
		  <thead>
		    <tr>
		      <th scope="col" style="width:20%;">編號：<s:property value="num" /></th>
		      <th scope="col" style="width:20%;">標題：<s:property value="title"/></th>
		      <th scope="col" style="width:20%;">公佈者：<s:property value="author"/></th>
		      <th scope="col" style="width:20%;">發佈日期：<s:property value="Start_date"/></th>
		      <th scope="col" style="width:20%;">截止日期：<s:property value="End_date"/></th>           
		    </tr>
		  </thead>
		</table>
		<textarea name="message.message" contenteditable="true" id="TextArea1" cols="20" rows="2" class="ckeditor"><s:property value="message" /></textarea>
				
		<div style="margin: 9px 0 0 9px;float:left; display:inline;">    		    	  
		    	<a href="Welcome"><input id="fat-btn" class="btn btn-warning" type="button" value="回首頁" ></a>  	    
		</div>
	</s:iterator>
<script type="text/javascript">

$(document).ready(function() {

   CKEDITOR.config.readOnly = true;

});

</script>
</body>
</html>