BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id INTEGER NOT NULL, 
	"Phone" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"Industry" VARCHAR(255), 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account" VALUES(1,'5551238765','Prospect','Biotechnology','Acme');
COMMIT;
