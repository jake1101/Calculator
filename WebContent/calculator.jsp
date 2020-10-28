<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Single Project</title>
<link	rel="stylesheet" href="css/bootstrap.min.css">
<style>
    div, button, h3, p{
        padding: 0;
        margin: 0;
    }
    #cal_cont {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        height: 100%;
    }
    
    #cal_body {
        border: 1px solid black;
        background: black;
        width: 300px;
        height: 470px;
        border-radius: 10px;
    }
    
    #displayArea {
        text-align: right;
        background-color: black;
        color: white;
        border-radius: 10px;
        height: 120px;
    }

    #icon {
        padding: 5px;
        font-size: 12px;
        display: flex;
        flex-direction: row;
        justify-content:space-between;
        height: 20px;
    }

    #display {
        font-size: 45px;
        padding-top: 30px;
        padding-right: 13px;
    }
    
    #inputArea {
        height: 300px;
    }
    
    .buttonRow {
        width:100%;
        height: 20%;
        display: flex;
        flex-direction: row;
        margin-bottom: 8px;
    }

    .buttonRow > button {
        width: 100%;
        height: 100%;
        color: white;
        background-color: #333333;
        font-size: 30px;
        border-radius: 100%;
        border: none;
        margin: 7px;
    }

    .buttonRow > #zero {
        width: 230%;
        border-radius: 50px;
    }

    button:focus {
        outline: none;
    }

    button:active {
        cursor: pointer;
        background-color: #525252;
    }

    .buttonRow > .lg_btn{
        color: black;
        background-color: #A5A5A5;
    }

    .lg_btn:active {
        background-color: #c9c7c7;
    }
    
    .buttonRow > .operator {
        background-color: #FE9E09;
    }

    .operator:active {
        background-color: #fdba56;
    }
</style>
</head>
<body oncontextmenu="return false">
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
  		<p class="mb-0 border-bottom">Calculator Page</p>
		</blockquote>
	  <div id="cal_cont">
	      <div id="cal_body">
	          <div id="displayArea">
	              <div id="icon">
	                  <div id="left">
	                      <i class="fas fa-signal"></i>
	                      JK LTE
	                  </div>
	                  <i class="fas fa-lock"></i>
	                  <div id="right">
	                      <i class="fas fa-moon"></i>
	                      79%
	                      <i class="fas fa-battery-three-quarters"></i>
	                  </div>
	              </div>
	              <h3 id="display" onmousedown="calculator.mouseClear(event)">0</h3>
	          </div>
	          <div id="inputArea">
	              <div class="buttonRow">
	                  <button class="lg_btn" onclick="calculator.clearAll()">AC</button>
	                  <button class="lg_btn" onclick="calculator.clear()">Del</button>
	                  <button class="lg_btn" onclick="calculator.getOperator('%')" style="font-size: 25px;"><b>%</b></button>
	                  <button class="operator" onclick="calculator.getOperator('/')">÷</button>                            
	              </div>
	              <div class="buttonRow">
	                  <button onclick="calculator.getNumber('7')">7</button>
	                  <button onclick="calculator.getNumber('8')">8</button>
	                  <button onclick="calculator.getNumber('9')">9</button>
	                  <button class="operator" onclick="calculator.getOperator('x')">×</button>
	              </div>
	              <div class="buttonRow">
	                  <button onclick="calculator.getNumber('4')">4</button>
	                  <button onclick="calculator.getNumber('5')">5</button>
	                  <button onclick="calculator.getNumber('6')">6</button>
	                  <button class="operator" onclick="calculator.getOperator('-')">─</button>
	              </div>
	              <div class="buttonRow">
	                  <button onclick="calculator.getNumber('1')">1</button>
	                  <button onclick="calculator.getNumber('2')">2</button>
	                  <button onclick="calculator.getNumber('3')">3</button>
	                  <button class="operator" onclick="calculator.getOperator('+')">+</button>
	              </div>
	              <div class="buttonRow">
	                  <button id="zero" onclick="calculator.getNumber('0')">0</button>
	                  <button onclick="calculator.checkDecimalPoint()">.</button>
	                  <button class="operator" onclick="calculator.getEqual()">=</button>
	              </div>
	          </div>
	      </div>
	  </div>
  </div>
<script>
  class Calculator {
      isFloat = false;
      hasOp = false;
      doubleOp = false;
      remover = false;
      operator = '';
      inputNum = '0';
      number1;
      number2;

      // 출력 메소드
      displayResult(num) {
          if(num.toString().length >= 11) {
              if(num.toString().charAt(1) != '.') num = num.toExponential(3);
              else num = num.toString().slice(0,11);
          }
          document.getElementById("display").innerHTML = num;
      }

      // 수 입력 메소드
      getNumber(num) {
          if(this.inputNum.length == 11) return false;
          this.inputNum += num;
      
          if(this.inputNum.charAt(0) == '0' 
          && this.inputNum.charAt(1) != '.') {
              this.inputNum = this.inputNum.substring(1);
          }
          this.displayResult(this.inputNum);
          this.setNumber();
      }
      
      // 수의 저장공간 할당 메소드
      setNumber() {
          if(this.hasOp) {
              this.number2 = Number(this.inputNum);
              this.doubleOp = false;
              this.remover = true;
          } else {
              this.number1 = Number(this.inputNum);
              this.remover = false;
          }
          this.isFloat = false;
      }

      // 연산자 입력 메소드
      getOperator(op) {
          this.inputNum = '0';
          this.hasOp = true;
          if(this.number2 && !this.doubleOp) this.calculate();
          this.operator = op;
          this.doubleOp = true;
      }

      // '=' 입력 메소드
      getEqual() {
          this.calculate();
          this.doubleOp = true;
          this.hasOp = false;
          this.remover = false;
      }

      // 연산 메소드
      calculate() {
          switch(this.operator) {
              case '%' :
                  this.number1 %= this.number2;
              case '/' :
                  if(this.number2 == 0) {
                      throw this.displayResult("Infinity");
                  }
                  this.number1 /= this.number2;
                  break;
              case 'x' :
                  this.number1 *= this.number2;
                  break;
              case '-' :
                  this.number1 -= this.number2;
                  break;
              case '+' :
                  this.number1 += this.number2;
          }
          this.displayResult(this.number1);
      }

      mouseClear(event) {
          if(event.button == 2) this.clear()
      }

      clear() {
          if(this.remover) {
              this.eraser(this.number2);
              this.number2 = Number(this.inputNum);
              this.doubleOp = true;
          }
          else{
              this.eraser(this.number1);
              this.number1 = Number(this.inputNum);
          } 
      }

      eraser(num) {
          this.inputNum = num.toString().slice(0, num.toString().length -1);
          if(this.inputNum.toString().length < 1) this.displayResult('0');                    
          else this.displayResult(this.inputNum);
      }

      clearAll() {    
          this.isFloat = this.hasOp = this.doubleOp = this.remover = false;
          this.operator = '';
          this.inputNum = '0';
          this.number1 = this.number2 = null;
          this.displayResult(0);
      }   

      checkDecimalPoint() {
          if(!this.isFloat) {
              this.getNumber('.');
              this.isFloat = true;
          } 
      }
  }

  let calculator = new Calculator();
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/537f2d83ee.js" crossorigin="anonymous"></script>
</body>
</html>