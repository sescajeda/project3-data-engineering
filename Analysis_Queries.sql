DROP TABLE compiled_hotel_prices
DROP TABLE concerts_info_ORIGINAL_DATES
DROP TABLE venues_info_ORIGINAL_DATES
DROP TABLE lodging_info_ORIGINAL_DATES


CREATE TABLE compiled_hotel_prices (
	Hotel VARCHAR NOT NULL,
	Price INT NOT NULL,
	CheckIn_Date DATE NOT NULL, 
	CheckOut_Date DATE NOT NULL,
	City VARCHAR NOT NULL,
	State VARCHAR NOT NULL,
	Country VARCHAR NOT NULL
	
);

CREATE TABLE concerts_info_ORIGINAL_DATES (
	Event_ID VARCHAR NOT NULL, 
	Concert_Name VARCHAR NOT NULL, 
	Concert_Date DATE NOT NULL, 
	Ticket_Sales_Status VARCHAR NOT NULL, 
	Ticket_Min_Price FLOAT NOT NULL,
	Ticket_Max_Price FLOAT NOT NULL,
	Ticket_Limitation VARCHAR NOT NULL, 
	Venue_ID VARCHAR NOT NULL
);


CREATE TABLE venues_info_ORIGINAL_DATES (
	Venue_ID VARCHAR NOT NULL, 
	Venue_Name VARCHAR NOT NULL, 
	Longitude FLOAT NOT NULL, 
	Latitude FLOAT NOT NULL, 
	Country VARCHAR NOT NULL, 
	State VARCHAR NOT NULL, 
	City VARCHAR NOT NULL, 
	Address VARCHAR NOT NULL
);

CREATE TABLE lodging_info_ORIGINAL_DATES (
	Concert_Date DATE NOT NULL, 
	Venue_ID VARCHAR NOT NULL, 
	Country VARCHAR NOT NULL, 
	State VARCHAR NOT NULL, 
	City VARCHAR NOT NULL,
	CheckIn_Date DATE NOT NULL, 
	CheckOut_Date DATE NOT NULL
)

SELECT * 
FROM lodging_info_ORIGINAL_DATES

SELECT * 
FROM venues_info_ORIGINAL_DATES

SELECT * 
FROM concerts_info_ORIGINAL_DATES

SELECT * 
FROM compiled_hotel_prices


--query to find the min_budget and max_budget 
SELECT sindys_results.city,
       sindys_results.concert_date,
       sindys_results.checkin_date,  -- Include checkin_date in the outer query
       ticket_min_price + min_hotel as min_budget,
       ticket_max_price + max_hotel as max_budget,
	   sindys_results.ticket_min_price,
       sindys_results.min_hotel,
	   CHP_min.hotel as hotel_name_for_min_price,
	   sindys_results.ticket_max_price,
       sindys_results.max_hotel,
       CHP_max.hotel as hotel_name_for_max_price
FROM (
    SELECT compiled_hotel_prices.city,  	
        lodging_info_ORIGINAL_DATES.concert_date,	
        lodging_info_ORIGINAL_DATES.checkin_date,	
        concerts_info_ORIGINAL_DATES.ticket_min_price,
        concerts_info_ORIGINAL_DATES.ticket_max_price,
        MIN(compiled_hotel_prices.price) AS min_hotel,
        MAX(compiled_hotel_prices.price) AS max_hotel
    FROM compiled_hotel_prices
    LEFT JOIN lodging_info_ORIGINAL_DATES
    ON compiled_hotel_prices.checkin_date = lodging_info_ORIGINAL_DATES.checkin_date 
    LEFT JOIN concerts_info_ORIGINAL_DATES
    ON lodging_info_ORIGINAL_DATES.venue_id = concerts_info_ORIGINAL_DATES.venue_id
    GROUP BY lodging_info_ORIGINAL_DATES.concert_date, 
             lodging_info_ORIGINAL_DATES.checkin_date, 
             compiled_hotel_prices.city,	
             concerts_info_ORIGINAL_DATES.ticket_min_price,
             concerts_info_ORIGINAL_DATES.ticket_max_price
) as sindys_results
LEFT JOIN compiled_hotel_prices as CHP_min ON sindys_results.min_hotel = CHP_min.price AND sindys_results.checkin_date = CHP_min.checkin_date 
LEFT JOIN compiled_hotel_prices as CHP_max ON sindys_results.max_hotel = CHP_max.price AND sindys_results.checkin_date = CHP_max.checkin_date
ORDER BY min_budget