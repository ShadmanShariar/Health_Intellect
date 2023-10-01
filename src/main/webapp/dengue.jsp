<%@page import="java.sql.*" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.TreeMap" %>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
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
    <div class="">
    </div>

<center>
<table border="1">

<tr>
<td style="background-color:yellow;">Medicine Name</td>

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
    String d = request.getParameter("disease");

    %>
    <br><br><br>
    <h1>Username : <%=hi%></h1>
    <br><br><br>
    <%
    String qry = "select * from datas where udisease = 'Dengue'";
 
    rs = st.executeQuery(qry);
    
    HashMap<String,Integer> map = new HashMap<String,Integer>();
    HashMap<String,Double> sum = new HashMap<String,Double>();
    
    
while(rs.next()){ 
String tmp = rs.getString(3);
int tmp22 = rs.getInt(4);
double tmp2 = (double)(tmp22);
if(map.containsKey(tmp)){
	int count = map.get(tmp);
	count++;
	map.put(tmp,count);
	double g = sum.get(tmp);
	g+=tmp2;
	sum.put(tmp,g);
}
else{
	
	map.put(tmp,1);
	sum.put(tmp,tmp2);
 }
}
SortedMap< Integer, String > map2 = new TreeMap<>( (i, j) -> i < j ? 1 : -1 );

for(Map.Entry<String, Integer>entry:map.entrySet()){
	String kk = entry.getKey();
	Integer kk2 = entry.getValue();
    map2.put(kk2, kk);
}



for(Map.Entry<Integer, String>entry:map2.entrySet()) {

	String kk = entry.getValue();
	Double kk2 = sum.get(kk);
	Integer kk3 = entry.getKey();
	 

	
%>

<tr>
<td><%=kk%></td>
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