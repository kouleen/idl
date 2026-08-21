namespace java io.github.kouleen.thrift.common
namespace go common
namespace py common

struct BaseRequest {
    1: optional i64 id          // ID
    2: optional i32 isDelete    // 删除标识 1：删除 0：未删除
    3: optional i64 createdBy   // 创建人
    4: optional i64 updatedBy   // 修改人
    5: optional i64 createTime  // 创建时间
    6: optional i64 updateTime  // 修改时间
}

struct BaseResponse {
    1: i64 id                   // ID
    2: i32 isDelete             // 删除标识 1：删除 0：未删除
    3: i64 createdBy            // 创建人
    4: i64 updatedBy            // 修改人
    5: i64 createTime           // 创建时间
    6: i64 updateTime           // 修改时间
}



