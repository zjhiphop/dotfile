#!/bin/bash
# 限制端口访问速度

port="$1"
limit=5
maxpac=60

# 限制端口最大连接数
iptables -I INPUT -p tcp --dport $port -m connlimit --connlimit-above $limit -j DROP
iptables -I OUTPUT -p tcp --dport $port -m connlimit --connlimit-above $limit -j DROP

# 限制端口每分钟数据包数
# * 首先输入命令service iptables stop关闭iptables
# * 限制端口并发数很简单，IPTABLES就能搞定了，假设你要限制端口5037的最大连接速度为60个包每秒，两句话命令：

# iptables -A INPUT -p tcp --sport $port -m limit --limit $maxpac/s -j ACCEPT
# iptables -A INPUT -p tcp --sport $port -j DROP

iptables -L -n -v
