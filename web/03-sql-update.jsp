<%@page import="java.io.Writer"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css"/>
    <title>sql:update Etiketi</title>
</head>
<body>
    
    <sql:setDataSource var="kaynak"
                       driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/depotakipvt"
                       user="root"
                       password="199144"/>
    
    <sql:query  dataSource="${kaynak}" sql="SELECT * FROM personel" var="sor" />
    
    <table>
        <tr>
            <th>ID</th>
            <th>Ad</th>
            <th>Soyad</th>
        </tr>
        <c:forEach var="deger" items="${sor.rows}">
             <tr>
                 <td><c:out  value="${deger.personelid}" /></td>
                 <td><c:out  value="${deger.personeladi}" /></td>
                 <td><c:out value="${deger.personelsoyadi}" /></td>
            </tr>
        </c:forEach>
       
    </table>
    <!--
      <sql:update  dataSource="${kaynak}" var="ekleme">
        INSERT INTO personel (personeladi,personelsoyadi,personeleposta,personelgorevi,personelmaasi)
                     VALUES  ("Soner","Evcil","evcilsoner@gmail.com","PTT","1800");
    </sql:update>
        -->
  <!--
        <sql:update dataSource="${kaynak}" var="guncelle">
            UPDATE  personel SET personeladi = "Emin",personelsoyadi = "Demir",
                                 personeleposta = "emin@yahoo.com",personelgorevi = "Securty", 
                                 personelmaasi = "1990" WHERE personelid = 12;
        </sql:update>
       <sql:update dataSource="${kaynak}" var="guncelle2">
                   UPDATE  personel SET personeladi = "RAMAZAN",personelsoyadi = "DUMAN",
                                 personeleposta = "duman@sinoplu.com",personelgorevi = "tesisat", 
                                 personelmaasi = "3000" WHERE personelid = 13;                   
       </sql:update>    
       
      <sql:update dataSource="${kaynak}" var="guncelle3">
           UPDATE  personel SET personeladi = "Mehmet",personelsoyadi = "Yuksel",
                                 personeleposta = "mehmet1@hotmail.com",personelgorevi = "PHP", 
                                 personelmaasi = "1500" WHERE personelid = 11;                           
      </sql:update>                          
                    
   <sql:update dataSource="${kaynak}" var="sil">
            DELETE FROM personel WHERE personelid = 10;                         
    </sql:update>     
            -->
          <sql:query  dataSource="${kaynak}" var="sorgu" sql="SELECT * FROM personel" />                       
        <table>
            <tr>
                <th>ID</th>
                <td>AD</td>
                <th>SOYAD</th>
                <th>MAAŞI</th>
            </tr>
            <c:forEach var="love" items="${sorgu.rows}">
                <tr>
                    <c:if test="${love.personelgorevi != 'ORACLE'}">
                        
                        <td><c:out value="${love.personelid}" /></td>
                        <td><c:out value="${love.personeladi}" /></td>
                        <td><c:out value="${love.personelsoyadi}" /></td>
                        <td><c:out value="${love.personelmaasi}" /></td>
                        
                    </c:if>
                  
                </tr>
            </c:forEach>
        </table>
        
        <!-- XML VERI DONDURUYORUM ASAGIDA -->
    <c:set var="dur">
               
          <c:forEach var="gor" items="${sorgu.rows}">
             <got not="${gor.personelid}">
                <a>${gor.personeladi}</a>
                <b>${gor.personelsoyadi}</b>
             </got>
          </c:forEach>
               
          </c:set>

      


</body>
</html>
