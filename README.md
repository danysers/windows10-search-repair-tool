# 🔍 Windows 10 Search Repair Tool

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.6+](https://img.shields.io/badge/python-3.6+-blue.svg)](https://www.python.org/downloads/)
[![Windows 10](https://img.shields.io/badge/platform-Windows%2010-blue.svg)](https://www.microsoft.com/en-us/windows)

A lightweight utility to fix common Windows 10 issues where:
- 🚫 The Start Menu search does not respond
- ⌨️ You cannot type in the Start Menu or File Explorer
- 🔒 Search appears frozen or broken

This tool automates a set of safe and well-known repair steps that usually restore the Windows search functionality without reinstalling the system.

---

## 🚀 What does this tool do?

The script executes the following actions automatically:

- 🏪 Opens Microsoft Store to allow reinstallation of search-related components
- 🔄 Restarts `ctfmon.exe` (Text Input Services)
- 🗂️ Restarts `explorer.exe` (Windows Explorer)
- 🧹 Cleans stuck processes related to input and UI

All actions are executed sequentially with real-time status feedback.

---

## 🧰 Actions executed

```powershell
# Refresh search components via Microsoft Store
Start-Process "ms-windows-store://pdp/?productid=9nblggh4tlx0"

# Restart Text Input Services
taskkill /f /im ctfmon.exe
start ctfmon.exe

# Restart Windows Explorer
taskkill /f /im explorer.exe
start explorer.exe
```

These steps are commonly recommended by Microsoft support and Windows power users.

---

## 📋 Requirements

- 🪟 **Windows 10** (any version)
- 🐍 **Python 3.6+** ([Download here](https://www.python.org/downloads/))
- 👑 **Administrator privileges** (recommended for best results)

---

## ▶️ How to use

### Method 1: Easy Launch (Recommended)
1. **Clone the repository:**
   ```bash
   git clone https://github.com/danysers/windows10-search-repair-tool.git
   cd windows10-search-repair-tool
   ```

2. **Choose your preferred method:**
   - **🎯 Batch Launcher:** Double-click `Arreglar_Buscador.bat`
   - **⚡ PowerShell Script:** Right-click `windows-search-repair.ps1` → "Run with PowerShell"
   - **🐍 Python Direct:** Run `python arreglar_buscador_windows.py`

### Method 2: PowerShell Script (No Python Required)
1. **Open PowerShell as Administrator**
2. **Navigate to the tool directory:**
   ```powershell
   cd "C:\path\to\windows10-search-repair-tool"
   ```
3. **Run the PowerShell script:**
   ```powershell
   .\windows-search-repair.ps1
   ```
   
   **Optional parameters:**
   ```powershell
   # Run silently without prompts
   .\windows-search-repair.ps1 -Silent -NoPrompt
   
   # Run with prompts but minimal output
   .\windows-search-repair.ps1 -NoPrompt
   ```

### Method 3: Direct Python Execution
1. **Open Command Prompt or PowerShell**
2. **Navigate to the tool directory:**
   ```bash
   cd path\to\windows10-search-repair-tool
   ```
3. **Run the Python script:**
   ```bash
   python arreglar_buscador_windows.py
   ```

### Method 4: Manual Commands
If you prefer to run commands manually, open **PowerShell as Administrator** and execute:

```powershell
# Step 1: Refresh search components
Start-Process "ms-windows-store://pdp/?productid=9nblggh4tlx0"

# Step 2: Restart text input services
taskkill /f /im ctfmon.exe
start ctfmon.exe

# Step 3: Restart Windows Explorer
taskkill /f /im explorer.exe
start explorer.exe
```

---

## 🔧 Troubleshooting

### ❌ Search still not working?
1. **Restart your computer** after running the tool
2. **Run the tool as Administrator** (right-click → "Run as administrator")
3. **Check Windows Updates** - install any pending updates
4. **Run Windows Search Troubleshooter:**
   - Go to Settings → Update & Security → Troubleshoot
   - Select "Search and Indexing" troubleshooter

### 🐍 Python not found?
- **Download Python:** Visit [python.org](https://www.python.org/downloads/)
- **During installation:** Make sure to check "Add Python to PATH"
- **Alternative:** Use the manual PowerShell commands instead

### 🛡️ Permission issues?
- **Run as Administrator:** Right-click on `Arreglar_Buscador.bat` and select "Run as administrator"
- **User Account Control (UAC):** Click "Yes" when prompted

---

## 📁 File Structure

```
windows10-search-repair-tool/
├── 📄 README.md                    # This documentation
├── 🐍 arreglar_buscador_windows.py # Main Python repair script
├── 🔧 Arreglar_Buscador.bat        # Windows batch launcher
├── ⚡ windows-search-repair.ps1     # PowerShell script (no Python needed)
├── 📜 LICENSE                      # MIT License
├── 🤝 CONTRIBUTING.md              # Contribution guidelines
├── 🚫 .gitignore                   # Git ignore file
└── 📁 .github/                     # GitHub configuration
    ├── 📁 workflows/               # GitHub Actions
    └── 📁 ISSUE_TEMPLATE/          # Issue templates
```

---

## ⚠️ Safety Information

✅ **This tool is completely safe to use:**
- Uses only standard Windows commands
- No system files are modified
- No registry changes are made
- All actions can be reversed by restarting Windows

⚠️ **Important notes:**
- The tool will temporarily close Windows Explorer (your desktop will disappear for a few seconds)
- This is normal behavior and Explorer will restart automatically
- Save any open work before running the tool

---

## 🤝 Contributing

Contributions are welcome! If you have suggestions for improvements or encounter issues:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add some amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Support

If this tool helped you fix your Windows 10 search issue, consider:
- ⭐ **Starring** this repository
- 🐛 **Reporting** any bugs you encounter
- 💡 **Suggesting** new features or improvements

---

## 📞 Contact

Created by **@danysers**

- 📧 **Issues:** [Report a problem](https://github.com/danysers/windows10-search-repair-tool/issues)
- 💬 **Discussions:** [Join the conversation](https://github.com/danysers/windows10-search-repair-tool/discussions)

---

<div align="center">
  <sub>Built with ❤️ for the Windows community</sub>
</div>