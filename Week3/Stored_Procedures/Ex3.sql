-- Scenario1
-- Monthly Interest
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN

    UPDATE Accounts

    SET Balance = Balance + (Balance * 0.01)

    WHERE AccountType='Savings';

    COMMIT;

END;
/
-- Scenario 2

-- Employee Bonus
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(

    p_DepartmentID NUMBER,

    p_BonusPercent NUMBER

)

IS

BEGIN

    UPDATE Employees

    SET Salary = Salary + (Salary * p_BonusPercent /100)

    WHERE DepartmentID=p_DepartmentID;

    COMMIT;

END;
/
-- Scenario 3

-- Transfer Funds

CREATE OR REPLACE PROCEDURE TransferFunds(

    p_FromAccount NUMBER,

    p_ToAccount NUMBER,

    p_Amount NUMBER

)

IS

    v_Balance NUMBER;

BEGIN

    SELECT Balance

    INTO v_Balance

    FROM Accounts

    WHERE AccountID=p_FromAccount;

    IF v_Balance>=p_Amount THEN

        UPDATE Accounts

        SET Balance=Balance-p_Amount

        WHERE AccountID=p_FromAccount;

        UPDATE Accounts

        SET Balance=Balance+p_Amount

        WHERE AccountID=p_ToAccount;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer Successful');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

    END IF;

END;
/