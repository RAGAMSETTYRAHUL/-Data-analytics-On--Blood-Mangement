CREATE DATABASE HospitalBloodManagement;
USE HospitalBloodManagement;

CREATE TABLE Donors (
    DonorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    BloodType VARCHAR(3),  -- Example: O+, A-, B+
    LastDonationDate DATE,
    PhoneNumber VARCHAR(15)
);

CREATE TABLE BloodUnits (
    UnitID INT AUTO_INCREMENT PRIMARY KEY,
    DonorID INT,
    BloodType VARCHAR(3),
    CollectionDate DATE,
    ExpirationDate DATE,
    IsAvailable BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID)
);

CREATE TABLE Recipients (
    RecipientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    BloodType VARCHAR(3),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Transfusions (
    TransfusionID INT AUTO_INCREMENT PRIMARY KEY,
    UnitID INT,
    RecipientID INT,
    TransfusionDate DATE,
    FOREIGN KEY (UnitID) REFERENCES BloodUnits(UnitID),
    FOREIGN KEY (RecipientID) REFERENCES Recipients(RecipientID)
);


-- Insert Donors
INSERT INTO Donors (FirstName, LastName, DateOfBirth, BloodType, LastDonationDate, PhoneNumber)
VALUES 
('John', 'Doe', '1980-05-15', 'O+', '2024-08-01', '123-456-7890'),
('Jane', 'Smith', '1990-11-23', 'A-', '2024-07-15', '234-567-8901'),
('Emily', 'Johnson', '1985-03-08', 'B+', '2024-06-30', '345-678-9012');

-- Insert Blood Units
INSERT INTO BloodUnits (DonorID, BloodType, CollectionDate, ExpirationDate)
VALUES 
(1, 'O+', '2024-08-01', '2024-10-01'),
(2, 'A-', '2024-07-15', '2024-09-15'),
(3, 'B+', '2024-06-30', '2024-08-30');

-- Insert Recipients
INSERT INTO Recipients (FirstName, LastName, DateOfBirth, BloodType, PhoneNumber)
VALUES 
('Michael', 'Brown', '1975-02-14', 'O+', '456-789-0123'),
('Sarah', 'Davis', '1982-09-27', 'A-', '567-890-1234');

-- Insert Transfusions
INSERT INTO Transfusions (UnitID, RecipientID, TransfusionDate)
VALUES 
(1, 1, '2024-08-20'),
(2, 2, '2024-08-15');




