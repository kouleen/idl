namespace java io.github.kouleen.thrift.stream
namespace go stream
namespace py stream

include "../common/base_query.thrift"

struct StreamClientHeaderRequest {
    1: optional i64 current
    2: optional i64 size
    3: optional i64 id
    4: string streamId                      // SRS内部实例ID
    5: string streamName                    // 业务流实例名称
    6: string streamUrl                     // 流url
    7: string serverId                      // server标识
    8: string serviceId                     // SRS会话ID
    9: string app                           // 业务组标识
    10: string vhost                        // 虚拟主机
    11: optional i8 status                  // 状态
    12: string remark                       // 备注
    13: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    14: optional i64 createdBy              // 创建人
    15: optional i64 updatedBy              // 修改人
    16: optional i64 createTime             // 创建时间
    17: optional i64 updateTime             // 修改时间

    254: list<i64> idList
    255: optional base_query.BaseQueryRequest params
}

struct StreamClientHeaderResponse {
    3: i64 id
    4: string streamId                      // SRS内部实例ID
    5: string streamName                    // 业务流实例名称
    6: string streamUrl                     // 流url
    7: string serverId                      // server标识
    8: string serviceId                     // SRS会话ID
    9: string app                           // 业务组标识
    10: string vhost                        // 虚拟主机
    11: optional i8 status                  // 状态
    12: string remark                       // 备注
    13: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    14: i64 createdBy                       // 创建人
    15: i64 updatedBy                       // 修改人
    16: i64 createTime                      // 创建时间
    17: i64 updateTime                      // 修改时间
}

struct StreamClientHeaderPageResponse {
    1: required i64 total,
    2: list<StreamClientHeaderResponse> records
}

struct StreamClientLineRequest {
    1: optional i64 current
    2: optional i64 size
    3: optional i64 id
    4: string clientId                      // 客户端ID
    5: string streamId                      // SRS内部实例ID
    6: optional i8 ioType                   // 1 拉流 2推流
    11: optional i8 status                  // 状态
    12: string remark                       // 备注
    13: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    14: optional i64 createdBy              // 创建人
    15: optional i64 updatedBy              // 修改人
    16: optional i64 createTime             // 创建时间
    17: optional i64 updateTime             // 修改时间

    254: list<i64> idList
    255: optional base_query.BaseQueryRequest params
}

struct StreamClientLineResponse {
    3: i64 id
    4: string clientId                      // 客户端ID
    5: string streamId                      // SRS内部实例ID
    6: optional i8 ioType                   // 1 拉流 2推流
    11: optional i8 status                  // 状态
    12: string remark                       // 备注
    13: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    14: i64 createdBy                       // 创建人
    15: i64 updatedBy                       // 修改人
    16: i64 createTime                      // 创建时间
    17: i64 updateTime                      // 修改时间
}

struct StreamClientLinePageResponse {
    1: required i64 total,
    2: list<StreamClientLineResponse> records
}

struct StreamClientLogRequest {
    1: optional i64 current
    2: optional i64 size
    3: optional i64 id
    4: string clientId                      // 客户端ID
    5: string clientIp                      // 客户端IP
    6: string action                        // 客户端类型
    12: string remark                       // 备注
    13: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    14: optional i64 createdBy              // 创建人
    15: optional i64 updatedBy              // 修改人
    16: optional i64 createTime             // 创建时间
    17: optional i64 updateTime             // 修改时间

    254: list<i64> idList
    255: optional base_query.BaseQueryRequest params
}

struct StreamClientLogResponse {
    3: i64 id
    4: string clientId                      // 客户端ID
    5: string clientIp                      // 客户端IP
    6: string action                        // 客户端类型
    12: string remark                       // 备注
    13: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    14: i64 createdBy                       // 创建人
    15: i64 updatedBy                       // 修改人
    16: i64 createTime                      // 创建时间
    17: i64 updateTime                      // 修改时间
}

struct StreamClientLogPageResponse {
    1: required i64 total,
    2: list<StreamClientLogResponse> records
}