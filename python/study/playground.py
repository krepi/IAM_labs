import string
name = input("What is your name? ")
surname = input("What is your surname? ")
department = input("What is your department? ")

class User:
    def __init__(self, name, surname, department):
        self.name = name
        self.surname = surname
        self.department = department

    def get_usermail(self):
        domain = "it.com" if self.department == "IT" else "company.com"
        return f"{self.name}.{self.surname}@{domain}".lower()

 
    
    def password_checker(self,password):
        lowercase = string.ascii_lowercase
        uppercase = string.ascii_uppercase
        digits = string.digits
        symbols = string.punctuation
        isValid = False
        hasUpper = any(char in uppercase for char in password)
        hasLower = any(char in lowercase for char in password)
        hasNumber = any(char in digits for char in password)
        hasSymbol = any(char in symbols for char in password)
        
        
        if not hasUpper: print("-> Missing uppercase letter")
        if not hasLower: print("-> Missing lowercase letter")
        if not hasNumber: print("-> Missing digit")
        if not hasSymbol: print("-> Missing symbol")
        
        isValid = all([hasUpper,hasLower,hasSymbol,hasNumber])
        return isValid
        
        
        
        return isValid
    
    def password_creator(self):
        while True:
            password = input("Enter your password: ")
            confirmed_password = input("Confirm your password: ")
            if password == confirmed_password:
                if len(password) < 8:
                    print("Password is too short")
                elif not self.password_checker(password):
                    print("Password has no specific digits")
                else:
                    return password
            else:
                print("Passwords do not match")

    def access_level(self):
        if self.department == "IT":
            self.password_creator()
            return f"Access Granted for {self.get_usermail()} as Admin. Password set successfully."
        else:
            return f"Access Granted for {self.get_usermail()} as User"


new_user = User(name, surname, department)
print(new_user.get_usermail())
print(new_user.access_level())

