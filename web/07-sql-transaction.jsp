<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css"/>
    <title>sql:transaction Etiketi</title>
</head>
<body>
   
    <sql:setDataSource var="kaynak" 
                       driver="com.mysql.jdbc.Driver" 
                       url="jdbc:mysql://localhost/depotakipvt"
                       user="root" 
                       password="199144"/>
    
    
       <sql:query dataSource="${kaynak}" sql="SELECT * FROM personel" var="sorgu" />
    
      <table>
        <tr>
            <c:forEach var="degisken" items="${sorgu.columnNames}">
                <th><c:out value="${degisken}" /></th>
            </c:forEach>
        </tr>
        <c:forEach var="tablo" items="${sorgu.rows}">
            <tr>
                <td><c:out value="${tablo.personelid}" /></td>
                <td><c:out  value="${tablo.personeladi}" /></td>
                <td><c:out value="${tablo.personelsoyadi}" /></td>
                <td><c:out value="${tablo.personeleposta}" /></td>
                <td><c:out value="${tablo.personelgorevi}" /></td>
                <td><c:out value="${tablo.personelmaasi}"  /></td>
                <td><c:out value="${tablo.personelkayittarihi}" /></td>
            <tr>
        </c:forEach>
        
    </table>
       
  <%
      
      SimpleDateFormat ft = new SimpleDateFormat("E yyyy.MM.dd '******' hh:mm:ss: a zz");
      Date tarih = new Date();
      ft.format(tarih);
      int personelid = 4;
      int personelid2 = 13;
  %>
    
  
  Transaction Seviyeleri (READ_COMMITED, READ_UNCOMMITED,REPETABLE_READ,SERILAZABLE)
  <sql:transaction dataSource="${kaynak}">
      <sql:update var="guncelle_sil_ekle">
          UPDATE personel SET personelkayittarihi = ?  WHERE personelid = ?
          
          <sql:dateParam  type="DATE" value="<%=tarih%>" />
          <sql:param  value="<%= personelid %>" />
      </sql:update>
                       
          
    <sql:update var="guncelle_ekle_sil_3">
   INSERT INTO personel (personeladi,personelsoyadi,personeleposta,personelgorevi,personelmaasi,personelkayittarihi)
                VALUES  ("NIYAZI","TEXT","niyaziveri@gmail.com","Havacı Astsubay","3872",?);
                
                <sql:dateParam  type="DATE" value="<%= tarih %>" />
    </sql:update>
                
                <sql:update var="guncelle_sil_ekle_2">
                    UPDATE personel SET personelkayittarihi = ? WHERE personelid = ?
                    
                    <sql:dateParam type="DATE" value="<%= tarih %>" />
                    <sql:param value="<%= personelid2 %>" />
                </sql:update>         
  </sql:transaction>
  <sql:query var="sor" dataSource="${kaynak}">
                    SELECT * FROM personel;
                </sql:query>
                    
                    
                    
                    
                    
      <table>
        <tr>
            <c:forEach var="degisken" items="${sor.columnNames}">
                <th><c:out value="${degisken}" /></th>
            </c:forEach>
        </tr>
        <c:forEach var="tablo" items="${sorgu.rows}">
            <tr>
                <td><c:out value="${tablo.personelid}" /></td>
                <td><c:out  value="${tablo.personeladi}" /></td>
                <td><c:out value="${tablo.personelsoyadi}" /></td>
                <td><c:out value="${tablo.personeleposta}" /></td>
                <td><c:out value="${tablo.personelgorevi}" /></td>
                <td><c:out value="${tablo.personelmaasi}"  /></td>
                <td><c:out value="${tablo.personelkayittarihi}" /></td>
            <tr>
        </c:forEach>
        
    </table>
</body>
</html>
