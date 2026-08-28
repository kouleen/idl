namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base.thrift"
include "../common/constant.thrift"



struct SystemRoleRequest {
    1:  string roleName               // 角色名称
    2: optional i32 roleSort                  // 显示顺序
    3: optional constant.BaseStatus status    // 状态
    4: list<i64> idList
    5: base.PageRequest PageRequest

    255: base.BaseRequest BaseRequest
}

struct SystemRoleResponse {
    1: string roleName               // 角色名称
    2: i32 roleSort                  // 显示顺序
    3: constant.BaseStatus status    // 状态

    255: base.BaseResponse BaseResponse
}

struct SystemRolePageResponse {
    1: required i64 total,
    2: list<SystemRoleResponse> records
}