# Show all available databases
SHOW DATABASES;
# Give permission on specific table to specific user on specific host
GRANT ALL PRIVILEGES ON *.* TO 'db_user'@'localhost' IDENTIFIED BY 'P@s$w0rd123!';
# Create new user with particular password
CREATE USER 'api-user' IDENTIFIED BY 'api-password'
