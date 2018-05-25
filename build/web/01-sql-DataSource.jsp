
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>SQL DataSource</h1>
    
    <sql:setDataSource var="VeriKaynagi"
                       driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/depotakipvt"
                       user="root"
                       password="199144"/>
    
    <sql:query dataSource="${VeriKaynagi}" sql="SELECT * FROM personel" var="sonucum" />
    
    
</body>
</html>
