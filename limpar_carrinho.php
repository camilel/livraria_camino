<?php
session_start();
require_once "conexao.php";

$id_cliente = $_SESSION["id_cliente"];

$sql = "delete from carrinho where id_cliente = $id_cliente";
$banco->query($sql);

?>

<script>
    window.location.href = "index.php";
</script>