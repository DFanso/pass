import random
import sys

def show_help():
    print("Usage: pass.exe [OPTIONS]")
    print("Generate random passwords")
    print("Options:")
    print("  -l NUMBER    Set password length (default: 12)")
    print("  -c NUMBER    Number of passwords to generate (default: 1)")
    print("  -ns          Don't include special characters")
    print("  -nn          Don't include numbers")
    print("  -nu          Don't include uppercase letters")
    print("  -nl          Don't include lowercase letters")
    print("  -h           Display this help and exit")
    sys.exit(0)

length = 12
count = 1
special_chars = True
numbers = True
uppercase = True
lowercase = True

args = sys.argv[1:]
while args:
    arg = args.pop(0)
    if arg in ("-l", "--length"):
        length = int(args.pop(0))
    elif arg in ("-c", "--count"):
        count = int(args.pop(0))
    elif arg in ("-ns", "--no-special"):
        special_chars = False
    elif arg in ("-nn", "--no-numbers"):
        numbers = False
    elif arg in ("-nu", "--no-uppercase"):
        uppercase = False
    elif arg in ("-nl", "--no-lowercase"):
        lowercase = False
    elif arg in ("-h", "--help"):
        show_help()
    else:
        print(f"Unknown option: {arg}")
        show_help()

if not (special_chars or numbers or uppercase or lowercase):
    print("Error: At least one character type must be enabled.")
    sys.exit(1)

chars = ""
if lowercase:
    chars += "abcdefghijklmnopqrstuvwxyz"
if uppercase:
    chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
if numbers:
    chars += "0123456789"
if special_chars:
    chars += "!@#$%^&*()-_=+[]{};:,.<>/?"

for i in range(1, count + 1):
    password = "".join(random.choice(chars) for _ in range(length))
    print(f"Password {i}: {password}")