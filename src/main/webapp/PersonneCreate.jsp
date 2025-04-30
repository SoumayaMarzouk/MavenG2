<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,model.Personne,model.Projet,model.Departement" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% List<Projet> pr=(List<Projet>)request.getAttribute("listProjet");
List<Departement> dept=(List<Departement>)request.getAttribute("listDept");
%>
<form action="PersonneController" method=post>
CIN : <input type=text name=cin><br>
Nom : <input type=text name=nom><br>
Prenom : <input type=text name=prenom><br>
Liste des Départements
<select name='dept'>
<% for(Departement d:dept) {%>
<option value=<%=d.getId() %>> <%= d.getNom() %></option>
<% } %>
</select><br>
List des projets <br>
<% for(Projet p:pr) {%>
<input type=checkbox name=projet value=<%=p.getId() %>> <%= p.getNom() %><br>
<% } %>
<input type=submit name=create value=Ajouter ><br>
</form>
</body>
</html>