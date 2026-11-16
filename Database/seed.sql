-- Sample data for the Modern CRM. Loaded by build_db.py unless --no-seed is given.

INSERT INTO 'person' VALUES(1,'Business','Thomas','George','Peters',0);

INSERT INTO 'address' VALUES(1,1,'Business','71 Valley View Ln.','','Smithville','PA','17022');
INSERT INTO 'address' VALUES(2,NULL,'Business','3 E. Leatherwood Dr.','','Hopewell','VA','23860');
INSERT INTO 'address' VALUES(3,NULL,'Business','54 Pin Oak St.','','Stillwater','MN','55082');
INSERT INTO 'address' VALUES(4,NULL,'Business','414 Walt Whitman St.','','Macomb','MI','48042');
INSERT INTO 'address' VALUES(5,NULL,'Business','79 E. Corona Ave.','','Milwaukee','WI','53204');
INSERT INTO 'address' VALUES(6,NULL,'Business','260 Foxrun Dr.','Apt. 102','Warren','FL','48089');

INSERT INTO 'contact' VALUES(1,1,'Email','testing123@test.com');
INSERT INTO 'contact' VALUES(2,1,'Phone','212-232-3434');
