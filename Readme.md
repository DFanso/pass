# lazy pass

- pip install pyinstaller

- /c/Users/leoga/AppData/Roaming/Python/Python313/Scripts/pyinstaller.exe -F pass.py

- mv dist/pass.exe .

```powershell
PS C:\Users\leoga> pass -h
Usage: pass.exe [OPTIONS]
Generate random passwords
Options:
  -l NUMBER    Set password length (default: 12)
  -c NUMBER    Number of passwords to generate (default: 1)
  -ns          Don't include special characters
  -nn          Don't include numbers
  -nu          Don't include uppercase letters
  -nl          Don't include lowercase letters
  -h           Display this help and exit
```