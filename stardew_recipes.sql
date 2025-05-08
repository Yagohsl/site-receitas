-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/05/2025 às 14:18
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `stardew_recipes`
--
CREATE DATABASE IF NOT EXISTS `stardew_recipes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `stardew_recipes`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `receitas`
--

CREATE TABLE `receitas` (
  `id_receita` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `ingredientes` varchar(250) NOT NULL,
  `modo_de_preparo` text NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `imagem` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `receitas`
--

INSERT INTO `receitas` (`id_receita`, `nome`, `ingredientes`, `modo_de_preparo`, `categoria`, `imagem`) VALUES
(2, 'Bolo Rosa', 'Melão (1)\r\nFarinha de trigo (1)\r\nAçúcar (1)\r\nOvo (1)', 'Preaqueça o forno a 180 °C.\r\n\r\nEm uma tigela, bata os ovos com o açúcar até formar um creme claro.\r\n\r\nAdicione o purê de melancia e misture bem.\r\n\r\nAcrescente a farinha de trigo peneirada e o fermento (se for usar), mexendo até a massa ficar homogênea.\r\n\r\nDespeje em uma forma untada e enfarinhada.\r\n\r\nAsse por 35–40 minutos, ou até dourar e passar no teste do palito.\r\n\r\nEspere esfriar e, se quiser deixar mais fofo e temático, decore com um pouquinho de calda feita da própria melancia ou açúcar polvilhado por cima.', 'Doce', 0x89504e470d0a1a0a0000000d4948445200000030000000300403000000a52ce4b40000000467414d410000b18f0bfc610500000015504c5445000000fff0f8ffdad1fea2c2bc71abeb56348a2c66859d84f40000000174524e530040e6d866000000be4944415478daa5d4b14e04311003d014a7eb0dba0f58df414fbca206ad454fb13d05caff7f02c524427b15195ce6159e51949432e2c85bb9cf24d8562549ad479b8593b900c0fe0900bc390d7e072e3b22971d40af998593f5020078a02a43b53a077cda01e051de1435bc6561e91d64ef48c2b971b9df9ccf2d077df3711f00f49a046fea13c7ac641e6c491c51fd076cf2a608af3a94cf82dd8f2b55c9abfc918252dab77f4dd2eaf6557250ce2d2cd25a1b4f6d1ec2468e7fc6dfe107953fa85e0ce340dd0000000049454e44ae426082),
(3, 'Pão', 'Farinha de trigo (1)', 'Adicione a água morna na farinha aos poucos e misture até formar uma massa.\r\n\r\nSove por 10 minutos até ficar elástica.\r\n\r\nDeixe descansar por 1 hora até dobrar de tamanho.\r\n\r\nModele o pão e asse em forno a 200 °C por 30–35 minutos.', 'Salgado', 0x89504e470d0a1a0a0000000d4948445200000030000000300403000000a52ce4b400000012504c54450000006026268c3f00c15c03e58827f2a72bc7ea1f960000000174524e530040e6d8660000005949444154785e63c0044a4a4a208a7209262517d7502505ca251894948d8d4d29944058e0e26c2c28409904c40213176343410606ca24469d34ea24d55017178805144ba8b8202ca05042d9186201e5120c8c82100b289600007ceb459d1648eb1f0000000049454e44ae426082),
(4, 'Pizza', 'Farinha de trigo (1)\r\nTomate (1)\r\nQueijo (1)', 'Em uma tigela, misture a farinha de trigo com um pouco de água morna e uma pitada de sal. Sove até formar uma massa lisa e elástica. Cubra e deixe descansar por cerca de 30 minutos em um local aquecido.\r\n\r\nEnquanto a massa descansa, corte o tomate em pedaços pequenos e cozinhe em fogo baixo até formar um molho espesso. Tempere com ervas frescas como manjericão ou orégano (se tiver cultivado na sua fazenda!).\r\n\r\nAbra a massa em formato redondo e coloque sobre uma assadeira. Espalhe o molho de tomate uniformemente por cima.\r\n\r\nRale ou fatie o queijo e distribua por cima do molho.\r\n\r\nLeve ao forno pré-aquecido por cerca de 15–20 minutos ou até a massa ficar dourada e o queijo derretido.', 'Salgado', 0x89504e470d0a1a0a0000000d4948445200000030000000300403000000a52ce4b40000000467414d410000b18f0bfc61050000002a504c5445000000ffff14fcd000f7af53ffae00e27e3bde8800ce6000b15603cb383800a7085471278e423b733a2ac0835df10000000174524e530040e6d866000000f34944415478daadd3bf4a03411006f07d805c31629332c335d1722020d8248cf8025e611d5812b0140e5f40b649910495296dcfcef69a4020d516296df65d646e53885d26f9caef07fb6f58e7ce9e221db23f0d8a947e82ef12167fed68c86dfd22f251fb59088b64842285576d798270c9d9ba6d2ce0e7daca0a9baf164b96776f83b8f3f533e300700000c013e4fbda3f450b6c4996d07c02968c43c1eb168742b7565861fbadc7850bc4ab06fa76a81e184bd6b6645902df553670bd4837fa88ba7ab635c58db3819f52f5283cd6cbcb5b45236f846e88446ada12e9309c115c2f66cbed61031b64cbd9fcfbb5c7c319f20bb9ee5db114cf240a0000000049454e44ae426082),
(5, 'Sorvete', 'Leite (1)\r\nAçúcar (1)', 'Em uma panela, aqueça o leite em fogo baixo até começar a soltar vapor, sem deixar ferver. Adicione o açúcar e mexa bem até dissolver completamente.\r\n\r\nDesligue o fogo e deixe a mistura esfriar à temperatura ambiente. Em seguida, leve à geladeira por pelo menos 2 horas.\r\n\r\nDepois de resfriado, leve ao freezer. A cada 30–45 minutos, retire e bata a mistura com um garfo ou fouet para evitar cristais de gelo. Repita esse processo 3–4 vezes.\r\n\r\nQuando estiver firme e cremoso, sirva em potes ou casquinhas. Pode adicionar frutas da estação ou calda feita com frutas da fazenda para um toque extra!', 'Doce', 0x89504e470d0a1a0a0000000d4948445200000030000000300403000000a52ce4b40000000467414d410000b18f0bfc61050000002d504c5445000000ebf6fdbacbd5fea2c267c700de88008094a0bc71abb156034e6371814067008e00376800733a2a03322b1b3023770000000174524e530040e6d866000000a64944415478da636080815560c080094895e05a555e6c6c6c6cbc6a01a512ab969783840d058dad565147c2d8987289776fce189b979f3973e6ccb977944b9c39bd1b04f651410224bac585728999d3d2766f14dcbd7b775ae64c4a25262909428024a5120cbc77951405058594ee5e60a05ca2a351b0a3a3833a12ada11dada154906060b87ba32334f62e96ac4686c4d5d08e5eea4830f0dec56e0719120c0c58bc4d82040084d6e887f76742ed0000000049454e44ae426082),
(6, 'Taco de Peixe', 'Atum (1)\r\nTortilha (1)\r\nRepolho roxo (1)\r\nMaionese (1)', 'Tempere o peixe com sal, limão e ervas da estação. Grelhe em uma frigideira com um fio de azeite até dourar dos dois lados. Desfie levemente, mas sem deixar desmanchar.\r\n\r\nCozinhe o milho até que esteja macio. Se preferir, toste levemente na frigideira para um sabor defumado. Pique a couve em tiras finas e tempere com azeite, vinagre e uma pitada de sal.\r\n\r\nAqueça a tortilha por alguns segundos em uma frigideira. Sobre ela, coloque uma porção do peixe grelhado, o milho e a couve temperada.\r\n\r\nEnrole a tortilha ou dobre ao meio. Sirva com limão ao lado e, se desejar, uma colher de molho caseiro feito com vegetais da fazenda.', 'Salgado', 0x89504e470d0a1a0a0000000d4948445200000030000000300403000000a52ce4b40000000467414d410000b18f0bfc61050000001e504c5445000000f8ea70fcd000ffb485ea894cde8800be6026008e00733a2a1e4d00750c731c0000000174524e530040e6d866000000bb4944415478dae5d3310ec2300c05d08eac113d8155243aa2dc809a0b54b8e202f5152a36a62a330bf26d2bbb4d051b35237f7dc34f62a728fe2369cde337d825ee092c747bb7cd9046a62b6a2e349b13720136319e82da81ac6633a491b92722820a638ca1446ac10dd4b14a9b6bce7662176887195418420825c2d1094b47c7500b3631eca31bb8a7e5f2b5d858d0073a0fd60e9d4a2df21a86bb38c11677eea01644449e7951b6c3f20d467b4780bc3e4e987775cde777fb12261c3b05bbd1448fc20000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `email`, `senha`) VALUES
(0, 'Admi Nistrador da Silva', 'admin@gmail.com', 'admin'),
(1, 'Ana Maria Braga', 'aninhaXd@yahoo.com', 'lourojose');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `receitas`
--
ALTER TABLE `receitas`
  ADD PRIMARY KEY (`id_receita`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `receitas`
--
ALTER TABLE `receitas`
  MODIFY `id_receita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
