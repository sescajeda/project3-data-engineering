from flask import Flask, render_template
import os
from database import load_airbnb_data, load_hotel_data
from utils import generate_visualizations

app = Flask(__name__)

# Directory to save the visualizations
VISUALIZATIONS_DIR = os.path.join('static', 'visualizations')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/visualization')
def visualization():
    try:
        # Load data
        airbnb_data = load_airbnb_data()
        hotel_data = load_hotel_data()

        # Generate visualizations
        generate_visualizations(airbnb_data, hotel_data, VISUALIZATIONS_DIR)

        # Render visualization page
        return render_template('visualization.html')

    except Exception as e:
        return f"Error generating visualizations: {str(e)}", 500

if __name__ == '__main__':
    app.run(debug=True)
