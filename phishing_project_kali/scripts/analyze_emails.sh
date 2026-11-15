#!/usr/bin/env bash
# Kali Linux Static Phishing Header & IOC Extractor
# Safe offline forensic helper for Project 03

EMAIL_DIR="../emails"
OUTPUT_LOG="../report/cli_forensics_output.txt"

echo "==========================================================" | tee "$OUTPUT_LOG"
echo " KALI LINUX STATIC PHISHING FORENSIC TRIAGE" | tee -a "$OUTPUT_LOG"
echo " Run Timestamp: $(date)" | tee -a "$OUTPUT_LOG"
echo "==========================================================" | tee -a "$OUTPUT_LOG"

for eml in "$EMAIL_DIR"/*.eml; do
    echo "" | tee -a "$OUTPUT_LOG"
    echo "[+] Analyzing File: $(basename "$eml")" | tee -a "$OUTPUT_LOG"
    echo "----------------------------------------------------------" | tee -a "$OUTPUT_LOG"
    grep -iE "^(From:|Reply-To:|Return-Path:|Subject:|Authentication-Results:|Date:)" "$eml" | tee -a "$OUTPUT_LOG"
    echo "[*] Extracted URLs (Defanged for display):" | tee -a "$OUTPUT_LOG"
    grep -oE 'https?://[^" <>]+' "$eml" | sed 's/http/hxxp/g' | tee -a "$OUTPUT_LOG"
done

echo "" | tee -a "$OUTPUT_LOG"
echo "[+] Attachment Hash & File Type Verification:" | tee -a "$OUTPUT_LOG"
echo "----------------------------------------------------------" | tee -a "$OUTPUT_LOG"
file "$EMAIL_DIR/Delivery_Invoice_8842.pdf.html" | tee -a "$OUTPUT_LOG"
sha256sum "$EMAIL_DIR/Delivery_Invoice_8842.pdf.html" | tee -a "$OUTPUT_LOG"
echo "" | tee -a "$OUTPUT_LOG"
echo "[✓] Analysis complete. Output saved to $OUTPUT_LOG"
