namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base_query.thrift"

struct SystemChangeLogRequest {
    1: optional i64 current
    2: optional i64 size
    3: optional i64 id                              // ID
    4: string schema
    5: string table
    6: string action
    7: string before
    8: string after
    11: string remark
    12: optional i8 isDelete
    13: optional i64 createdBy
    14: optional i64 updatedBy
    15: optional i64 createTime
    16: optional i64 updateTime

    254: list<i64> idList
    255: optional base_query.BaseQueryRequest params
}

struct SystemChangeLogResponse {
    3: i64 id                              // ID
    4: string schema
    5: string table
    6: string action
    7: string before
    8: string after
    11: string remark
    12: optional i8 isDelete
    13: i64 createdBy
    14: i64 updatedBy
    15: i64 createTime
    16: i64 updateTime
}

struct SystemChangeLogPageResponse {
    1: required i64 total,
    2: list<SystemChangeLogResponse> records
}