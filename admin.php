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
if (!isset($_GET['categoria'])) {
  header("Location: ?categoria=Adicionar");
  exit;
}
/*php para adicionar receita*/
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $_GET['categoria'] === 'Adicionar') {
  if (isset($_FILES['imagem']) && $_FILES['imagem']['error'] === UPLOAD_ERR_OK) {
    $nome = $_POST['nome'];
    $categoria = $_POST['categoria'];
    $ingredientes = $_POST['ingredientes'];
    $modo = $_POST['modo_de_preparo'];
    $imagem = file_get_contents($_FILES['imagem']['tmp_name']);

    $stmt = $pdo->prepare("INSERT INTO receitas (nome, categoria, ingredientes, modo_de_preparo, imagem) VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([$nome, $categoria, $ingredientes, $modo, $imagem]);
    echo '<div class="alert alert-success" style="font-size: 2rem;">Receita adicionada com sucesso!</div>';
  } 
}


/*php para remover receita*/
if (isset($_GET['categoria']) && $_GET['categoria'] === 'Deletar' && $_SERVER['REQUEST_METHOD'] === 'POST') {
  $id = $_POST['id'];

  $stmt = $pdo->prepare("DELETE FROM receitas WHERE id_receita = ?");
  if ($stmt->execute([$id])) {
    echo "<div class='alert alert-success' style='font-size: 2rem;' >Receita deletada com sucesso!</div>";
  } else {
    echo "<div class='alert alert-danger' style='font-size: 2rem;'>Erro ao deletar receita.</div>";
  }
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
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categorias
          </a>
          <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="?categoria=Adicionar">Adicionar Receita</a></li>
          <li><a class="dropdown-item" href="?categoria=Deletar">Deletar Receita</a></li>
          </ul>
        </li>

      </ul>
      
    </div>
  </div>
</nav>
<body>
  <!-- Formulario de adicionar receitas -->
<?php if (isset($_GET['categoria']) && $_GET['categoria'] === 'Adicionar'): ?>

  <form method="post" enctype="multipart/form-data" class="painel-receita">
    <h1 class="title-painel">Painel Administrativo</h1>
    <br><br>
    <div class="mb-3">
    <label for="nome_receita" class="form-label label-painel" >Nome da receita</label>
      <input type="text" class="form-control input-painel" name="nome" placeholder="Digite o nome da receita" required>

    <div class="mb-3">
    <label for="categoria_receita" class="form-label label-painel" >Categoria</label>
      <select name="categoria" class="form-select input-painel" arial-label="Categorias">
        <option value="Doce">Doce</option>
        <option value="Salgado">Salgado</option>
      </select>
    </div>

    <div class="mb-3">
      <label for="ingredientes_receitas" class="form-label label-painel" >Ingredientes</label>
      <textarea class="form-control input-painel"name="ingredientes" placeholder="Digite os Ingredientes aqui" required></textarea>
    </div>
      <div class="mb-3">
        <label for="modo_de_preparo" class="form-label label-painel" >Modo de preparo</label>
        <textarea class="form-control input-painel" id="text-modo-preparo" rows="5"name="modo_de_preparo" placeholder="Digite o modo de preparo da receita aqui" required></textarea>
    </div>
    <div class="mb-3">
      <label for="foto_receita" class="form-label label-painel" >Foto da receita</label>
      <input class="form-control input-painel" type="file" name="imagem" accept="image/*" required>
    </div>
    <button type="submit"class="buscar btn-buscar">Adicionar Receita</button>
  </form>
  <?php endif; ?>

<!--Formulario de Deletar receita -->
<?php
if ($_GET['categoria'] === 'Deletar') {
  $stmt = $pdo->query("SELECT id_receita, nome FROM receitas ORDER BY id_receita ASC");
  $receitas = $stmt->fetchAll();

  echo "<div class='container mt-4'>";
  echo "<h1 class='mb-3 title-painel'>Receitas cadastradas</h1>";
  echo "<ul class='list-group'>";
  foreach ($receitas as $receita) {
    echo "<li class='list-group-item input-painel'>ID: {$receita['id_receita']} - {$receita['nome']}</li>";
  }
  echo "</ul>";
  echo "</div>";
}
?>
  <?php if (isset($_GET['categoria']) && $_GET['categoria'] === 'Deletar'): ?>
  <form method="post" class="painel-receita mt-5">
    <h1 class="title-painel">Deletar Receita</h1>
    <div class="mb-3">
      <label for="id" class="form-label label-painel">ID da Receita</label>
      <input type="number" class="form-control input-painel" name="id" placeholder="Digite o ID da receita para deletar" required>
    </div>
    <button type="submit" class="buscar btn-deletar">Deletar Receita</button>
  </form>
<?php endif; ?>


  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>
</body>
</html>
<!--
php pra deletar
conn = dbConnect();
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
 
    $sql = "delete from receitas where id_receita = '$id'";
    if (mysqli_query($conn, $sql)) {
        echo "Receita deletada!";
    } else {
        echo "Erro: " . mysqli_error($conn);
    }--> 