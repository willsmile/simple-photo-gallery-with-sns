# README

## 環境構築
- `make init`コマンドで環境構築を行う

## 環境変数の設定
### direnvを使う場合
- `cp .envrc.example .envrc`コマンドでenvrcファイルを複製して、外部サービス連携に必要な環境変数を設定して、設定を反映してください。

### direnvを使わない場合
- `.envrc.example`ファイルで示した環境変数をお好みの方法で設定してください。

## サーバー実行
- `bin/rails s`で実行して、`http://localhost:3000/login`をブラウザで開いてください。

## 開発環境構築で困ったとき
- 本システムはActiveStorageを使っているため、ローカルの開発環境に依存するライブラリ（imagemagick、libvipsなど）をインストールしないと、エラーがでることやイメージが表示できないという現象が出るかもしれないので、類似する問題なら、まずその方向で調べてください。
  - 参考資料（一例）：https://qiita.com/fgem28/items/54c5ca70753f16ef420c
