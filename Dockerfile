FROM --platform=linux/x86_64 ubuntu:20.04
RUN apt-get update && apt-get install -y \
  sudo \
  wget
RUN wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh && \
  sh /Anaconda3-2021.05-Linux-x86_64.sh -b && \
  rm -f /Anaconda3-2021.05-Linux-x86_64.sh
ENV PATH /root/anaconda3/bin:$PATH
RUN pip install --upgrade pip && \
  conda create -n PokeCon python=3.6 -y && \
  conda init bash
WORKDIR /
CMD ["/bin/bash"]