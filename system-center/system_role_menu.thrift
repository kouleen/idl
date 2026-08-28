namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

struct SystemRoleMenuRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id                          // ID
    4: optional i64 roleId                      // 角色ID
    5: string roleName                          // 角色名称
    6: optional i32 roleSort                    // 显示顺序
    7: list<i64> menuIds                        // 菜单ID
    8: optional i8 status                       // 状态
    9: string remark                            // 备注
    10: optional i8 isDelete                    // 删除标识 1：删除 0：未删除
    11: optional i64 createdBy                  // 创建人
    12: optional i64 updatedBy                  // 修改人
    13: optional i64 createTime                 // 创建时间
    14: optional i64 updateTime                 // 修改时间
}

struct SystemRoleMenuResponse {
    1: i64 id                   // ID
    2: i64 roleId               // 角色ID
    3: i64 menuId               // 菜单ID
    4: string remark            // 备注
    5: i8 isDelete              // 删除标识 1：删除 0：未删除
    6: i64 createdBy            // 创建人
    7: i64 updatedBy            // 修改人
    8: i64 createTime           // 创建时间
    9: i64 updateTime           // 修改时间
}

struct SystemRoleMenuPageResponse {
    1: required i64 total,
    2: list<SystemRoleMenuResponse> records
}