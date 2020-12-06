-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

-- Populate lookup tables

INSERT INTO tblRole (RoleName, RoleDesc)
VALUES ('Software Engineer', 'Software Engineers leverage engeering principles to design, create
    and troubleshoot software'),
  ('Product Manager', 'Product Managers are point of people for a given product'),
  ('Program Manager', 'Program Manager ideate, implement, measure the impact of and optimize a
    given program within an organization'),
  ('Data Scientist', 'Data Scientists analyze data to derive meaning from it and ultimately, use
    that information to help meet organizational goals'),
  ('Business Analyst', 'Business Analysts study organizational operations to assess performance,
    identify problems and come up with creative solutions');
GO

INSERT INTO tblEmployee (FName, LName, DOB)
VALUES ('Somya', 'Doshi', '08-28-1999'),
  ('Kristie', 'Walsh', '04-12-1994'),
  ('Zoey', 'Rose', '01-11-1998'),
  ('Ranjith', 'Ramkishore', '01-14-1999'),
  ('Varun', 'Patel', '10-14-1999');
GO

INSERT INTO tblEvent_Type (EventTypeName, EventTypeDesc)
VALUES ('Hired', 'A person was hired to the company'),
  ('Fired', 'A person was fired from the company'),
  ('Salary Raise', 'Increase in paycheck'),
  ('Promotion', 'Employee moves up in hierarchy and recieves more responsibility'),
  ('Demotion', 'Employee moves down in hierarchy and recieves less responsibility/more management'),
  ('Transfer Location', 'Employee transfered to another office location');
GO


INSERT INTO tblRating (RatingName, RatingNumeric)
VALUES ('Performance', 8),
  ('Performance', 10),
  ('Performance', 6.5);
GO

INSERT INTO tblOrganization (OrganizationName, OrganizationDesc)
VALUES ('Marketing', 'Team responsible for outreach and growth'),
  ('Development', 'Responsible for the development of the product.'),
  ('Legal', 'Handles all legal responsibilities.');
GO
