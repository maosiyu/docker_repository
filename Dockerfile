# mao_siyu Docker
#
# VERSION 1.0.0

# 应用哪个仓库 承载自己的应用程序
FROM docker.io/nano/node.js:0.10

# 设置该dockerfile的作者和联系邮箱
MAINTAINER mao_siyu@sina.com

# 设定环境变量  可以看到之前js文件有用到 var port = normalizePort(process.env.PORT || '8000'); ，就是在这里设定的
ENV PORT 8000

# 拷贝项目文件 COPY 指令用来复制本地主机的文件到容器中
COPY  .  /app
WORKDIR /app
# 这里把我们项目目录本身，即当前目录 . 拷贝至容器的 /app 位置。
# 然后通过指令 WORKDIR 将 /app 目录设为工作目录。工作目录可以理解为运行时的 pwd。

# run是在编译时执行命令
RUN npm install pm2
RUN npm --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist install

# 暴露server的port
EXPOSE 8000

CMD ["npm", "start"]