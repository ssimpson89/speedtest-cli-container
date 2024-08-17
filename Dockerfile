FROM rockylinux/rockylinux:8.4

RUN curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | bash

RUN yum -y install speedtest

RUN echo alias speedtest=\'speedtest --accept-license\' >> ~/.bashrc

CMD ["speedtest"]