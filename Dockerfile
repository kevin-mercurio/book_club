FROM jupyter/minimal-notebook

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

USER $NB_UID

# Install Python 3 packages
RUN conda install --quiet --yes \
    'conda-forge::blas=*=openblas' \
    'pandas' \
    'matplotlib' \
    'scipy' \
    'seaborn' \
    'scikit-learn' \
    'statsmodels' \
    'cloudpickle' \
    'dill' \
    'bokeh' \
    'sqlalchemy' \
    'beautifulsoup4' \
    'xgboost' \
    'rpy2' \
    'xlrd'  && \
    conda remove --quiet --yes --force qt pyqt && \
    conda clean -tipsy && \
    npm cache clean --force && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    rm -rf /home/$NB_USER/.node-gyp && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN conda install -c conda-forge jupyter_contrib_nbextensions && \ 
    conda install -c conda-forge jupyter_nbextensions_configurator
