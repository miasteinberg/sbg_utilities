curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh

conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

conda install mamba
