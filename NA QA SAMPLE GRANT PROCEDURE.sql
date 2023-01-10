-- NA QA
-- sample db

CREATE OR REPLACE PROCEDURE global_qa_data.grants_qa_sample(schema_name VARCHAR, table_name VARCHAR, n INT)
LANGUAGE plpgsql
AS
$$
BEGIN

IF n = 1
THEN
BEGIN
EXECUTE 'GRANT ALL ON TABLE ' || quote_ident(schema_name) || '.'  || quote_ident(table_name) || ' TO rl_dna_global_qa_etl_usr' ; 
EXECUTE 'GRANT SELECT ON TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' TO rl_dna_view_admin' ;
EXECUTE 'GRANT SELECT ON TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' TO readwrite_usr' ;
EXECUTE 'GRANT ALL ON TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' TO admin' ;
EXECUTE 'ALTER TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' OWNER TO rl_dna_global_qa_etl_usr' ;
EXECUTE 'GRANT SELECT ON TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' TO group readonly_group' ;
RAISE INFO 'Grants given to %.% table successfully .',schema_name,table_name ;
END;

ELSIF n = 2
THEN 
BEGIN
EXECUTE 'GRANT ALL ON TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' TO admin' ;
EXECUTE 'GRANT ALL ON TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' TO rl_dna_view_admin' ; 	
EXECUTE 'GRANT SELECT ON TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' TO group rl_dna_msi_application_usr_group' ; 
EXECUTE 'GRANT SELECT ON TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' TO readwrite_usr' ; 
EXECUTE 'ALTER TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' OWNER TO rl_dna_view_admin' ; 
EXECUTE 'GRANT SELECT ON TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' TO group readonly_group' ; 
RAISE INFO 'Grants given to %.% view successfully .',schema_name,table_name ;
END;

ELSE
 RAISE EXCEPTION 'Please enter 1 for ETL and 2 for MSI Grants.';

END IF;

END;
$$;


-- CALL global_qa_data.grants_qa_sample('schema_name', 'table_name', n) ;
-- n = 1 --> For ETL
-- n = 2 --> For MSI
