namespace java io.github.kouleen.thrift.user
namespace go user
namespace py user

include "../common/base_query.thrift"

struct UserIdentityRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id
    4: string userCode                      // 用户编码
    5: string username                      // 用户名
    6: optional i8 gender                   // 性别 1：男 2：女
    7: string phone                         // 手机号
    9: optional i8 isDelete                 // 删除标识 1：删除 0：未删除
    10: i64 createdBy                       // 创建人
    11: i64 updatedBy                       // 修改人
    12: i64 createTime                      // 创建时间
    13: i64 updateTime                      // 修改时间
    14: list<i64> idList
    255: optional base_query.BaseQueryRequest params
}

struct UserIdentityResponse {
    1: i64 id                               // ID
    2: string userCode                      // 用户编码
    3: string username                      // 用户名
    5: optional i8 gender                   // 性别 1：男 2：女
    7: string phone                         // 手机号
    9: optional i8 isDelete                 // 删除标识 1：删除 0：未删除
    10: i64 createdBy                       // 创建人
    11: i64 updatedBy                       // 修改人
    12: i64 createTime                      // 创建时间
    13: i64 updateTime                      // 修改时间
}

struct UserIdentityPageResponse {
    1: required i64 total,
    2: list<UserIdentityResponse> records
}