#
# Anaconda based image with Tensorflow, exposed as a Jupyter Gateway for Atom.
#

FROM continuumio/anaconda

# Jupyter gateway support for Atom's Hydrogen package
RUN conda install --quiet -c conda-forge jupyter_kernel_gateway
RUN jupyter notebook --generate-config
RUN sed -i "s|#c.NotebookApp.token = '<generated>'|c.NotebookApp.token = 'hbe_python_data_token'|g" /root/.jupyter/jupyter_notebook_config.py

# Tensorflow
RUN conda install --quiet -c conda-forge tensorflow

EXPOSE 8888
# run kernel gateway on container start, not notebook server
CMD ["jupyter", "kernelgateway", "--KernelGatewayApp.ip=0.0.0.0", "--KernelGatewayApp.port=8888"]
