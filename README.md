# project3-data-engineering

# Airbnb vs. Hotels Analysis

## Project Overview

This project aims to analyze and visualize the differences between Airbnb listings and hotel accommodations. We will explore various metrics, including pricing, availability, and ratings, to understand which option provides better value for travelers.

## Project Structure

/airbnb_vs_hotels

│

├── /data

│   ├── airbnb_data.csv

│   ├── hotel_data.csv

│

├── /notebooks

│   ├── data_cleaning.ipynb

│   ├── data_visualization.ipynb

│

├── /src

│   ├── app.py             # Main Flask application

│   ├── database.py        # Database setup and interactions

│   └── utils.py           # Utility functions

│   ├── /templates

│     ├── index.html         # Main HTML template

│     └── visualization.html  # Visualization template

├── README.md              # Project documentation

└── requirements.txt       # List of required packages



## Data Sources

- **Airbnb Data**: Data for Airbnb listings, including attributes like price, location, and ratings.
- **Hotel Data**: Data for hotel accommodations with similar attributes for comparison.

## Getting Started

### Prerequisites

Ensure you have Python 3.x installed. You will also need to install the required packages listed in `requirements.txt`.

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/sescajeda/airbnb_vs_hotels.git
   cd airbnb_vs_hotels

2. Create a virtual environment (optional but recommended):
   python -m venv venv
source venv/bin/activate  # On Windows use `venv\Scripts\activate`

3. Install the required packages:
   pip install -r requirements.txt

### Running the Application
Start the Flask application:
python src/app.py
Open your web browser and go to http://127.0.0.1:5000/ to view the main page.

### Jupyter Notebooks
data_cleaning.ipynb: This notebook is used for cleaning and preprocessing the Airbnb and hotel data. It handles missing values, standardizes column names, and saves the cleaned datasets.

data_visualization.ipynb: This notebook contains visualizations comparing key metrics between Airbnb listings and hotels, helping to identify trends and insights.

### Contributing
Contributions are welcome! Please feel free to submit a pull request or open an issue to discuss improvements or features.

### License
This project is licensed under the MIT License - see the LICENSE file for details.

### Acknowledgments
Pandas Documentation
Flask Documentation

### Key Sections:
- **Project Overview**: Brief description of the project's purpose.
- **Project Structure**: Directory layout with explanations of the contents.
- **Data Sources**: Explanation of the datasets used.
- **Getting Started**: Instructions for installing dependencies and running the application.
- **Jupyter Notebooks**: Overview of the notebooks and their purposes.
- **Contributing**: Invitation for contributions to the project.
- **License**: Information about the project's license.
- **Acknowledgments**: Links to relevant documentation.

