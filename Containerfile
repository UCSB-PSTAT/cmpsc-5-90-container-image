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
        zsh && \
    apt-get clean

RUN pip install -U nbclassic

RUN pip install jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --sys-prefix && \
    jupyter nbextension enable toc2/main --sys-prefix && \
    jupyter nbextension enable table_beautifier/main --sys-prefix && \
    jupyter nbextension enable toggle_all_line_numbers/main --sys-prefix

ARG RPY2_CFFI_MODE=ABI

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
        jupyterlab_vim \
        jupyterlab_widgets \
        ipympl 

RUN pip install --upgrade jupyterlab-git && \
    jupyter nbextension enable export_embedded/main --sys-prefix && \
    pip install nbzip && \
    jupyter serverextension enable nbzip --py --sys-prefix && \
    jupyter nbextension install nbzip --py --sys-prefix && \
    jupyter nbextension enable nbzip --py --sys-prefix 

RUN jupyter nbextensions_configurator enable --sys-prefix && \
    pip install --pre rise && \
    jupyter nbextension install rise --py --sys-prefix && \
    jupyter nbextension enable rise --py --sys-prefix && \
    pip install git+https://github.com/fdion/hide_code@compatibility && \
    jupyter nbextension install --py hide_code --sys-prefix && \
    jupyter nbextension enable --py hide_code --sys-prefix && \
    jupyter serverextension enable --py hide_code --sys-prefix

RUN rm -f /opt/conda/share/jupyter/lab/extensions/jupyter-matplotlib-0.4.* \
    rm -f /opt/conda/share/jupyter/lab/extensions/jupyterlab_bokeh-1.0.0.tgz \
    rm -f /opt/conda/share/jupyter/lab/extensions/jupyterlab_vim-0.11.0.tgz \
    rm -f /opt/conda/share/jupyter/lab/extensions/jupyter-widgets-jupyterlab-manager-1.1.0.tgz \
    rm -f /opt/conda/share/jupyter/lab/extensions/nbdime-jupyterlab-1.0.0.tgz   

RUN npm install -g npm@latest && \
    npm install -g codemirror && \
    jupyter nbextension enable table_beautifier/main --sys-prefix && \
    jupyter nbextension enable toggle_all_line_numbers/main --sys-prefix 

USER $NB_USER
