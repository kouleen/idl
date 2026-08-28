namespace java io.github.kouleen.thrift.user
namespace go user
namespace py user

struct UserHeaderRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: list<i64> userIdList
    4: string username                      // 用户名
    5: string password                      // 用户密码
    6: string nickname                      // 用户昵称
    7: optional i8 gender                   // 性别 1：男 2：女
    8: string avatar                        // 头像
    9: string phone                         // 手机号
    10: optional i8 status                  // 状态
    11: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    12: optional i64 createdBy              // 创建人
    13: optional i64 updatedBy              // 修改人
    14: optional i64 createTime             // 创建时间
    15: optional i64 updateTime             // 修改时间
}

struct UserHeaderResponse {
    1: i64 id                               // ID
    2: string username                      // 用户名
    3: string password                      // 用户密码
    4: string nickname                      // 用户昵称
    5: i8 gender                            // 性别 1：男 2：女
    6: string avatar                        // 头像
    7: string phone                         // 手机号
    8: i8 status                            // 状态
    9: i8 isDelete                          // 删除标识 1：删除 0：未删除
    10: i64 createdBy                       // 创建人
    11: i64 updatedBy                       // 修改人
    12: i64 createTime                      // 创建时间
    13: i64 updateTime                      // 修改时间
}

struct UserHeaderPageResponse {
    1: required i64 total,
    2: list<UserHeaderResponse> records
}

