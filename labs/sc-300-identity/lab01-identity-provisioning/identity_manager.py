from importlib.machinery import all_suffixes
import string
import re

# Collect user information
name = input("What is your name? ")
surname = input("What is your surname? ")
department = input("What is your department? ")
mocked_existing_db = ["JKOW00001", "ANOW00001", "JKOW00002", "MMSZ00001"]

class User:
    """
    Represents a system identity.
    Handles identity attributes and basic authorization logic (Attribute-Based Access Control - ABAC).
    """
    def __init__(self, name, surname, department):
        self.name = name
        self.surname = surname
        self.department = department

    def get_usermail(self):
        """Generates a company email based on the department attribute."""
        domain = "it.com" if self.department == "IT" else "company.com"
        return f"{self.name}.{self.surname}@{domain}".lower()

    def access_level(self, authenticator):
        """
        Determines access level based on identity attributes (ABAC).
        Admin access for IT department triggers a password setup flow.
        """
        if self.department == "IT":
            # Direct the user to the authenticator for security setup
            authenticator.password_creator()
            return f"Access Granted for {self.get_usermail()} as Admin. Security profile initialized."
        else:
            return f"Access Granted for {self.get_usermail()} as User"
    
    def generate_id(self, db):
        """
        Generates a unique system ID based on user's name and surname.
        Format: First letter of name + first 3 letters of surname (padded with 'X') + 5-digit sequence.
        Example: 'John', 'Doe' -> 'JDOEX00001'.
        """
        # Ensure the surname part has exactly 3 characters by padding with 'X'
        surname_part = self.surname[:3].upper().ljust(3, 'X')
        
        # Ensure name part is always treated safely (extracting the first letter)
        name_part = self.name[0].upper() if self.name else 'X'
        
        prefix = f"{name_part}{surname_part}"
        highest_suffix = 0

        for user_id in db:            
            # Check if existing ID matches the current prefix
            if user_id[:4].upper() == prefix:
                try:
                    # Extract the numeric suffix (from 5th character onwards)
                    current_suffix = int(user_id[4:])
                    if current_suffix > highest_suffix:
                        highest_suffix = current_suffix
                except ValueError:
                    # Silently ignore DB entries that have an invalid format
                    continue
                    
        # Increment the sequence and pad it with leading zeros up to 5 digits length
        suffix = str(highest_suffix + 1).zfill(5)
        
        return f"{prefix}{suffix}"

class Authenticator:
    """
    Handles security validation and authentication mechanisms.
    Separated from User class to follow the Single Responsibility Principle (SRP).
    """
    
    def _validate_password(self, password):
        """
        Validates password complexity using Regular Expressions.
        Checks for: 8+ chars, uppercase, lowercase, digit, and special character.
        """
        if len(password) < 8:
            print("-> Security Alert: Password is too short (min. 8 characters)")
            return False
            
        # Regex to check all complexity requirements in one pass
        # (?=.*[A-Z]) -> Uppercase check
        # (?=.*[a-z]) -> Lowercase check
        # (?=.*\d)    -> Digit check
        # (?=.*[#!$%&()*+]) -> Symbol check
        pattern = r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!#\$%&()*+]).+$"
        
        if not re.match(pattern, password):
            print("-> Security Alert: Password must contain uppercase, lowercase, digit, and special symbol.")
            return False
        
        return True

    def password_creator(self):
        """Interactive loop to set and verify a new password."""
        while True:
            # Note: In production, use 'getpass' module to hide input
            password = input("Enter your new secure password: ")
            confirmed_password = input("Confirm your password: ")
            
            if password != confirmed_password:
                print("-> Error: Passwords do not match. Please try again.")
                continue
                
            if self._validate_password(password):
                print("-> Success: Password meets complexity standards.")
                return password

# Bootstrap the identity and security modules
new_user = User(name, surname, department)
new_authenticator = Authenticator()

# Demonstrate identity and access flow
print("-" * 30)
print(f"Identity Verified: {new_user.get_usermail()}")
print(new_user.access_level(new_authenticator))
print("-" * 30)
print(new_user.generate_id(mocked_existing_db))
