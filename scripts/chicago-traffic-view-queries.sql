USE chicago_traffic_citations;


-- View 1
CREATE VIEW HighPaymentDueTickets AS
SELECT 
    t.TicketNumber, 
    p.TotalPayments
FROM 
    Tickets t
JOIN 
    Payments p ON t.TicketNumber = p.TicketNumber
WHERE 
    p.TotalPayments > (SELECT AVG(TotalPayments) FROM Payments)
ORDER BY 
    p.TotalPayments DESC;


-- View 2
CREATE VIEW AvgPaymentPerViolation AS
SELECT
	v.ViolationDescription,
	ROUND(AVG(p.TotalPayments),2) AS AvgPayment
FROM
	Violations v
JOIN
	Tickets t ON v.ViolationID = t.ViolationID
JOIN
	Payments p ON t.TicketNumber = p.TicketNumber
GROUP BY
	v.ViolationDescription
ORDER BY 
    AvgPayment DESC;


-- View 3
CREATE VIEW ViolationsByVehicleType AS
SELECT
	v.ViolationDescription,
    vt.LicensePlateType,
    COUNT(t.TicketNumber) AS TotalTickets
FROM
	Violations v
JOIN
	Tickets t ON v.ViolationID = t.ViolationID
JOIN
	Vehicles vt ON t.VehicleID = vt.VehicleID
GROUP
	BY v.ViolationDescription, vt.LicensePlateType
ORDER BY 
    TotalTickets DESC;


-- View 4
CREATE OR REPLACE VIEW FilteredZipCodesByViolations AS
SELECT 
    l.ZipCode, 
    COUNT(t.TicketNumber) AS TotalViolations
FROM 
    Tickets t
JOIN 
    Locations l ON t.LocationID = l.LocationID
WHERE 
    l.ZipCode IS NOT NULL
    AND TRIM(l.ZipCode) != ''
GROUP BY 
    l.ZipCode
HAVING 
    COUNT(t.TicketNumber) > 2
ORDER BY 
    TotalViolations DESC;
    
    
-- View 5
CREATE VIEW TicketViolationsAndLocations AS
SELECT 
    t.TicketNumber, 
    v.ViolationDescription, 
    l.ViolationLocation
FROM 
    Tickets t
JOIN 
    Violations v ON t.ViolationID = v.ViolationID
JOIN 
    Locations l ON t.LocationID = l.LocationID;


-- View 6
CREATE VIEW LiableTicketViolationHearings AS
SELECT
	h.TicketNumber,
    v.ViolationDescription,
    h.HearingDisposition AS Disposition
FROM
	Hearings h
JOIN 
    Tickets t ON h.TicketNumber = t.TicketNumber
JOIN 
    Violations v ON t.ViolationID = v.ViolationID
WHERE 
    h.HearingDisposition = 'Liable';
