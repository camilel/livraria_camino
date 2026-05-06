<?php
session_start();
require_once "conexao.php";

if (!isset($_SESSION["id_cliente"])) {
    header("Location: login.php");
    exit;
}

$id_cliente = $_SESSION["id_cliente"];
$editar = isset($_GET["editar"]);

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["salvar"])) {
    $nome = $_POST["nome"];
    $senha = $_POST["senha"];
    $endereco = $_POST["endereco"];
    $telefone = $_POST["telefone"];
    $cidade = $_POST["cidade"];
    $estado = $_POST["estado"];
    $cep = $_POST["cep"];

 
    $sql = "update cliente 
            set nome='$nome', senha='$senha', endereco='$endereco', 
                telefone='$telefone', cidade='$cidade', estado='$estado', cep='$cep'
            where id=$id_cliente";
    $banco->query($sql);
    $_SESSION["nome_cliente"] = $nome;
    header("Location: perfil.php?sucesso=1");
    exit;
}

$sql = "select nome, cpf, email, senha, endereco, telefone, cidade, estado, cep 
        from cliente 
        where id=$id_cliente";
$result = $banco->query($sql);
$cliente = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Perfil</title>
    <link rel="stylesheet" href="cadastro.css">
</head>
<body>

<div class="wrapper">
    <form action="perfil.php<?php echo $editar ? '' : '?editar=1'; ?>" method="POST">
        <h1>Perfil</h1>

        <?php if (isset($_GET["sucesso"])): ?>
            <script>
                alert('Dados atualizados!');
                window.location.href = 'index.php';
            </script>
        <?php endif; ?>

        <div class="input-box">
            <input type="text" name="nome" placeholder="Nome"
                   value="<?php echo $cliente['nome']; ?>"
                   <?php echo $editar ? '' : 'readonly'; ?>>
        </div>

        <div class="input-box">
            <input type="text" name="cpf" value="<?php echo $cliente['cpf']; ?>" readonly>
        </div>

        <div class="input-box">
            <input type="text" name="email" value="<?php echo $cliente['email']; ?>" readonly>
        </div>

        <div class="input-box">
            <input type="password" name="senha" placeholder="Senha"
                   value="<?php echo $cliente['senha']; ?>"
                   <?php echo $editar ? '' : 'readonly'; ?>>
        </div>

        <div class="input-box full">
            <input type="text" name="endereco" placeholder="Endereço"
                   value="<?php echo $cliente['endereco']; ?>"
                   <?php echo $editar ? '' : 'readonly'; ?>>
        </div>

        <div class="input-box">
            <input type="tel" name="telefone" placeholder="Telefone"
                   value="<?php echo $cliente['telefone']; ?>"
                   <?php echo $editar ? '' : 'readonly'; ?>>
        </div>

        <div class="input-box">
            <input type="text" name="cep" placeholder="CEP"
                   value="<?php echo $cliente['cep']; ?>"
                   <?php echo $editar ? '' : 'readonly'; ?>>
        </div>

        <?php
        if ($editar) {
            echo '<button type="submit" name="salvar" class="btn">Salvar alterações</button>';
            echo '<a href="perfil.php" class="btn" style="background-color:#999;text-decoration:none;">Cancelar</a>';
        } else {
            echo '<a href="perfil.php?editar=1" class="btn">Editar perfil</a>';
        }
        ?>
    </form>
</div>

</body>
</html>
