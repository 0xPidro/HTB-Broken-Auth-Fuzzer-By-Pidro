# HTB Broken Auth Brute-Forcer

A custom Bash wrapper for `ffuf` designed to perform nested brute-forcing (User Enumeration + Password Fuzzing) for the HackTheBox Broken Authentication module.

## 🚀 Features
- **User Iteration:** Reads a list of usernames and runs a full password spray against each.
- **Optimized Headers:** Includes realistic browser headers to mimic legitimate traffic.
- **Smart Filtering:** Uses `-mc 300-400` to catch successful redirects (common in successful logins).
- **Graceful Exit:** Handles `Ctrl+C` properly without leaving ghost processes.

## 🛠️ Prerequisites
- [ffuf](https://github.com/ffuf/ffuf) installed and in your `$PATH`.
- A valid `PHPSESSID` cookie from the target lab.

## 📖 Usage
1. Make the script executable, then run the script by providing a user list and a password list:
   ```bash
   $ chmod +x htb_broken_auth.sh
   $ ./htb_broken_auth.sh users.txt passwords.txt
