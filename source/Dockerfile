# CentOS Development Environment with Bash and GNU utils
#  Lets you share environments with your friends, without contaminating theirs

FROM centos
MAINTAINER None <naff@off-and.fu>
LABEL Name="LinuxDev" \
      Creator="Michael Warr"

# Update packages and install sudo
RUN yum -y update && \
    yum -y install sudo && \
    yum -y install git && \
    yum clean all

# Install Python 3 via IUS, and link python3  & pip3 -> python3.6 & pip3.6
RUN yum -y update && \
    yum -y install https://centos7.iuscommunity.org/ius-release.rpm && \
    yum -y install python36u python36u-pip && \
    yum clean all
RUN ln -s '/usr/bin/python3.6' '/usr/bin/python3' && \
    ln -s '/usr/bin/pip3.6' '/usr/bin/pip3'

# Group 'wheel' should be able to sudo without a password (as no-one has one)
# Editing sudoers with sed, hashtag YOLO!
RUN sed -i 's/^%wheel/#(Edited!) %wheel/' '/etc/sudoers' && sed -i 's/^# %wheel/%wheel/' '/etc/sudoers'

# Add the linuxdev user and use it from here onwards
RUN adduser linuxdev
RUN usermod -aG wheel linuxdev
USER linuxdev

# Switch to the mounted dir from here onwards
WORKDIR /mnt/host_files

# Although CentOS does this by default, this line is also used to define the command run on attaching to the container with linuxdev
ENTRYPOINT /bin/bash
