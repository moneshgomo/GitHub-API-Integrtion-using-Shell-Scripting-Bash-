# 🔍 GitHub Commit Fetcher (Bash Script)

A lightweight Bash automation script to fetch and list recent commits from any GitHub repository using the GitHub REST API.

This project demonstrates:
- 🔐 Secure use of GitHub API tokens (optional authentication)  
- 🧰 Practical Bash scripting with `curl` and `jq`  
- ⚙️ Simple error handling and input validation  

---

## 🚀 Features

✅ Fetch commits from any public GitHub repository  
✅ Optional authentication for higher rate limits and private repo access  
✅ Show **commit author**, **message**, **SHA**, and **date** in JSON format  
✅ Clean, formatted output using `jq`  
✅ Works on any Linux/Mac terminal with `bash`, `curl`, and `jq`  

---

## ⚙️ Setup

### 🧩 1️⃣ Prerequisites

Make sure you have these installed:

| Tool | Description | Install Command |
|------|-------------|-----------------|
| `bash` | Shell interpreter | (pre-installed on Linux/Mac) |
| `curl` | For API calls | `sudo apt install curl -y` or `brew install curl` |
| `jq` | For JSON formatting | `sudo apt install jq -y` or `brew install jq` |

---

### 🔑 2️⃣ Authentication (recommended): use a token — NOT your raw account password

For higher rate limits and private repository access, prefer a Personal Access Token (PAT). It's strongly recommended to avoid storing your GitHub account password in environment variables or files. If you must use credentials for a specific workflow, understand the risks and scope.

- Create a PAT: https://github.com/settings/profile  ( go to developer settings ) 
- Create the  token use ( PAT clasic ) 
- Save the token locally or export it as an environment variable (preferred)

Example: save in token.txt (do NOT commit this file)
```bash
echo "ghp_your_personal_access_token_here" > token.txt
```

Add token.txt to `.gitignore`.

---

## ▶️ Store credentials on your machine (do NOT store on GitHub)

Important: export credentials only on your local machine, CI environment, or a trusted secrets manager. Do NOT put tokens, passwords, or any secrets into your GitHub repository (including issues, PRs, or README files) or commit them to any public repo.

Example: export locally in your shell (preferred: token)  Just for learning export a personal access token on your machine

```bash
export GITHUB_TOKEN="ghp_your_personal_access_token_here"
export GITHUB_USERNAME="your_github_username"

```


Verify exported environment variables on your machine:
run : 
``` bash
print env
```
or 

Show a specific variable (be careful — this prints the secret)

```bash
echo $GITHUB_TOKEN
echo $GITHUB_USERNAME
```

---

## ▶️ Usage

Note: the script filename is List_Commits.sh

1. Make the script executable:
```bash
chmod +x List_Commits.sh
```

2. Run the script:
```bash
./List_Commits.sh <repo_owner> <repo_name>
```

Example:
```bash
./List_Commits.sh torvalds linux
```

3. Authentication behavior
- If `GITHUB_TOKEN` is exported on your machine, the script will prefer that.
- If `token.txt` exists in the same directory, the script will use it if no GITHUB_TOKEN is set.
- If your script supports username/password (not recommended), it can read $GITHUB_USERNAME and $GITHUB_PASSWORD — but prefer GITHUB_TOKEN.

Example: using exported token (preferred):
```bash
export GITHUB_TOKEN="ghp_..."
./List_Commits.sh owner repo
```

---

## 🧠 Sample Output

Running:
```bash
./List_Commits.sh torvalds linux
```

Produces JSON objects like:
```json
{
  "sha": "abcdef123456789...",
  "author": "Linus Torvalds",
  "message": "Merge branch 'for-linus'",
  "date": "2024-01-15T10:30:45Z",
  "url": "https://api.github.com/repos/torvalds/linux/commits/abcdef123..."
}
```

The output is formatted by `jq` for readability.


<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/f34a8f9c-5c78-4ac8-81e8-13b1459ecc95" />

---

## 📚 API Reference

Official GitHub REST API Documentation:  
https://docs.github.com/en/rest

---

## 👨‍💻 Author

Monesh (Gomo)  
Passionate about Development & DevOps   

