<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Cases</title>
    <style>
         body {
             font-family: Arial, sans-serif;
           background-image: url('caseofficer.jpg');
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column; /* Align items vertically */
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-repeat:no-repeat;
             background-size: cover; /* Cover the entire background */
    background-position: center;
   
        }


        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
              background-color: rgba(255, 255, 255,0.8);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            text-align: center; /* Center align contents */
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: rgba(255, 255, 255,0.9);
            color: black;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Case</h2>
        <form action="process_delete_actions.jsp" method="post">
            <label for="caseId">Enter Case ID to Delete:</label>
            <input type="text" id="caseId" name="caseId" required>
            <button type="submit">Delete</button>
        </form>
    </div>
</body>
</html>
