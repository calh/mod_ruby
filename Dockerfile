ARG BASE_IMAGE=centos:centos6
FROM $BASE_IMAGE
ARG RUBY_VERSION=2.5.7

RUN yum -y upgrade && \
  yum install -y \
    apr \
    apr-devel \
    apr-util \
    apr-util-devel \
    autoconf \
    automake \
    bison \
    bzip2 \
    gcc-c++ \
    httpd \
    httpd-devel \
    iconv-devel \
    libffi-devel \
    libtool \
    libyaml-devel \
    make \
    openssl-devel \
    patch \
    readline \
    readline-devel \
    sqlite-devel \
    which \
    zlib \
    zlib-devel

# Install rvm
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import - \
    && gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB \
    && curl -L get.rvm.io | bash -s stable

# Change the shell to load RVM from profile
SHELL ["/bin/bash", "-l", "-c"]

# RVM requirements
RUN rvm requirements


# ruby version
RUN rvm install "ruby-${RUBY_VERSION}" -C --enable-shared \
  && cp "/usr/local/rvm/src/${RUBY_VERSION}/libruby-static.a" "/usr/local/rvm/rubies/${RUBY_VERSION}/lib/"

WORKDIR /usr/src/mod_ruby
COPY . /usr/src/mod_ruby

# Install apache config
COPY examples/mod_ruby.conf /etc/httpd/conf.d
COPY examples/docker_httpd.conf /etc/httpd/conf.d

RUN ruby configure.rb \
    --with-apr-includes=/usr/include/apr-1 \
    --with-apxs=$(which apxs) \
    # Force mod_ruby.so to statically link ruby interpreter
    && sed 's/LIBRUBYARG = $(LIBRUBYARG_SHARED)/LIBRUBYARG = $(LIBRUBYARG_STATIC)/' -i Makefile \
    && make \
    && make install

CMD /usr/sbin/httpd -DFOREGROUND
