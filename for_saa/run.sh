#!/bin/bash

# 扱いたいデータセットディレクトリへのパス
# 末尾に/をつけることでそいつの配下のディレクトリ群をマウント
# 末尾に/を付けた場合はマウント先の末尾にも/を指定する必要がある
DATASET_DIR=/media/deepstation/storage/share/sugimoto/datasets/raw/mvtec/

# 結果を格納するためのディレクトリへのパス
# マウントするだけなので利用したければプロジェクトごとに調整する必要アリ
RESULT_DIR=/media/deepstation/storage/share/sugimoto/results/ssa

# イメージの名称
# 既に存在するイメージ名と被らないようにお願いします
IMAGE_NAME=ssa:latest

# コンテナの名称
# 既に存在するコンテナ名と被らないようにお願いします
CONTAINER_NAME=ssa

# ポートの割り当て対応
# コンテナ側の6006をホスト側の10000に割り当てます
# VSCodeのForward a PortでPortに10000を指定してやると、ローカルでTensorBoardの出力を見ることができます
# PORT_FLAGでポートの割り当てを行うかどうかを管理します、デフォルトは行わない設定です
PORT_FLAG=false
PORT="10000:6006"

docker build -t $IMAGE_NAME .
if $PORT_FLAG ; then
    docker run --rm -it --name $CONTAINER_NAME \
            --ulimit memlock=-1 --gpus all -p $PORT\
            --shm-size=8g \
            --mount type=bind,src=./,dst=/work/ \
            --mount type=bind,src=$RESULT_DIR,dst=/work/my_results \
            --mount type=bind,src=$DATASET_DIR,dst=/work/my_datasets/,readonly \
            $IMAGE_NAME
else
    docker run --rm -it --name $CONTAINER_NAME \
            --ulimit memlock=-1 --gpus all \
            --shm-size=8g \
            --mount type=bind,src=./,dst=/work/ \
            --mount type=bind,src=$RESULT_DIR,dst=/work/my_results \
            --mount type=bind,src=$DATASET_DIR,dst=/work/my_datasets/,readonly \
            $IMAGE_NAME
fi