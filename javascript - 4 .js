<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Anagram Checker</title>
</head>
<body>
    <h1>Anagram Checker</h1>
    
    <input type="text" id="str1" placeholder="Enter String 1">
    <input type="text" id="str2" placeholder="Enter String 2">

    <br><br>
    <button onclick="processInput()">Check Anagram</button>
    
    <br><br>
    <div id="result"></div>

    <script>
        function processInput() {
            const str1 = document.getElementById('str1').value;
            const str2 = document.getElementById('str2').value;

            // Check if input strings are empty
            if (str1.trim() === '' || str2.trim() === '') {
                document.getElementById('result').innerHTML = 'Please enter both strings.';
                return;
            }

            // Check if input strings contain only non-alphanumeric characters
            if (!/^[a-zA-Z0-9]+$/.test(str1) || !/^[a-zA-Z0-9]+$/.test(str2)) {
                document.getElementById('result').innerHTML = 'Input strings should contain only letters and numbers.';
                return;
            }

            // Check if strings are anagrams
            isAnagram(str1, str2);
        }

        function isAnagram(str1, str2) {
            const sortedStr1 = str1.toLowerCase().split('').sort().join('');
            const sortedStr2 = str2.toLowerCase().split('').sort().join('');

            if (sortedStr1 === sortedStr2) {
                document.getElementById('result').innerHTML = 'Anagrams.';
            } else {
                document.getElementById('result').innerHTML = 'Not Anagrams.';
            }
        }
    </script>
</body>
</html>
