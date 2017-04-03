

UPDATE `maestro_indicador` SET `edita_n` = '1' WHERE `maestro_indicador`.`id` = 12;
UPDATE `maestro_indicador` SET `edita_n` = '1' WHERE `maestro_indicador`.`id` = 14;
UPDATE `maestro_indicador` SET `edita_n` = '1' WHERE `maestro_indicador`.`id` = 15;
UPDATE `maestro_indicador` SET `edita_n` = '1' WHERE `maestro_indicador`.`id` = 11;
UPDATE `maestro_indicador` SET `edita_n` = '1' WHERE `maestro_indicador`.`id` = 16;
UPDATE `maestro_indicador` SET `edita_n` = '1' WHERE `maestro_indicador`.`id` = 17;
UPDATE `maestro_indicador` SET `edita_n` = '1' WHERE `maestro_indicador`.`id` = 18;
UPDATE `maestro_indicador` SET `edita_n` = '1' WHERE `maestro_indicador`.`id` = 13;



### YAAA

ALTER TABLE `maestro_indicador` ADD `criterio` VARCHAR(500) NOT NULL AFTER `aceptacion`;

UPDATE `maestro_indicador` SET `criterio` = 'Como terminados entregados a los usuarios' WHERE `maestro_indicador`.`id` = 1;
UPDATE `maestro_indicador` SET `criterio` = 'Como terminados entregados a los usuarios' WHERE `maestro_indicador`.`id` = 2;
UPDATE `maestro_indicador` SET `criterio` = 'Como servicios efectivos' WHERE `maestro_indicador`.`id` = 3;
UPDATE `maestro_indicador` SET `criterio` = 'Como prestados dentro del tiempo limite' WHERE `maestro_indicador`.`id` = 4;
UPDATE `maestro_indicador` SET `criterio` = 'Como tiempo de prestación del servicio.' WHERE `maestro_indicador`.`id` = 5;
UPDATE `maestro_indicador` SET `criterio` = 'Como multas en firme' WHERE `maestro_indicador`.`id` = 6;
UPDATE `maestro_indicador` SET `criterio` = '50 minutos' WHERE `maestro_indicador`.`id` = 7;
UPDATE `maestro_indicador` SET `criterio` = 'Como multas exoneradas' WHERE `maestro_indicador`.`id` = 8;
UPDATE `maestro_indicador` SET `criterio` = 'Como reclamaciones presentadas' WHERE `maestro_indicador`.`id` = 9;
UPDATE `maestro_indicador` SET `criterio` = 'Como reclamaciones presentadas' WHERE `maestro_indicador`.`id` = 10;
UPDATE `maestro_indicador` SET `criterio` = 'Como reclamaciones presentadas' WHERE `maestro_indicador`.`id` = 11;
UPDATE `maestro_indicador` SET `criterio` = 'Como reclamaciones presentadas' WHERE `maestro_indicador`.`id` = 12;
UPDATE `maestro_indicador` SET `criterio` = 'Como reclamaciones presentadas' WHERE `maestro_indicador`.`id` = 13;
UPDATE `maestro_indicador` SET `criterio` = 'Como reclamaciones aceptadas' WHERE `maestro_indicador`.`id` = 14;
UPDATE `maestro_indicador` SET `criterio` = 'Como reclamaciones aceptadas' WHERE `maestro_indicador`.`id` = 15;
UPDATE `maestro_indicador` SET `criterio` = 'Como reclamaciones aceptadas' WHERE `maestro_indicador`.`id` = 16;
UPDATE `maestro_indicador` SET `criterio` = 'Como reclamaciones aceptadas' WHERE `maestro_indicador`.`id` = 17;
UPDATE `maestro_indicador` SET `criterio` = 'Como reclamaciones aceptadas' WHERE `maestro_indicador`.`id` = 18;
UPDATE `maestro_indicador` SET `criterio` = 'Como procesos abiertos' WHERE `maestro_indicador`.`id` = 19;
UPDATE `maestro_indicador` SET `criterio` = 'Como procesos de cobro coactivo con mandamiento de pago' WHERE `maestro_indicador`.`id` = 20;
UPDATE `maestro_indicador` SET `criterio` = 'Como procesos terminados por pago' WHERE `maestro_indicador`.`id` = 21;
UPDATE `maestro_indicador` SET `criterio` = 'como procesos terminados por remate' WHERE `maestro_indicador`.`id` = 22;
UPDATE `maestro_indicador` SET `criterio` = 'como reclamaciones aceptadas' WHERE `maestro_indicador`.`id` = 23;
UPDATE `maestro_indicador` SET `criterio` = 'como multas en firme' WHERE `maestro_indicador`.`id` = 24;
UPDATE `maestro_indicador` SET `criterio` = 'como multas del total impuestas a traves de ayudas tecnologicas' WHERE `maestro_indicador`.`id` = 25;
UPDATE `maestro_indicador` SET `criterio` = 'la semaforizacion debe contar con una disponibilidad minima del' WHERE `maestro_indicador`.`id` = 26;
UPDATE `maestro_indicador` SET `criterio` = 'los equipos fijos de deteccion deben tener una disponibilidad minima del' WHERE `maestro_indicador`.`id` = 27;
UPDATE `maestro_indicador` SET `criterio` = 'los equipos moviles de deteccion deben tener una disponibilidad minima del' WHERE `maestro_indicador`.`id` = 28;
UPDATE `maestro_indicador` SET `criterio` = 'el software misional  debe tener una disponibilidad minima del' WHERE `maestro_indicador`.`id` = 29;
UPDATE `maestro_indicador` SET `criterio` = 'el hardware operativo  debe tener una disponibilidad minima del' WHERE `maestro_indicador`.`id` = 30;
UPDATE `maestro_indicador` SET `criterio` = 'los equipos fijos de deteccion deben contar con minimo 4 mantenimientos al mes' WHERE `maestro_indicador`.`id` = 31;
UPDATE `maestro_indicador` SET `criterio` = 'la semaforizacion debe contar con un tiempo maximo de daños del' WHERE `maestro_indicador`.`id` = 32;
UPDATE `maestro_indicador` SET `criterio` = 'los equipos fijos de deteccion deben contar con un tiempo maximo de repacion de' WHERE `maestro_indicador`.`id` = 33;
UPDATE `maestro_indicador` SET `criterio` = 'el hardware operativo debe contar con un tiempo maximo de reparacion de' WHERE `maestro_indicador`.`id` = 34;



