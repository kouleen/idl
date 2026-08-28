namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

struct SystemRoleRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id                              // ID
    4: string roleName                              // 角色名称
    5: optional i32 roleSort                        // 显示顺序
    6: optional i8 status                           // 状态
    7: optional i32 isDelete                        // 删除标识 1：删除 0：未删除
    8: optional i64 createdBy                       // 创建人
    9: optional i64 updatedBy                       // 修改人
    10: optional i64 createTime                     // 创建时间
    11: optional i64 updateTime                     // 修改时间
    12: list<i64> idList
}

struct SystemRoleResponse {
    1: i64 id                           // ID
    2: string roleName                  // 角色名称
    3: i32 roleSort                     // 显示顺序
    4: i8 status                        // 状态
    5: i8 isDelete                      // 删除标识 1：删除 0：未删除
    6: i64 createdBy                    // 创建人
    7: i64 updatedBy                    // 修改人
    8: i64 createTime                   // 创建时间
    9: i64 updateTime                   // 修改时间
}

struct SystemRolePageResponse {
    1: required i64 total,
    2: list<SystemRoleResponse> records
}