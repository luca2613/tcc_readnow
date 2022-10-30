<?php
require_once("conexao.php");

$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
//$input = json_decode('{"email":"fulano@gmail.com","senha":"123"}', TRUE); //convert JSON into array
//input are an array dictionary type from PHP.
$email = $input['email'];
$senha = $input['senha'];

$stmt = $conn->prepare("SELECT * FROM usuario WHERE nm_email_usuario = :email and nm_senha_usuario = :senha");

$stmt->bindParam(':email', $email, PDO::PARAM_STR); // PARAM_STR
$stmt->bindParam(':senha', $senha, PDO::PARAM_STR);
$stmt->execute();

$stmt->setFetchMode(PDO::FETCH_ASSOC); 
$result = $stmt->fetchAll();

  
$response = Array("verkey" => "", "tipo-usuario" => "");
if($stmt->rowCount() == 0){
    echo json_encode($response);
    echo "não existe está pessoa";
  }else{
      
      //it can be removed. It's an example how to access the date of a resultset
      foreach($result as $linha){
         echo $linha['cd_tipo_usuario']. " e " . $linha['cd_usuario'];
         echo "<li>{$linha['cd_tipo_usuario']}</li>";
      }
      
    $stmt = $conn->prepare("UPDATE usuario SET verkey=:verkey WHERE cd_tipo_usuario= :cd_tipo_usuario");
      $hash = md5($linha['nm_senha_usuario'] . $linha['nm_email_usuario']);
      $stmt->bindParam(':cd_tipo_usuario', $linha['cd_tipo_usuario']);
      $stmt->bindParam(':verkey', $hash);
    
      // execute the query
      $stmt->execute();  
      
      // adequado dar outro select para verificar se a hash foi inserida no update
     $response["verkey"] = $hash;
     $response["tipo-usuario"] = $linha['cd_tipo_usuario'];
     echo json_encode($response);
}

?>