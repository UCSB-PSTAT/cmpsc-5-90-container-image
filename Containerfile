FROM ucsb/jupyter-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

RUN apt update && \
    apt install -y \
        bsdmainutils \
        fonts-powerline \
        libxtst-dev \
        powerline \
        pv \
        texlive-xetex \
        texlive-fonts-recommended \
        texlive-plain-generic \
        zsh && \
    apt-get clean


RUN pip install \
        datascience \
        cvxpy \
        nltk \
        quandl \ 
        altair vega_datasets \
        otter-grader \
        pendulum \
        ipywebrtc \
        ipympl \
        jupyter_bokeh \
        nbdime \
        jupytext --upgrade \
        jupyterlab_widgets \
        ipympl

USER $NB_USER
