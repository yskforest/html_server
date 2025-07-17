# HTTPS Server with Nginx and Docker Compose

## セットアップ手順

### 1. 自己署名証明書の作成

まず、証明書を生成するためのスクリプトに実行権限を付与します。

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
