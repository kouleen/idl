namespace java io.github.kouleen.thrift.common
namespace go common
namespace py common

struct BaseRequest {
    1: optional i64 id
    2: optional i32 isDelete
    3: optional i64 createdBy
    4: optional i64 updatedBy
    5: optional i64 createTime
    6: optional i64 updateTime
}

struct BaseResponse {
    1: i64 id
    2: i32 isDelete
    3: i64 createdBy
    4: i64 updatedBy
    5: i64 createTime
    6: i64 updateTime
}

