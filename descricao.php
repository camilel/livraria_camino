<?php
require_once "conexao.php"; // Faz a conexão com o banco

if (isset($_GET['id']) && !empty($_GET['id'])) {
    $id = intval($_GET['id']); 

    $sql = "select l.*, a.nome from livro l inner join autor a on a.id = l.id_autor where l.id = $id";

    $busca = $banco->query($sql);

    if ($busca && $busca->num_rows > 0) {
        $dados = $busca->fetch_object();
    } else {
        die("<h2>Livro não encontrado.</h2>");
    }
} else {
    die("<h2>Nenhum livro especificado.</h2>");
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <title>Informações</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="descricao.css">
</head>
<body>

<div class="logo"></div>
<div class="logo1">Livraria</div>
<div class="logo2">Camino</div>

<div class ="titulo">
    <h1>Informações</h1>
</div>

<main class="pagina">
<section class="cartao-produto">
<div class="capa">
<img src="<?php echo "$dados->imagem" ?>" alt="">
</div>
<div class="detalhes">
<h1 class="nome"> <?php echo "$dados->titulo" ?> </h1>
<div class="autor"><?php echo "$dados->nome" ?> </div>
<div class="descricao">
<p><?php echo "$dados->descricao" ?> </p>
</div>
<div class="rodape">
<p class="preço">R$ <?php echo number_format($dados->valor, 2, ',', '.'); ?></p></div>
<form method="POST" action="add_carinho.php?cod=<?php echo $dados->id ?>">
      <button class="botao" type="submit">Adicionar ao carrinho</button>
    </form>
</div>
</div>
</section>
</main>

</body>
</html>