CREATE TABLE users (
 id SERIAL PRIMARY KEY,
 name VARCHAR(50) NOT NULL,
 email VARCHAR(50) NOT NULL,
 password VARCHAR(30) NOT NULL,
 cpf INTEGER NOT NULL
);

CREATE TABLE roles (
 id SERIAL PRIMARY KEY,
 role_name VARCHAR(50) NOT NULL,
 id_users INTEGER
);

CREATE TABLE groups (
 id SERIAL PRIMARY KEY,
 id_users INTEGER,
 production_line INTEGER NOT NULL
);

CREATE TABLE groups_version (
 id SERIAL PRIMARY KEY,
 read BOOLEAN NOT NULL,
 id_groups INTEGER,
 id_versions INTEGER
);

CREATE TABLE manual (
 id SERIAL PRIMARY KEY,
 version VARCHAR NOT NULL,
 description VARCHAR NOT NULL,
 id_products INTEGER,
 id_materials INTEGER
);

CREATE TABLE materials (
 id SERIAL PRIMARY KEY,
 type VARCHAR NOT NULL,
 file VARCHAR NOT NULL,
 description VARCHAR NOT NULL
);

CREATE TABLE products (
 id SERIAL PRIMARY KEY,
 name VARCHAR(50) NOT NULL,
 model VARCHAR(50) NOT NULL,
 type VARCHAR(50) NOT NULL,
 release_year DATE NOT NULL
);

CREATE TABLE versions (
 id SERIAL PRIMARY KEY,
 id_manual INTEGER,
 number VARCHAR(50) NOT NULL
);

ALTER TABLE roles ADD CONSTRAINT roles_id_users_fkey FOREIGN KEY (id_users) REFERENCES users(id);
ALTER TABLE groups ADD CONSTRAINT groups_id_users_fkey FOREIGN KEY (id_users) REFERENCES users(id);
ALTER TABLE groups_version ADD CONSTRAINT groups_version_id_groups_fkey FOREIGN KEY (id_groups) REFERENCES groups(id);
ALTER TABLE groups_version ADD CONSTRAINT groups_version_id_versions_fkey FOREIGN KEY (id_versions) REFERENCES versions(id);
ALTER TABLE manual ADD CONSTRAINT manual_id_products_fkey FOREIGN KEY (id_products) REFERENCES products(id);
ALTER TABLE manual ADD CONSTRAINT manual_id_materials_fkey FOREIGN KEY (id_materials) REFERENCES materials(id);
ALTER TABLE versions ADD CONSTRAINT versions_id_manual_fkey FOREIGN KEY (id_manual) REFERENCES manual(id);