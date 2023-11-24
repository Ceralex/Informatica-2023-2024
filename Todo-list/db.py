import sqlite3 as sq

# Create a connection to the database, create it if it doesn't exist
conn = sq.connect('data.db')

# Create a cursor
c = conn.cursor()

def init_db(c):
    # Create tables
    with open('db.sql', 'r') as f:
        sql = f.read()
        c.executescript(sql)

def populate_db(c):
    todo_items = [
        ("Complete the project report", 0),
        ("Call the dentist for an appointment", 0),
        ("Buy groceries", 0),
        ("Schedule car maintenance", 0),
        ("Plan weekend trip", 0),
        ("Read the new novel", 0),
        ("Prepare for the meeting on Monday", 0),
        ("Renew gym membership", 0),
        ("Pay electricity bill", 0),
        ("Organize the storage room", 0)
    ]

    # Inserting data into the todos table
    c.executemany('INSERT INTO todos (content, done) VALUES (?, ?)', todo_items)

# Initialize the database
init_db(c)

# Populate the database
populate_db(c)

# Commit the change
conn.commit()

# Close the connection
conn.close()