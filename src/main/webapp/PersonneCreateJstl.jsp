<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,model.Personne,model.Projet,model.Departement" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty listDept}">
  <p style="color:red;">Aucun département trouvé</p>
</c:if>
<c:if test="${empty listProjet}">
  <p style="color:red;">Aucun projet trouvé</p>
</c:if>
<form action="PersonneController" method=post>
CIN : <input type=text name=cin><br>
Nom : <input type=text name=nom><br>
Prenom : <input type=text name=prenom><br>
Liste des Départements
<select name='dept'>
<c:forEach items="${listDept}" var="d" varStatus="status">
<option value='${d.id}'> ${d.nom}</option>
</c:forEach>
</select><br>

List des projets <br>
<c:forEach items="${listProjet}" var="p" varStatus="status">
<input type=checkbox name=projet value='${p.id}'> ${p.nom }<br>
</c:forEach>
<input type=submit name=create value=Ajouter ><br>
</form>
</body>
</html>