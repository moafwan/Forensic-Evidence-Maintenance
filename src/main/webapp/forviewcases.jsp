<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Case Details</title>
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

        h1 {
            text-align: center;
            color: white;
            margin-bottom: 20px;
        }

        form {
            text-align: center;
            margin-bottom: 20px; /* Add some space between form and button */
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #666;
        }

        input[type="text"] {
            width: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: rgba(255, 255, 255,0.7);
            color: black;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: rgba(255, 255, 255,1.0);
        }

        .back-button button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: rgba(255, 255, 255,0.7);
            color: black;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .back-button button:hover {
            background-color: rgba(255, 255, 255,1.0);
        }
    </style>
</head>
<body>
    <h1>Enter Case ID to Retrieve Details:</h1>
    <form action="retrieve_case_details.jsp" method="post">
        <label for="caseId"></label>
        <input type="text" id="caseId" name="caseId">
        <button type="submit">Retrieve Details</button>
    </form>

    <!-- Back button -->
    <div class="back-button">
        <button onclick="goBack()">Back</button>
    </div>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>
