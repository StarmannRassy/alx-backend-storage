-- SQL Script to Create Function: SafeDiv

-- Description: This script creates a function called 'SafeDiv' that divides the first number by the second number. If the second number is equal to 0, it returns 0.

-- Create the function
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS DECIMAL(10, 2)
BEGIN
DECLARE result DECIMAL(10, 2);

IF b = 0 THEN
    SET result = 0;
ELSE
    SET result = a / b;
END IF;

RETURN result;

END;

-- The function 'SafeDiv' takes two arguments 'a' and 'b' of type INT and returns a DECIMAL(10, 2).
-- It checks if 'b' is equal to 0, and if so, sets the result to 0. Otherwise, it calculates the division of 'a' by 'b'.

-- Usage:
-- SELECT SafeDiv(10, 2); -- Returns 5.00
-- SELECT SafeDiv(10, 0); -- Returns 0.00
