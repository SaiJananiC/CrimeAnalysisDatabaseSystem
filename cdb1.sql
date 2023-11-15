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
	Street VARCHAR(100),
    Locality VARCHAR(100),
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
    Locality VARCHAR(255),
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
    ('John Doe', '1990-05-15', 31, 'Multiple thefts', '123 Main St, Whitefield', 'Indian'),
    ('Jane Smith', '1985-12-02', 36, 'Assault and robbery', '456 Oak Ave, Indranagar', 'Indian'),
    ('Robert Johnson', '1982-07-20', 39, 'Burglary', '789 Pine Rd, Jayanagar', 'Indian'),
    ('Emily White', '1995-02-10', 26, 'Drug possession', '101 Elm Ln, Banashankari', 'Indian'),
    ('Michael Brown', '1988-09-28', 33, 'Embezzlement', '202 Cedar St, Malleshwaram', 'Indian'),
    ('Aisha Khan', '1992-03-08', 29, 'Fraud', '543 Maple Ave, BTM Layout', 'Indian'),
    ('Rahul Sharma', '1997-11-12', 24, 'Forgery', '765 Birch Rd, Whitefield', 'Indian'),
    ('Ananya Patel', '1980-08-18', 41, 'Arson', '876 Redwood Ln, Marathahalli', 'Indian'),
    ('Vikram Singh', '1991-12-30', 30, 'Kidnapping', '234 Fir Dr, HSR Layout', 'Indian'),
    ('Neha Verma', '1986-05-25', 35, 'Extortion', '567 Cedar Ln, Yelahanka', 'Indian'),
    ('Samuel Brown', '1987-06-18', 34, 'Shoplifting and theft', '456 High Street, Koramangala', 'Indian'),
    ('Eva Rodriguez', '1993-09-25', 28, 'Vandalism and assault', '789 Park Avenue, Whitefield', 'Indian'),
    ('Daniel Kim', '1984-03-12', 37, 'Grand theft auto', '101 Grove Road, Yelanka', 'Indian'),
    ('Sophia Patel', '1990-11-28', 31, 'Assault and battery', '202 Hill Lane, Banashankari', 'Indian'),
    ('Liam Kumar', '1982-04-15', 39, 'Breaking and entering', '543 Pine Avenue, Yelanka', 'Indian'),
    ('Olivia Reddy', '1995-07-22', 26, 'Identity theft and fraud', '765 Elm Street, Whitefield', 'Indian'),
    ('Noah Singh', '1998-02-03', 23, 'Forgery and white-collar crimes', '876 Oak Drive, Malleshwaram', 'Indian'),
    ('Ava Verma', '1981-08-10', 40, 'Arson and vandalism', '234 Birch Road, Marathahalli', 'Indian'),
    ('Lucas Sharma', '1992-01-30', 29, 'Kidnapping and extortion', '567 Redwood Avenue, Yelanka', 'Indian'),
    ('Mia Gupta', '1986-05-18', 35, 'Bribery and corruption', '890 Cedar Lane, Yelanka', 'Indian');

