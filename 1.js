<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Duplicate Elements Finder</title>
</head>
<body>
    <h1>Duplicate Elements Finder</h1>
    
    <input type="text" id="userInput" placeholder="Enter numbers ">
    <br><br> <button onclick="processInput()">Find Duplicates</button>
    
    <br><br><div id="ans"></div>

    <script>
        function processInput() {
            const input = document.getElementById('userInput').value;
            const array = input.split(',');
            const duplicates = findDuplicates(array);
            document.getElementById('ans').innerHTML = "Duplicates: " + duplicates;
        }

        function findDuplicates(arr) {
            let duplicates = [];
            for (let i = 0; i < arr.length; i++) {
                for (let j = i + 1; j < arr.length; j++) {
                    if (arr[i] === arr[j] && !duplicates.includes(arr[i])) {
                        duplicates.push(arr[i]);
                        break;
                    }
                }
            }
            return duplicates;
        }
    </script>
</body>
</html>
