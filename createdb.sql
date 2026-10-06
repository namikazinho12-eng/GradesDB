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

