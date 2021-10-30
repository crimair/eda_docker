FROM gosu/centos:7
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN \
  yum install -y ld-linux.so.2 \
  && yum install -y libX11.so.6 \
  && yum install -y libXext.so.6 \
  && yum install -y libXft.so.2 \
  && yum install -y libncurses.so.5 \
  && yum groupinstall -y "X Window System" \
  && yum install -y vlgothic-* \
  && yum groupinstall -y "Fonts" \
  && yum groupinstall -y "Development tools" \
  && yum install -y xorg-x11-apps \
  && yum install -y gnome-terminal \
  && yum install -y libpng libpng12.so.0 \
  && yum install -y libSM.so.6 \
  && yum install -y tcsh curl \
  && yum install -y redhat-lsb \
  && yum install -y redhat-lsb.i686 redhat-lsb-printing.i686 \
  && sed -i -e "s/1024/unlimited/" /etc/security/limits.d/20-nproc.conf \
  && chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
