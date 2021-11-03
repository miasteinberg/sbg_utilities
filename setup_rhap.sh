# needs a python 2 environment
conda create -y -n py2 python=2.7
conda activate py2

# install cwl-runner
pip install -U pip
pip install cwlref-runner

# download the pipeline
wget https://bitbucket.org/CRSwDev/cwl/get/eba54645ed1f.zip -O rhap.zip
unzip rhap.zip
rm rhap.zip

# start docker and pull image
sudo service docker start
sudo docker pull bdgenomics/rhapsody
