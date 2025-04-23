package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Departement;
import model.Personne;
import model.Projet;

import java.io.IOException;
import java.util.List;

import dao.DepartementDAO;
import dao.PersonneDAO;
import dao.ProjetDAO;

/**
 * Servlet implementation class PersonneController
 */
@WebServlet("/PersonneController")
public class PersonneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private PersonneDAO pdao;
	private ProjetDAO prDao;
	private DepartementDAO deptDao;
	public PersonneController() {
		super();
		pdao=new PersonneDAO();
		prDao= new ProjetDAO();
		deptDao=new DepartementDAO();
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message="";
		if(request.getParameter("id")!=null) {
		message="suppression impossible";
		long id=Long.parseLong(request.getParameter("id"));
		if(pdao.delete(id))
			message="suppression de la personne "+id+" avec succes";
		}
		if(request.getParameter("updateId")!=null) {
		long id=Long.parseLong(request.getParameter("updateId"));
		Personne p= pdao.findById(id);
		request.setAttribute("personne",p);
		RequestDispatcher rd=getServletContext().getRequestDispatcher("/personneUpdate.jsp");
		rd.forward(request, response); 	
		}else {
		List<Personne> results = pdao.findAll();
		request.setAttribute("listPersonne",results);
		request.setAttribute("message",message);
		RequestDispatcher rd=getServletContext().getRequestDispatcher("/PersonneView.jsp");
		rd.forward(request, response); 
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message="";
		if(request.getParameter("create")!=null) {
		message="creation impossible";
		String cin=request.getParameter("cin");
		String prenom=request.getParameter("prenom");
		String nom=request.getParameter("nom");
		String dept=request.getParameter("dept");
		String pr[]=request.getParameterValues("projet");
		Personne p=new Personne(cin,nom,prenom);
		long departement=Long.parseLong(dept);
		long[] projet = new long[10];
		int i=0;
		for( String s:pr) {
			projet[i]=Long.parseLong(s);
			i++;
		}
		
		if(pdao.create(p,departement,projet))
			   message="personne "+cin+" cree avec succes";
		}
		else if(request.getParameter("update")!=null) {
			message="mise a jour impossible";
			long id=Long.parseLong(request.getParameter("id"));
			String cin=request.getParameter("cin");
			String prenom=request.getParameter("prenom");
			String nom=request.getParameter("nom");
			if(pdao.update(id,cin,nom,prenom)) 
				     message="personne "+cin+" mis a jour avec succes";
			}
		if(request.getParameter("createForm")!=null) {
			List<Departement> dept = deptDao.findAll();
			List<Projet> pr = prDao.findAll();
			request.setAttribute("listDept",dept);
			request.setAttribute("listProjet",pr);
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/PersonneCreate.jsp");
			rd.forward(request, response); 
			}
		else {
			List<Personne> results = pdao.findAll();
			request.setAttribute("listPersonne",results);
			request.setAttribute("message",message);
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/PersonneView.jsp");
			rd.forward(request, response); 
		}
			}

	}

