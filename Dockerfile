FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    python3 \
    python3-pip \
    libx11-6 \
    libgl1 \
    libqt5widgets5 \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://casa.nrao.edu/download/distro/casa-pipeline/release/linux/casa-6.6.1-17-pipeline-2024.1.0.8-py3.8.el8.tar.xz
RUN tar -xf casa-6.6.1-17-pipeline-2024.1.0.8-py3.8.el8.tar.xz
RUN rm casa-6.6.1-17-pipeline-2024.1.0.8-py3.8.el8.tar.xz
RUN mv casa-6.6.1-17-pipeline-2024.1.0.8 /opt/casa

COPY source/analysis_scripts /usr/local/lib/analysis_scripts
# COPY source/startup.py /root/.casa/startup.py

ENV PYTHONPATH="/usr/local/lib/analysis_scripts"
ENV PATH="/opt/casa/bin:$PATH"
