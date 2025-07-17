#!/bin/bash

# このスクリプトは自己署名SSL証明書を生成します。
# .envファイルからSERVER_NAMEを読み込んで使用します。

set -eu

# スクリプトのあるディレクトリに移動し、相対パスを正しく解決する
cd "$(dirname "$0")"

# .envファイルを読み込む
if [ -f .env ]; then
  set -o allexport
  # shellcheck disable=SC1091
  source .env
  set +o allexport
else
    echo "エラー: .envファイルが見つかりません。" >&2
    exit 1
fi

# SERVER_NAMEが.envに設定されているか確認
if [ -z "${SERVER_NAME:-}" ]; then
    echo "エラー: .envファイルにSERVER_NAMEが設定されていません。" >&2
    exit 1
fi

SSL_DIR="nginx/ssl"
KEY_FILE="${SSL_DIR}/${SERVER_NAME}.key"
CERT_FILE="${SSL_DIR}/${SERVER_NAME}.crt"

mkdir -p "$SSL_DIR"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "$KEY_FILE" -out "$CERT_FILE" -subj "/CN=${SERVER_NAME}"

echo "自己署名証明書を作成しました。"
echo "  秘密鍵: ${KEY_FILE}"
echo "  証明書: ${CERT_FILE}"