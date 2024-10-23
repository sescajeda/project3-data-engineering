-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/419YKj
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "compiled_hotel_prices" (
    "Hotel" VARCHAR(255)   NOT NULL,
    "Price" FLOAT   NOT NULL,
    "City" VARCHAR(255)   NOT NULL,
    "State" VARCHAR(255)   NOT NULL,
    "Country" VARCHAR(255)   NOT NULL,
    "CheckIn_Date" DATE   NOT NULL,
    "CheckOut_Date" DATE   NOT NULL,
    CONSTRAINT "pk_compiled_hotel_prices" PRIMARY KEY (
        "Hotel"
     )
);

CREATE TABLE "concerts_info_ORIGINAL_DATES" (
    "Event_ID" VARCHAR(255)   NOT NULL,
    "Concert_Name" VARCHAR(255)   NOT NULL,
    "Concert_Date" DATE   NOT NULL,
    "Ticket_Sale_Status" VARCHAR(255)   NOT NULL,
    "Ticket_Min_Price" FLOAT   NOT NULL,
    "Ticket_Max_Price" FLOAT   NOT NULL,
    "Ticket_Limitation" VARCHAR(255)   NOT NULL,
    "Venue_ID" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_concerts_info_ORIGINAL_DATES" PRIMARY KEY (
        "Event_ID"
     )
);

CREATE TABLE "lodging_info_ORIGINAL_DATES" (
    "Concert_Date" DATE   NOT NULL,
    "Venue_ID" VARCHAR(255)   NOT NULL,
    "Country" VARCHAR(255)   NOT NULL,
    "State" VARCHAR(255)   NOT NULL,
    "City" VARCHAR(255)   NOT NULL,
    "CheckIn_Date" DATE   NOT NULL,
    "CheckOut_Date" DATE   NOT NULL
);

CREATE TABLE "venues_info_ORIGINAL_DATES" (
    "Venue_ID" VARCHAR(255)   NOT NULL,
    "Venue_Name" VARCHAR(255)   NOT NULL,
    "Longitude" FLOAT   NOT NULL,
    "Latitiude" FLOAT   NOT NULL,
    "Country" VARCHAR(255)   NOT NULL,
    "State" VARCHAR(255)   NOT NULL,
    "City" VARCHAR(255)   NOT NULL,
    "Address" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_venues_info_ORIGINAL_DATES" PRIMARY KEY (
        "Venue_ID"
     )
);

ALTER TABLE "compiled_hotel_prices" ADD CONSTRAINT "fk_compiled_hotel_prices_City_State_Country_CheckIn_Date_CheckOut_Date" FOREIGN KEY("City", "State", "Country", "CheckIn_Date", "CheckOut_Date")
REFERENCES "lodging_info_ORIGINAL_DATES" ("City", "State", "Country", "CheckIn_Date", "CheckOut_Date");

ALTER TABLE "concerts_info_ORIGINAL_DATES" ADD CONSTRAINT "fk_concerts_info_ORIGINAL_DATES_Concert_Date" FOREIGN KEY("Concert_Date")
REFERENCES "lodging_info_ORIGINAL_DATES" ("Concert_Date");

ALTER TABLE "concerts_info_ORIGINAL_DATES" ADD CONSTRAINT "fk_concerts_info_ORIGINAL_DATES_Venue_ID" FOREIGN KEY("Venue_ID")
REFERENCES "venues_info_ORIGINAL_DATES" ("Venue_ID");

ALTER TABLE "lodging_info_ORIGINAL_DATES" ADD CONSTRAINT "fk_lodging_info_ORIGINAL_DATES_Venue_ID" FOREIGN KEY("Venue_ID")
REFERENCES "concerts_info_ORIGINAL_DATES" ("Venue_ID");

ALTER TABLE "lodging_info_ORIGINAL_DATES" ADD CONSTRAINT "fk_lodging_info_ORIGINAL_DATES_Country_State_City" FOREIGN KEY("Country", "State", "City")
REFERENCES "venues_info_ORIGINAL_DATES" ("Country", "State", "City");

ALTER TABLE "venues_info_ORIGINAL_DATES" ADD CONSTRAINT "fk_venues_info_ORIGINAL_DATES_Venue_ID" FOREIGN KEY("Venue_ID")
REFERENCES "lodging_info_ORIGINAL_DATES" ("Venue_ID");

ALTER TABLE "venues_info_ORIGINAL_DATES" ADD CONSTRAINT "fk_venues_info_ORIGINAL_DATES_Country_State_City" FOREIGN KEY("Country", "State", "City")
REFERENCES "compiled_hotel_prices" ("Country", "State", "City");

