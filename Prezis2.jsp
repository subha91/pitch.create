
<!DOCTYPE html><html class=''>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="java.util.*,com.json.parse.Prezis,com.json.parse.Creator,com.json.parse.JsonParsing"%>
<head>



<script src='//assets.codepen.io/assets/editor/live/console_runner-d0a557e5cb67f9cd9bbb9673355c7e8e.js'></script><script src='//assets.codepen.io/assets/editor/live/events_runner-21174b4c7273cfddc124acb0876792e0.js'></script><script src='//assets.codepen.io/assets/editor/live/css_live_reload_init-7618a0de08795409d8f6c9ef6805f7b2.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="canonical" href="https://codepen.io/adobewordpress/pen/gbewLV" />

<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css'>
<style class="cp-pen-styles">body{
  padding:20px 20px;
}

.results tr[visible='false'],
.no-result{
  display:none;
}

.results tr[visible='true']{
  display:table-row;


.counter{
  padding:8px; 
  color:#ccc;
}</style></head><body>

	<%
String file=getServletContext().getRealPath("/WEB-INF/prezis.json");
System.out.println(file);
List<Prezis> prezisList = JsonParsing.jsonParse(file);
request.setAttribute("prezisList",prezisList);
%>

<div class="form-group pull-right">
    <input type="text" class="search form-control" placeholder="What you looking for?">
</div>
<span class="counter pull-right"></span>
<table class="table table-hover table-bordered results">
  <thead>
    <tr>
      <th>#</th>
      <th class="col-md-5 col-xs-5">Id</th>
      <th class="col-md-4 col-xs-4">Name</th>
      <th class="col-md-3 col-xs-3">Image</th>
	  
      <th class="col-md-5 col-xs-5">Title</th>
      <th class="col-md-4 col-xs-4">Profile</th>
      <th class="col-md-3 col-xs-3">Date</th>
    </tr>
    <tr class="warning no-result">
      <td colspan="4"><i class="fa fa-warning"></i> No result</td>
    </tr>
  </thead>
  <tbody>
  <% 
		int i=0;
	 
		%>
	<c:forEach var="prezisList" items="${prezisList}">
<% 
	 
	i++;
		%>
	<tr>
	 <th scope="row"><%=i%></th>
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

	
  </tbody>
</table>
<script src='//assets.codepen.io/assets/common/stopExecutionOnTimeout.js?t=1'></script><script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script>$(document).ready(function () {
    $('.search').keyup(function () {
        var searchTerm = $('.search').val();
        var listItem = $('.results tbody').children('tr');
        var searchSplit = searchTerm.replace(/ /g, '\'):containsi(\'');
        $.extend($.expr[':'], {
            'containsi': function (elem, i, match, array) {
                return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || '').toLowerCase()) >= 0;
            }
        });
        $('.results tbody tr').not(':containsi(\'' + searchSplit + '\')').each(function (e) {
            $(this).attr('visible', 'false');
        });
        $('.results tbody tr:containsi(\'' + searchSplit + '\')').each(function (e) {
            $(this).attr('visible', 'true');
        });
        var jobCount = $('.results tbody tr[visible="true"]').length;
        $('.counter').text(jobCount + ' item');
        if (jobCount == '0') {
            $('.no-result').show();
        } else {
            $('.no-result').hide();
        }
    });
});
//# sourceURL=pen.js
</script>
</body></html>