# import pandas as pd
#
# # Load Airbnb data from CSV with ISO-8859-1 encoding
# def load_airbnb_data():
#     airbnb_data = pd.read_csv('../data/airbnb_data.csv', encoding='ISO-8859-1')
#     return airbnb_data
#
# # Load hotel data from CSV with ISO-8859-1 encoding
# def load_hotel_data():
#     hotel_data = pd.read_csv('../data/hotel_data.csv', encoding='ISO-8859-1')
#     return hotel_data

import pandas as pd
from sqlalchemy import create_engine

# Database connection string (for SQLite)
DATABASE_URL = 'sqlite:///../data/hotel.db'  # Replace with your database file path

# Create a database engine
engine = create_engine(DATABASE_URL)

# Load Airbnb data from SQL database
def load_airbnb_data():
    query = "SELECT * FROM airbnb_table"  # Replace with your actual table name
    airbnb_data = pd.read_sql(query, engine)
    return airbnb_data

# Load hotel data from SQL database
def load_hotel_data():
    query = "SELECT * FROM hotel_table"  # Replace with your actual table name
    hotel_data = pd.read_sql(query, engine)
    return hotel_data

