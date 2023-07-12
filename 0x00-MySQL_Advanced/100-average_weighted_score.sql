-- SQL Script to Create Stored Procedure: ComputeAverageWeightedScoreForUser

-- Description: This stored procedure computes and stores the average weighted score for a student.

-- Input Parameters:
-- user_id: The ID of the user for whom the average weighted score needs to be computed.

-- Tips:
-- The weighted average can be calculated using the formula: (score1 * weight1 + score2 * weight2 + ... + scoreN * weightN) / (weight1 + weight2 + ... + weightN)

CREATE PROCEDURE ComputeAverageWeightedScoreForUser (IN user_id INT)
BEGIN
-- Variable to store the computed average weighted score
DECLARE average_weighted_score DECIMAL(10, 2);

sql

-- Calculate the weighted average score using user_id
SELECT SUM(score * weight) / SUM(weight) INTO average_weighted_score
FROM scores
WHERE user_id = user_id;

-- Insert or update the average weighted score in the user_scores table
INSERT INTO user_scores (user_id, average_weighted_score)
VALUES (user_id, average_weighted_score)
ON DUPLICATE KEY UPDATE average_weighted_score = average_weighted_score;

-- Print success message
SELECT CONCAT('Average weighted score computed and stored for user_id ', user_id) AS message;

END;

-- Usage:
-- CALL ComputeAverageWeightedScoreForUser(123);
-- Replace 123 with the actual user_id value.