INSERT INTO Victim (VictimName, Dob, Age, Address, Contact)
VALUES
    ('Alice Johnson', '1992-08-05', 29, '123 Main St, Bangalore', '9876543210'),
    ('Bob Smith', '1985-04-12', 36, '456 Oak Ave, Bangalore', '8765432109'),
    ('Charlie White', '1990-12-18', 31, '789 Pine Rd, Bangalore', '7654321098'),
    ('Diana Brown', '1995-03-22', 26, '101 Elm Ln, Bangalore', '6543210987'),
    ('Edward Khan', '1988-10-08', 33, '202 Cedar St, Bangalore', '5432109876'),
    ('Fiona Patel', '1991-05-30', 30, '543 Maple Ave, Bangalore', '4321098765'),
    ('George Sharma', '1997-12-15', 24, '765 Birch Rd, Bangalore', '3210987654'),
    ('Hannah Verma', '1980-09-21', 41, '876 Redwood Ln, Bangalore', '2109876543'),
    ('Isaac Singh', '1996-02-02', 25, '234 Fir Dr, Bangalore', '1098765432'),
    ('Julia Gupta', '1983-06-25', 38, '567 Cedar Ln, Bangalore', '9876543210'),
    ('Kevin Brown', '1994-11-12', 27, '345 Pine Ave, Bangalore', '8765432109'),
    ('Linda Kumar', '1987-05-28', 34, '678 Oak Ave, Bangalore', '7654321098'),
    ('Mike Reddy', '1993-01-14', 28, '789 Maple Rd, Bangalore', '6543210987'),
    ('Nancy Sharma', '1998-06-30', 23, '890 Elm Ln, Bangalore', '5432109876'),
    ('Oscar Verma', '1982-11-05', 39, '987 Cedar St, Bangalore', '4321098765'),
    ('Pamela Singh', '1990-07-22', 31, '876 Birch Rd, Bangalore', '3210987654'),
    ('Quincy Patel', '1995-04-08', 26, '234 Redwood Ln, Bangalore', '2109876543'),
    ('Raj Brown', '1986-09-18', 35, '567 Fir Dr, Bangalore', '1098765432'),
    ('Sara Verma', '1992-02-01', 29, '890 Cedar Ln, Bangalore', '9876543210'),
    ('Tom Singh', '1984-08-15', 37, '123 Pine Rd, Bangalore', '8765432109');

INSERT INTO Crime (CrimeType, CrimeDate, CrimeTime, CrimeDesc, Street, Locality, Severity, CriminalID, VictimID)
VALUES
    ('Robbery', '2023-01-15', '14:30:00', 'Armed robbery at a convenience store', 'Main Street', 'Whitefield', 'High', 1, 1),
    ('Assault', '2023-02-10', '18:45:00', 'Physical assault in a parking lot', 'Oak Avenue', 'Indiranagar', 'Medium', 2, 2),
    ('Burglary', '2023-03-05', '03:00:00', 'Break-in at a residence', 'Pine Road', 'Jayanagar', 'High', 3, 3),
    ('Drug Possession', '2023-04-20', '12:15:00', 'Drug possession and trafficking', 'Elm Lane', 'Banashankari', 'Medium', 4, 4),
    ('Embezzlement', '2023-05-12', '09:30:00', 'Corporate embezzlement case', 'Cedar Street', 'Malleshwaram', 'High', 5, 5),
    ('Fraud', '2023-06-28', '15:20:00', 'Online fraud scheme', 'Maple Avenue', 'BTM Layout', 'Medium', 6, 6),
    ('Forgery', '2023-07-15', '11:45:00', 'Forgery of official documents', 'Birch Road', 'Whitefield', 'High', 7, 7),
    ('Arson', '2023-08-02', '05:30:00', 'Arson at a commercial building', 'Redwood Lane', 'Marathahalli', 'High', 8, 8),
    ('Kidnapping', '2023-09-18', '20:00:00', 'Kidnapping for ransom', 'Fir Drive', 'HSR Layout', 'High', 9, 9),
    ('Extortion', '2023-10-10', '22:10:00', 'Attempted extortion of a business owner', 'Cedar Lane', 'Yelahanka', 'Medium', 10, 10),
    ('Shoplifting', '2023-11-05', '16:00:00', 'Shoplifting incident at a mall', 'Broadway Avenue', 'Koramangala', 'Medium', 11, 11),
    ('Vandalism', '2023-12-18', '21:30:00', 'Vandalism of public property', 'Main Street', 'Whitefield', 'High', 12, 12),
    ('Car Theft', '2024-01-22', '03:45:00', 'Car theft in a residential area', 'Maple Lane', 'Yelahanka', 'High', 13, 13),
    ('Assault', '2024-02-09', '14:15:00', 'Assault near a park', 'Pine Avenue', 'Banashankari', 'Medium', 14, 14),
    ('Burglary', '2024-03-14', '06:30:00', 'Burglary at a jewelry store', 'Oak Road', 'Yelahanka', 'High', 15, 15),
    ('Fraud', '2024-04-27', '11:10:00', 'Credit card fraud', 'Cedar Lane', 'Whitefield', 'High', 16, 16),
    ('Forgery', '2024-05-19', '18:20:00', 'Forgery of official documents', 'Elm Drive', 'Malleshwaram', 'Medium', 17, 17),
    ('Arson', '2024-06-03', '04:00:00', 'Arson at a warehouse', 'Redwood Road', 'Marathahalli', 'High', 18, 18),
    ('Kidnapping', '2024-07-11', '19:45:00', 'Kidnapping attempt at a school', 'Fir Avenue', 'Yelahanka', 'High', 19, 19),
    ('Extortion', '2024-08-28', '23:30:00', 'Extortion threat to a business', 'Cedar Road', 'Yelahanka', 'High', 20, 20);


