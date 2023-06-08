FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-devel

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y python python-pip
RUN apt-get install -y libsndfile1
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get autoremove
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
RUN pip install SoundFile munch pydub pyyaml click librosa
RUN pip install soxr

WORKDIR /work