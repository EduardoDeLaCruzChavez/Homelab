#!/bin/bash

set -e

CERT_DIR="./nginx/certs"
KEY_FILE="${CERT_DIR}/homelab.key"
CRT_FILE="${CERT_DIR}/homelab.crt"
DAYS_VALID=365

DNS_LIST=(
  "homelab.cz"
  "*.homelab.cz"
  "localhost"
)

IP_LIST=(
  "127.0.0.1"
)

SAN_ENTRIES=()

# Add DNS list
for domain in "${DNS_LIST[@]}"; do
  SAN_ENTRIES+=("DNS:${domain}")
done

# Add IP list
for ip in "${IP_LIST[@]}"; do
  SAN_ENTRIES+=("IP:${ip}")
done

# Join array
SAN_STRING=$(
  IFS=,
  echo "${SAN_ENTRIES[*]}"
)

echo "Creating certificate directory in ${CERT_DIR}..."
mkdir -p "${CERT_DIR}"

echo "Generating self-signed OpenSSL certificate..."
echo "Primary domain: ${DNS_LIST[0]}"
echo "Subject Alternative Names (SAN): ${SAN_STRING}"

openssl req -x509 -nodes -days "${DAYS_VALID}" -newkey rsa:2048 \
  -keyout "${KEY_FILE}" \
  -out "${CRT_FILE}" \
  -subj "/CN=${DNS_LIST[0]}/O=Homelab/C=ES" \
  -addext "subjectAltName = ${SAN_STRING}" \
  >/dev/null 2>&1

# Set permissions for the generated files
chmod 600 "${KEY_FILE}"
chmod 644 "${CRT_FILE}"

echo "Certificates successfully generated in ${CERT_DIR}:"
ls -la "${CERT_DIR}"
