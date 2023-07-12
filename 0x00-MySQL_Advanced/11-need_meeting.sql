-- SQL Script to Create View: need_meeting

-- Description: This script creates a view called 'need_meeting' that lists all students who have a score under 80 (strict) and either have no last_meeting date or the last_meeting date is more than one month ago.

-- Create the view
CREATE VIEW need_meeting AS
SELECT name
FROM students
WHERE score < 80 AND (last_meeting IS NULL OR last_meeting < DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH));

-- The view 'need_meeting' selects the 'name' column from the 'students' table.
-- It filters the students based on the condition that their score is under 80 (strict) and either they have no last_meeting date or the last_meeting date is more than one month ago.

-- Usage:
-- SELECT * FROM need_meeting; -- Retrieves the list of students who need a meeting.

-- Note: Ensure that the 'students' table exists in the database and adjust the table and column names if needed.
