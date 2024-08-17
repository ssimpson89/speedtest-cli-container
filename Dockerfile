FROM rockylinux/rockylinux:8.4

RUN curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | bash

RUN yum -y install speedtest

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]