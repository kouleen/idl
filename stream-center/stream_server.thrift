namespace java io.github.kouleen.thrift.stream
namespace go stream
namespace py stream

include "../common/base_query.thrift"

struct StreamSyncRequest {
    1: string serverId
    2: string serviceId
    3: string action
    4: string clientId
    5: string ip
    6: string vhost
    7: string app
    8: string tcUrl
    9: string stream
    10: string param
    11: string streamUrl
    12: string streamId
}

struct StreamServerRequest {
    1: optional i64 current
    2: optional i64 size
    3: optional i64 id
    4: string serverId                      // server标识
    5: string serviceId                     // SRS会话ID
    10: optional i8 status                  // 状态
    11: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    12: optional i64 createdBy              // 创建人
    13: optional i64 updatedBy              // 修改人
    14: optional i64 createTime             // 创建时间
    15: optional i64 updateTime             // 修改时间

    254: list<i64> idList
    255: optional base_query.BaseQueryRequest params
}

struct StreamServerResponse {
    3: i64 id
    4: string serverId                      // server标识
    5: string serviceId                     // SRS会话ID
    10: optional i8 status                  // 状态
    11: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    12: i64 createdBy                       // 创建人
    13: i64 updatedBy                       // 修改人
    14: i64 createTime                      // 创建时间
    15: i64 updateTime                      // 修改时间
}

struct StreamServerPageResponse {
    1: required i64 total,
    2: list<StreamServerResponse> records
}