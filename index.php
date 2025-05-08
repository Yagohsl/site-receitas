<?php
include 'db.php';
$busca = $_GET['busca'] ?? '';
$categoria = $_GET['categoria'] ?? '';

$sql = "SELECT * FROM receitas WHERE nome LIKE ? AND categoria LIKE ?";
$stmt = $pdo->prepare($sql);
$stmt->execute(["%$busca%", "%$categoria%"]);
$receitas = $stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
  <link rel="stylesheet" href="css/style.css">

  <title>Receitas de Stardew</title>
</head>
<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top" >
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Stardew Receitas</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="login.php">Admin</a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categorias
          </a>
          <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="?categoria=">Todas</a></li>
          <li><a class="dropdown-item" href="?categoria=Doce">Doce</a></li>
          <li><a class="dropdown-item" href="?categoria=Salgado">Salgado</a></li>
          </ul>
        </li>

      </ul>
      <form class="d-flex" role="search" method="get">
        <input class="form-control me-2" type="search" placeholder="Buscar por nome" aria-label="Search" name="busca"/>
        <button class="btn btn-outline-success" type="submit">Buscar</button>
      </form>
    </div>
  </div>
</nav>
<body>
  <img src="./images/logo.png" class="img-index">


  <div class="receitas">
    <?php foreach ($receitas as $r): ?>
      <div class="receita">
        <h3><?= htmlspecialchars($r['nome']) ?></h3>
        <img src="data:image/jpeg;base64,<?= base64_encode($r['imagem']) ?>" alt="Imagem da receita">
        <p><strong>Categoria:</strong> <?= $r['categoria'] ?></p>
        <p><strong>Ingredientes:</strong> <?= nl2br($r['ingredientes']) ?></p>
        <p><strong>Modo de Preparo:</strong> <?= nl2br($r['modo_de_preparo']) ?></p>
      </div>
    <?php endforeach; ?>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>
</body>
</html>