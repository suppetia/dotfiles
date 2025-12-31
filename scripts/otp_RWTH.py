# run with e.g.
# /home/chris/.venvs/automations/bin/python /home/chris/Documents/scripts/otp_RWTH.py

# import keyboard
import subprocess

p = subprocess.run(
    ["nitropy", "nk3", "secrets", "get-otp", "RWTH Aachen"],
    capture_output=True,
    encoding="utf8",
)
otp_pwd = p.stdout.split("\n")[-2]
# subprocess.run(["wl-copy", otp_pwd])
subprocess.run(["ydotool", "type", otp_pwd])
subprocess.run(["ydotool", "key", "enter"])

# keyboard.write(otp_pwd)
# keyboard.send("enter")
