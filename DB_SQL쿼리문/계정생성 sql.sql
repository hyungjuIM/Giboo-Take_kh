ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER giboo IDENTIFIED BY take1234;

GRANT CONNECT, RESOURCE TO giboo;


ALTER USER giboo DEFAULT TAbLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;



SELECT * FROM ALL_USERS;