FROM debian:bookworm
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal C_INCLUDE_PATH=/usr/include/gdal
ENV LOCALTILESERVER_CLIENT_PREFIX='proxy/{port}'
#python

RUN apt-get update && apt-get install -y \
    python3-full \
    python3-pip \
    git \
    gdal-bin \
    libgdal-dev \
    python3-gdal
    # python3-gdal
# RUN pip install numpy
# RUN pip install setuptools==58
#RUN pip install pipx
# RUN python3 -m pip install --user pipx && python3 -m pipx ensurepath  
# ENV VIRTUAL_ENV=/opt/venv
# RUN python3 -m venv $VIRTUAL_ENV
# ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# RUN apt-get install -y pipx 
# RUN pipx install pygdal==3.6.2.11
# RUN pipx install gdal-utils
RUN pip install jupyterlab jupyter-server-proxy ipykernel --break-system-packages
RUN pip install shapely rasterio --no-binary shapely --no-binary rasterio --break-system-packages
RUN pip install rioxarray geopandas rasterstats --break-system-packages
RUN pip install tqdm p_tqdm --break-system-packages
RUN pip install localtileserver ipyleaflet --break-system-packages
RUN pip install ipyevents --break-system-packages

# #---

ENTRYPOINT ["jupyter", "lab", "--port=8888", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]
