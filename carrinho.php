<?php
session_start();
include 'conexao.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $qtd = $_POST["quantidade"];
  $id = $_POST["id"];

  $sql = "update carrinho set quantidade = $qtd where id = $id";

  $busca = $banco->query($sql); 
  echo "<script> window.location.href = 'carrinho.php';</script>";
}
?>


<!DOCTYPE html>
<html lang="pt-br">
<head>
  <title>Carrinho</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="carrinho.css">
</head>
<body>

<div class="logo"></div>
<div class="logo1">Livraria</div>
<div class="logo2">Camino</div>

<div class ="titulo">
    <h1>Carrinho</h1>
</div>

<div class="back">
<a href="index.php">CONTINUE COMPRANDO</a>
</div>

<?php 
  if (isset($_SESSION['id_cliente']) && !empty($_SESSION['id_cliente'])) {
    $id_cliente = $_SESSION["id_cliente"];
    $sql = "select c.id, c.quantidade, c.id_cliente, c.id_livro, l.titulo, l.valor, l.imagem, l.id_autor, a.nome from carrinho c inner join livro l on l.id = c.id_livro inner join autor a on a.id = l.id_autor where id_cliente = $id_cliente;";
    $busca = $banco->query($sql); 
?>
  
<div class = "carrinho2">
  <table class='table table-bordered table-striped'>
  <thead><tr><th>Produto</th><th>Preço</th><th>Qtd</th><th>Subtotal</th><th>Ação</th></tr></thead>
    <tbody>
      <tr>
        <?php   
        $total = 0;
        while ($dados = $busca->fetch_object()) { //Roda todos os registros retornados no select ?> 
          <td> 
          <div class="d-flex align-items-center mb-3">
            <img src="<?php echo $dados->imagem ?>" alt="suspense3" width="70" class="me-3">
    
            <div>
              <h6 class="mb-0"><?php echo $dados->titulo ?></h6>
              <small class="text-muted d-block"><?php echo $dados->nome ?></small>
            </div>
          </div>
          </td>

          <td> <?php echo "R$ " . number_format($dados->valor, 2, ',', '.') ?> </td>

          <td>
            <form method="POST">
              <div class="input-group mb-2" style="max-width:150px;">            
                <input type="hidden" name="id" value="<?php echo $dados->id ?>">
                <input type="number" name="quantidade" value="<?php echo $dados->quantidade ?>" min="1" class="form-control" required>
                <button type="submit" class= 'btn btn-secondary'>Atualizar</button>
              </div>
          </form>
          </td>

          <td><?php $subtotal =  $dados->valor * $dados->quantidade;
                    $total = $total + $subtotal;
              echo "R$ " . number_format($subtotal, 2, ',', '.') ?></td>
          <form method="POST" action="remove_carrinho.php">
            <input type="hidden" name="id" value="<?php echo $dados->id ?>">
            <td><button type="submit" class='btn btn-sm btn-secondary'>Remover</button></td>
          </form>
      </tr>
      <?php }?>

      <tr class='table-dark'><td colspan='3'><strong>Total</strong></td>
        <td colspan='2'><strong><?php echo "R$ " . number_format($total, 2, ',', '.') ?></strong></td></tr>
    </tbody>
  </table>
      <form method='post' action='pagamento.php'>
        <button name='finalizar_pedido' class='btn btn-dark' <?php echo ($total == 0) ? 'disabled' : ''; ?>>
            Finalizar Pedido
        </button>
      </form>
  </div>

  <?php } 
  else { ?>
    <div class="carrinho-vazio">
        <div class="icone-vazio">🛒</div>
        <h3>Seu carrinho está vazio</h3>
        <p>Faça login para começar suas compras!</p>
        <a href="login.php" class="btn btn-dark">LOGIN</a>
    </div>
  <?php } ?>
</body>
</html>