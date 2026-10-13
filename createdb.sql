DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS teaching_loads;
DROP TABLE IF EXISTS group_students;
DROP TABLE IF EXISTS marks;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS professors;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS degrees;
DROP TABLE IF EXISTS people;

CREATE TABLE people (
    person_id INT NOT NULL,
    dni VARCHAR(9) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100),
    CONSTRAINT pk_people PRIMARY KEY (person_id)
);

CREATE TABLE degrees (
    degree_id INT NOT NULL,
    degree_name VARCHAR(100) NOT NULL,
    years INT NOT NULL,
    CONSTRAINT pk_degrees PRIMARY KEY (degree_id)
);

CREATE TABLE students (
    student_id INT NOT NULL,
    access_method VARCHAR(50) NOT NULL,
    CONSTRAINT pk_students PRIMARY KEY (student_id),
    CONSTRAINT fk_students_people FOREIGN KEY (student_id) REFERENCES people (person_id)
);

CREATE TABLE professors (
    professor_id INT NOT NULL,
    category VARCHAR(50) NOT NULL,
    CONSTRAINT pk_professors PRIMARY KEY (professor_id),
    CONSTRAINT fk_professors_people FOREIGN KEY (professor_id) REFERENCES people (person_id)
);

CREATE TABLE subjects (
    subject_id INT NOT NULL,
    degree_id INT NOT NULL,
    subject_name VARCHAR(100) NOT NULL,
    acronym VARCHAR(10) NOT NULL,
    credits DECIMAL(4,1) NOT NULL,
    course INT NOT NULL,
    subject_type VARCHAR(50) NOT NULL,
    CONSTRAINT pk_subjects PRIMARY KEY (subject_id),
    CONSTRAINT fk_subjects_degrees FOREIGN KEY (degree_id) REFERENCES degrees (degree_id)
);

CREATE TABLE groups (
    group_id INT NOT NULL,
    subject_id INT NOT NULL,
    group_name VARCHAR(10) NOT NULL,
    activity VARCHAR(50) NOT NULL,
    academic_year INT NOT NULL,
    CONSTRAINT pk_groups PRIMARY KEY (group_id),
    CONSTRAINT fk_groups_subjects FOREIGN KEY (subject_id) REFERENCES subjects (subject_id)
);

CREATE TABLE marks (
    mark_id INT NOT NULL,
    student_id INT NOT NULL,
    group_id INT NOT NULL,
    val DECIMAL(3,1) NOT NULL,
    call_number VARCHAR(20) NOT NULL,
    with_honors TINYINT(1) NOT NULL,
    CONSTRAINT pk_marks PRIMARY KEY (mark_id),
    CONSTRAINT fk_marks_students FOREIGN KEY (student_id) REFERENCES students (student_id),
    CONSTRAINT fk_marks_groups FOREIGN KEY (group_id) REFERENCES groups (group_id)
);

CREATE TABLE group_students (
    group_student_id INT NOT NULL,
    student_id INT NOT NULL,
    group_id INT NOT NULL,
    CONSTRAINT pk_group_students PRIMARY KEY (group_student_id),
    CONSTRAINT fk_group_students_students FOREIGN KEY (student_id) REFERENCES students (student_id),
    CONSTRAINT fk_group_students_groups FOREIGN KEY (group_id) REFERENCES groups (group_id)
);

CREATE TABLE teaching_loads (
    teaching_load_id INT NOT NULL,
    professor_id INT NOT NULL,
    group_id INT NOT NULL,
    credits DECIMAL(3,1) NOT NULL,
    CONSTRAINT pk_teaching_loads PRIMARY KEY (teaching_load_id),
    CONSTRAINT fk_teaching_loads_professors FOREIGN KEY (professor_id) REFERENCES professors (professor_id),
    CONSTRAINT fk_teaching_loads_groups FOREIGN KEY (group_id) REFERENCES groups (group_id)
);

CREATE TABLE enrollments (
    enrollment_id INT NOT NULL,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    CONSTRAINT pk_enrollments PRIMARY KEY (enrollment_id),
    CONSTRAINT fk_enrollments_students FOREIGN KEY (student_id) REFERENCES students (student_id),
    CONSTRAINT fk_enrollments_subjects FOREIGN KEY (subject_id) REFERENCES subjects (subject_id)
);

-- RESTRICCIONES TABLA people
ALTER TABLE people
    ADD CONSTRAINT rn12_people_age CHECK (age BETWEEN 16 AND 70),
    ADD CONSTRAINT rn14_people_dni CHECK (dni REGEXP '^[0-9]{8}[A-Za-z]$'),
    ADD CONSTRAINT rn_uq_people_dni UNIQUE (dni),
    ADD CONSTRAINT rn_uq_people_email UNIQUE (email);

-- RESTRICCIONES TABLA professors
ALTER TABLE professors
    ADD CONSTRAINT ck_professors_category CHECK (
        category IN ('Ayudante','AyudanteDoctor','Titular','Catedrático')
    );

-- RESTRICCIONES TABLA students
ALTER TABLE students
    ADD CONSTRAINT ck_students_access_method CHECK (
        access_method IN ('Selectividad','Ciclo','Mayor','Titulado','Extranjero')
    );

-- RESTRICCIONES TABLA degrees
ALTER TABLE degrees
    ADD CONSTRAINT rn13_degree_duration CHECK (years BETWEEN 3 AND 6),
    ADD CONSTRAINT rn_uq_degrees_name UNIQUE (degree_name);

-- RESTRICCIONES TABLA subjects
ALTER TABLE subjects
    ADD CONSTRAINT rn10_subjects_credits CHECK (credits IN (6, 12)),
    ADD CONSTRAINT rn16_subjects_course CHECK (course BETWEEN 1 AND 6),
    ADD CONSTRAINT ck_subjects_type CHECK (
        subject_type IN ('Formación Básica','Obligatoria','Optativa')
    ),
    ADD CONSTRAINT rn_uq_subjects_name UNIQUE (subject_name),
    ADD CONSTRAINT rn_uq_subjects_acronym UNIQUE (acronym);

-- RESTRICCIONES TABLA groups
ALTER TABLE groups
    ADD CONSTRAINT ck_groups_activity CHECK (
        activity IN ('Teoría','Laboratorio')
    ),
    ADD CONSTRAINT rn_uq_groups_combination UNIQUE (subject_id, group_name, activity, academic_year);

-- RESTRICCIONES TABLA marks
ALTER TABLE marks
    ADD CONSTRAINT rn11_marks_val CHECK (val BETWEEN 0.0 AND 10.0),
    ADD CONSTRAINT ck_marks_call_number CHECK (
        call_number IN ('Primera','Segunda','Tercera')
    ),
    ADD CONSTRAINT ck_marks_with_honors CHECK (with_honors IN (0, 1));
