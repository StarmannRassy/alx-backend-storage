-- Compute average score using user_id
SELECT AVG(score) INTO average_score
FROM scores
WHERE user_id = user_id;

-- Insert or update the average score in the user_scores table
INSERT INTO user_scores (user_id, average_score)
VALUES (user_id, average_score)
ON DUPLICATE KEY UPDATE average_score = average_score;

-- Print success message
SELECT CONCAT('Average score computed and stored for user_id ', user_id) AS message;

