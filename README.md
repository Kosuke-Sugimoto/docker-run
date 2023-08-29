## このリポジトリについて
このリポジトリは過去に作った docker の起動スクリプトを置いておくためのスクリプトです。  
また、docker 関連で得られた知見等があれば、この README.md に追記していきます。  

## run.sh ( 起動スクリプト ) について
- shebang ( シバン、シェバン ) は書く
    - インタプリタの指定
    - 実行権限を付与することでコマンドとして実行可能 ( ./run.sh 的な )

## Dockerfile について
- [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/) が参考になる
- 上のリンクに書いてあることだが、apt-get update と apt-get install は && で繋げて処理すること
    - キャッシュされた apt-get update の結果を参照して、古いパッケージをインストールする事故を防げる
    - apt-get clean と rm -rf /var/lib/apt/lists/* も末尾に && で繋げておくといいかも
        - 生成されるイメージの容量削減