-- Script para agregar el campo token a la tabla usuarios
USE `planillasweb`;

ALTER TABLE `usuarios` 
MODIFY COLUMN `token` TEXT NULL DEFAULT NULL AFTER `password_hash`;
