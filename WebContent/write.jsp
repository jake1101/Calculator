<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="main.jsp"><h1 class="display-4" style="padding-right: 100px;">Notice Board</h1></a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>

	  <div class="collapse navbar-collapse" id="navbarSupportedContent" style="font-size: 20px;">
	    <ul class="navbar-nav mr-auto" style="width: 85%;">
	      <li class="nav-item active">
	        <a class="nav-link" href="main.jsp" style="padding-right: 30px;">Home <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="board.jsp" style="padding-right: 30px;">Board</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="calculator.jsp">Calculator</a>
	      </li>
	    </ul>
	    <ul class="navbar-nav mr-auto">
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
	    </ul>
	  </div>
	</nav>
	<div class="container" Style="box-align: center; padding-top: 50px;">
		<blockquote class="blockquote text-right">
  		<p class="mb-0 border-bottom">Writing Form</p>
		</blockquote>
		<form method="post" action="writeAction.jsp" style="padding-top: 30px;">
		  <div class="form-group">
		    <label for="title">Title</label>
		    <input type="text" class="form-control" id="title" placeholder="type title here." name="boardTitle" maxlength="50">
		  </div>
		  <div class="form-group">
		    <label for="content">Text Area</label>
		    <textarea class="form-control" id="content" placeholder="type content here." name="boardContent" maxlength="2048" style="height: 350px;"></textarea>
		  </div>
		  <div class="d-flex justify-content-end" style="width: 100%; margin-top: 30px;">
		  	<input type="submit" class="btn btn-primary" value="Upload.">
			</div>
		</form>
	</div>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/537f2d83ee.js" crossorigin="anonymous"></script>
</body>
</html>