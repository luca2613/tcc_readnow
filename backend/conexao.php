<?php
$servername = "localhost";
$username = "daniel";
$password = "123";
$dbname = "readnow";
    try {
      $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
      $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      echo "Connected successfully. Classe Conexão Readnow";
      echo "<br>";
    } catch(PDOException $e) {
      echo "Connection failed: " . $e->getMessage();
    }
  
?>