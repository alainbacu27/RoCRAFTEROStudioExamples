<?php
$servername = "localhost";
$username = "USERNAME;
$password = "PASSWORD";
$dbname = "DBNAME";

$conn = mysqli_connect($servername, $username, $password, $dbname);
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

$payload = json_decode(file_get_contents("php://input"), true);
$PlayerID = $payload['PlayerID'];

if($PlayerID != NULL){
	$sql = "INSERT INTO Players (PlayerID, Score1, Score2)
VALUES ('$PlayerID', '0', '0')";
}

$sql = "SELECT * FROM Players";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
  // output data of each row
  while($row = mysqli_fetch_assoc($result)) {
    echo "id: " . $row["PlayerID"]. "<br>Score1: " . $row["Score1"] . "<br>";
  }
} else {
  echo "0 results";
}
?>