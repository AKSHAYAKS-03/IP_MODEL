<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3-Letter Words Finder</title>
</head>
<body>
    <h1>3-Letter Words Finder</h1>
    
    <input type="text" id="sentenceInput" placeholder="Enter a sentence">
    <br><br>
    <button onclick="findThreeLetterWords()">Find 3-Letter Words</button>
    
    <br><br>
    <div id="result"></div>

    <script>
        function findThreeLetterWords() {
            const input = document.getElementById('sentenceInput').value.trim();
            if (input === "") {
                document.getElementById('result').innerHTML = "Please enter a sentence.";
                return;
            }

            const words = input.split(" ");
            const threeLetterWords =[];
                    for (let i = 0; i < words.length; i++) {
                        if (words[i].length === 3) {
                          threeLetterWords.push(words[i]);
                        }
                      }


            document.getElementById('result').innerHTML = "The Words Are : " + threeLetterWords.join(" , ");
        }
    </script>
</body>
</html>
