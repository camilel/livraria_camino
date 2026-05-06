<?php
session_start();
require_once "conexao.php";

$usuario = $_POST["usuario"];
$senha = $_POST["senha"];
$sql = "select id, nome from cliente where email = '$usuario' and senha = '$senha' ";
$busca = $banco->query($sql);
if ($busca->num_rows>0){

     while ($dados = $busca->fetch_object()) { 
        $_SESSION["id_cliente"] = $dados->id;
        $_SESSION["nome_cliente"] = $dados->nome;
     }
    echo"<script>alert('Login efetuado com sucesso'); window.location.href='index.php'; </script>";
}
else {
    $_SESSION["id_cliente"] = "";
    $_SESSION["nome_cliente"] = "";
    echo"<script>alert('Usuário não encontrado'); window.location.href='login.php'; </script>";
}
?>