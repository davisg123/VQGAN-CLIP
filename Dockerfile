FROM nvidia/cuda:11.1-base-ubuntu20.04

RUN sudo apt-get update
RUN sudo apt-get install -y python3.9
# RUN apt-get install -y curl
# RUN apt install -y libncurses5

RUN python -m ensurepip --upgrade

RUN pip install torch==1.9.0 torchvision==0.10.0 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html

RUN pip install ftfy regex tqdm omegaconf pytorch-lightning IPython kornia imageio imageio-ffmpeg einops torch_optimizer

COPY . .

RUN mkdir -p checkpoints

RUN curl -L -o checkpoints/vqgan_imagenet_f16_16384.yaml -C - 'https://heibox.uni-heidelberg.de/d/a7530b09fed84f80a887/files/?p=%2Fconfigs%2Fmodel.yaml&dl=1'
RUN curl -L -o checkpoints/vqgan_imagenet_f16_16384.ckpt -C - 'https://heibox.uni-heidelberg.de/d/a7530b09fed84f80a887/files/?p=%2Fckpts%2Flast.ckpt&dl=1'