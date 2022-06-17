UPDATE `bwcs`.`tb_usuario` SET `senha` = 'e10adc3949ba59abbe56e057f20f883e' WHERE `user_id` = 1;
UPDATE bwcs.tb_auth SET data = CURDATE() WHERE user = '1' LIMIT 1;