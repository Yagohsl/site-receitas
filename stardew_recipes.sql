-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 08/05/2025 às 03:56
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

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
(1, 'Bolo Rosa', 'Melão (1)\r\nFarinha de trigo (1)\r\nAçúcar (1)\r\nOvo (1)', 'Preaqueça o forno a 180 °C.\r\n\r\nEm uma tigela, bata os ovos com o açúcar até formar um creme claro.\r\n\r\nAdicione o purê de melancia e misture bem.\r\n\r\nAcrescente a farinha de trigo peneirada e o fermento (se for usar), mexendo até a massa ficar homogênea.\r\n\r\nDespeje em uma forma untada e enfarinhada.\r\n\r\nAsse por 35–40 minutos, ou até dourar e passar no teste do palito.\r\n\r\nEspere esfriar e, se quiser deixar mais fofo e temático, decore com um pouquinho de calda feita da própria melancia ou açúcar polvilhado por cima.', 'Doce', 0x89504e470d0a1a0a0000000d4948445200000030000000300403000000a52ce4b40000000467414d410000b18f0bfc610500000015504c5445000000fff0f8ffdad1fea2c2bc71abeb56348a2c66859d84f40000000174524e530040e6d866000000be4944415478daa5d4b14e04311003d014a7eb0dba0f58df414fbca206ad454fb13d05caff7f02c524427b15195ce6159e51949432e2c85bb9cf24d8562549ad479b8593b900c0fe0900bc390d7e072e3b22971d40af998593f5020078a02a43b53a077cda01e051de1435bc6561e91d64ef48c2b971b9df9ccf2d077df3711f00f49a046fea13c7ac641e6c491c51fd076cf2a608af3a94cf82dd8f2b55c9abfc918252dab77f4dd2eaf6557250ce2d2cd25a1b4f6d1ec2468e7fc6dfe107953fa85e0ce340dd0000000049454e44ae426082),
(2, 'Bolo Rosa', 'Melão (1)\r\nFarinha de trigo (1)\r\nAçúcar (1)\r\nOvo (1)', 'Preaqueça o forno a 180 °C.\r\n\r\nEm uma tigela, bata os ovos com o açúcar até formar um creme claro.\r\n\r\nAdicione o purê de melancia e misture bem.\r\n\r\nAcrescente a farinha de trigo peneirada e o fermento (se for usar), mexendo até a massa ficar homogênea.\r\n\r\nDespeje em uma forma untada e enfarinhada.\r\n\r\nAsse por 35–40 minutos, ou até dourar e passar no teste do palito.\r\n\r\nEspere esfriar e, se quiser deixar mais fofo e temático, decore com um pouquinho de calda feita da própria melancia ou açúcar polvilhado por cima.', 'Doce', 0x89504e470d0a1a0a0000000d4948445200000030000000300403000000a52ce4b40000000467414d410000b18f0bfc610500000015504c5445000000fff0f8ffdad1fea2c2bc71abeb56348a2c66859d84f40000000174524e530040e6d866000000be4944415478daa5d4b14e04311003d014a7eb0dba0f58df414fbca206ad454fb13d05caff7f02c524427b15195ce6159e51949432e2c85bb9cf24d8562549ad479b8593b900c0fe0900bc390d7e072e3b22971d40af998593f5020078a02a43b53a077cda01e051de1435bc6561e91d64ef48c2b971b9df9ccf2d077df3711f00f49a046fea13c7ac641e6c491c51fd076cf2a608af3a94cf82dd8f2b55c9abfc918252dab77f4dd2eaf6557250ce2d2cd25a1b4f6d1ec2468e7fc6dfe107953fa85e0ce340dd0000000049454e44ae426082),
(3, 'Pão', 'Farinha de trigo (1)', 'Adicione a água morna na farinha aos poucos e misture até formar uma massa.\r\n\r\nSove por 10 minutos até ficar elástica.\r\n\r\nDeixe descansar por 1 hora até dobrar de tamanho.\r\n\r\nModele o pão e asse em forno a 200 °C por 30–35 minutos.', 'Salgado', 0x89504e470d0a1a0a0000000d4948445200000030000000300403000000a52ce4b400000012504c54450000006026268c3f00c15c03e58827f2a72bc7ea1f960000000174524e530040e6d8660000005949444154785e63c0044a4a4a208a7209262517d7502505ca251894948d8d4d29944058e0e26c2c28409904c40213176343410606ca24469d34ea24d55017178805144ba8b8202ca05042d9186201e5120c8c82100b289600007ceb459d1648eb1f0000000049454e44ae426082);

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
  MODIFY `id_receita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