INSERT INTO PersonalDescription (Gender, Height, Weight, IdentificationMarks, CriminalID, VictimID)
VALUES
    ('Male', 175.5, 70.2, 'Tattoo on left arm', 1, 1),
    ('Female', 160.0, 55.8, 'Scar on forehead', 2, 2),
    ('Male', 182.3, 80.5, 'Mole on right cheek', 3, 3),
    ('Other', 165.8, 63.0, 'Birthmark on neck', 4, 4),
    ('Male', 178.0, 75.9, 'Piercing on left ear', 5, 5),
    ('Female', 155.5, 50.0, 'Scar on right hand', 6, 6),
    ('Male', 170.2, 68.7, 'Tattoo on chest', 7, 7),
    ('Other', 160.5, 60.3, 'Burn mark on arm', 8, 8),
    ('Male', 175.0, 72.1, 'Mole on neck', 9, 9),
    ('Female', 165.5, 58.4, 'Birthmark on back', 10, 10),
    ('Male', 180.2, 78.0, 'Scar on left hand', 11, 11),
    ('Female', 158.7, 53.2, 'Piercing on nose', 12, 12),
    ('Male', 176.8, 74.5, 'Tattoo on right arm', 13, 13),
    ('Other', 162.3, 61.8, 'Birthmark on leg', 14, 14),
    ('Male', 177.5, 76.3, 'Scar on right leg', 15, 15),
    ('Female', 163.0, 55.5, 'Tattoo on ankle', 16, 16),
    ('Male', 179.5, 79.8, 'Mole on forehead', 17, 17),
    ('Other', 161.7, 62.5, 'Scar on left leg', 18, 18),
    ('Male', 174.0, 71.2, 'Piercing on eyebrow', 19, 19),
    ('Female', 166.5, 57.0, 'Birthmark on arm', 20, 20);

INSERT INTO Evidence (ItemType, Description, CollectionDate, Source, CollectionOfficerName, CollectionOfficerContact, CrimeID)
VALUES
    ('Weapon', 'Handgun used in the robbery', '2023-01-16', 'Anonymous tip', 'Officer Smith', '123-456-7890', 1),
    ('Fingerprint', 'Fingerprint found on the crime scene', '2023-02-11', 'Forensic analysis', 'Officer Johnson', '987-654-3210', 2),
    ('Surveillance Video', 'Video footage of the burglary', '2023-03-06', 'Security cameras', 'Officer White', '567-890-1234', 3),
    ('Drugs', 'Bag of illegal substances', '2023-04-21', 'Undercover operation', 'Officer Brown', '210-987-6543', 4),
    ('Financial Records', 'Evidence of embezzlement', '2023-05-13', 'Corporate investigation', 'Officer Patel', '432-109-8765', 5),
    ('Emails', 'Evidence of fraudulent activity', '2023-06-29', 'Cybercrime division', 'Officer Sharma', '654-321-0987', 6),
    ('Forged Documents', 'Forgery of official papers', '2023-07-16', 'Legal investigation', 'Officer Singh', '876-543-2109', 7),
    ('Arson Residue', 'Remnants from the arson incident', '2023-08-03', 'Fire department', 'Officer Verma', '109-876-5432', 8),
    ('CCTV Footage', 'Video of the kidnapping incident', '2023-09-19', 'Surveillance cameras', 'Officer Kumar', '321-098-7654', 9),
    ('Threatening Letter', 'Letter demanding extortion payment', '2023-10-11', 'Mailed to victim', 'Officer Gupta', '543-210-9876', 10),
    ('Vandalized Property', 'Damaged property as evidence', '2023-11-06', 'Crime scene photos', 'Officer Brown', '987-654-3210', 11),
    ('Physical Assault Marks', 'Injuries on victim', '2023-12-19', 'Medical examination', 'Officer Smith', '876-543-2109', 12),
    ('Stolen Goods', 'Recovered stolen items', '2024-01-23', 'Police operation', 'Officer White', '765-432-1098', 13),
    ('Fake IDs', 'Forged identification cards', '2024-02-10', 'Undercover operation', 'Officer Brown', '654-321-0987', 14),
    ('Vandalism Evidence', 'Proof of vandalism', '2024-03-15', 'Security footage', 'Officer Patel', '543-210-9876', 15),
    ('Shoplifting Merchandise', 'Stolen items from shoplifting', '2024-04-28', 'Store security', 'Officer Sharma', '432-109-8765', 16),
    ('DNA Sample', 'Genetic material from the crime scene', '2024-05-20', 'Forensic lab', 'Officer Singh', '321-098-7654', 17),
    ('Security Camera Footage', 'Video evidence of extortion attempt', '2024-06-04', 'Business surveillance', 'Officer Verma', '109-876-5432', 18),
    ('Bribery Money', 'Illegally obtained money', '2024-07-12', 'Undercover operation', 'Officer Kumar', '543-210-9876', 19),
    ('Online Fraud Records', 'Evidence of online fraud scheme', '2024-08-29', 'Cybercrime division', 'Officer Gupta', '765-432-1098', 20);

