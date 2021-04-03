<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
    <style type="text/css">
        
        
        
    </style>
</head>
<body>


<table class="table table-hover table-dark">
  <thead>
    <tr>
      <th scope="col" style="width:10%;">編號</th>
      <th scope="col" style="width:30%;">標題</th>
      <th scope="col" style="width:20%;">發佈日期</th>
      <th scope="col" style="width:20%;">截止日期</th>
      <th scope="col" style="width:10%;">修改</th>
      <th scope="col" style="width:10%;">刪除</th>
    </tr>
  </thead>
  <tbody>
  <s:iterator value='messageList'>
    <tr>      
      <td><s:property value="num"/></td>
      <td><a href="showMessage?message.num=<s:property value="num"/>" style="color:white;text-decoration:none;"><s:property value="title"/></td>
      <td><s:property value="Start_date"/></td>
      <td><s:property value="End_date"/></td>
      <td><a href="updata_show?message.num=<s:property value='num'/>" style="color:white;text-decoration:none;">修改</td>
      <td><a href="delete?message.num=<s:property value='num'/>" style="color:white;text-decoration:none;">刪除</td>
    </tr>
  </s:iterator>
  </tbody>
</table>
       
    <div style="margin: 0 0 0 9px;float:left; display:inline;">    	
    	  
    	<a href="creat"><input id="fat-btn" class="btn btn-primary" type="button" value="發佈公告" ></a>    
                
    </div>
    <div style="margin: 0 0 0 9px;float:left; display:inline;">
    	<ul class="pagination">
    	<li class="page-item"><a  class="page-link" href="Welcome?now=${now-1}">&laquo;</a></li>
    		<c:forEach var="i" begin="1" end="${pagecount}" step="1">
               <li class="page-item"><a class="page-link" href="Welcome?now=${i}">${i}</a></li>
           </c:forEach>
        <li class="page-item"><a class="page-link" href="Welcome?now=${now+1}">&raquo;</a></li>
    </ul>
    </div>
</div>
</body>
</html>