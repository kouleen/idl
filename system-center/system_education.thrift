namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base_query.thrift"

struct SystemEducationRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id                              // ID
    4: string title
    5: optional i8 hits
    6: string remark
    7: optional i8 isDelete
    8: optional i64 createdBy
    9: optional i64 updatedBy
    10: optional i64 createTime
    11: optional i64 updateTime

    255: optional base_query.BaseQueryRequest params
}

struct SystemEducationResponse {
    1: i64 id                                       // ID
    4: string title
    5: optional i8 hits
    6: string remark
    7: optional i8 isDelete
    8: i64 createdBy
    9: i64 updatedBy
    10: i64 createTime
    11: i64 updateTime
}

struct SystemEducationPageResponse {
    1: required i64 total,
    2: list<SystemEducationResponse> records
}