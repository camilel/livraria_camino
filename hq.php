<?php
  require_once "conexao.php"; // Faz a conexão com o banco

  $sql = "select l.*, a.nome from livro l inner join autor a on a.id = l.id_autor where id_formato = 1;"; // faz o código SQL em uma variavel normal

  $busca = $banco->query($sql); // $busca é a variavel que vai ter o resultado da consulta no banco, $banco é a variavel que ta definida em conexao.php
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <title>Histórias em Quadrinhos</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.iconify.design/3/3.1.0/iconify.min.js"></script>
  <link rel="stylesheet" href="genero.css">
</head>
<body>

<div class="logo"></div>
<div class="logo1">Livraria</div>
<div class="logo2">Camino</div>

<div class ="titulo">
    <h1>Histórias em Quadrinhos</h1>
</div>

<div class="back">
<a href="index.php">VOLTAR</a>
</div>

<div class="vendidos d-flex flex-wrap">

  <?php while ($dados = $busca->fetch_object()) { //Roda todos os registros retornados no select ?> 
    <div class="card bg-transparent border-0 text-center p-2" >
    <img src= "<?php echo "$dados->imagem" ?>" alt="" style="width:225px; height:350px;border-radius:15px;display:block;margin: 0 auto;">
    <a href="descricao.php?id=<?php echo $dados->id ?>" class="card-link"><?php echo $dados->titulo ?></a>
    <p><?php echo "$dados->nome" ?> </p> 
    <p class="price">R$ <?php echo number_format($dados->valor, 2, ',', '.'); ?></p>
    <form method="POST" action="add_carinho.php?cod=<?php echo $dados->id ?>">
      <button class="btn-add" type="submit"><span class="iconify" data-icon="mdi:cart-plus" style="font-size:24px;"></button>
    </form>
    </div> 

  <?php } ?>
</div>

</body>
</html>