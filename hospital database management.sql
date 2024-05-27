CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender CHAR(1),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Reason VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Treatments (
    TreatmentID INT PRIMARY KEY,
    AppointmentID INT,
    TreatmentDescription VARCHAR(255),
    TreatmentDate DATE,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
    RoomNumber VARCHAR(10),
    RoomType VARCHAR(50),
    Status VARCHAR(20)
);

CREATE TABLE PatientRooms (
    PatientID INT,
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);
-- Insert data into Patients table
INSERT INTO Patients (PatientID, FirstName, LastName, DateOfBirth, Gender, Phone, Address) VALUES
(1, 'John', 'Doe', '1980-05-15', 'M', '123-456-7890', '123 Main St, Anytown, USA'),
(2, 'Jane', 'Smith', '1990-08-25', 'F', '234-567-8901', '456 Elm St, Othertown, USA');

-- Insert data into Doctors table
INSERT INTO Doctors (DoctorID, FirstName, LastName, Specialty, Phone, Email) VALUES
(1, 'Alice', 'Johnson', 'Cardiology', '345-678-9012', 'alice.johnson@hospital.com'),
(2, 'Bob', 'Brown', 'Neurology', '456-789-0123', 'bob.brown@hospital.com');

-- Insert data into Appointments table
INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Reason) VALUES
(1, 1, 1, '2024-06-01 10:00:00', 'Routine Checkup'),
(2, 2, 2, '2024-06-01 11:00:00', 'Headache');

-- Insert data into Treatments table
INSERT INTO Treatments (TreatmentID, AppointmentID, TreatmentDescription, TreatmentDate) VALUES
(1, 1, 'Blood Test', '2024-06-01'),
(2, 2, 'MRI Scan', '2024-06-01');

-- Insert data into Rooms table
INSERT INTO Rooms (RoomID, RoomNumber, RoomType, Status) VALUES
(1, '101', 'Single', 'Available'),
(2, '102', 'Double', 'Occupied');

-- Insert data into PatientRooms table
INSERT INTO PatientRooms (PatientID, RoomID, CheckInDate, CheckOutDate) VALUES
(1, 2, '2024-06-01', NULL);
SELECT * FROM Patients;
SELECT FirstName, LastName, Specialty FROM Doctors;
SELECT a.AppointmentID, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName, a.AppointmentDate, a.Reason
FROM Appointments a
JOIN Doctors d ON a.DoctorID = d.DoctorID
WHERE a.PatientID = 1;
SELECT t.TreatmentID, t.TreatmentDescription, t.TreatmentDate
FROM Treatments t
WHERE t.AppointmentID = 1;
SELECT RoomNumber, RoomType
FROM Rooms
WHERE Status = 'Occupied';
UPDATE Patients
SET Phone = '345-678-9012'
WHERE PatientID = 1;
DELETE FROM Appointments
WHERE AppointmentID = 2;
