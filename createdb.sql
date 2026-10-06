CREATE TABLE people (
    person_id INT NOT NULL,
    dni VARCHAR(9) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100),
    CONSTRAINT pk_people PRIMARY KEY (person_id)
);
