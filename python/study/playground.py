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

    def password_creator(self):
        password = input("Enter your password: ")
        confirmed_password = input("Confirm your password: ")
        if password == confirmed_password:
            if len(password) < 8:
                print("Password is too short")
                return self.password_creator()
            else:
                return password
        else:
            print("Passwords do not match")
            return self.password_creator()
    
    def acces_level(self):
        if self.department == "IT":
            return f"Access Granted for {self.get_usermail()} as Admin and now create your password{self.password_creator()}"
        else:
            return f"Access Granted for {self.get_usermail()} as User"


new_user = User(name, surname, department)
print(new_user.get_usermail())
print(new_user.acces_level())

