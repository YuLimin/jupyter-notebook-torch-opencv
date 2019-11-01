FROM jupyter/tensorflow-notebook

LABEL maintainer="Yu Li Min <YuLimin@cn.ibm.com>"

# 0. Update conda
RUN conda update --quiet --yes -n base conda

# 1. Install Torch
RUN conda install --quiet --yes pytorch-cpu torchvision-cpu -c pytorch && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# 2. Install OpenCV
RUN conda install --quiet --yes opencv && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
