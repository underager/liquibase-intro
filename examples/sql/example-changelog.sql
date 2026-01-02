--liquibase formatted sql

--changeset your.name:1 labels:example-label context:example-context
--comment: example comment
create table person (
    id int primary key IDENTITY(1,1) not null,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)
--rollback DROP TABLE person;

--changeset your.name:2 labels:example-label context:example-context
--comment: example comment
create table company (
    id int primary key IDENTITY(1,1) not null,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)
--rollback DROP TABLE company;

--changeset other.dev:3 labels:example-label context:example-context
--comment: example comment
alter table person add country varchar(2)
--rollback ALTER TABLE person DROP COLUMN country;

--changeset your.name:4
ALTER TABLE person ADD worksfor_company_id INT;
--changeset your.name:5
ALTER TABLE person ADD CONSTRAINT fk_person_worksfor FOREIGN KEY (worksfor_company_id) REFERENCES company(id);

--liquibase formatted sql
--changeset TsviZ:createTable_salesTableZ-1221
CREATE TABLE salesTableZ (
ID int NOT NULL,
NAME varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
REGION varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
MARKET varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

--changeset authorNameOne:id1
INSERT INTO salesTableZ(ID, NAME, REGION, MARKET)
VALUES (1, 'NameOne', 'RegionOne', 'MarketOne')

--rollback DELETE FROM salesTableZ WHERE ID = 1;
