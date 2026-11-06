namespace java io.github.kouleen.thrift.stream
namespace go stream
namespace py stream

include "stream_server.thrift"
include "stream_client.thrift"

service StreamService {

    // 同步流回调信息
    bool SyncStream(1: stream_server.StreamSyncRequest req)

    // 分页查询流服务节点
    stream_server.StreamServerPageResponse QueryStreamServerPage(1: stream_server.StreamServerRequest req)
    list<stream_server.StreamServerResponse> QueryStreamServerList(1: stream_server.StreamServerRequest req)
    stream_server.StreamServerResponse QueryStreamServer(1: stream_server.StreamServerRequest req)
    // 删除流服务节点
    bool DeleteStreamServer(1: stream_server.StreamServerRequest req)

    // 分页查询流客户端实例
    stream_client.StreamClientHeaderPageResponse QueryStreamClientHeaderPage(1: stream_client.StreamClientHeaderRequest req)
    list<stream_client.StreamClientHeaderResponse> QueryStreamClientHeaderList(1: stream_client.StreamClientHeaderRequest req)
    stream_client.StreamClientHeaderResponse QueryStreamClientHeader(1: stream_client.StreamClientHeaderRequest req)
    bool DeleteStreamClientHeader(1: stream_client.StreamClientHeaderRequest req)

    // 分页查询流客户端连接
    stream_client.StreamClientLinePageResponse QueryStreamClientLinePage(1: stream_client.StreamClientLineRequest req)
    list<stream_client.StreamClientLineResponse> QueryStreamClientLineList(1: stream_client.StreamClientLineRequest req)
    stream_client.StreamClientLineResponse QueryStreamClientLine(1: stream_client.StreamClientLineRequest req)
    bool DeleteStreamClientLine(1: stream_client.StreamClientLineRequest req)

    // 分页查询流客户端连接日志
    stream_client.StreamClientLogPageResponse QueryStreamClientLogPage(1: stream_client.StreamClientLogRequest req)
    list<stream_client.StreamClientLogResponse> QueryStreamClientLogList(1: stream_client.StreamClientLogRequest req)
    stream_client.StreamClientLogResponse QueryStreamClientLog(1: stream_client.StreamClientLogRequest req)
    bool DeleteStreamClientLog(1: stream_client.StreamClientLogRequest req)
}