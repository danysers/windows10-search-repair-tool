# Contributing to Windows 10 Search Repair Tool

Thank you for your interest in contributing to this project! This document provides guidelines for contributing to the Windows 10 Search Repair Tool.

## 🤝 How to Contribute

### Reporting Issues
- Use the [issue tracker](https://github.com/danysers/windows10-search-repair-tool/issues) to report bugs
- Check if the issue has already been reported
- Provide detailed information about:
  - Windows 10 version
  - Python version
  - Error messages (if any)
  - Steps to reproduce the issue

### Suggesting Enhancements
- Open an issue to discuss new features before implementing them
- Explain the use case and benefit of the enhancement
- Consider backward compatibility

### Code Contributions

#### Prerequisites
- Python 3.6 or higher
- Basic understanding of Windows system commands
- Familiarity with Git and GitHub

#### Setup Development Environment
1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/your-username/windows10-search-repair-tool.git
   cd windows10-search-repair-tool
   ```
3. Create a virtual environment (optional but recommended):
   ```bash
   python -m venv venv
   venv\Scripts\activate  # On Windows
   ```

#### Making Changes
1. Create a new branch for your feature/fix:
   ```bash
   git checkout -b feature/your-feature-name
   ```
2. Make your changes following the coding standards below
3. Test your changes thoroughly
4. Commit with a clear message:
   ```bash
   git commit -m "Add: Brief description of your changes"
   ```
5. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```
6. Create a Pull Request

## 🎯 Coding Standards

### Python Code Style
- Follow PEP 8 style guidelines
- Use descriptive variable and function names
- Add docstrings for all functions
- Keep functions focused and small
- Use type hints where appropriate

### Comments
- Write clear, concise comments
- Explain the "why" not just the "what"
- Keep comments up to date with code changes
- Use English for all comments and documentation

### Batch File Guidelines
- Use clear, descriptive echo messages
- Include error handling for common scenarios
- Test on different Windows 10 versions
- Keep compatibility with older systems where possible

## ✅ Testing Guidelines

Before submitting any changes:

1. **Test the Python script directly:**
   ```bash
   python arreglar_buscador_windows.py
   ```

2. **Test the batch launcher:**
   - Double-click `Arreglar_Buscador.bat`
   - Test with and without Python in PATH

3. **Test edge cases:**
   - Run without administrator privileges
   - Test on systems with restricted permissions
   - Verify behavior when processes don't exist

4. **Manual verification:**
   - Ensure all commands execute properly
   - Verify Windows search functionality after running
   - Test error handling paths

## 📝 Documentation

When making changes:
- Update README.md if functionality changes
- Add inline comments for complex logic
- Update any relevant documentation
- Ensure examples remain accurate

## 🚫 What Not to Include

Please avoid:
- Adding external dependencies unless absolutely necessary
- Making the tool platform-specific beyond Windows 10
- Adding features that require installation of additional software
- Including personal information or credentials in code

## 📋 Pull Request Guidelines

### Before Submitting
- [ ] Code follows the project style guidelines
- [ ] Changes have been tested on Windows 10
- [ ] Documentation has been updated if needed
- [ ] Commit messages are clear and descriptive
- [ ] No unnecessary files are included

### PR Description Template
```markdown
## Description
Brief description of what this PR does

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Code refactoring

## Testing
Describe how you tested these changes

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] Tests pass
```

## 🆘 Getting Help

If you need help with contributing:
- Open a discussion in the [Discussions](https://github.com/danysers/windows10-search-repair-tool/discussions) section
- Review existing issues and pull requests
- Contact the maintainer through GitHub

## 📄 License

By contributing to this project, you agree that your contributions will be licensed under the MIT License.

---

Thank you for helping make this tool better! 🙏