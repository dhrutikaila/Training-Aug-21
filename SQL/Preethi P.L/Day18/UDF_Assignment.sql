-- UDF ASSIGNMENT

-- 1) Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.

DELIMITER &&
CREATE FUNCTION pf(basicsalary NUMERIC)
RETURNS NUMERIC
BEGIN
	DECLARE pf NUMERIC;
    SET pf = basicsalary*0.12;
    RETURN(pf);
END &&
DELIMITER ;

SELECT pf(10000);

-- 2) Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
/* Monthly Earnings	        Profession Tax Payable
	Below Rs. 5999	        	Nil
	Rs. 6000 to Rs. 8999		Rs. 80/month
	Rs. 9000 to Rs. 11999		Rs. 150/month
	Rs. 12000 and above	     	Rs. 200/month */


DELIMITER &&
CREATE FUNCTION pt(MonthlyEarning NUMERIC)
RETURNS VARCHAR(50)
BEGIN
	DECLARE pt VARCHAR(50);
    IF MonthlyEarning <= 5999 THEN SET pt = "NIL";
    ELSEIF MonthlyEarning BETWEEN 6000 AND 8999 THEN SET pt = "Rs. 80/month";
    ELSEIF MonthlyEarning BETWEEN 9000 AND 11999 THEN SET pt = "Rs. 150/month";
    ELSEIF MonthlyEarning >= 12000 THEN SET pt = "Rs. 200/month";
    END IF; 	    
    RETURN(pt);
END &&
DELIMITER ;

SELECT pt(7000);

-- MYSQL does not support TABLE VALUED FUNCTIONS