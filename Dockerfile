FROM nvidia/cuda:11.6.0-base-ubuntu20.04

SHELL ["/bin/bash", "-c"]

RUN apt clean && apt upgrade -yqq

# conda
RUN apt-get -qq update && apt-get -qq -y install curl bzip2 git \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    && apt-get -qq -y remove curl bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes

ENV PATH /opt/conda/bin:$PATH

RUN mkdir /mcc
WORKDIR /mcc

COPY docker/requirements.txt /mcc/
COPY docker/conda.txt /mcc/

RUN conda create --name mccqrnn --file conda.txt
RUN echo "source activate mccqrnn" > ~/.bashrc
RUN source ~/.bashrc && pip install -r requirements.txt && rm conda.txt requirements.txt

COPY docker/photon_best_model.photon /mcc
COPY docker/entrypoint.py /mcc
RUN chmod +x entrypoint.py

RUN mkdir /input
RUN mkdir /output

CMD source ~/.bashrc && python entrypoint.py
