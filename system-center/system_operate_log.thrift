namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base_query.thrift"

struct SystemOperateLogRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id                              // ID
    4: string module
    5: string business
    6: i8 type
    7: string ip
    8: string location
    9: string os
    10: string browser
    11: optional i8 status
    12: string remark
    13: optional i8 isDelete
    14: optional i64 createdBy
    15: optional i64 updatedBy
    16: optional i64 createTime
    17: optional i64 updateTime
    18: list<i64> idList

    255: optional base_query.BaseQueryRequest params
}

struct SystemOperateLogResponse {
    3: optional i64 id                              // ID
    4: string module
    5: string business
    6: i8 type
    7: string ip
    8: string location
    9: string os
    10: string browser
    11: optional i8 status
    12: string remark
    13: optional i8 isDelete
    14: optional i64 createdBy
    15: optional i64 updatedBy
    16: optional i64 createTime
    17: optional i64 updateTime
}

struct SystemOperateLogPageResponse {
    1: required i64 total,
    2: list<SystemOperateLogResponse> records
}