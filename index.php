<?php
  session_start();
  require_once "conexao.php"; // Faz a conexão com o banco

 // $sql = "select l.*, a.nome from livro l inner join autor a on a.id = l.id_autor "; 
 $sql = "select l.*, a.nome from livro l inner join mais_vendidos mv on mv.id_livro = l.id inner join autor a on a.id = l.id_autor;";

  $busca = $banco->query($sql); // $busca é a variavel que vai ter o resultado da consulta no banco, $banco é a variavel que ta definida em conexao.php
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"><!-- link do icone offcanvas -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.iconify.design/3/3.1.0/iconify.min.js"></script>
  <title>Livraria Camino</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

  <div class="logo"></div>
  <div class="logo1">Livraria</div>
  <div class="logo2">Camino</div>

  <div class ="lista1">
    <ul>
   <li><a href="carrinho.php">Carrinho</a></li>
   <li><a href="duvidas.php">Dúvidas Frequentes</a></li>

   <?php     
        if (isset($_SESSION['id_cliente']) && !empty($_SESSION['id_cliente'])) {
          $nome = $_SESSION["nome_cliente"];
    ?>
      <li><a href="sair.php">Logout</a></li>
      <li><a href="perfil.php" id="perfil">Olá, <?php echo $_SESSION["nome_cliente"]; ?></a></li>
   <?php }  else { ?>

    <li><a href="login.php">Login/Cadastro</a></li>
   <?php }  ?>
  </div>

   <form method="GET" action="buscar.php">
      <input type="text" name="q" placeholder="Buscar...">
   </form>

   <div class ="lista2">
      <ul>
        <div class ="li2"> 
          <li><a href="infantil.php">INFANTIL</a></li>
          <li><a href="adultos.php">ADULTOS</a></li>
          <li><a href="didaticos.php">DIDÁTICOS</a></li>
          <li><a href="geek.php">GEEK</a></li>
        </div>
      </ul>
  </div>

<button class="navbar-toggler d-flex align-items-center gap-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#menuLateral" aria-controls="menuLateral">
  <i class="bi bi-book-half" style="font-size: 28px; color:#black; position:absolute; top:105px;"></i>
  <span class="menu-text">Categorias</span>
</button>


<!-- Offcanvas -->
<div class="offcanvas offcanvas-end fade" tabindex="-1" id="menuLateral" aria-labelledby="menuLateralLabel">
  <div class="offcanvas-header">
  <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Fechar"></button>
  </div>

      <h2>Gêneros</h2>
        <div class = "ul-offcanvas">
          <ul> 
          <li><a href=drama.php>Drama</a></li>
          <li><a href=fantasia.php>Fantasia</a></li>
          <li><a href=romance.php>Romance</a></li>
          <li><a href=suspense.php>Suspense</a></li>
          <li><a href=terror.php>Terror</a></li>
          </ul>
        </div>
      <h3>Formatos</h3>
        <div class = "ul-offcanvas2">
          <ul> 
          <li><a href=hq.php>Histórias em Quadrinhos</a></li>
          <li><a href=livro.php>Livro</a></li>
          <li><a href=manga.php>Mangá</a></li>
          </ul>
         </div>
  </div>

<div class="carrosel">
  <!-- Carousel -->
 <div id="demo" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="3000">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="imagens/carrossel1.png" alt="descontos" class="d-block" style="width:1100px;height:700px;border-radius:30px;display:block;margin: 0 auto">
    </div>
    <div class="carousel-item">
      <img src="imagens/carrossel2.png" alt="descontos" class="d-block" style="width:1100px;height:700px;border-radius:30px;display:block;margin: 0 auto">
    </div>
    <div class="carousel-item">
      <img src="imagens/carrossel3.png" alt="lançamentos" class="d-block" style="width:1100px;height:700px;border-radius:30px;display:block;margin: 0 auto">
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
 </div>
</div>

<h1>Os mais vendidos</h1>
  
<div class="vendidos d-flex flex-wrap">

  <?php while ($dados = $busca->fetch_object()) { //Roda todos os registros retornados no select ?> 
    <div class="card bg-transparent border-0 text-center p-2" >
      <img src= "<?php echo "$dados->imagem" ?>" alt="" style="width:150px; height:225px;border-radius:15px;display:block;margin: 0 auto">
      <a href="descricao.php?id=<?php echo $dados->id ?>" class="card-link"><?php echo $dados->titulo ?></a>
      <p><?php echo "$dados->nome" ?> </p> 
      <p class="price">R$ <?php echo number_format($dados->valor, 2, ',', '.'); ?></p>
        <form method="POST" action="add_carinho.php?cod=<?php echo $dados->id ?>">
          <button class="btn-add" type="submit"><span class="iconify" data-icon="mdi:cart-plus" style="font-size:24px;"></span></button>
        </form>
    </div> 

  <?php } ?>
</div>


</body>
</html>
