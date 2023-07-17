docker build -t rszostak/multilayer-prompt-gis-segmentation -f Dockerfile .
call start cmd /C docker run ^
-v %cd%:/home/workdir ^
-v %cd%/.docker/.vscode-server:/root/.vscode-server ^
-v %cd%/.docker/.vscode-server-insiders:/root/.vscode-server-insiders ^
-w /home/workdir ^
-p 8888:8888 ^
--rm ^
--shm-size 8G ^
rszostak/multilayer-prompt-gis-segmentation