CREATE DATABASE CrimeDB;

USE CrimeDB;

CREATE TABLE Criminal (
    CriminalID INT PRIMARY KEY AUTO_INCREMENT,
    CriminalName VARCHAR(100) NOT NULL,
    Dob DATE,
    Age INT,
    Records VARCHAR(200),
    Address VARCHAR(200),
    Nationality VARCHAR(200)
);

CREATE TABLE Victim (
    VictimID INT PRIMARY KEY AUTO_INCREMENT,
    VictimName VARCHAR(100) NOT NULL,
    Dob DATE,
    Age INT,
    Address VARCHAR(200),
    Contact VARCHAR(100),
    UNIQUE (VictimName)
);

CREATE TABLE Crime (
    CrimeID INT PRIMARY KEY AUTO_INCREMENT,
    CrimeType VARCHAR(100) NOT NULL,
    CrimeDate DATE NOT NULL,
    CrimeTime TIME NOT NULL,
    CrimeDesc VARCHAR(100),
	Latitude DECIMAL(10, 6),
    Longitude DECIMAL(10, 6),
    Severity VARCHAR(100),
    CriminalID INT,
    VictimID INT,
    FOREIGN KEY (CriminalID) REFERENCES Criminal(CriminalID),
    FOREIGN KEY (VictimID) REFERENCES Victim(VictimID)
);

CREATE TABLE PersonalDescription (
    Gender ENUM('Male', 'Female', 'Other'),
    Height DECIMAL(10, 6),
    Weight DECIMAL(10, 6),
    IdentificationMarks TEXT,
    CriminalID INT,
    VictimID INT,
    FOREIGN KEY (CriminalID) REFERENCES Criminal(CriminalID),
    FOREIGN KEY (VictimID) REFERENCES Victim(VictimID)
);

CREATE TABLE Evidence (
    EvidenceID INT PRIMARY KEY AUTO_INCREMENT,
    ItemType VARCHAR(100) NOT NULL,
    Description TEXT,
    CollectionDate DATE,
    Source VARCHAR(255),
    CollectionOfficerName VARCHAR(255),
    CollectionOfficerContact VARCHAR(100),
    CrimeID INT,
    FOREIGN KEY (CrimeID) REFERENCES Crime(CrimeID)
);

CREATE TABLE LawEnforcementAgency (
    AgencyID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Location VARCHAR(255),
    Contact VARCHAR(100),
    EvidenceID INT,
    CrimeID INT,
    FOREIGN KEY (EvidenceID) REFERENCES Evidence(EvidenceID),
    FOREIGN KEY (CrimeID) REFERENCES Crime(CrimeID)
);

CREATE TABLE InvestigatingTeam (
    TeamID INT PRIMARY KEY AUTO_INCREMENT,
    SketchArtists VARCHAR(255) NOT NULL, 
    LeadInspector VARCHAR(255),
    ForensicSpecialists VARCHAR(255), 
    Interrogator VARCHAR(255),
    SpecialisedUnits VARCHAR(255), 
    LegalAdvisor VARCHAR(255),
    AgencyID INT,
    FOREIGN KEY (AgencyID) REFERENCES LawEnforcementAgency(AgencyID)
);

INSERT INTO Criminal (CriminalName, Dob, Age, Records, Address, Nationality)
VALUES
    ('Rahul Sharma', '1990-05-15', 31, 'Multiple thefts', '123 Main St, Bangalore', 'Indian'),
    ('Priya Singh', '1985-12-02', 36, 'Assault and robbery', '456 Oak Ave, Bangalore', 'Indian'),
    ('Rajesh Kumar', '1982-07-20', 39, 'Burglary', '789 Pine Rd, Bangalore', 'Indian'),
    ('Amit Patel', '1995-02-10', 26, 'Drug possession', '101 Elm Ln, Bangalore', 'Indian'),
    ('Neha Verma', '1988-09-28', 33, 'Embezzlement', '202 Cedar St, Bangalore', 'Indian');

INSERT INTO Victim (VictimName, Dob, Age, Address, Contact)
VALUES
    ('Meera Gupta', '1980-03-08', 41, '321 Maple St, Bangalore', '+91 9876543210'),
    ('Suresh Menon', '1992-06-25', 29, '543 Birch Ave, Bangalore', '+91 9876543211'),
    ('Geeta Singh', '1999-11-12', 22, '765 Redwood Rd, Bangalore', '+91 9876543212'),
    ('Sanjay Kapoor', '1975-08-18', 46, '876 Willow Ln, Bangalore', '+91 9876543213'),
    ('Pooja Sharma', '1991-12-30', 30, '234 Fir Dr, Bangalore', '+91 9876543214');

