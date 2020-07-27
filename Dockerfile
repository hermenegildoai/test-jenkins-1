FROM centos:7
RUN yum update -y
RUN yum install epel-release -y
RUN yum install python3 python-pip -y
RUN mkdir /opt/app
COPY src/app.py /opt/app/
COPY requirements.txt /opt/app/
RUN pip install --upgrade pip
RUN pip3 install -r /opt/app/requirements.txt	

COPY docker-entrypoint.sh /

ENTRYPOINT "/docker-entrypoint.sh"
