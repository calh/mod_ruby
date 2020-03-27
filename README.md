# README for mod_ruby

## What's mod_ruby?

mod_ruby embeds the Ruby interpreter into the Apache web server,
allowing Ruby CGI scripts to be executed natively. These scripts will
start up much faster than without mod_ruby.

## Required environment

* Ruby version 1.6.x or later.
  (Recommends version 1.6.4 or later.)
* Apache version 1.3.3 or later.

You can use Apache 2.0 also, but there are some restrictions.

* You should build mod_ruby as a DSO module. (Please use --with-apxs
  option instead of --with-apache option when running configure.rb.)
* Some methods are not implemented for Apache 2.0 because Apache 2.0
  API is different from Apache 1.x API.

## Installation

(1) Type `./configure.rb' to create Makefile.
    (Type `./configure.rb --help' to get a help message.)

(2) Type `make' to compile mod_ruby.

(3) Type `make install' to install files.

(4) Edit `httpd.conf'. (see examples/httpd.conf.)

(5) Restart Apache.

## Building / Testing / Development with Docker

* Build the Docker image:

```
$ docker build -t mod_ruby .
```

* Change the build base image, ruby version:

```
$ docker build -t mod_ruby --build-arg BASE_IMAGE=centos:centos6 --build-arg RUBY_VERSION=2.5.7
```

* Start up a container, binding port 80

```
$ docker run -d -p 8080:80 mod_ruby
```

* Try out the first Hello World test script:

```
$ curl http://localhost:8080/ruby-run/test1.rb
Hello World!
```

## Official Web Site

((<URL:http://modruby.net/>))
