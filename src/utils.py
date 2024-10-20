import seaborn as sns
import matplotlib.pyplot as plt
import os
import pandas as pd


def generate_visualizations(airbnb_data, hotel_data, output_dir):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Convert Airbnb price to numeric
    airbnb_data['price'] = pd.to_numeric(airbnb_data['price'], errors='coerce')
    airbnb_data.dropna(subset=['price'], inplace=True)

    # Calculate average price for Hotels
    hotel_data['price'] = (hotel_data['high_rate'] + hotel_data['low_rate']) / 2
    hotel_data.dropna(subset=['price'], inplace=True)

    # Create price distribution histogram
    plt.figure(figsize=(10, 6))
    sns.histplot(airbnb_data['price'], label='Airbnb', color='green', kde=True, stat='density')
    sns.histplot(hotel_data['price'], label='Hotels', color='blue', kde=True, stat='density')
    plt.title('Price Distribution: Airbnb vs Hotels')
    plt.xlabel('Price (USD)')
    plt.ylabel('Density')
    plt.legend()
    plt.savefig(os.path.join(output_dir, 'price_distribution_airbnb_vs_hotels.png'))
    plt.close()

    # Create price comparison boxplot
    plt.figure(figsize=(8, 6))
    data_to_plot = [airbnb_data['price'], hotel_data['price']]
    plt.boxplot(data_to_plot, labels=['Airbnb', 'Hotels'])
    plt.title('Price Comparison: Airbnb vs Hotels')
    plt.ylabel('Price (USD)')
    plt.savefig(os.path.join(output_dir, 'boxplot_airbnb_vs_hotels.png'))
    plt.close()

    # Create average price comparison bar chart
    average_prices = {
        'Airbnb': airbnb_data['price'].mean(),
        'Hotels': hotel_data['price'].mean(),
    }

    plt.figure(figsize=(8, 5))
    plt.bar(average_prices.keys(), average_prices.values(), color=['orange', 'blue'])
    plt.title('Average Price Comparison')
    plt.ylabel('Average Price (USD)')
    plt.ylim(0, max(average_prices.values()) + 50)  # Set y-axis limit for better visibility
    plt.grid(axis='y')

    # Save the average price comparison figure
    plt.savefig(os.path.join(output_dir, 'average_price_comparison.png'))
    plt.close()
