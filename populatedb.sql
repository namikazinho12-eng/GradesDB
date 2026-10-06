INSERT INTO degrees (degree_id, degree_name, years) VALUES
(1, 'Ingeniería del Software', 4),
(2, 'Ingeniería de Computadores', 4),
(3, 'Tecnologías Informáticas', 4);

INSERT INTO subjects (subject_id, degree_id, subject_name, acronym, credits, course, subject_type) VALUES
(1, 3, 'Fundamentos de Programación', 'FP', 12.0, 1, 'Formación Básica'),
(2, 3, 'Cálculo Infinitesimal y Numérico', 'CIN', 6.0, 1, 'Formación Básica'),
(10, 3, 'Análisis y Diseño de Datos y Algoritmos', 'ADDA', 12.0, 2, 'Obligatoria'),
(11, 3, 'Introducción a la Ingeniería del Software y los Sistemas de Información I', 'IISSI-1', 6.0, 2, 'Obligatoria'),
(15, 3, 'Introducción a la Ingeniería del Software y los Sistemas de Información II', 'IISSI-2', 6.0, 2, 'Obligatoria');
