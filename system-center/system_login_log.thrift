namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base_query.thrift"

struct SystemLoginLogRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id                              // ID
    4: string username
    5: string ip
    6: string location
    7: string os
    8: string token
    9: string browser
    10: optional i8 status
    11: string remark
    12: optional i8 isDelete
    13: optional i64 createdBy
    14: optional i64 updatedBy
    15: optional i64 createTime
    16: optional i64 updateTime

    255: optional base_query.BaseQueryRequest params
}

struct SystemLoginLogResponse {
    1: i64 id                              // ID
    4: string username
    5: string ip
    6: string location
    7: string os
    8: string token
    9: string browser
    10: optional i8 status
    11: string remark
    12: optional i8 isDelete
    13: i64 createdBy
    14: i64 updatedBy
    15: i64 createTime
    16: i64 updateTime
}

struct SystemLoginLogPageResponse {
    1: required i64 total,
    2: list<SystemLoginLogResponse> records
}