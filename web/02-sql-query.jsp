
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css"/>   
    <title>sql:query Etiketi</title>
</head>
<body>
    
    <h2>JSTL SQL sql:query Tag</h2>
    
    <sql:setDataSource  var="Verikaynagi"
                        driver="com.mysql.jdbc.Driver"
                        url="jdbc:mysql://localhost/depotakipvt"
                        user="root"
                        password="199144"/>
  
      <sql:query dataSource="${Verikaynagi}" sql="SELECT * FROM personel" var="sorgula" />
    

    <table border="1" width="100%">
        <tr>
            <td>ID</td>
            <th>AD</th>
            <th>SOYAD</th>
            <th>E-POSTA</th>
            <th>GÖREVİ</th>
            <th>MAAŞI</th>
        </tr>
        <c:forEach var="satir" items="${sorgula.rows}">
            <tr>
                <td><c:out value="${satir.personelid}" /></td>
                <td><c:out  value="${satir.personeladi}"/></td>
                <td><c:out  value="${satir.personelsoyadi}" /></td>
                <td><c:out  value="${satir.personeleposta}" /></td>
                <td><c:out value="${satir.personelgorevi}" /></td>
                <td><c:out value="${satir.personelmaasi}" /></td>
                
            </tr>
        </c:forEach>
    </table>
  
     
</body>
</html>
