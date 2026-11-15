# PROJECT 03: PHISHING EMAIL ANALYSIS REPORT
**Track:** Cybersecurity | **Environment:** Kali Linux SOC Sandbox  
**Analyst Name:** [Your Full Name]  
**InternCircle ID:** [Your Intern ID]  
**Date:** 2026-11-14  

---

## 1. EXECUTIVE SUMMARY & METHODOLOGY
This report documents the static and passive forensic analysis of five email specimens (three phishing samples and two verified genuine communications) conducted within an isolated Kali Linux environment. All links, domains, and attachments were inspected using non-interactive command-line utilities (`whois`, `dig`, `file`, `sha256sum`) and passive reputation lookups without executing payloads or visiting live malicious URLs.

---

## 2. EMAIL SPECIMEN ANALYSIS (5 SAMPLES)

### Sample 01: Banking KYC Suspension Alert [PHISHING]
* **Screenshot Reference:** `screenshots/sample01_annotated.png`
* **Sender & Header Metadata:** `From: "SBI Bank" <support@sbi-secure-alert.com>` | `Reply-To: noreply-kyc@sbi-kyc-update.xyz` | `SPF=FAIL, DKIM=NONE, DMARC=FAIL`
* **Annotated Warning Signs:** `[1]` Look-alike domain (`sbi-secure-alert.com` vs `sbi.co.in`), `[2]` Artificial urgency ("blocked today"), `[3]` Mismatched unencrypted `http://` link (`sbi-kyc-update.xyz`), `[4]` Request for Card/PIN/OTP, `[5]` Generic "Dear Customer" greeting.
* **Decision & Action:** **PHISHING** — Do not click; report to official bank phishing channel and delete.

### Sample 02: Microsoft 365 Password Expiry Notice [PHISHING]
* **Screenshot Reference:** `screenshots/sample02_annotated.png`
* **Sender & Header Metadata:** `From: "Microsoft Account Team" <security@micros0ft-auth-support.com>` | `SPF=SOFTFAIL, DKIM=FAIL, DMARC=FAIL`
* **Annotated Warning Signs:** `[1]` Homoglyph typosquatting (`micros0ft` with zero), `[2]` 2-hour countdown pressure, `[3]` Credential-harvesting login URL.
* **Decision & Action:** **PHISHING** — Quarantine email, block domain, and alert IT SOC.

### Sample 03: International Courier Customs Fee [PHISHING]
* **Screenshot Reference:** `screenshots/sample03_annotated.png`
* **Sender & Header Metadata:** `From: "DHL Express Delivery" <dispatch@dhl-parcel-track.info>` | `SPF=FAIL, DKIM=NONE, DMARC=FAIL`
* **Annotated Warning Signs:** `[1]` Unofficial `.info` domain, `[2]` Double-extension HTML attachment (`Delivery_Invoice_8842.pdf.html`), `[3]` Shortened URL (`bit.ly`) demanding small customs payment.
* **Decision & Action:** **PHISHING** — Do not open attachment; submit SHA-256 hash to SOC and delete.

### Sample 04: GitHub SSH Key Addition Alert [SAFE / GENUINE]
* **Screenshot Reference:** `screenshots/sample04_annotated.png`
* **Sender & Header Metadata:** `From: "GitHub" <noreply@github.com>` | `SPF=PASS, DKIM=PASS, DMARC=PASS`
* **Verification Findings:** Authentic domain, passing cryptographic authentication, personalized username, and official `https://github.com/settings/keys` destination.
* **Decision & Action:** **SAFE** — Legitimate security alert; retain for records.

### Sample 05: InternCircle Task Submission Update [SAFE / GENUINE]
* **Screenshot Reference:** `screenshots/sample05_annotated.png`
* **Sender & Header Metadata:** `From: "InternCircle" <notifications@interncircle.in>` | `SPF=PASS, DKIM=PASS, DMARC=PASS`
* **Verification Findings:** Verified domain headers, official HTTPS dashboard link, and zero requests for credentials or OTPs.
* **Decision & Action:** **SAFE** — Verified platform notification.

---

## 3. PHISHING WARNING SIGN CHECKLIST
- [ ] **Sender Domain Match:** Address after `@` matches the official domain exactly.
- [ ] **Header Authentication:** `SPF`, `DKIM`, and `DMARC` all evaluate to `PASS`.
- [ ] **No Artificial Urgency:** Absence of threats, countdowns, or account suspension ultimatums.
- [ ] **Personalized Greeting:** Uses your actual name/username rather than "Dear Customer".
- [ ] **Safe Hover URL:** Link preview displays a legitimate `https://` domain matching the sender.
- [ ] **Safe Attachments:** No unexpected `.html`, `.exe`, `.zip`, `.scr`, or macro files.
- [ ] **Zero Secret Requests:** Never asks for passwords, PINs, CVVs, or OTPs.

---

## 4. SAFE INCIDENT REPORTING PROCESS (SOP)
1. **STOP & CONTAIN:** Do not click links, open attachments, or forward the live email.
2. **CAPTURE EVIDENCE:** Screenshot with personal details hidden or export raw headers.
3. **REPORT OFFICIALLY:** Report to internal IT Security / SOC, the impersonated organization's official support desk, and **CERT-In** (`incident@cert-in.org.in`) / `1930`.
4. **DELETE:** Permanently remove the email from Inbox and Trash.
5. **WARN OTHERS:** Alert peers via chat without forwarding the malicious link.

---

## 5. ONE-PAGE STAFF AWARENESS GUIDE: SPOT & STOP PHISHING
**Pause Before You Click — Every Single Time.**

1. **Inspect the Sender Domain:** Watch for look-alikes (`paypa1.com`, `micros0ft.com`, `sbi-secure-alert.com`).
2. **Reject Panic & False Urgency:** Scammers create 2-hour deadlines or account-block threats to rush you.
3. **Hover Before You Click:** Preview the true destination URL without clicking; avoid `http://` or unfamiliar domains.
4. **Never Share Passwords or OTPs:** Legitimate banks and IT teams never request OTPs, PINs, or passwords via email.
5. **Verify Unexpected Attachments:** Watch out for double extensions like `.pdf.html` or `.doc.exe`.

**Golden Rule:** **REPORT** to IT/Security → **DELETE** from Inbox & Trash → **WARN** your team.
