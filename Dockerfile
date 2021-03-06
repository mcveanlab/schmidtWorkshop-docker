FROM jupyter/base-notebook

USER root

# R pre-requisites
RUN rm -rf /var/lib/apt/lists/* && apt-get clean
RUN  apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    tzdata \
    gfortran \
    git \
    gcc \
    libzmq3-dev \
    graphviz-dev \
    libsqlite3-dev \
    r-base \
    r-base-dev \
    r-cran-ggplot2 \
    r-cran-cairo \
    r-cran-crayon \
    r-cran-devtools \
    r-cran-uuid \
    r-cran-digest \
    r-cran-png \
    # Needed for the workshop
    r-cran-data.table \
    r-cran-magrittr

# Install remaining packages not available in ubuntu.
RUN R -e "source('https://bioconductor.org/biocLite.R'); biocLite(c('Rgraphviz', 'graph', 'BiocGenerics'))"
RUN R -e "install.packages(c('htmlwidgets', 'shiny', 'plotly'))"

# IRkernel is needed for Jupyter notebook.
RUN R -e "devtools::install_github('IRkernel/IRkernel')"
RUN R -e "IRkernel::installspec(user=FALSE)"

# Jupyter extensions
RUN pip install nbgitpuller
RUN conda install --quiet --yes \
    'jupyter_contrib_nbextensions' && \
    conda clean -tipsy 
RUN fix-permissions $CONDA_DIR
RUN jupyter contrib nbextension install --system
RUN jupyter nbextension enable init_cell/main --system
RUN jupyter nbextension enable hide_input/main --system
RUN jupyter serverextension enable --py nbgitpuller --sys-prefix

# Uncomment this to test locally.
# COPY schmidtWorkshop /home/jovyan

RUN fix-permissions /home/jovyan
USER $NB_UID
