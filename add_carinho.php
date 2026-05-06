<?php
    session_start();
    require_once "conexao.php"; 
    if (isset($_SESSION['id_cliente']) && !empty($_SESSION['id_cliente'])) {
        $id_livro = $_GET['cod'] ?? 0; 
        $id_cliente = $_SESSION["id_cliente"];

        $sql = "insert into carrinho (quantidade, id_livro, id_cliente) values (1, $id_livro, $id_cliente)";

        $busca = $banco->query($sql); 

        echo "<script> window.location.href = 'carrinho.php'; </script>";
    }
    else {
        echo "<script> alert('Faça login'); window.location.href = 'login.php';</script>";

    }
?>

