<%
if (session.getAttribute("name")==null){
	response.sendRedirect("home.jsp");
}

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
  <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #0e2433;
        color: white;
        margin: 0;
        padding: 0;
    }

    .header {
        background-color: #45b6fe;
        padding: 20px;
        text-align: center;
    }

    .header h1 {
        margin: 0;
    }

    .container {
        max-width: 1500px;
        margin: 20px auto;
        padding: 20px;
        background-color: #0e2433;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }

    h2 {
        color: #45b6fe;
    }
    
figure {
display: grid;
border-radius: 1rem;
overflow: hidden;
cursor: pointer;
padiing-left:30%;
}
figure > * {
grid-area: 1/1;
transition: .4s;
}
figure figcaption {
display: grid;
align-items: end;
font-family: sans-serif;
font-size: 2.3rem;
font-weight: bold;
color: #0000;
padding: .75rem;
background: var(--c,#0009);
clip-path: inset(0 var(--_i,100%) 0 0);
-webkit-mask:
linear-gradient(#000 0 0),
linear-gradient(#000 0 0);
-webkit-mask-composite: xor;
-webkit-mask-clip: text, padding-box;
margin: -1px;
}
figure:hover figcaption{
--_i: 0%;
}
figure:hover img {
transform: scale(1.2);
}
@supports not (-webkit-mask-clip: text) {
figure figcaption {
-webkit-mask: none;
color: #fff;
}
}

</style>
</head>

<body style="background-color: white;" id="page-top"> 
	<!-- Navigation-->
	<nav style="background-color:orange;" 
		class="navbar navbar-expand-lg bg-orange text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">Health Intellect</a>
			<br>
			<a href="his.jsp" class="nav-link py-3 px-0 px-lg-3 rounded"><%=session.getAttribute("name") %></a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="index.jsp">Home</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="information.jsp">Provide Info</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="get_suggestions.jsp">Get Suggestions</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="digonesis.jsp">Diagnosis</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="aboutUs.jsp">About Us</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded bg-danger" href="Logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	
  <img style="margin-top: 20%; margin-left:38%;" src="images/logo.png" alt="">
  <h1 align="center" style="color: navy; margin-top: 5%;">Some Common Diseases</h1>
 <br> <br> <br>
  </div>
  <div align="center"  style="display:inline-flex; margin-left:10%; margin-bottom: 10%;">
<a href="fever.jsp">
   <figure>
    <img src="images/fever.png" alt="Mountains">
    <figcaption>Fever</figcaption>
</figure>
</a>
<a href="diarrhea.jsp">
<figure>
    <img src="images/di.jpg" alt="Mountains">
    <figcaption>Diarrhea</figcaption>
</figure>
</a>
<a href="dengue.jsp">
    <figure>
    <img src="images/den.png" alt="Mountains">
    <figcaption>Dengue</figcaption>
</figure>
</a>
<a href="diabetes.jsp">
<figure>
    <img src="images/diabetes.png" alt="Mountains">
    <figcaption>Diabetes</figcaption>
</figure>
</a>
<a href="cold.jsp">
   <figure>
    <img src="images/cold.jpg" alt="Mountains">
    <figcaption>Cold</figcaption>
</figure>
</a>
  </div>
  <div style="background-color: orange; height: 80px;">
<br><br>
  </div>

			
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
