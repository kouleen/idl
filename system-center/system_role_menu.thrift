namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base.thrift"
include "../common/constant.thrift"

struct SystemRoleMenuRequest {
    1: optional i64 roleId                      // 角色ID
    2: string roleName                 // 角色名称
    3: optional i32 roleSort                    // 显示顺序
    4: list<i64> menuIds               // 菜单ID
    5: optional constant.BaseStatus status      // 状态
    6: string remark                   // 备注
    7: base.PageRequest PageRequest

    255: base.BaseRequest BaseRequest
}

struct SystemRoleMenuResponse {
    1: i64 roleId       // 角色ID
    2: i64 menuId       // 菜单ID
    3: string remark    // 备注

    255: base.BaseResponse BaseResponse
}

struct SystemRoleMenuPageResponse {
    1: required i64 total,
    2: list<SystemRoleMenuResponse> records
}