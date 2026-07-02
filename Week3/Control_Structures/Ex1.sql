-- Scenario1
-- Apply a 1% discount to loan interest rates for customers above 60 years old.
BEGIN

    FOR cust IN (
        SELECT CustomerID, Age
        FROM Customers
    )
    LOOP

        IF cust.Age > 60 THEN

            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = cust.CustomerID;

        END IF;

    END LOOP;

    COMMIT;

END;
/

-- Scenario2
-- Customers with balance greater than 10000 become VIP.
BEGIN

    FOR cust IN (
        SELECT CustomerID, Balance
        FROM Customers
    )
    LOOP

        IF cust.Balance > 10000 THEN

            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = cust.CustomerID;

        END IF;

    END LOOP;

    COMMIT;

END;
/

-- Scenario3
-- Loans due within the next 30 days.
BEGIN

    FOR loan_rec IN (

        SELECT CustomerID,
               LoanID,
               DueDate
        FROM Loans
        WHERE DueDate BETWEEN SYSDATE AND SYSDATE + 30

    )

    LOOP

        DBMS_OUTPUT.PUT_LINE(

            'Reminder: Loan '
            || loan_rec.LoanID
            || ' for Customer '
            || loan_rec.CustomerID
            || ' is due on '
            || loan_rec.DueDate

        );

    END LOOP;

END;
/
