<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VALIDSTRING</title>
</head>
<body>
    <h1>VALIDSTRING</h1>
    
    <input type="text" id="str1" placeholder="Enter String 1">

    <br><br>
    <button onclick="processInput()">CHECK</button>
    
    <br><br>
    <div id="result"></div>

    <script>
        function processInput() {
            const str1 = document.getElementById('str1').value;
            const string = removeNumbersFromString(str1);
            document.getElementById('result').innerHTML = "Answer: " + string;
        }
            function removeNumbersFromString(str) {
                return str.replace(/[0-9]/g, '');
      }

              
    </script>
</body>
</html>
