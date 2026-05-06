<?php
require_once "conexao.php";

if ($banco->connect_error) {
    echo "<p>Encontrei um erro: " . $banco->connect_error . "</p>";
    die();
}
 
$termo = isset($_GET['q']) ? $_GET['q'] : '';
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Busca</title>
  <link rel="stylesheet" href="buscar.css">
  <script src="https://code.iconify.design/3/3.1.0/iconify.min.js"></script>
</head>
<body>

<div class="logo"></div>
<div class="logo1">Livraria</div>
<div class="logo2">Camino</div>

<div class ="titulo">
    <h1>Busca</h1>
</div>

<div class="back">
<a href="index.php">VOLTAR</a>
</div>
 
<h2>Resultados para: <span class="text-primary"><?php echo ($termo); ?></span></h2>
 
<div class="row">
<?php
if ($termo != '') {
    $sql = "select livro.id, livro.titulo, livro.valor, livro.imagem, autor.nome AS autor
            from livro
            join autor on livro.id_autor = autor.id
            where livro.titulo like ? or autor.nome like ?";
 
    $stmt = $banco->prepare($sql);
 
    if (!$stmt) {
        die("Erro no prepare: " . $banco->error);
    }
 
    $busca = "%" . $termo . "%";
    $stmt->bind_param("ss", $busca, $busca);
    $stmt->execute();
    $result = $stmt->get_result();
 
    if ($result->num_rows > 0) {
        while ($dados = $result->fetch_object()) {
            ?>
            <div class="card">
              <img src="<?php echo ($dados->imagem); ?>"
                   alt="Capa do livro">
              <div class="card-body">
                <a href="descricao.php?id=<?php echo $dados->id ?>" class="card-link"><?php echo $dados->titulo ?></a>
                <p class="card-text"><?php echo ($dados->autor); ?></p>
                <p class="price">R$ <?php echo number_format($dados->valor, 2, ',', '.'); ?></p>
                <form method="POST" action="add_carinho.php?cod=<?php echo $dados->id ?>">
                    <button class="btn-add" type="submit"><span class="iconify" data-icon="mdi:cart-plus" style="font-size:24px;"></span></button>
                </form>
              </div>
            </div>
            <?php
        }
    } else {
        echo "<p>Nenhum livro encontrado.</p>";
    }
 
    $stmt->close();
}
$banco->close();
?>
</div>
 
</body>
</html>