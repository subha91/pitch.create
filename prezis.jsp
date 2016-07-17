<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="java.util.*,com.json.parse.Prezis,com.json.parse.Creator,com.json.parse.JsonParsing"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
th {
    background-color: blue;
    color: white;
} 
h1 {
    background-color: green;
}

img {
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    width: 100%;
    height: 50%;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body >


	<%
String file=getServletContext().getRealPath("/WEB-INF/prezis.json");
System.out.println(file);
List<Prezis> prezisList = JsonParsing.jsonParse(file);
request.setAttribute("prezisList",prezisList);
%>

<html>
<head>
<title>JSTL</title>
</head>
<body>
<div class="container">
<h3><center>Prezis Details</center></h1>
<table id="example" class="table table-striped table-bordered table-condensed">
<th>Id </th>
<th>Title</th>
<th>Thumb Nail image</th>
<th>Creator Name</th>
<th>Profile URL</th>
<th>Created At</th>
	<c:forEach var="prezisList" items="${prezisList}">
	<tr>
			<td><c:out value="${prezisList.id}" /></td>
			<td><c:out value="${prezisList.title}" /></td>
			<td><img SRC="${prezisList.thumbnail}" width="100" height="100">
			</td>
			<%-- <td><c:out value="${prezisList.thumbnail}" /></td> --%>
			<td><c:out value="${prezisList.creator.name}" /></td>
			<%-- <td><img SRC="${prezisList.creator.profileUrl}" width="100" height="100">
			</td> --%>
			 <td><c:out value="${prezisList.creator.profileUrl}" /></td> 
			<td><c:out value="${prezisList.createdAt}" /></td>
			
			</tr>
	</c:forEach>
	</table>
	</div>
</body>
</html>



</body>
</html>