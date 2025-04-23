<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,model.Personne" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Personne p=(Personne)request.getAttribute("personne");
%>
<form action="PersonneController" method=post>
ID : <input type=text name=id value='<%=p.getId()%>'><br>
CIN : <input type=text name=cin value='<%=p.getCin()%>'><br>
Nom : <input type=text name=nom value='<%=p.getNom()%>'><br>
Prenom : <input type=text name=prenom value='<%=p.getPrenom()%>'><br>
<input type=submit name=update value=Update ><br>
</form>

</body>
</html>