-- Inserting tuples into the Criminal table for the new localities
INSERT INTO Criminal (CriminalName, Dob, Age, Records, Address, Nationality)
VALUES
    ('Ravi Kumar', '1988-05-18', 33, 'Online fraud and hacking', '123 Tech Park Road, Electronic City', 'Indian'),
    ('Neha Kapoor', '1985-11-22', 36, 'Assault and battery charges', '456 MG Road, Shivajinagar', 'Indian'),
    ('Prakash Reddy', '1990-08-30', 31, 'Burglary and theft', '789 Lake View Street, KR Puram', 'Indian'),
    ('Anita Singh', '1995-03-10', 26, 'Kidnapping and ransom', '101 Army Road, Cantonment', 'Indian'),
    ('Vikas Verma', '1988-10-25', 33, 'Extortion and blackmail', '202 Market Street, Vijayanagar', 'Indian'),
    ('Shweta Sharma', '1991-06-12', 30, 'Arson and property damage', '543 Gandhi Bazaar, Basavanagudi', 'Indian'),
    ('Rajeev Gupta', '1997-01-30', 24, 'Online fraud and identity theft', '765 Skyline Road, Hebbal', 'Indian'),
    ('Nisha Patel', '1980-08-18', 41, 'Burglary and breaking and entering', '876 Industrial Avenue, Jalahalli', 'Indian'),
    ('Ramesh Singh', '1992-04-22', 29, 'Bank robbery and armed robbery', '234 Main Street, Peenya', 'Indian'),
    ('Anjali Verma', '1986-11-15', 35, 'Assault and street fighting', '567 Township Road, Kengeri', 'Indian');

-- Inserting tuples into the Victim table for the new localities
INSERT INTO Victim (VictimName, Dob, Age, Address, Contact)
VALUES
    ('Shreya Kapoor', '1990-07-05', 31, '123 Tech Park Road, Electronic City', '9876543210'),
    ('Rahul Sharma', '1982-12-12', 38, '456 MG Road, Shivajinagar', '8765432109'),
    ('Meera Reddy', '1995-05-18', 26, '789 Lake View Street, KR Puram', '7654321098'),
    ('Amit Singh', '1992-10-22', 29, '101 Army Road, Cantonment', '6543210987'),
    ('Priya Verma', '1987-07-08', 34, '202 Market Street, Vijayanagar', '5432109876'),
    ('Karthik Sharma', '1993-12-30', 28, '543 Gandhi Bazaar, Basavanagudi', '4321098765'),
    ('Sneha Gupta', '1981-09-21', 40, '765 Skyline Road, Hebbal', '3210987654'),
    ('Vivek Patel', '1996-02-02', 25, '876 Industrial Avenue, Jalahalli', '2109876543'),
    ('Neha Singh', '1983-06-25', 38, '234 Main Street, Peenya', '1098765432'),
    ('Raj Kumar', '1991-11-12', 30, '567 Township Road, Kengeri', '9876543210');

