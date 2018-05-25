
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css"/>
        
    <title>JSP Page</title>
</head>
<body>
  
    <sql:setDataSource var="palavra"
                       driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/depotakipvt"
                       user="root"
                       password="199144"/>
    
    
    <sql:query dataSource="${palavra}"  var="sorgum">
        SELECT personelid,
               personeladi,
               personelsoyadi,
               personelgorevi,
               personelmaasi FROM depotakipvt.personel
    </sql:query>
   
               <table>
                   <tr>
                       <th>Bu Sayfadan diğer sayfalara gödereceğiz</th>
                   </tr>
                       <tr>
                           <td>
                               <form action="05-sql-param2Cevap.jsp">
                                 <strong>Personel Adı Soyoadı </strong>
                                   <select name="PersonelParametresi">
                                       <c:forEach var="p" items="${sorgum.rows}">
                                       <option value="${p.personelid}">
                                           ${p.personeladi} ${p.personelsoyadi}
                                       </option>
                                       </c:forEach>
                                   </select>
                                 <input type="submit" value="VeriIsle" name="Gönderiliyor" />
                               </form>
                           </td>
                       </tr>
              
               </table>
    
               
    
</body>
</html>
