FROM centos:7

# 不能用openjdk,建议安装oracle的java环境
COPY ./crack/jdk-8u131-linux-x64.rpm /tmp
COPY ./crack/atlassian-confluence-6.3.1-x64.bin /tmp
COPY ./crack/atlassian-extras-decoder-v2-3.2.jar /tmp
COPY ./crack/atlassian-universal-plugin-manager-plugin-2.22.jar /tmp

# 安装java环境
RUN rpm -ivh /tmp/jdk-8u131-linux-x64.rpm

# 并更新profile
RUN echo "JAVA_HOME=/usr/java/jdk1.8.0_131" >> /etc/profile \
    && echo "JAVA_BIN=/usr/java/jdk1.8.0_131/bin" >> /etc/profile \
    && echo "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/bin:/sbin/" >> /etc/profile \
    && echo "CLASSPATH=.:/lib/dt.jar:/lib/tools.jar" >> /etc/profile \
    && export JAVA_HOME JAVA_BIN PATH CLASSPATH \
    && source /etc/profile

# 安装confluence 
RUN chmod +x /tmp/atlassian-confluence-6.3.1-x64.bin \
    && sh -c '/bin/echo -e "\no\n1\ni\nn" | /tmp/atlassian-confluence-6.3.1-x64.bin'

# 替换破解文件
RUN mv /opt/atlassian/confluence/confluence/WEB-INF/lib/atlassian-extras-decoder-v2-3.2.jar /mnt/ \
    && cp /tmp/atlassian-extras-decoder-v2-3.2.jar /opt/atlassian/confluence/confluence/WEB-INF/lib \
    && mv /opt/atlassian/confluence/confluence/WEB-INF/atlassian-bundled-plugins/atlassian-universal-plugin-manager-plugin-2.22.1.jar /mnt/ \
    && cp /tmp/atlassian-universal-plugin-manager-plugin-2.22.jar /opt/atlassian/confluence/confluence/WEB-INF/atlassian-bundled-plugins
