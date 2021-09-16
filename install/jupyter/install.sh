#! /bin/bash
export JAVA_HOME=/usr/lib/jdk1.8.0_211
export PATH=$PATH:$JAVA_HOME/bin

# install Jupyter
python3 -m pip install -U jupyter numpy scipy
python3 -m ipykernel install --user --name=myJupyter
# launch Jupyter
# jupyter notebook --ip 0.0.0.0 --no-browser --allow-root


