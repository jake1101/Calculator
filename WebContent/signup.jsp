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
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <i class="far fa-user-circle"></i>
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="login.jsp">login</a>
	          <a class="dropdown-item" href="signup.jsp">sign up</a>
        	</div>
	      </li>
	    </ul>
	  </div>
	</nav>
	<div class="container" Style="box-align: center; padding-top: 50px;">
		<blockquote class="blockquote text-right">
  		<p class="mb-0 border-bottom">Sign Up Page</p>
		</blockquote>
		<form method="post" action="signupAction.jsp">
			<div class="form-group" style="padding-bottom: 30px;">
		    <label for="userID">ID</label>
		    <input type="text" class="form-control" id="userID" name="userID">
		  </div>
			<div class="form-group" style="padding-bottom: 30px;">
		    <label for="userPW">Password</label>
		    <input type="password" class="form-control" id="userPW" name="userPW">
		  </div>
	 		<div class="form-group" style="padding-bottom: 30px;">
		    <label for="userName">Name</label>
		    <input type="text" class="form-control" id="userName" name="userName">
		  </div>
		  <div class="form-group" style="padding-bottom: 30px;">
		  	<div style="padding-bottom: 10px;">Gender</div>
			  <div class="custom-control custom-radio custom-control-inline">
				  <input type="radio" name="userGender" id="male" class="custom-control-input" value="male">
				  <label class="custom-control-label" for="male">male</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
				  <input type="radio" name="userGender" id="female" class="custom-control-input" value="female">
				  <label class="custom-control-label" for="female">female</label>
				</div>
			</div>
		  <div class="form-group">
		    <label for="userEmail">Email address</label>
		    <input type="email" class="form-control" id="userEmail" name="userEmail" aria-describedby="emailHelp">
		    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
		  </div>
		  <div class="d-flex justify-content-end" style="width: 100%; margin-top: 30px;">
		  	<input type="submit" class="btn btn-primary" value="Sign Up.">
			</div>
		</form>
	</div>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/537f2d83ee.js" crossorigin="anonymous"></script>
</body>
</html>