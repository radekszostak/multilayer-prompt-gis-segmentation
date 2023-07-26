FROM debian:bookworm
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal C_INCLUDE_PATH=/usr/include/gdal
ENV LOCALTILESERVER_CLIENT_PREFIX='proxy/{port}'

RUN apt-get update && apt-get install -y \
    python3-full \
    python3-pip \
    git \
    gdal-bin \
    libgdal-dev

COPY requirements.txt /tmp/requirements.txt

# install from local wheels
# COPY .wheels /tmp/.wheels
# RUN pip install -r /tmp/requirements.txt --break-system-packages --no-index --find-links /tmp/.wheels

#install from pypi
RUN pip install -r /tmp/requirements.txt --break-system-packages

ENTRYPOINT ["jupyter", "lab", "--port=8888", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]
