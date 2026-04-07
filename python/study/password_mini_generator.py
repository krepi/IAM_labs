#password generator
import random
from itertools import count
letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
symbols = ['!', '#', '$', '%', '&', '(', ')', '*', '+']
random_symbol_array =[letters, numbers, symbols]

if __name__ == "__main__":
    print("Welcome to the PyPassword Generator!")
    nr_letters = int(input("How many letters would you like in your password?\n"))
    nr_symbols = int(input(f"How many symbols would you like?\n"))
    nr_numbers = int(input(f"How many numbers would you like?\n"))
    symbols_sum= nr_letters + nr_symbols + nr_numbers
    
    password = ""
    for i in count():
        current_array = random.choice(random_symbol_array)
        if current_array == letters and nr_letters> 0:
            password += random.choice(letters)
            nr_letters -= 1
        elif current_array == symbols and nr_symbols> 0:
            password += random.choice(symbols)
            nr_symbols -= 1
        elif current_array == numbers and nr_numbers> 0:
            password += random.choice(numbers)
            nr_numbers -= 1

        if len(password) == symbols_sum:
            break

    print(f"Your password is: {password}")
    print(f"Length: {len(password)}")
# Another way
# password_list = []
# for char in range(0, nr_letters):
#     password_list.append(random.choice(letters))

# for char in range(0, nr_symbols):
#     password_list.append(random.choice(symbols))

# for char in range(0, nr_numbers):
#     password_list.append(random.choice(numbers))

# print(password_list)
# random.shuffle(password_list)
# print(password_list)

# password = ""
# for char in password_list:
#     password += char

# print(f"Your password is: {password}")

# --- SECURE IAM VERSION (Reference) ---
# Import 'secrets' instead of 'random' for Cryptographically Secure PRNG (CSPRNG)
import secrets
import string

def generate_secure_password(length=16):
    """
    Generates a secure password with at least one character from each group:
    lowercase, uppercase, digits, and symbols.
    """
    if length < 4:
        # Enforcing minimum length of 4 to satisfy all categories
        # Defaulting to 8 for better security if too short
        length = 8
    
    # Character sets from the 'string' module
    lowercase = string.ascii_lowercase
    uppercase = string.ascii_uppercase
    digits = string.digits
    symbols = string.punctuation
    
    # Guarantee at least one character from each group
    password_chars = [
        secrets.choice(lowercase),
        secrets.choice(uppercase),
        secrets.choice(digits),
        secrets.choice(symbols)
    ]
    
    # Fill the remaining length with random choices from all characters
    all_characters = lowercase + uppercase + digits + symbols
    password_chars += [secrets.choice(all_characters) for _ in range(length - 4)]
    
    # Use secrets.SystemRandom() for cryptographically secure shuffling
    # This ensures the guaranteed characters are not always in the same positions
    secrets.SystemRandom().shuffle(password_chars)
    
    return ''.join(password_chars)

# Example usage (commented out to not interfere with your script):
# print(f"Secure Password: {generate_secure_password()}")
# print("Remember: Length (Entropy) is more important than complexity alone!")