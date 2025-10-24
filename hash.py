from werkzeug.security import generate_password_hash

# --- Configuration ---
num_users = 50
sql_table_name = 'customer'
# The roles will cycle through this list
roles = ['Vip', 'Premium', 'Crown'] 

# --- Script ---
sql_values = []
print(f"Generating SQL for {num_users} users...")

for i in range(1, num_users + 1):
    # Generate user data
    username = f'user{i}'
    email = f'user{i}@example.com'
    raw_password = f'user{i}123'
    contact = f'09100000{i:02d}' # Formats the number with a leading zero if needed
    
    # Cycle through the roles list
    role = roles[(i - 1) % len(roles)]
    
    # Hash the password
    hashed_password = generate_password_hash(raw_password, method='pbkdf2:sha256')
    
    # Create the SQL VALUES string for this user
    # Note the escaped single quotes for SQL compatibility
    sql_values.append(
        f"('{username}', '{email}', '{hashed_password}', '{contact}', '{role}')"
    )

# Assemble the final, complete SQL statement
final_sql_statement = (
    f"INSERT INTO {sql_table_name} (username, email, password, contact, role) VALUES\n" +
    ",\n".join(sql_values) +
    ";"
)

# You can either print the result to the console or save it to a file
print("\n--- SQL SCRIPT ---")
print(final_sql_statement)

# To save to a file, uncomment the lines below
# with open('users.sql', 'w') as f:
#    f.write(final_sql_statement)
# print("\nSQL script saved to users.sql")