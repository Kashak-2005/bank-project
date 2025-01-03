CREATE DATABASE ABC_Bank;
USE ABC_Bank;
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('M', 'F', 'Other') NOT NULL,
    pan_number VARCHAR(20) NOT NULL,
    aadhar_number VARCHAR(20) NOT NULL,
    account_type ENUM('Savings', 'Current') NOT NULL,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    pin INT NOT NULL,
    balance FLOAT DEFAULT 0.0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_account_number VARCHAR(20) NOT NULL,
    receiver_account_number VARCHAR(20) NOT NULL,
    amount FLOAT NOT NULL,
    balance_after_transaction FLOAT NOT NULL,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_account_number) REFERENCES Users(account_number),
    FOREIGN KEY (receiver_account_number) REFERENCES Users(account_number)
);

CREATE TABLE CustomerDetails (
    sno INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    account_number VARCHAR(20) NOT NULL,
    current_balance FLOAT DEFAULT 0.0,
    FOREIGN KEY (account_number) REFERENCES Users(account_number)
);

-- Insert Users
INSERT INTO Users (username, password, email, phone_number, dob, gender, pan_number, aadhar_number, account_type, account_number, pin, balance) 
VALUES
('john_doe', 'password123', 'john@example.com', '9876543210', '1990-01-01', 'M', 'ABCDE1234F', '123456789012', 'Savings', '100001', 1234, 5000.0),
('jane_doe', 'password456', 'jane@example.com', '9876543211', '1992-05-05', 'F', 'XYZWE1234J', '987654321098', 'Current', '100002', 5678, 3000.0);

-- Insert Transactions
INSERT INTO Transactions (sender_account_number, receiver_account_number, amount, balance_after_transaction)
VALUES
('100001', '100002', 500.0, 4500.0),
('100002', '100001', 200.0, 5200.0);

-- Insert Customer Details
INSERT INTO CustomerDetails (name, email, account_number, current_balance)
VALUES
('John Doe', 'john@example.com', '100001', 5000.0),
('Jane Doe', 'jane@example.com', '100002', 3000.0);
