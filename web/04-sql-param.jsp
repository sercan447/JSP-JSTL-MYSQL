<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css"/>
    <title>JSP Page</title>
</head>
<body>
    
    <sql:setDataSource var="veriBileseni"
                       driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/depotakipvt"
                       user="root"
                       password="199144"/>
    
    <sql:query dataSource="${veriBileseni}" var="ika" sql="SELECT * FROM personel" />
    <table>
        <tr>
            <th>id</th>
            <th>İsim</th>
            <th>Soyisim</th>
            <th>Gorev</th>
            <th>Maaşı</th>
        </tr>
        <c:forEach var="kimrit" items="${ika.rows}">
            <tr>
                <td><c:out  value="${kimrit.personelid}" /></td>
                <td><c:out  value="${kimrit.personeladi}" /></td>
                <td><c:out value="${kimrit.personelsoyadi}" /></td>
                <td><c:out value="${kimrit.personelgorevi}" /></td>
                <td><c:out value="${kimrit.personelmaasi}" /></td>
                    
            </tr>
        </c:forEach>
    </table>
    
    
    <c:set var="param_id" value="5" />
    <sql:update dataSource="${veriBileseni}" var="isle">
                DELETE FROM personel WHERE personelid = ?

                <sql:param  value="${param_id}" />
            </sql:update>
        
           
    <sql:query dataSource="${veriBileseni}" var="ika1" sql="SELECT * FROM personel" />
    <table>
        <tr>
            <th>id</th>
            <th>İsim</th>
            <th>Soyisim</th>
            <th>Gorev</th>
            <th>Maaşı</th>
        </tr>
        <c:forEach var="kimrit" items="${ika1.rows}">
            <tr>
                <td><c:out  value="${kimrit.personelid}" /></td>
                <td><c:out  value="${kimrit.personeladi}" /></td>
                <td><c:out value="${kimrit.personelsoyadi}" /></td>
                <td><c:out value="${kimrit.personelgorevi}" /></td>
                <td><c:out value="${kimrit.personelmaasi}" /></td>
                    
            </tr>
        </c:forEach>
    </table>
   
  <c:set var="param_id_2" value="12" /> 
  <sql:update dataSource="${veriBileseni}" var="metre" >
        DELETE FROM personel WHERE personelid = ?
        <sql:param  value="${param_id_2}" />
    </sql:update>
    
          <sql:query dataSource="${veriBileseni}" var="ika2" sql="SELECT * FROM personel" />
    <table>
        <tr>
            <th>id</th>
            <th>İsim</th>
            <th>Soyisim</th>
            <th>Gorev</th>
            <th>Maaşı</th>
        </tr>
        <c:forEach var="kimrit" items="${ika2.rows}">
            <tr>
                <td><c:out  value="${kimrit.personelid}" /></td>
                <td><c:out  value="${kimrit.personeladi}" /></td>
                <td><c:out value="${kimrit.personelsoyadi}" /></td>
                <td><c:out value="${kimrit.personelgorevi}" /></td>
                <td><c:out value="${kimrit.personelmaasi}" /></td>
                    
            </tr>
        </c:forEach>
    </table>
</body>
</html>
