<%@ page import="java.util.List,model.Personne,model.Projet" %> 
<head> <meta charset="utf-8"> <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> </head> 
<h1> Liste des Projets</h1>
<div class="container mt-4">

<table class="table table-hover">
<tr class="table-primary"><th>Nom</th><th>Nb</th></tr>
<%
List<Object[]> results = (List<Object[]> )request.getAttribute("listProjet");
for(Object[] p:results){ 
String s="";
long nb=(long)p[0];
String nom=(String)p[1];


%>
	<tr><td> <%= nom%> </td><td> <%= nb%>
	      </td> 
	</tr>
<% }  %> </table></div>

