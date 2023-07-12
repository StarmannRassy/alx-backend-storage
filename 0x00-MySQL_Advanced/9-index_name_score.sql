-- SQL Script to Create Index: idx_name_first_score

-- Description: This script creates an index on the first letter of the 'name' and 'score' columns in the 'names' table.

-- Import the table dump before creating the index
-- Assuming the table dump file is named 'names.sql.zip', it should be imported into the database.

-- Import command:
-- mysql -u <username> -p <database_name> < names.sql.zip

-- Create the index on the first letter of the 'name' and 'score' columns
CREATE INDEX idx_name_first_score ON names (LEFT(name, 1), score);

-- The index will improve the performance of queries that involve filtering or sorting by the first letter of the 'name' column and the 'score' column.

-- Note: Ensure that the 'names' table exists in the database before running this script and adjust the table name if needed.
-- Also, ensure that you have appropriate privileges to create indexes on the table.