--- Inserting tuples into the Crime table for the new localities
INSERT INTO Crime (CrimeType, CrimeDate, CrimeTime, CrimeDesc, Street, Locality, Severity, CriminalID, VictimID)
VALUES
    ('Fraud', '2024-09-05', '16:30:00', 'Online fraud in Electronic City', 'Tech Park Road', 'Electronic City', 'Medium', 21, 21),
    ('Assault', '2024-10-18', '20:15:00', 'Street brawl in Shivajinagar', 'MG Road', 'Shivajinagar', 'High', 22, 22),
    ('Burglary', '2024-11-22', '02:00:00', 'Residential break-in in KR Puram', 'Lake View Street', 'KR Puram', 'High', 23, 23),
    ('Kidnapping', '2024-12-10', '18:45:00', 'Kidnapping incident in Cantonment', 'Army Road', 'Cantonment', 'High', 24, 24),
    ('Extortion', '2025-01-15', '04:30:00', 'Extortion attempt in Vijayanagar', 'Market Street', 'Vijayanagar', 'High', 25, 25),
    ('Arson', '2025-02-09', '12:10:00', 'Arson at Basavanagudi market', 'Gandhi Bazaar', 'Basavanagudi', 'High', 26, 26),
    ('Fraud', '2025-03-04', '22:00:00', 'Online scam in Hebbal', 'Skyline Road', 'Hebbal', 'Medium', 27, 27),
    ('Burglary', '2025-04-19', '06:45:00', 'Business break-in in Jalahalli', 'Industrial Avenue', 'Jalahalli', 'High', 28, 28),
    ('Robbery', '2025-05-12', '15:20:00', 'Bank robbery in Peenya', 'Main Street', 'Peenya', 'High', 29, 29),
    ('Assault', '2025-06-28', '23:00:00', 'Street fight in Kengeri', 'Township Road', 'Kengeri', 'Medium', 30, 30);

-- Inserting tuples into the Evidence table for the new localities
INSERT INTO Evidence (ItemType, Description, CollectionDate, Source, CollectionOfficerName, CollectionOfficerContact, CrimeID)
VALUES
    ('Emails', 'Evidence of online fraud scheme in Electronic City', '2024-09-07', 'Cybercrime division', 'Officer Kumar', '987-654-3210', 21),
    ('CCTV Footage', 'Video evidence of street fight in Shivajinagar', '2024-10-20', 'Security cameras', 'Officer Reddy', '876-543-2109', 22),
    ('Fingerprint', 'Fingerprint found at the burglary scene in KR Puram', '2024-11-24', 'Forensic analysis', 'Officer Singh', '765-432-1098', 23),
    ('Threatening Letter', 'Extortion letter in Cantonment', '2024-12-12', 'Mailed to victim', 'Officer Verma', '654-321-0987', 24),
    ('Surveillance Video', 'Video footage of extortion attempt in Vijayanagar', '2025-01-17', 'Business surveillance', 'Officer Sharma', '543-210-9876', 25),
    ('Arson Residue', 'Evidence of arson in Basavanagudi', '2025-02-11', 'Fire department', 'Officer Patel', '432-109-8765', 26),
    ('Fraud', 'Online fraud evidence in Hebbal', '2025-03-06', 'Cybercrime division', 'Officer Singh', '321-098-7654', 27),
    ('Stolen Goods', 'Recovered stolen items in Jalahalli', '2025-04-21', 'Police operation', 'Officer Verma', '109-876-5432', 28),
    ('Bank Records', 'Bank records related to the robbery in Peenya', '2025-05-14', 'Financial investigation', 'Officer Kumar', '543-210-9876', 29),
    ('Medical Report', 'Medical report of the assault victim in Kengeri', '2025-06-30', 'Medical examination', 'Officer Gupta', '765-432-1098', 30);


