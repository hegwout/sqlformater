<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="dbconn.*"%>
<%
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy");


%>

<%@page import="java.util.List"%>
<%@page import="com.alibaba.druid.sql.SQLUtils"%>
<%@page import="com.alibaba.druid.sql.dialect.mysql.visitor.MySqlSchemaStatVisitor"%>
<%@page import="com.alibaba.druid.util.JdbcConstants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
          String sql = request.getParameter("sql");
          String dbType = JdbcConstants.MYSQL;
          if( sql == null ){
            sql = "select id,name from my_table where 1 and 2 group by id,name";
          }
          String result = "";
          //格式化输出
          result = SQLUtils.format(sql, dbType);
          pageContext.setAttribute("result", result);
          pageContext.setAttribute("sql", sql);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>SQL代码格式化</title>
    <link href="favicon.ico" rel="icon" type="image/x-icon"/>
    <link href="favicon.ico" rel="shortcut icon" type="image/x-icon"/>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet"
          href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/default.min.css">
        
          
</head>

<body>



<div class="container">
    <div class="py-5 text-center">
        <h2>SQL代码格式化</h2>
        
    </div>

    <div class="row">

        <div class="col-md-12 order-md-1">
            <form class="needs-validation" id="sqlForm" method="post" novalidate="" _lpchecked="1">
                <div class="mb-3">
                    
                    <textarea required="required" class="form-control" id="sql" name="sql" rows="7"
                              placeholder="select * from a"><c:out value="${sql}" escapeXml="true"/></textarea>
                </div>

                <button class="btn btn-primary btn-lg btn-block" type="submit">Format 格式化</button>
                <hr class="mb-4">

                <h4 class="mb-3"></h4>
                <pre><code class="sql" id="output1"><c:out value="${result}" escapeXml="true"/></code></pre>
                <button class="btn btn-primary btn-lg btn-block" id="copyBtn" type="button">Copy 复制</button>


            </form>
        </div>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">@<%=sdf.format(new java.util.Date())%></p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="http://heoffice.com" target="_blank">heoffice.com</a></li>
            <li class="list-inline-item"><a href="http://zrmj.com" target="_blank">zrmj.com</a></li>
            <li class="list-inline-item"><a href="http://17lian.top" target="_blank">17lian.top</a></li>
        </ul>
    </footer>
</div>

<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"
       ></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<link href="http://cdn.bootcss.com/highlight.js/8.5/styles/default.min.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/highlight.js/8.5/highlight.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
  
<script src="sql.js">
   


</script>
</body>
</html>