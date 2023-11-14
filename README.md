# 環境構築方法

## 開発環境

### 1. ビルドを実施し、イメージを作成する

下記のコマンドを実行します。

```cmd
$ docker-compose -f docker-compose.build.yml build
```

### 2. 開発環境を起動する

下記のコマンドを実行します。

```cmd
$ docker-compose up
```

## 本番環境

### 1. ビルドを実施し、イメージを作成する

```cmd
$ docker build --target production -t go-production:latest .
```
