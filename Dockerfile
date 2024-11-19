FROM python:3.9-slim


WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN mkdir notebooks


COPY ./notebooks/ ./notebooks/


# Puerto de jupyter
EXPOSE 8888


# Configurar Jupyter Lab para aceptar conexiones desde cualquier IP
RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.allow_root = True" >> /root/.jupyter/jupyter_notebook_config.py


CMD ["jupyter", "lab", "--allow-root", "--no-browser", "--NotebookApp.token=''"]
