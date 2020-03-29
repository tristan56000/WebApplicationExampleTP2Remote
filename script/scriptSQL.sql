CREATE DATABASE IF NOT EXISTS GUERIN;

CREATE TABLE IF NOT EXISTS GUERIN.user (id INT NOT NULL AUTO_INCREMENT, name VARCHAR(50), password VARCHAR(150), salary BIGINT NOT NULL,age INT UNSIGNED NOT NULL, role VARCHAR(50), PRIMARY KEY(id));

INSERT INTO GUERIN.user(name,password,salary,age,role) VALUES
        ('manager','92a881051a0d26ba0fe4a65cb1039c10e18718c68591efb6afbf883b672a328bc8ba8c13fdaa90eedc018c280782cbbd2a842acbd9a5f3b8965012a1ba489234',1234,22,'manager'),
        ('tristan','b16ed7d24b3ecbd4164dcdad374e08c0ab7518aa07f9d3683f34c2b3c67a15830268cb4a56c1ff6f54c8e54a795f5b87c08668b51f82d0093f7baee7d2981181',2500,21,'manager'),
        ('antoine','6d201beeefb589b08ef0672dac82353d0cbd9ad99e1642c83a1601f3d647bcca003257b5e8f31bdc1d73fbec84fb085c79d6e2677b7ff927e823a54e789140d9',2400,27,'manager'),
        ('maxime','cb872de2b8d2509c54344435ce9cb43b4faa27f97d486ff4de35af03e4919fb4ec53267caf8def06ef177d69fe0abab3c12fbdc2f267d895fd07c36a62bff4bf',3900,18,'manager');

CREATE USER 'GUERIN'@'localhost';
GRANT all privileges on GUERIN.user to 'GUERIN'@'localhost';
FLUSH privileges;
