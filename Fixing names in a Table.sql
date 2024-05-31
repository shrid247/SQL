DROP TABLE IF EXISTS NAMES;
CREATE TABLE NAMES(
NAME CHAR(50)
);
INSERT INTO NAMES(NAME)
VALUES
('rAVI kUMAR'),
('priya sharma'),
('amit PATEL'),
('NEHA gupta');

UPDATE NAMES
SET NAME = Lower(NAME);

-- Trim leading and trailing spaces
UPDATE NAMES
SET NAME = TRIM(NAME);

-- Convert to title CASE
UPDATE NAMES
SET NAME = initcap(NAME);

SELECT * FROM NAMES;