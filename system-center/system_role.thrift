namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base_query.thrift"

struct SystemRoleRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id                              // ID
    4: string roleName                              // 角色名称
    5: optional i32 roleSort                        // 显示顺序
    6: optional i8 status                           // 状态
    7: string remark                                // 备注
    8: optional i32 isDelete                        // 删除标识 1：删除 0：未删除
    9: optional i64 createdBy                       // 创建人
    10: optional i64 updatedBy                       // 修改人
    11: optional i64 createTime                     // 创建时间
    12: optional i64 updateTime                     // 修改时间
    13: optional list<i64> idList
    14: list<i64> menuIds

    255: optional base_query.BaseQueryRequest params
}

struct SystemRoleResponse {
    1: i64 id                           // ID
    2: string roleName                  // 角色名称
    3: optional i32 roleSort            // 显示顺序
    4: optional i8 status               // 状态
    5: string remark                    // 备注
    6: optional i8 isDelete             // 删除标识 1：删除 0：未删除
    7: i64 createdBy                    // 创建人
    8: i64 updatedBy                    // 修改人
    9: i64 createTime                   // 创建时间
    10: i64 updateTime                   // 修改时间
    11: list<i64> menuIds
}

struct SystemRolePageResponse {
    1: required i64 total,
    2: list<SystemRoleResponse> records
}