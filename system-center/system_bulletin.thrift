namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base_query.thrift"

struct SystemBulletinRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id                              // ID
    4: string title
    5: optional i8 type
    6: optional i8 status
    7: string content
    8: optional i8 isDelete
    9: optional i64 createdBy
    10: optional i64 updatedBy
    11: optional i64 createTime
    12: optional i64 updateTime
    13: optional list<i64> idList

    255: optional base_query.BaseQueryRequest params
}

struct SystemBulletinResponse {
    1: i64 id                                       // ID
    2: string title
    3: optional i8 type
    4: optional i8 status
    5: string content
    6: optional i8 isDelete
    7: i64 createdBy
    8: i64 updatedBy
    9: i64 createTime
    10: i64 updateTime
}

struct SystemBulletinPageResponse {
    1: required i64 total,
    2: list<SystemBulletinResponse> records
}
