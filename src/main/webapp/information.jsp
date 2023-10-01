<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medical Information Form</title>
    <style>
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
        }

        h1 {
            color: #333;
            text-align: center;
        }

        form {
            margin-top: 20px;
            height: 800px;
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
		
        <h1>Medical Information Form</h1>
        
        <form style="width: 50%;" action="info" method="post"  >
			
            <label for="disease">Disease:</label>
            <input style="margin-bottom: 30px;" type="text" required name="disease" id="disease" class="required">

            <label for="symptoms">Symptoms:</label>
            <input style="margin-bottom: 30px;" type="text" required name="symptoms" id="symptoms" class="required">

            <label for="medicine">Medicine:</label>
            <input style="margin-bottom: 30px;" type="text" required name="medicine" id="medicine" class="required">

            <label for="accuracy">Medicine Accuracy:</label>
            <input style="margin-bottom: 30px;" type="text" required  name="accuracy" id="accuracy" class="required" placeholder="Give Rating Out Of 10">

            <label for="age">Age:</label>
            <input style="margin-bottom: 30px; height: 3%;" required type="number" name="age" class="required">
            
            <label for="gender">Gender:</label>
            <input style="margin-bottom: 30px;" type="radio" required name="gender" value="0">Male
            <input style="margin-bottom: 30px;" type="radio" required name="gender" value="1">Female
            
            <span id="lasterror" style="margin-left: 120px;"></span><br><br>

            <input style="margin-bottom: 30px;" type="submit" class="submit-button" value="Submit">
        </form>
    </div>
    <script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type = "text/javascript">
	
	var status = document.getElementById("status").value;
	if (status=="success"){
		swal("Congrats","Details Saved Successfully","success");
	}

</body>
</html>