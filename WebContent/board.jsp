<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Single Project</title>
<link	rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	<%
		String userIDofSession = null;
		if (session.getAttribute("userID") != null) {
			userIDofSession = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="main.jsp"><h1 class="display-4" style="padding-right: 100px;">Notice Board</h1></a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent" style="font-size: 20px;">
	    <ul class="navbar-nav mr-auto" style="width: 85%;">
	      <li class="nav-item">
	        <a class="nav-link" href="main.jsp" style="padding-right: 30px;">Home <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item active">
	        <a class="nav-link" href="board.jsp" style="padding-right: 30px;">Board</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="calculator.jsp">Calculator</a>
	      </li>
	    </ul>
	    <ul class="navbar-nav mr-auto">
	    	<%
	       if(userIDofSession == null){
	      %>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <i class="far fa-user-circle"></i>
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="login.jsp">login</a>
	          <a class="dropdown-item" href="signup.jsp">sign up</a>
        	</div>
        </li>
        	<% 
						} else {
					%>
	      <li class="nav-item dropdown">
		      <div style="display: flex; flex-direction: row;">
		        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		        	<%= userIDofSession %>
		        </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <a class="dropdown-item" href="logoutAction.jsp">log out</a>
		        </div>
	        </div>
	      </li>
	      	<%
						}
	        %>	
	    </ul>
	  </div>
	</nav>
	<div class="container" style="padding-top: 50px;">
		<blockquote class="blockquote text-right">
  		<p class="mb-0 border-bottom">Notice Board Page</p>
		</blockquote>
		<div class="list-group">
		<%
    	BoardDAO boardDAO = new BoardDAO();
    	ArrayList<BoardDTO> list = boardDAO.getList(pageNumber);
    	for(int i = 0; i < list.size(); i++) {
    		if(userIDofSession != null) {
		%>
			<div class="d-flex w-100 justify-content-between" style="height: 120px;">
				<a href="view.jsp?boardID=<%= list.get(i).getBoardID() %>" class="list-group-item list-group-item-action">
		    <div class="d-flex w-100 justify-content-between">
		      <h5 class="mb-1" style="overflow: hidden; text-overflow: ellipsis; display: inline-box;"><%= list.get(i).getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></h5>
		      <small><%= list.get(i).getBoardDate() %></small>
		    </div>
		    <p class="mb-1" style="height: 50px; overflow: hidden; text-overflow: ellipsis;"><%= list.get(i).getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p>
		    <small>Writer: <%= list.get(i).getUserID() %></small>
		  </a>
		  </div>
		<%
				} else {
		%>	
		  <a onclick="return confirm('로그인이 필요합니다.')" href="login.jsp" class="list-group-item list-group-item-action">
		    <div class="d-flex w-100 justify-content-between">
		      <h5 class="mb-1" style="overflow: hidden; text-overflow:ellipsis;"><%= list.get(i).getBoardTitle() %></h5>
		      <small><%= list.get(i).getBoardDate() %></small>
		    </div>
		    <p class="mb-1">...</p>
		    <small>Writer: <%= list.get(i).getUserID() %></small>
		  </a>
		<%
				}
			}
		%>
		</div>
		<div style="display: flex; flex-direction: row; margin-top: 30px;">
		 	<%
		  	if(pageNumber != 1) {
		 	%>
		  <a href="board.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success" style="margin-right: 1px;">prev</a>
		  <%	
		  	}
		  	if(boardDAO.nextPage(pageNumber + 1)) {
		  %>
		  <a href="board.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success">next</a> 
			<%
		  	}
			%>
			<div class="d-flex justify-content-end" style="width: 100%;">
			  <%
			  	if(userIDofSession != null) {
				%>
				<a href="write.jsp" class="btn btn-primary">Write.</a>
				<%		
					} else {
				%>
				<a onclick="return confirm('로그인이 필요합니다.')" href="login.jsp" class="btn btn-primary">Write.</a>
				<%
					}
				%>
			</div>
		</div>
	</div>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/537f2d83ee.js" crossorigin="anonymous"></script>
</body>
</html>