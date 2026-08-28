namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

struct SystemRoleUserRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id                          // ID
    4: optional i64 roleId                      // 角色ID
    5: list<i64> userIdList                     // 用户ID
    6: string username                          // 用户名称
    7: string nickname                          // 用户昵称
    8: string phone                             // 手机号
    9: string remark                            // 备注
    10: optional i8 isDelete                     // 删除标识 1：删除 0：未删除
    11: optional i64 createdBy                  // 创建人
    12: optional i64 updatedBy                  // 修改人
    13: optional i64 createTime                 // 创建时间
    14: optional i64 updateTime                 // 修改时间
}

struct SystemRoleUserResponse {
    1: i64 id                           // ID
    2: i64 roleId                       // 角色ID
    3: string roleName                  // 角色名称
    4: i64 userId                       // 用户ID
    5: string username                  // 用户名
    6: string nickname                  //用户昵称
    7: i8 gender                        // 性别 1:男 2:女
    8: string avatar                    // 头像
    9: string phone                     // 手机号
    10: i8 status                       // 状态
    11: string remark                   // 备注
    12: i8 isDelete                     // 删除标识 1：删除 0：未删除
    13: i64 createdBy                   // 创建人
    14: i64 updatedBy                   // 修改人
    15: i64 createTime                  // 创建时间
    16: i64 updateTime                  // 修改时间
}

struct SystemRoleUserPageResponse {
    1: required i64 total,
    2: list<SystemRoleUserResponse> records
}