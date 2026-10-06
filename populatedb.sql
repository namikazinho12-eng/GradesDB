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

-- 3. GRUPOS
INSERT INTO groups (group_id, subject_id, group_name, activity, academic_year) VALUES
(1, 11, 'T1', 'Teoría', 2024),
(2, 11, 'L1', 'Laboratorio', 2024),
(3, 11, 'L2', 'Laboratorio', 2024);

-- 4. PERSONAS
INSERT INTO people (person_id, dni, first_name, last_name, age, email) VALUES
(1, '00000001A', 'David', 'Ruiz', 50, 'druiz@us.es'),
(2, '00000002B', 'Inma', 'Hernández', 40, 'inmahernandez@us.es'),
(3, '00000003C', 'Fernando', 'Sola', 28, 'fsola@us.es'),
(6, '10000006F', 'David', 'Romero', 22, 'david.romero@alum.us.es'),
(7, '10000007G', 'Lucía', 'Molina', 21, 'lucia.molina@alum.us.es'),
(8, '10000008H', 'Hugo', 'Paredes', 20, 'hugo.paredes@alum.us.es'),
(16, '10000016R', 'Pablo', 'Vidal', 22, 'pablo.vidal@alum.us.es'),
(25, '10000025A', 'Paula', 'Bermejo', 21, 'paula.bermejo@alum.us.es');

-- 5. PROFESORES
INSERT INTO professors (professor_id, category) VALUES
(1, 'Catedrático'),
(2, 'Titular'),
(3, 'AyudanteDoctor');

-- 6. ALUMNOS
INSERT INTO students (student_id, access_method) VALUES
(6, 'Selectividad'),
(7, 'Selectividad'),
(8, 'Selectividad'),
(16, 'Selectividad'),
(25, 'Selectividad');

-- 7. MATRÍCULAS
INSERT INTO enrollments (enrollment_id, student_id, subject_id) VALUES
(1, 6, 11),
(2, 7, 11),
(3, 8, 11),
(4, 16, 11),
(5, 25, 11);

-- 8. GRUPOS ALUMNOS
INSERT INTO group_students (group_student_id, student_id, group_id) VALUES
(1, 6, 1),
(2, 7, 1),
(3, 8, 1),
(4, 16, 1),
(5, 25, 1),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 16, 3),
(10, 25, 3);

-- 9. CARGAS DOCENTES
INSERT INTO teaching_loads (teaching_load_id, professor_id, group_id, credits) VALUES
(1, 1, 1, 3.0),
(2, 2, 1, 3.0),
(3, 3, 2, 3.0);

-- 10. NOTAS
INSERT INTO marks (mark_id, student_id, group_id, val, call_number, with_honors) VALUES
(1, 6, 1, 9.8, 'Primera', 1),
(2, 7, 1, 9.2, 'Primera', 1),
(3, 8, 1, 5.4, 'Primera', 0),
(11, 16, 1, 4.2, 'Primera', 0),
(20, 25, 1, 4.7, 'Primera', 0),
(21, 16, 1, 6.2, 'Segunda', 0),
(30, 25, 1, 4.3, 'Segunda', 0),
(35, 25, 1, 5.7, 'Tercera', 0);
