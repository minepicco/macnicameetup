# API based Menlo security cloud system monitoring

Docker Imageのビルド後、以下のコマンドでdockerを起動します。

<pre> $ docker run -v <your working directory>params.conf:/home/ubuntu/menlo-test/params.conf -d <your build image> </pre>

実行後、ワーキングディレクトリ上のparams.confファイルに設定値を入力します。
