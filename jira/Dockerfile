FROM centos:7

# 不能用openjdk,建议安装oracle的java环境
COPY ./crack/jdk-8u131-linux-x64.rpm /tmp
COPY ./crack/atlassian-jira-software-7.4.1-x64.bin /tmp
COPY ./crack/atlassian-extras-3.2.jar /tmp
COPY ./crack/mysql-connector-java-5.1.39-bin.jar /tmp

# 安装java环境
RUN rpm -ivh /tmp/jdk-8u131-linux-x64.rpm

# 并更新profile
RUN echo "JAVA_HOME=/usr/java/jdk1.8.0_131" >> /etc/profile \
    && echo "JAVA_BIN=/usr/java/jdk1.8.0_131/bin" >> /etc/profile \
    && echo "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/bin:/sbin/" >> /etc/profile \
    && echo "CLASSPATH=.:/lib/dt.jar:/lib/tools.jar" >> /etc/profile \
    && export JAVA_HOME JAVA_BIN PATH CLASSPATH \
    && source /etc/profile

# 安装jira
RUN chmod +x /tmp/atlassian-jira-software-7.4.1-x64.bin \ 
    && sh -c '/bin/echo -e "\no\n1\ni\nn" | /tmp/atlassian-jira-software-7.4.1-x64.bin'

RUN cp /tmp/atlassian-extras-3.2.jar /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/ \
    && cp /tmp/mysql-connector-java-5.1.39-bin.jar /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/
