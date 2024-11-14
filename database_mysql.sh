Create a Database and Table:
You might first set up a table to work with. You can execute this part in your terminal or through a separate shell script.

CopyReplit
CREATE DATABASE my_database;
USE my_database;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);
Shell Script Example:

Below is a simple shell script to interact with a MySQL database.

CopyReplit
#!/bin/bash

# MySQL credentials
DB_USER="myuser"
DB_PASS="mypassword"
DB_NAME="my_database"

# Create a new user entry
create_user() {
    name="$1"
    email="$2"

    mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "INSERT INTO users (name, email) VALUES ('$name', '$email');"
}

# Query all users
list_users() {
    mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SELECT * FROM users;"
}

# Main script execution
case "$1" in
    create)
        create_user "$2" "$3"
        ;;
    list)
        list_users
        ;;
    *)
        echo "Usage: $0 {create <name> <email>|list}"
        exit 1
        ;;
esac
Running the MySQL Example Script
Save the script to a file named mysql_script.sh.

Make it executable:

CopyReplit
chmod +x mysql_script.sh
Create a user:

CopyReplit
./mysql_script.sh create "Alice" "alice@example.com"
List users:

CopyReplit
./mysql_script.sh list
Working with PostgreSQL
Example: PostgreSQL Database Interaction
Create a Database and Table:
You can set up a similar database in PostgreSQL.

CopyReplit
CREATE DATABASE my_database;
\c my_database;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);
Shell Script Example:

Below is a shell script to interact with a PostgreSQL database.

CopyReplit
#!/bin/bash

# PostgreSQL credentials
DB_USER="myuser"
DB_PASS="mypassword"
DB_NAME="my_database"

# Export PGPASSWORD to avoid password prompt
export PGPASSWORD="$DB_PASS"

# Create a new user entry
create_user() {
    name="$1"
    email="$2"

    psql -U "$DB_USER" -d "$DB_NAME" -c "INSERT INTO users (name, email) VALUES ('$name', '$email');"
}

# Query all users
list_users() {
    psql -U "$DB_USER" -d "$DB_NAME" -c "SELECT * FROM users;"
}

# Main script execution
case "$1" in
    create)
        create_user "$2" "$3"
        ;;
    list)
        list_users
        ;;
    *)
        echo "Usage: $0 {create <name> <email>|list}"
        exit 1
        ;;
esac
Running the PostgreSQL Example Script
Save the script to a file named postgres_script.sh.

Make it executable:

CopyReplit
chmod +x postgres_script.sh
