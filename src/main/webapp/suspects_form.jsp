<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Suspects Form</title>
    <style>
        body {
            
    margin: 0;
    padding: 0;
    background-image: url('caseofficer.jpg'); 
    font-family: Arial, sans-serif;
    background-repeat: no-repeat; /* Prevent background image from repeating */
    background-size: cover; /* Cover the entire background */
    background-position: center; /* Center the background image */
    height: 100vh; /* Set the body height to 100% of viewport height */
}
 

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255,0.7);
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            width: 50%;
            padding: 10px;
            background-color: rgba(255, 255, 255, 0.3);
            color: black;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        button[type="submit"]:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Enter Suspect Details</h2>
        <form action="process_suspect_form.jsp" method="post">
            <label for="case_id">Case ID:</label>
            <input type="text" id="case_id" name="case_id" required>
            
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
            
            <label for="aadhar_id">Valid ID :</label>
            <input type="text" id="aadhar_id" name="aadhar_id" required>
            
            <label for="crime">Crime:</label>
            <input type="text" id="crime" name="crime" required>
            
            <label for="crime_date">Crime Date:</label>
            <input type="date" id="crime_date" name="crime_date" required>
            
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
