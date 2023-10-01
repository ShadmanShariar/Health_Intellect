<%@page import="java.sql.*" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Map" %>
<%@page import=" java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medical Information Form</title>
    <style>
    ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
  position: -webkit-sticky; /* Safari */
  position: sticky;
  top: 0;
}

li {
margin-top:1.5%;
  float: right;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}
table {
borader: 1px solid;
  border-collapse: collapse;
  width: 30%;
}

th, td {
  padding: 40px;
  text-align: center;
  border-bottom: 1px solid skyblue;
}

tr:hover {background-color: skyblue;}
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        form {
            margin-top: 20px;
            height: 400px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 30px;
            margin-bottom: 30px;


        }

        input[type="text"],
        input[type="radio"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="radio"] {
            width: auto;
            margin-right: 10px;
        }

        input[type="text"]:focus,
        input[type="radio"]:focus {
            outline: none;
            border-color: #45b6fe;
        }

        .required-error {
            color: red;
            margin-top: -10px;
            margin-bottom: 10px;
        }

        .submit-button {
            background-color: orange;
            color: #fff;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            cursor: pointer;
            width: 45%;
        }

        .submit-button:hover {
            background-color: red;
        }    
    </style>
</head>
<body style="background-color: white;">

<ul  style="margin-top:2%; margin-left:10%; width:80%; height:100px;">
  <li style="float: left;" ><a class="active" href="index.jsp">HEALTH INTELECT</a></li>
    <li><a href="aboutUs.jsp">ABOUT US</a></li>
 <li><a href="get_suggestions.jsp">GET SUGGESTIONS</a></li>
  <li><a href="information.jsp">PROVIDE INFO</a></li>
 <li><a href="digonesis.jsp">DIGONESIS</a></li>
  <li><a href="index.jsp">HOME</a></li>
  
</ul>

<center>

<h1>History</h1>

<table style="margin-top:2%;">

<tr>
<td style="background-color:yellow" >Disease Name</td>
</tr>

<%
Connection conn = null;
Statement st = null;
ResultSet rs = null;

// Database connection
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginreg", "root", "root");
    st = conn.createStatement();
    Object ob = session.getAttribute("name");
    String hi = ob.toString();
    String qry = "select * from his WHERE uname='"+hi+"'";
 
    rs = st.executeQuery(qry);
    
    HashSet<String> set = new HashSet<String>();
    
   while(rs.next()){ 
    String go = rs.getString(2);
    set.add(go);
    }


   for(String tp : set){
   String go = tp;
%>

<tr>
<td><%=go%></td>
</tr>
	
<%
 }
}catch(Exception ex){
	
}
    
%>

</table>
</center>



</body>
</html>