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


new_user = User(name, surname, department)
print(new_user.get_usermail())

