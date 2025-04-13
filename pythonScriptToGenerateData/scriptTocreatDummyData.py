from faker import Faker
import random
from datetime import datetime, timedelta
import csv

fake = Faker()
Faker.seed(0)
random.seed(0)

# Helper to create timestamp values
def random_date(start_year=2020, end_year=2024):
    start = datetime(start_year, 1, 1)
    end = datetime(end_year, 12, 31)
    return fake.date_time_between(start_date=start, end_date=end).strftime('%Y-%m-%d %H:%M:%S')

# Table seeds
data = {}

# bookLanguage (10)
languages = ['English', 'Spanish', 'French', 'German', 'Italian', 'Chinese', 'Japanese', 'Russian', 'Arabic', 'Swahili']
data['bookLanguage'] = [(i+1, lang) for i, lang in enumerate(languages)]

# publisher (50)
data['publisher'] = [(i+1, fake.company()) for i in range(50)]

# author (50)
data['author'] = [(i+1, fake.first_name(), fake.last_name(), fake.text(max_nb_chars=150), random_date(), random_date()) for i in range(50)]

# country (50)
data['country'] = [(i+1, fake.country()) for i in range(50)]

# addressStatus (4)
statuses = ['Billing', 'Shipping', 'Primary', 'Secondary']
data['addressStatus'] = [(i+1, status) for i, status in enumerate(statuses)]

# shippingMethod (10)
data['shippingMethod'] = [(i+1, fake.word().capitalize() + ' Shipping', round(random.uniform(5, 50), 2), random_date(), random_date()) for i in range(10)]

# orderStatus (5)
order_statuses = ['Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled']
data['orderStatus'] = [(i+1, status) for i, status in enumerate(order_statuses)]

# book (50)
data['book'] = []
for i in range(50):
    data['book'].append((
        i+1,
        fake.sentence(nb_words=4).rstrip('.'),
        fake.isbn13(),
        round(random.uniform(10, 200), 2),
        fake.text(max_nb_chars=200),
        fake.date_between(start_date='-3y', end_date='today').strftime('%Y-%m-%d'),
        random.randint(1, 50),  # publisherID
        random.randint(1, 10),  # languageID
        random_date(),
        random_date()
    ))

# bookAuthor (50)
data['bookAuthor'] = [(random.randint(1, 50), random.randint(1, 50)) for _ in range(50)]

# customer (50)
data['customer'] = [(i+1, fake.first_name(), fake.last_name(), fake.unique.email(), fake.phone_number(), random_date(), random_date()) for i in range(50)]

# address (50)
data['address'] = [(i+1, fake.street_address(), fake.city(), fake.postcode(), random.randint(1, 50)) for i in range(50)]

# customerAddress (50)
data['customerAddress'] = [(random.randint(1, 50), random.randint(1, 50), random.randint(1, 4)) for _ in range(50)]

# customerOrder (50)
data['customerOrder'] = [(i+1, random_date(), random.randint(1, 50), random.randint(1, 5), random.randint(1, 10), random_date(), random_date()) for i in range(50)]

# orderLine (50)
data['orderLine'] = [(random.randint(1, 50), random.randint(1, 50), random.randint(1, 5), round(random.uniform(10, 200), 2), random_date(), random_date()) for _ in range(50)]

# orderHistory (50)
data['orderHistory'] = [(i+1, random.randint(1, 50), random.randint(1, 5), random_date()) for i in range(50)]

# Generate SQL INSERT statements
sql_lines = []
for table, rows in data.items():
    for row in rows:
        values = ', '.join([f"'{str(v)}'" if isinstance(v, str) else str(v) for v in row])
        sql_lines.append(f"INSERT INTO {table} VALUES ({values});")

# Save to .sql file
sql_file_path = "D:\Project\BookStoreDb\insertData.sql"
with open(sql_file_path, 'w', encoding='utf-8') as f:
    f.write('\n'.join(sql_lines))