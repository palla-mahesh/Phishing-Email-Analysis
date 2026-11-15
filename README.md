# Phishing-Email-Analysis

Here is the complete, professional `README.md` file formatted specifically for your GitHub repository or documentation folder. It provides clear instructions on how to set up, explore, and run the phishing email analysis project in Kali Linux.

---

```markdown
# Project 03: Phishing Email Analysis (Kali Linux SOC Investigation Edition)

[![Cybersecurity Track](https://img.shields.io/badge/Track-Cybersecurity-blue.svg)](https://interncircle.in)
[![Environment](https://img.shields.io/badge/Environment-Kali%20Linux-orange.svg)](https://www.kali.org)
[![Status](https://img.shields.io/badge/Status-Complete-success.svg)]()

A hands-on Security Operations Center (SOC) investigation project focused on static email forensics, threat intelligence triage, and safety awareness documentation conducted in an isolated Kali Linux environment.

---

## 📂 Repository Structure

```text
phishing_project_kali/
├── emails/                             # 5 sample .eml specimens (3 phishing, 2 genuine) + defanged attachment
│   ├── sample01_phishing_sbi.eml       # SBI Bank KYC suspension lure
│   ├── sample02_phishing_m365.eml      # Microsoft 365 homoglyph typosquatting
│   ├── sample03_phishing_dhl.eml       # DHL courier customs fee & double extension
│   ├── sample04_safe_github.eml        # Verified GitHub SSH key addition alert
│   ├── sample05_safe_interncircle.eml  # Verified platform notification
│   └── Delivery_Invoice_8842.pdf.html  # Mock defanged attachment for hashing
├── scripts/
│   └── analyze_emails.sh               # Automated Kali static header, defanged URL & SHA-256 script
├── report/
│   ├── project_03_report.md            # Comprehensive project report, checklist, SOP & 1-page guide
│   └── cli_forensics_output.txt        # Generated automated triage log output
├── screenshots/                        # Folder for your annotated evidence screenshots
└── README.md                           # Project documentation and quick-start guide

```

---

## 🛠️ Prerequisites & Tools Used

* **Operating System:** Kali Linux (Rolling / Latest)
* **CLI Utilities:** `whois`, `dig`, `file`, `sha256sum`, `grep`, `sed`
* **Documentation Tool:** LibreOffice Writer / Markdown to PDF compiler

---

## 🚀 How to Run in Kali Linux

Follow these steps to execute the automated forensic analysis and compile your report:

1. **Clone or Extract the Project:**
```bash
unzip phishing_project_kali.zip
cd phishing_project_kali/scripts

```


2. **Run the Automated Forensic Triage Script:**
Make the shell script executable and run it to parse email headers, extract defanged URLs (`hxxp://`), and compute attachment hashes:
```bash
chmod +x analyze_emails.sh
./analyze_emails.sh

```


3. **Inspect the Generated Triage Log:**
Review the automated output saved in the report directory:
```bash
cat ../report/cli_forensics_output.txt

```


4. **Export Your Completed Report to PDF:**
Open `report/project_03_report.md`, insert your details and annotated screenshots, then compile it into a PDF for submission:
```bash
libreoffice --headless --convert-to pdf ../report/project_03_report.md --outdir ../report/

```



---

## 📋 Key Deliverables Included

1. **Five Fully Analyzed Specimen Reports:** Detailed header metadata, CLI reconnaissance findings, and warning sign breakdowns for 3 phishing and 2 genuine emails.
2. **Master Warning Sign Checklist:** 8-point verification criteria covering sender domains, authentication records, urgency cues, and attachment safety.
3. **Safe Incident Reporting SOP:** Actionable containment, reporting (`1930` / CERT-In / IT SOC), deletion, and peer-warning protocols.
4. **Standalone Staff Awareness Guide:** A clean, printable one-page reference sheet highlighting the top 5 phishing red flags.

---

