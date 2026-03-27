emails = ["marcin.kowalski@org", "roman.nowak@citi", "kondzio.bobek@com", "mario.kondino.gov"]

for email in emails:
    if "@" in email:
        username = email.split('@')[0].upper()
        password = f"{username}2024!"
        print(f"User: {username} | Pwd: {password}")
    else:
        print(f"Error: '{email}' is not a valid email address.")