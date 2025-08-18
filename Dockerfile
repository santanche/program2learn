FROM python:3.9.23
ENV PYTHONUNBUFFERED=1
RUN mkdir /code
WORKDIR /code
RUN pip install jupyter
RUN pip install notebook
RUN apt update
RUN apt install -y guile-3.0 guile-3.0-dev automake gcc libunwind-dev build-essential
RUN wget https://github.com/zeromq/libzmq/releases/download/v4.3.5/zeromq-4.3.5.tar.gz && \
    tar xvf zeromq-4.3.5.tar.gz && cd /code/zeromq-4.3.5/ && \
    ./autogen.sh && ./configure CXXFLAGS='-Wno-error -Wno-error=stringop-truncation' && make && make install
RUN wget https://openbsd.c3sl.ufpr.br/savannah-nongnu/guile-json/guile-json-4.7.1.tar.gz && \
    tar -xzf guile-json-4.7.1.tar.gz && cd guile-json-4.7.1 && \
    ./configure --prefix=/usr && make && make install
# guile-simple-zmq
RUN git clone https://github.com/jerry40/guile-simple-zmq.git && \
    cd guile-simple-zmq && \
    autoreconf --verbose --install --force && \
    ./configure --prefix=/usr && make && make install
#
RUN mkdir /usr/local/share/jupyter/kernels/guile
WORKDIR /usr/local/share/jupyter/kernels/guile
RUN git clone https://github.com/jerry40/guile-kernel.git
RUN cp ./guile-kernel/src/kernel.json .
EXPOSE 8888
RUN groupadd -r jupyter_users && useradd --no-log-init -m -r -g jupyter_users guile_user
USER guile_user
WORKDIR /home/guile_user/work
ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--notebook-dir=/home/guile_user/work"]
