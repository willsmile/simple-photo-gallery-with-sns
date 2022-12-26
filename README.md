# README

## 環境構築
- `make init`コマンドで環境構築を行う

## サーバー実行
- `bin/rails s`で実行して、`http://localhost:3000/login`をブラウザで開いてください。

## 開発環境構築で困ったとき
- 本システムはActiveStorageを使っているため、ローカルの開発環境に依存するライブラリ（imagemagick、libvipsなど）をインストールしないと、エラーがでることやイメージが表示できないという現象が出るかもしれないので、類似する問題なら、まずその方向で調べてください。
  - 参考資料（一例）：https://qiita.com/fgem28/items/54c5ca70753f16ef420c
