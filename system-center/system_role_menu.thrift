namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

struct SystemRoleMenuRequest {
    3: optional i64 id                              // ID
    4: optional i64 roleId                          // 角色ID
    5: optional i64 menuId                          // 菜单ID
    7: string remark                                // 备注
    8: optional i8 isDelete                         // 删除标识 1：删除 0：未删除
    9: optional i64 createdBy                       // 创建人
    10: optional i64 updatedBy                      // 修改人
    11: optional i64 createTime                     // 创建时间
    12: optional i64 updateTime                     // 修改时间

    253: list<i64> menuIds
    254: list<i64> idList
}

struct SystemRoleMenuResponse {
    3: i64 id                              // ID
    4: i64 roleId
    5: i64 menuId
    7: string remark                       // 备注
    8: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    9: i64 createdBy                       // 创建人
    10: i64 updatedBy                      // 修改人
    11: i64 createTime                     // 创建时间
    12: i64 updateTime                     // 修改时间
}
