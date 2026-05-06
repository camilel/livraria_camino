<?php
    require_once "conexao.php"; 
    $id = $_POST["id"];

    $sql = "delete from carrinho where id = $id";

    $busca = $banco->query($sql); 
?>

<script>
    window.location.href = "carrinho.php";
</script>