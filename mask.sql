Create ROLE Normal_user;
COMMENT ON ROLE Normal_user IS 'MASKED';


CREATE TABLE pytest.CUST_TABLE ( id TEXT, firstname TEXT, lastname TEXT, phone TEXT, card_no TEXT);

INSERT INTO pytest.CUST_TABLE VALUES ('001','Hemanth', 'Kumar','9966060174','0609110911');

select * from pytest.CUST_TABLE;


COMMENT ON COLUMN pytest.CUST_TABLE.card_no IS 'MASKED WITH FUNCTION anon.random_name()';

COMMENT ON COLUMN pytest.CUST_TABLE.phone IS 'MASKED WITH FUNCTION anon.partial (phone, 2, $$*-***-**$$, 2)';

grant select on pytest.CUST_TABLE.phone to Normal_user

set role Normal_user;
select * from pytest.CUST_TABLE;