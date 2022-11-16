Create ROLE Normal_user;
COMMENT ON ROLE Normal_user IS 'MASKED';


CREATE TABLE pytest.CUST_TABLE ( id TEXT, firstname TEXT, lastname TEXT, phone TEXT, card_no TEXT);


COMMENT ON COLUMN patient.name IS 'MASKED WITH FUNCTION anon.random_name()';