<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css"/>
    <title>JSP Page</title>
</head>
<body>
    
    <sql:setDataSource var="maraton"
                       driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/depotakipvt"
                       user="root"
                       password="199144"/>
   
    <sql:query dataSource="${maraton}" var="sorgu" >
        SELECT * FROM personel WHERE personelid = ?
        
        <sql:param  value="${param.PersonelParametresi}" />
    </sql:query>
    
        <table border="1">
            <tr>
                <c:forEach var="KolonIsimleri" items="${sorgu.columnNames}">
                    <th><c:out value="${KolonIsimleri}" /></th>
                </c:forEach>
            </tr>
            <c:forEach var="satir" items="${sorgu.rowsByIndex}">
                <tr>
                    <c:forEach var="kolon" items="${satir}">
                         <td><c:out value="${kolon}" /></td>
                    </c:forEach>
                   
                </tr>
            </c:forEach>
        </table>
        
        <hr/>
        
        
        
        <c:set var="row2" scope="request" value="${sorgu.rows[0]}" />
        
        <table>
            <tr>
                <td>ID : </td>
                <td>${row2.personelid}</td>
            </tr>
            <tr>
                <td>Adı Soyad : </td>
                <td>${row2.personeladi} ${row2.personelsoyadi}</td>
            </tr>
            <tr>
                <td>Görevi :</td>
                <td>${row2.personelgorevi}</td>
            </tr>
            <tr>
                <td>E-Posta :</td>
                <td> ${row2.personeleposta}</td>
            </tr>
        </table>
        
    
</body>
</html>
