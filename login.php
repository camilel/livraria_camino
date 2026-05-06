<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>

     <div class="wrapper">
        <form method="POST" action="processalogin.php">
            <h1>Faça seu login</h1>
            <div class="input-box">
                <input type="text" placeholder="E-Mail" name="usuario" required>
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Senha" name="senha" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <button type="submit" class="btn">Entrar</button>
            <div class="register-link">
                <p>Não tem uma conta? <a href="cadastro.php">Cadastre-se</a></p>
            </div>
        </form>
    </div>
</body>
</html>