INSERT INTO Crime (CrimeType, CrimeDate, CrimeTime, CrimeDesc, Latitude, Longitude, Severity, CriminalID, VictimID)
VALUES
    ('Theft', '2023-08-10', '15:30:00', 'Shoplifting', 12.9716, 77.5946, 'Low', 1, 1),
    ('Assault', '2023-08-11', '18:45:00', 'Street Fight', 12.9276, 77.6271, 'Medium', 2, 2),
    ('Burglary', '2023-08-12', '02:15:00', 'Residential Break-in', 12.9352, 77.6245, 'High', 3, 3),
    ('Drug Possession', '2023-08-13', '20:00:00', 'Possession of Narcotics', 12.9667, 77.5953, 'Medium', 4, 4),
    ('Embezzlement', '2023-08-14', '10:30:00', 'Financial Fraud', 12.9227, 77.5905, 'High', 5, 5);

INSERT INTO PersonalDescription (Gender, Height, Weight, IdentificationMarks, CriminalID, VictimID)
VALUES
    ('Male', 180.0, 75.0, 'Tattoo on right arm', 1, 1),
    ('Female', 165.0, 55.0, 'Scar on left cheek', 2, 2),
    ('Male', 175.0, 80.0, 'Missing left index finger', 3, 3),
    ('Male', 172.0, 70.0, 'Pierced ears', 4, 4),
    ('Female', 160.0, 60.0, 'Birthmark on neck', 5, 5);

INSERT INTO Evidence (ItemType, Description, CollectionDate, Source, CollectionOfficerName, CollectionOfficerContact, CrimeID)
VALUES
    ('Fingerprint', 'Fingerprint on glass window', '2023-08-10', 'Crime Scene', 'Officer Smith', '+91 9876543220', 1),
    ('Blood Sample', 'Bloodstains on victim''s clothing', '2023-08-11', 'Hospital', 'Officer Johnson', '+91 9876543221', 2),
    ('Tool', 'Lock-picking tools found at crime scene', '2023-08-12', 'Crime Scene', 'Officer Brown', '+91 9876543222', 3),
    ('Drugs', 'Bag of narcotics seized from suspect', '2023-08-13', 'Crime Scene', 'Officer Wilson', '+91 9876543223', 4),
    ('Financial Records', 'Embezzlement evidence: fraudulent documents', '2023-08-14', 'Company Office', 'Officer Davis', '+91 9876543224', 5);

INSERT INTO LawEnforcementAgency (AgencyID, Name, Location, Contact, EvidenceID, CrimeID)
VALUES
    (1, 'Bangalore City Police', 'Brigade Road, Bangalore', '+91 80 12345678', 1, 1),
    (2, 'Bangalore Metropolitan Police', 'MG Road, Bangalore', '+91 80 23456789', 2, 2),
    (3, 'Karnataka State Police', 'Vidhana Soudha, Bangalore', '+91 80 34567890', 3, 3),
    (4, 'Central Bureau of Investigation (CBI)', 'Indiranagar, Bangalore', '+91 80 45678901', 4, 4),
    (5, 'Enforcement Directorate', 'Richmond Road, Bangalore', '+91 80 56789012', 5, 5);

INSERT INTO InvestigatingTeam (SketchArtists, LeadInspector, ForensicSpecialists, Interrogator, SpecialisedUnits, LegalAdvisor, AgencyID)
VALUES
    ('John Doe, Jane Smith', 'Inspector Anderson', 'Dr. Brown, Dr. Patel', 'Officer Garcia', 'Narcotics Unit, Cybercrime Unit', 'Lawyer Johnson', 1),
    ('Mike White, Lisa Johnson', 'Inspector Wilson', 'Dr. Lee', 'Officer Martinez', 'SWAT Team, K-9 Unit', 'Lawyer Davis', 2),
    ('Sarah Adams, Chris Baker', 'Inspector Clark', 'Dr. Gupta', 'Officer Miller', 'Financial Crimes Unit', 'Lawyer Williams', 3),
    ('David Martin, Laura Turner', 'Inspector Harris', 'Dr. Walker', 'Officer Jackson', 'Homicide Unit', 'Lawyer Brown', 4),
    ('Emily Turner, Mark Wilson', 'Inspector Rodriguez', 'Dr. Patel', 'Officer Davis', 'Cybercrime Unit', 'Lawyer Anderson', 5);
