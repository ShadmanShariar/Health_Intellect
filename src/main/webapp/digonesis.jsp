<%@page import="java.sql.*" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.TreeMap" %>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medical Information Form</title>
    <style>
    table {
borader: 1px solid;
  border-collapse: collapse;
  width: 30%;
}

th, td {
  padding: 40px;
  text-align: center;
  border-bottom: 1px solid white;
}

tr:hover {background-color: white;}
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
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
            background-color: blue;
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
<body style="background-color: skyblue;">
    <div class="container">
		
        <h1>Get Disease List</h1>
        
        <form style="width: 50%; height:100%;" action="digonesis.jsp" method="post">
			
			 <label for="disease">Username:</label>
            <input style="margin-bottom: 30px;" type="text" required name="uname" id="uname" class="required">
			
            <label for="disease">Symptoms:</label>
            <input style="margin-bottom: 30px;" type="text" required name="symptoms" id="symptoms" class="required">

            <label for="age">Age:</label>
            <input style="margin-bottom: 30px; height: 30px;" required type="number" name="age" class="required">
            
            <label for="gender">Gender:</label>
            <input style="margin-bottom: 30px;" type="radio" required name="gender" value="0">Male
            <input style="margin-bottom: 30px;" type="radio" required name="gender" value="1">Female
            
            <span id="lasterror" style="margin-left: 120px;"></span><br><br>

            <input style="margin-bottom: 30px;" type="submit" class="submit-button" value="Submit">
        </form>
    </div>

<center>
<table border="1">

<tr>
<td style="background-color:yellow;">Disease List</td>
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
    String d = request.getParameter("symptoms");
    %>
    <br><br><br>
    <h1>Username : <%=hi%></h1>
    <br><br><br>
    <%
    String qry = "";
    
    if(d.contains(",")){
    	String [] arr = d.split(",");
    	
    	arr[0] = arr[0].trim();
    	arr[1] = arr[1].trim();
    	qry = "SELECT * FROM datas WHERE usymptoms = '"+arr[0]+"' and usymptoms = '"+arr[1]+"'";
    	
    }
    else{
    	
    	qry = "SELECT * FROM datas WHERE usymptoms = '"+d+"'";
    	
    }

 
    rs = st.executeQuery(qry);

    HashSet<String> set = new HashSet<String>();
    
while(rs.next()){ 

	String kk = rs.getString(1);
    set.add(kk);
	
}
for(String kk : set){

%>

<tr>
<td><%=(kk)%></td>
</tr>
	
<%
 }
}catch(Exception ex){
	
}
    
%>

</table>
</center>


<br><br><br><br><br><br>
</body>
</html>