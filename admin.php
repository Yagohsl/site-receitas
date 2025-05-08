<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
if (!isset($_SESSION['admin'])) {
  echo "Acesso negado.";
  exit;
}
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $nome = $_POST['nome'];
  $categoria = $_POST['categoria'];
  $ingredientes = $_POST['ingredientes'];
  $modo = $_POST['modo_de_preparo'];
  $imagem = file_get_contents($_FILES['imagem']['tmp_name']);

  $stmt = $pdo->prepare("INSERT INTO receitas (nome, categoria, ingredientes, modo_de_preparo, imagem) VALUES (?, ?, ?, ?, ?)");
  $stmt->execute([$nome, $categoria, $ingredientes, $modo, $imagem]);
  echo "Receita adicionada com sucesso!";
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Painel Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
  <link rel="stylesheet" href="css/style.css">
</head>
<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="./index.php">Stardew Receitas</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link disabled" aria-current="page" href="login.php">Admin</a>
        </li>

      </ul>
      
    </div>
  </div>
</nav>
<body>
  <form method="post" enctype="multipart/form-data" class="painel-receita">
    <h1>Painel Administrativo</h1>
    <br><br>
    <div class="mb-3">
    <label for="nome_receita" class="form-label" >Nome da receita</label>
      <input type="text" class="form-control" name="nome" placeholder="Digite o nome da receita" required>

    <div class="mb-3">
    <label for="categoria_receita" class="form-label" >Categoria</label>
      <select name="categoria" class="form-select" arial-label="Categorias">
        <option value="Doce">Doce</option>
        <option value="Salgado">Salgado</option>
      </select>
    </div>

    <div class="mb-3">
      <label for="ingredientes_receitas" class="form-label" >Ingredientes</label>
      <textarea class="form-control"name="ingredientes" placeholder="Digite os Ingredientes aqui" required></textarea>
    </div>
      <div class="mb-3">
        <label for="modo_de_preparo" class="form-label" >Modo de preparo</label>
        <textarea class="form-control" id="text-modo-preparo" rows="5"name="modo_de_preparo" placeholder="Digite o modo de preparo da receita aqui" required></textarea>
    </div>
    <div class="mb-3">
      <label for="foto_receita" class="form-label" >Foto da receita</label>
      <input class="form-control" type="file" name="imagem" accept="image/*" required>
    </div>
    <button type="submit"class="btn btn-primary">Adicionar Receita</button>
  </form>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>
</body>
</html>