<?php
    require_once "conexao.php"; 

    $nome = $_POST["nome"];
    $email = $_POST["email"];
    $confirma_email = $_POST["confirma_email"];
    $senha = $_POST["senha"];
    $confirma_senha = $_POST["confirma_senha"];
    $cpf = $_POST["cpf"];
    $endereco = $_POST["endereco"];
    $telefone = $_POST["telefone"];
    $cep = $_POST["cep"];

    if ($email != $confirma_email) {
        echo "<script> alert('Email deve ser igual'); </script>";
        echo "<script> window.location.href = 'cadastro.php'; </script>";
    }
    else if ($senha != $confirma_senha) {
        echo "<script> alert('Senha deve ser igual'); </script>";
        echo "<script> window.location.href = 'cadastro.php'; </script>";
    }
    else {
        $sql = "select * from cliente where email = '$email' ";
        $busca = $banco->query($sql);
        if ($busca->num_rows>0){
            echo"<script>alert('Usuário já cadastrado com esse email'); window.location.href='cadastro.php'; </script>";
        }
        else{
            $sql = "insert into cliente (nome, email, senha, cpf, endereco, telefone, cep) values ('$nome', '$email', '$senha', '$cpf', '$endereco', '$telefone','$cep')";
            $busca = $banco->query($sql); 
            echo"<script>alert('Usuário cadastrado com sucesso'); window.location.href='login.php'; </script>";
        }
    }
    
?>