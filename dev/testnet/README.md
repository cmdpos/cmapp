# Testnet Tutorial

## 启动本地测试网
```sh
cd $GOPATH/src/github.com/cmdpos/cmapp/dev/testnet
./testnet.sh -i -s -n 3
```
### 参数：
1. `-i` 执行testnet，初始化网络配置数据:创世块，创世tx，创世账户
1. `-s` 执行start，启动节点
1. `-n` 启动节点个数(必须大于0，且小于100)
1. `-p` 本地LAN IP，如果网络是单机运行可以忽略此选项（默认为`127.0.0.1`）

### 端口
每个节点有两个监听端口:rpc端口和p2p端口。

端口计算公式如下:
* rpc端口: 1${node_id}{rpc_port}
* p2p端口: 1${node_id}{p2p_port}

比如:
* node_id是个0-99之间的两位整数，表示一个节点id
* p2p_port是56
* rpc_port是57
* seed node id 为0，它的两个端口分别是10056,10057
* 节点id为1的节点两个端口分别就是10156,10157

### 浏览器查询节点状态
访问这个地址可以查询指定节点的状态信息
http://${node_ip_address}:${rpc_port}

比如访问 http://localhost:10057:
```$xslt
Available endpoints:

Endpoints that require arguments:
//localhost:10057/abci_info?
//localhost:10057/abci_query?path=_&data=_&height=_&prove=_
//localhost:10057/block?height=_
//localhost:10057/block_results?height=_
//localhost:10057/blockchain?minHeight=_&maxHeight=_
//localhost:10057/broadcast_tx_async?tx=_
//localhost:10057/broadcast_tx_commit?tx=_
//localhost:10057/broadcast_tx_sync?tx=_
//localhost:10057/commit?height=_
//localhost:10057/consensus_params?height=_
//localhost:10057/consensus_state?
//localhost:10057/dump_consensus_state?
//localhost:10057/genesis?
//localhost:10057/health?
//localhost:10057/net_info?
//localhost:10057/num_unconfirmed_txs?
//localhost:10057/status?
//localhost:10057/subscribe?query=_
//localhost:10057/tx?hash=_&prove=_
//localhost:10057/tx_search?query=_&prove=_&page=_&per_page=_
//localhost:10057/unconfirmed_txs?limit=_
//localhost:10057/unsubscribe?query=_
//localhost:10057/unsubscribe_all?
//localhost:10057/validators?height=_

```

### 新节点加入

#### 若seed node在本地机器运行
```sh
cd $GOPATH/src/github.com/cmdpos/cmapp/dev/testnet
./addnewnode.sh -n ${node_id}
```

#### 若seed node不在本地机器运行
```sh
cd $GOPATH/src/github.com/cmdpos/cmapp/dev/testnet
./addnewnode.sh -n ${node_id} -s 10ed9cb348b0b2f2f84ec76d6b815913deaa9cef@${seed_node_ip}:10056 -i ${IP}
```

#### 参数说明：
 1. `-n` 节点ID(必须大于0，且小于100)，用于节点别名、文件路径
 1. `-s` seed node，取自上面`./testnet.sh -i -s -n 3`的输出信息
 1. `-i` 本地LAN IP，如果网络是单机运行可以忽略此选项（默认为`127.0.0.1`）
 

#### 新加入的节点vote power均为0


## 
* 基础货币stake