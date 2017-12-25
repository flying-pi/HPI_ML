FROM python:3.6-slim

ADD . ./app
WORKDIR ./app

RUN pip3 install --upgrade pip
RUN pip3 install jupyter pandas numpy scipy

RUN chmod -R a+w /app && chmod -R 777 /app

RUN useradd -m myuser
USER myuser

CMD jupyter notebook --no-browser --port=${PORT} --ip=0.0.0.0 --allow-root --NotebookApp.password="sha1:6f50777b9654:d7be130f413745989835eb88241683e7078e2857"
