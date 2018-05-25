<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css"/>
    <title>JSP Page</title>
</head>
<body>
  
    <sql:setDataSource var="verin"
                       driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/depotakipvt"
                       user="root"
                       password="199144"/>
    
    
    <sql:query dataSource="${verin}" sql="SELECT * FROM personel" var="sorgu" />
    
    <table>
        <tr>
            <c:forEach var="degisken" items="${sorgu.columnNames}">
                <c:choose>
                    <c:when test="${degisken  == 'personelid'}">
                        <th><c:out value=" No:" /></th>
                    </c:when>
                    <c:when test="${degisken == 'personeladi'}">
                     <th><c:out value=" Adı" /></th>
                    </c:when>
                    <c:when test="${degisken == 'personelsoyadi'}">
                    <th><c:out  value=" Soyadı" /></th>
                    </c:when>
                    <c:when test="${degisken == 'personelgorevi'}">
                        <th><c:out value="Gorevi" /></th>
                    </c:when>
                    <c:when test="${degisken == 'personelmaasi'}">
                        <th><c:out value="Maasi" /></th>
                    </c:when>
                    <c:when test="${degisken == 'personeleposta'}">
                        <th><c:out value="E-Posta" /></th>
                    </c:when>
                    <c:when test="${degisken == 'personelkayittarihi'}">
                    <th><c:out value="K.Tarihi" /></th>
                    </c:when>    
                    <c:otherwise>
                    <th><c:out  value="DIGER"/></th>
                    </c:otherwise>
                </c:choose>
            
            </c:forEach>
            
        </tr>
        <c:forEach var="veri" items="${sorgu.rowsByIndex}">
            <tr>
                <c:forEach var="her" items="${veri}" >
                      <td><c:out  value="${her}" /></td>    
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    
    <%
    Date tarih = new Date("1453/05/29");
    java.util.Date zaman = new java.util.Date();
    
    int secilenPersonelId = 14;
    
    out.println("ZAMAN : "+zaman);
    %>
    <br/>
    Web Sayfasında Zaman 1: <%=zaman %> <br/>
    Web Sayfasında Zaman 2 : <% out.println(String.valueOf(zaman)); %>
    
    <c:set  var="param_ad" value="Efe" />
    <c:set var="param_soyad" value="Beyoğlu" />
    <c:set var="param_posta" value="sercan.goger@gmail.com" />
    <c:set  var="param_gorev" value="JAVA EE PLATFORM" />
    <c:set  var="param_maas" value="2866"/>
    <c:set var="param_tarih" value="<%= tarih %>" />
    
    <c:set var="parametrePersonelId" value="<%= secilenPersonelId %>" />
    
    <sql:update  dataSource="${verin}" var="guncelle_sil_ekleme" >
        UPDATE personel SET personeladi = ?,
                            personelsoyadi = ?,
                            personeleposta = ?,
                            personelgorevi = ?,
                            personelmaasi = ? ,
                            personelkayittarihi = ? WHERE personelid = ?
        
                            <sql:param value="${param_ad}" />
                            <sql:param value="${param_soyad}" />
                            <sql:param value="${param_posta}" />
                            <sql:param value="${param_gorev}" />
                            <sql:param value="${param_maas}" />
                            <sql:dateParam type="DATE" value="<%= zaman %>" />
             <sql:param  value="${parametrePersonelId}" />
      
    </sql:update>
    
        <hr/>
        
        <sql:query  dataSource="${verin}" sql="SELECT * FROM personel" var="sorgu2" />
        
        <table>
            <tr>
                <c:forEach var="yuz" items="${sorgu2.columnNames}">
                    <th><c:out value="${yuz}"  /></th>
                </c:forEach>
            </tr>
            <c:forEach var="gun" items="${sorgu.rowsByIndex}">
                <tr>
                    <c:forEach var="sanci" items="${gun}">
                        <th><c:out value="${sanci}" /></th>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
        
        
</body>
</html>
