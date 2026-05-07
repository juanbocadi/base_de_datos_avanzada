INSERT INTO ADM_Paises VALUES (1, 'Argentina'), (2, 'Brasil'), (3, 'Uruguay');

INSERT INTO ADM_Ciudades VALUES (1, 'Rosario', 1), (2, 'Cordoba', 1), (3, 'Motevideo', 3), 
                                (4, 'San Pablo', 2), (5, 'Floria', 2), (6, 'Santa Fe', 1);

INSERT INTO FER_Predios (nombre_predio, id_ciudad, superficie) 
VALUES ('La Posta', 1, 1200), ('El Quincho', 1, 1000), ('Francia', 3, 4000), 
       ('El Palomar', 4, 2500), ('La Noche', 1, 200), ('La Estrella', 2, 5000), ('El Establo', 6, 600);

INSERT INTO FER_Rubros VALUES (1, 'Promociones'), (2, 'Cumpleaños'), (3, 'Despedidas'), (4, 'Casamientos');

INSERT INTO FER_Expos VALUES 
(1, 'casamiento Juan', 4, '2007-08-25', '2007-08-25', 1),
(2, 'comidas ricas', 1, '2008-04-30', '2008-05-02', 4),
(3, 'fin2004', 3, '2004-12-20', '2004-12-21', 3),
(4, 'fin2005', 3, '2008-05-14', '2008-05-15', 1),
(5, 'casamiento Ariel', 4, '2009-01-05', '2009-01-06', 2),
(6, 'cumple15', 2, '2009-04-25', '2009-04-26', 2);