<!DOCTYPE html>
<html>
<head>
    <title>Address Form</title>
</head>
<body>
<?php
    // Database connection
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "addresses";
    $port = 3307;

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname, $port);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Initialize variables
    $address = $city = $state = "";
    $address_err = $city_err = $state_err = "";

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Validate input
        if (empty($_POST["address"])) {
            $address_err = "Address is required";
        } else {
            $address = test_input($_POST["address"]);
        }

        if (empty($_POST["city"])) {
            $city_err = "City is required";
        } else {
            $city = test_input($_POST["city"]);
        }

        if (empty($_POST["state"])) {
            $state_err = "State is required";
        } else {
            // Check if state is a valid two-letter abbreviation
            if (preg_match("/^[a-zA-Z]{2}$/", $_POST["state"])) {
                $state = test_input($_POST["state"]);
            } else {
                $state_err = "State must be a valid two-letter abbreviation";
            }
        }

        // If all fields are filled out, insert data into database
        if (empty($address_err) && empty($city_err) && empty($state_err)) {
            $sql = "INSERT INTO addresses (address, city, state) VALUES ('$address', '$city', '$state')";
            if ($conn->query($sql) === TRUE) {
                echo "<center><p>Address successfully added.</p><br><br></<center>";
            } else {
                echo "<p>Error: " . $sql . "<br>" . $conn->error . "</p><br>";
            }
        }
    }

    // Function to sanitize input data
    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
?>
<center><form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
    <div>
        <label>Address:</label>
        <input type="text" name="address" value="<?php echo htmlspecialchars($address); ?>">
        <span><?php echo $address_err; ?></span>
    </div><br>
    <div>
        <label>City:</label>
        <input type="text" name="city" value="<?php echo htmlspecialchars($city); ?>">
        <span><?php echo $city_err; ?></span>
    </div><br>
    <div>
        <label>State (2-letter code):</label>
        <input type="text" name="state" value="<?php echo htmlspecialchars($state); ?>">
        <span><?php echo $state_err; ?></span>
    </div><br>
    <div>
        <input type="submit" value="Submit">
    </div>
</form>
</center>
</body>
</html>
