<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Medicines</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4; /* Light grey background */
        }
        .navbar {
            background-color: #007bff; /* Bootstrap primary color */
        }
        .navbar a {
            color: white;
        }
        .search-container {
            padding: 20px;
            margin-top: 20px;
            background: white;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        #results {
            margin-top: 20px;
        }
        .card {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="Profile.jsp">Home</a>
        </div>
    </nav>
    <div class="container search-container">
        <h2 class="mb-3">Search for Medicines</h2>
        <div class="input-group mb-3">
            <input type="text" id="searchQuery" class="form-control" placeholder="Enter medicine name...">
            <div class="input-group-append">
                <button class="btn btn-primary" onclick="fetchMedicines()">Search</button>
            </div>
        </div>
        <div id="results"></div> <!-- Container for displaying search results -->
    </div>

    <script>
        function fetchMedicines() {
            var query = document.getElementById('searchQuery').value;
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'fetchDetails.jsp?query=' + encodeURIComponent(query), true);
            xhr.onload = function() {
                if (this.status == 200) {
                    document.getElementById('results').innerHTML = this.responseText;
                } else {
                    document.getElementById('results').innerHTML = '<div class="alert alert-danger">Error fetching data.</div>';
                }
            };
            xhr.send();
        }
    </script>
</body>
</html>