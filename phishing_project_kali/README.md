# Project 03: Phishing Email Analysis (Kali Linux Lab Kit)

## Directory Structure
```text
phishing_project_kali/
├── emails/                             # 5 raw .eml specimens (3 phishing, 2 safe) + defanged attachment
│   ├── sample01_phishing_sbi.eml
│   ├── sample02_phishing_m365.eml
│   ├── sample03_phishing_dhl.eml
│   ├── sample04_safe_github.eml
│   ├── sample05_safe_interncircle.eml
│   └── Delivery_Invoice_8842.pdf.html
├── scripts/
│   └── analyze_emails.sh               # Automated Kali static header, defanged URL & SHA-256 script
├── report/
│   └── project_03_report.md            # Complete project report, checklist, SOP & 1-page guide
├── screenshots/                        # Place your annotated screenshots here
└── README.md                           # Quick-start instructions for Kali Linux
```

## How to Run in Kali Linux
1. Unzip the archive and navigate into the project directory:
   ```bash
   unzip phishing_project_kali.zip
   cd phishing_project_kali/scripts
   ```
2. Run the static forensic triage script:
   ```bash
   chmod +x analyze_emails.sh
   ./analyze_emails.sh
   ```
3. Review the generated forensic log in `../report/cli_forensics_output.txt`.
4. Open `../report/project_03_report.md`, fill in your name/ID, attach your annotated screenshots, and export to PDF:
   ```bash
   libreoffice --headless --convert-to pdf ../report/project_03_report.md --outdir ../report/
   ```
