#!/bin/bash

# このスクリプトは自己署名SSL証明書を生成します。
# 使い方: ./generate-cert.sh <hostname>
# 例: ./generate-cert.sh localhost

set -eu

# スクリプトのあるディレクトリに移動し、相対パスを正しく解決する
cd "$(dirname "$0")"

if [ "$#" -ne 1 ]; then
    echo "エラー: ホスト名を引数に指定してください。" >&2
    echo "使い方: $0 <hostname>" >&2
    exit 1
fi

HOSTNAME=$1
SSL_DIR="nginx/ssl"
KEY_FILE="${SSL_DIR}/server.key"
CERT_FILE="${SSL_DIR}/server.crt"

mkdir -p "$SSL_DIR"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "$KEY_FILE" -out "$CERT_FILE" -subj "/CN=${HOSTNAME}"

echo "自己署名証明書を作成しました。"
echo "  秘密鍵: ${KEY_FILE}"
echo "  証明書: ${CERT_FILE}"