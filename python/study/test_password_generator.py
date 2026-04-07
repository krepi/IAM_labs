import string
import secrets
import sys
from password_mini_generator import generate_secure_password

def verify_password(password):
    """
    Checks if a password contains at least one of each:
    lowercase, uppercase, digits, and symbols.
    """
    has_lower = any(c in string.ascii_lowercase for c in password)
    has_upper = any(c in string.ascii_uppercase for c in password)
    has_digit = any(c in string.digits for c in password)
    has_symbol = any(c in string.punctuation for c in password)
    
    return has_lower and has_upper and has_digit and has_symbol

def run_tests(iterations=1000):
    print(f"Testing generate_secure_password with {iterations} iterations...")
    success_count = 0
    for i in range(iterations):
        pwd = generate_secure_password(length=secrets.randbelow(13) + 4) # Test lengths 4 to 16
        if verify_password(pwd):
            success_count += 1
        else:
            print(f"Failed at iteration {i}: {pwd}")
    
    print(f"Success rate: {success_count}/{iterations} ({(success_count/iterations)*100:.1f}%)")
    
    if success_count == iterations:
        print("All tests passed! Character diversity guaranteed.")
    else:
        print("Tests failed.")
        sys.exit(1)

if __name__ == "__main__":
    run_tests()
