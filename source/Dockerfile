# CentOS Development Environment with Bash and GNU utils
#  Lets you share environments with your friends, without contaminating theirs

FROM centos
MAINTAINER None <naff@off-and.fu>
LABEL Name="LinuxDev" \
      Creator="Michael Warr"

# Update packages and install sudo
RUN yum -y update && \
    yum -y install sudo && \
    yum clean all

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
