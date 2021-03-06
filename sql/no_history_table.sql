SET client_min_messages TO error;

CREATE TABLE no_history_table (sys_period tstzrange);

CREATE TRIGGER versioning_trigger
BEFORE INSERT OR UPDATE OR DELETE ON no_history_table
FOR EACH ROW EXECUTE PROCEDURE versioning('sys_period', NULL, true);

INSERT INTO no_history_table DEFAULT VALUES;

DELETE FROM no_history_table;
