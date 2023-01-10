EXECUTE 'GRANT ALL ON TABLE ' || quote_ident(schema_name) || '.'  || quote_ident(table_name) || ' TO rl_dna_global_qa_etl_usr' ; 
EXECUTE 'GRANT SELECT ON TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' TO rl_dna_view_admin' ;
EXECUTE 'GRANT SELECT ON TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' TO readwrite_usr' ;
EXECUTE 'GRANT ALL ON TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' TO admin' ;
EXECUTE 'ALTER TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' OWNER TO rl_dna_global_qa_etl_usr' ;
EXECUTE 'GRANT SELECT ON TABLE ' || quote_ident(schema_name) || '.' || quote_ident(table_name) || ' TO group readonly_group' ;