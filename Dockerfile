FROM python:latest
RUN useradd wgmeshconf && mkdir -p /home/wgmeshconf && chown wgmeshconf:wgmeshconf /home/wgmeshconf
RUN pip3 install wg-meshconf
WORKDIR /home/wgmeshconf
ENTRYPOINT ["/usr/local/bin/wg-meshconf"]