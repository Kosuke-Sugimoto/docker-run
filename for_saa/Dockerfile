FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-devel

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# pip install -eのために退避
COPY ./GroundingDINO /my_package/GroundingDINO
COPY ./SAM /my_package/SAM

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y cmake
RUN apt-get install -y libopencv-dev
RUN apt-get install -y wget
RUN apt-get install -y python3 python3-pip
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get autoremove
RUN python3 -m pip install --upgrade pip
RUN apt-get install -y wget

# install.sh
RUN pip3 install setuptools==59.5.0
RUN pip3 install --upgrade diffusers[torch]
RUN pip3 install opencv-python pycocotools matplotlib onnxruntime onnx ipykernel
RUN pip3 install transformers
RUN pip3 install addict
RUN pip3 install yapf
RUN pip3 install timm
RUN pip3 install loguru
RUN pip3 install tqdm
RUN pip3 install scikit-image
RUN pip3 install scikit-learn
RUN pip3 install pandas
RUN pip3 install tensorboard
RUN pip3 install seaborn
RUN pip3 install open_clip_torch
RUN pip3 install SciencePlots
RUN pip3 install timm
RUN pip3 install einops
RUN pip3 install gradio

# GroundingDINO & SAM
WORKDIR /my_package/GroundingDINO
RUN export PATH=/usr/local/cuda/bin:$PATH
RUN pip3 install -e .
WORKDIR /my_package/SAM
RUN pip3 install -e .

# mkdir & cd 記述量削減
WORKDIR /weights
RUN wget https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth
RUN wget https://github.com/IDEA-Research/GroundingDINO/releases/download/v0.1.0-alpha/groundingdino_swint_ogc.pth

WORKDIR /work