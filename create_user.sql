create USER rajkum IDENTIFIED BY password;

grant connect to rajkum;

grant create session to rajkum;

grant dba to rajkum;

create tablespace ts_rajkum datafile 'C:\oraclexe\app\oracle\oradata\XE\df_rajkum.dbf' SIZE 1000M;

alter user rajkum default TABLESPACE ts_rajkum;