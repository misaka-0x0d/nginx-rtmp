FROM centos:7
RUN yum -y install wget git gcc gcc-c++ pcre pcre-devel zlib zlib-devel openssl openssl-devel
RUN wget http://tengine.taobao.org/download/tengine-2.3.2.tar.gz && git clone https://github.com/winshining/nginx-http-flv-module.git && git clone https://github.com/vozlt/nginx-module-vts.git && tar zxvf tengine-2.3.2.tar.gz
WORKDIR ./tengine-2.3.2/
RUN ./configure --prefix=/usr/local/nginx --add-module=../nginx-http-flv-module --add-module=../nginx-module-vts && make && make install
ADD nginx.conf /usr/local/nginx/conf
ADD html /usr/local/nginx/html
EXPOSE 80
EXPOSE 1935
CMD ["/usr/local/nginx/sbin/nginx","-g","daemon off;"]