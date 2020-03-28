CREATE DATABASE IF NOT EXISTS GUERIN;

CREATE TABLE IF NOT EXISTS GUERIN.user (id INT NOT NULL AUTO_INCREMENT, name VARCHAR(250), password VARCHAR(250), salary VARCHAR(250),age VARCHAR(250), PRIMARY KEY(id));

INSERT INTO GUERIN.user(name, password, salary, age) VALUES ('NGyDPZYcEkiM5OMjgLvvWA==','sXtiUP5u9L3s9YR/S7GiuQ==','lpEvz9fSWDlgSEwjL3p8uA==','r8LS43ENuBLlmtS7ch03jw==');

CREATE USER 'GUERIN'@'localhost';
GRANT all privileges on GUERIN.user to 'GUERIN'@'localhost';
FLUSH privileges;
