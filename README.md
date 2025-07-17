# HTTPS Server with Nginx and Docker Compose

This is a template project for serving HTML content over HTTPS using Nginx and Docker Compose.

## セットアップ手順

### 1. 環境設定

`.env.example` ファイルをコピーして `.env` ファイルを作成します。

```bash
cp .env.example .env
```

次に、`.env` ファイルを開き、あなたの環境に合わせて `SERVER_NAME` と `HTTPS_PORT` を編集します。

```ini
# .env
SERVER_NAME=192.168.0.1 # or localhost, dev.example.com etc.
HTTPS_PORT=8443
```

### 2. 自己署名証明書の作成

まず、証明書生成スクリプトに実行権限を付与します。

```bash
chmod +x generate-cert.sh
```

次に、スクリプトを実行して `localhost` 用の証明書を作成します。他のホスト名（例: `dev.example.com`）を使用する場合は、引数を変更してください。

```bash
./generate-cert.sh localhost
```

### 2. コンテナの起動

```bash
docker compose up -d
```
