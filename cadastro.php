<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <link rel="stylesheet" href="cadastro.css">
</head>
<body>
    <div class="wrapper">
        <form action="add_cliente.php" method="POST">
            <h1>Faça seu cadastro</h1>
            <div class="input-box">
                <input type="text" placeholder="Nome" required name="nome">
                <i class='bx bxs-user'></i>
            </div>
             <div class="input-box">
                <input type="text" placeholder="CPF" required name="cpf">
                <i class='bx bxs-user'></i>
            </div>
             <div class="input-box">
                <input type="text" placeholder="E-Mail" required name="email">
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-box">
                <input type="text" placeholder="Confirme seu E-Mail" required name="confirma_email">
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Senha" required name="senha">
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Confirme sua senha" required name="confirma_senha">
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-box full">
                <input type="text" placeholder="Endereço" required name="endereco">
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-box">
                <input type="tel" placeholder="Telefone" required name="telefone">
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-box">
                <input type="text" placeholder="CEP" required name="cep">
                <i class='bx bxs-user'></i>
            </div>
            <button type="submit" class="btn">Cadastre-se</button>
        </form>
    </div>
</body>
</html>