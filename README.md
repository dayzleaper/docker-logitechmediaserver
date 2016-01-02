# docker-logitechmediaserver
Container for the Logitech Media Server

Run with
'''
docker run -d \
	-p 3483 \
	-p 9000 \
	-p 9090 \
	-v <data_dir>:/config \
	dayzleaper/logitechmediaserver:latest
'''