INSERT INTO PersonalDescription (Gender, Height, Weight, IdentificationMarks, CriminalID, VictimID)
VALUES
    ('Male', 175.0, 75.5, 'Tattoo on right forearm', 21, 21),
    ('Female', 162.5, 55.2, 'Scar on left cheek', 22, 22),
    ('Male', 180.0, 80.0, 'Mole on neck', 23, 23),
    ('Female', 168.0, 60.8, 'Birthmark on right arm', 24, 24),
    ('Male', 175.5, 72.3, 'Piercing on right ear', 25, 25),
    ('Female', 160.2, 52.5, 'Scar on left hand', 26, 26),
    ('Male', 178.5, 78.0, 'Tattoo on chest', 27, 27),
    ('Female', 163.5, 56.7, 'Burn mark on right arm', 28, 28),
    ('Male', 177.2, 76.5, 'Mole on forehead', 29, 29),
    ('Female', 165.0, 58.3, 'Birthmark on back', 30, 30);

-- Inserting at least one entry per locality into the LawEnforcementAgency table
INSERT INTO LawEnforcementAgency (AgencyID, Name, Locality, Contact, EvidenceID, CrimeID)
VALUES
    (1, 'Bangalore City Police', 'Koramangala', '100', 1, 1),
    (2, 'Indiranagar Police Station', 'Indiranagar', '101', 2, 2),
    (3, 'Jayanagar Law Enforcement', 'Jayanagar', '102', 3, 3),
    (4, 'Banashankari Police', 'Banashankari', '103', 4, 4),
    (5, 'BTM Layout Police Department', 'BTM Layout', '104', 5, 5),
    (6, 'Whitefield Security Bureau', 'Whitefield', '105', 6, 6),
    (7, 'Marathahalli Crime Prevention', 'Marathahalli', '106', 7, 7),
    (8, 'HSR Layout Police Office', 'HSR Layout', '107', 8, 8),
    (9, 'Yelahanka Law Enforcement', 'Yelahanka', '108', 9, 9),
    (10, 'Malleshwaram Security Agency', 'Malleshwaram', '109', 10, 10),
    (11, 'Electronic City Police', 'Electronic City', '110', 11, 11),
    (12, 'Shivajinagar Police Department', 'Shivajinagar', '111', 12, 12),
    (13, 'KR Puram Security Division', 'KR Puram', '112', 13, 13),
    (14, 'Cantonment Police Station', 'Cantonment', '113', 14, 14),
    (15, 'Vijayanagar Law Enforcement', 'Vijayanagar', '114', 15, 15),
    (16, 'Basavanagudi Police Office', 'Basavanagudi', '115', 16, 16),
    (17, 'Hebbal Security Bureau', 'Hebbal', '116', 17, 17),
    (18, 'Jalahalli Crime Prevention', 'Jalahalli', '117', 18, 18),
    (19, 'Peenya Police Department', 'Peenya', '118', 19, 19),
    (20, 'Kengeri Security Agency', 'Kengeri', '119', 20, 20);

-- Inserting tuples into the InvestigatingTeam table
INSERT INTO InvestigatingTeam (SketchArtists, LeadInspector, ForensicSpecialists, Interrogator, SpecialisedUnits, LegalAdvisor, AgencyID)
VALUES
    ('John Smith, Maria Patel', 'Inspector Anderson', 'Dr. Emily White, Dr. Raj Singh', 'Officer Harris', 'Cybercrime Unit', 'Lawyer Johnson', 1), -- Bangalore City Police
    ('Sara Verma, Raj Kumar', 'Inspector Gupta', 'Dr. Sophia Reddy', 'Officer Davis', 'Forensic Science Unit', 'Lawyer Sharma', 6), -- Whitefield Security Bureau
    ('Ankit Singh, Priya Reddy', 'Inspector Verma', 'Dr. Rajesh Kumar', 'Officer Patel', 'Special Weapons and Tactics (SWAT) Team', 'Lawyer Singh', 9), -- Yelahanka Law Enforcement
    ('Rahul Sharma, Nisha Gupta', 'Inspector Kumar', 'Dr. Anjali Verma', 'Officer Reddy', 'K-9 Unit', 'Lawyer Kumar', 12), -- Shivajinagar Police Department
    ('Priya Singh, Karan Verma', 'Inspector Patel', 'Dr. Vikram Sharma', 'Officer White', 'Bomb Squad', 'Lawyer Verma', 17); -- Hebbal Security Bureau
