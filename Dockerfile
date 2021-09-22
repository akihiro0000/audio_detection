FROM ubuntu:bionic-20210827

FROM python:3.7.0

ENV DEBIAN_FRONTEND=noninteractive


RUN apt update && apt upgrade -y
RUN apt-get -y install curl wget

RUN pip3 install -U pip
RUN pip3 install -U setuptools

#RUN wget -0 https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -

RUN apt-get -y install clang-7 lldb-7 lld-7 libllvm-7-ocaml-dev libllvm7 llvm-7 llvm-7-dev llvm-7-doc llvm-7-examples llvm-7-runtime clang-7 clang-tools-7 clang-7-doc libclang-common-7-dev libclang-7-dev libclang1-7 clang-format-7 python-clang-7 libfuzzer-7-dev lldb-7 lld-7 libc++-7-dev libc++abi-7-dev libomp-7-dev

RUN ln -s /usr/lib/llvm-7/bin/llvm-config /usr/bin/llvm-config
RUN export LLVM_CONFIG=/usr/bin/llvm-config
RUN LLVM_CONFIG=/usr/bin/llvm-config pip install llvmlite==0.31.0
RUN pip3 install librosa==0.6.3
RUN pip install soundfile==0.10.3.post1
RUN pip install torch
RUN pip install numba==0.48 torchlibrosa
RUN pip3 install matplotlib==3.0.3

WORKDIR /home


RUN git clone https://github.com/qiuqiangkong/audioset_tagging_cnn.git


WORKDIR /home/audioset_tagging_cnn

RUN CHECKPOINT_PATH="Cnn14_mAP=0.431.pth"

RUN wget -O Cnn14_mAP=0.431.pth https://zenodo.org/record/3987831/files/Cnn14_mAP%3D0.431.pth?download=1

RUN MODEL_TYPE="Cnn14"

RUN apt-get install -y libhdf5-dev libsndfile1
RUN pip3 install h5py pandas


RUN apt install -y vim portaudio19-dev
RUN pip3 install pyaudio

RUN git clone --depth 1 https://github.com/akihiro0000/audio_detection.git
