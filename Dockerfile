FROM ubuntu:latest
MAINTAINER Rick Torzynski "ricktorzynski@gmail.com"
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y
RUN apt-get install -y python3-pip python-dev build-essential
RUN apt update && apt install -y libsm6 libxext6
RUN apt-get -y install tesseract-ocr
COPY . /app
WORKDIR /app
RUN pip install pillow
RUN pip install pytesseract
RUN pip install opencv-contrib-python
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
