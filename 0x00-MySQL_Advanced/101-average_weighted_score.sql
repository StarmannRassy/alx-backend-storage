-- SQL Script to Create Stored Procedure: ComputeAverageWeightedScoreForUsers

-- Description: This stored procedure computes and stores the average weighted score for all students.

-- Tips:
-- The weighted average can be calculated using the formula: (score1 * weight1 + score2 * weight2 + ... + scoreN * weightN) / (weight1 + weight2 + ... + weightN)

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
BEGIN
-- Variable to store the user ID
DECLARE user_id INT;

sql

-- Cursor to iterate over the users
DECLARE cur CURSOR FOR SELECT id FROM users;

-- Variables to store the computed average weighted score
DECLARE average_weighted_score DECIMAL(10, 2);

-- Variables for score and weight
DECLARE score DECIMAL(10, 2);
DECLARE weight DECIMAL(10, 2);

-- Open the cursor
OPEN cur;

-- Start fetching rows
FETCH cur INTO user_id;

-- Loop through each user
WHILE user_id IS NOT NULL DO
    -- Calculate the weighted average score for the current user
    SET average_weighted_score = 0;

    -- Cursor to iterate over the scores for the current user
    DECLARE cur_scores CURSOR FOR SELECT score, weight FROM scores WHERE user_id = user_id;

    -- Open the cursor for scores
    OPEN cur_scores;

    -- Start fetching scores
    FETCH cur_scores INTO score, weight;

    -- Loop through each score
    WHILE score IS NOT NULL DO
        -- Calculate the weighted score for the current score
        SET average_weighted_score = average_weighted_score + (score * weight);
        FETCH cur_scores INTO score, weight;
    END WHILE;

    -- Close the cursor for scores
    CLOSE cur_scores;

    -- Get the total weight for the current user
    SELECT SUM(weight) INTO weight FROM scores WHERE user_id = user_id;

    -- Calculate the average weighted score for the current user
    IF weight IS NOT NULL THEN
        SET average_weighted_score = average_weighted_score / weight;
    ELSE
        SET average_weighted_score = 0;
    END IF;

    -- Insert or update the average weighted score in the user_scores table
    INSERT INTO user_scores (user_id, average_weighted_score)
    VALUES (user_id, average_weighted_score)
    ON DUPLICATE KEY UPDATE average_weighted_score = average_weighted_score;

    -- Fetch the next user
    FETCH cur INTO user_id;
END WHILE;

-- Close the cursor
CLOSE cur;

-- Print success message
SELECT 'Average weighted score computed and stored for all users' AS message;

END;

-- Usage:
-- CALL ComputeAverageWeightedScoreForUsers();
