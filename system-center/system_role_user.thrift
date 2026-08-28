namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base.thrift"
include "../common/constant.thrift"

struct SystemRoleUserRequest {
    1: optional i64 roleId                      // 角色ID
    2: list<i64> userIdList            // 用户ID
    3: string username                 // 用户名称
    4: string nickname                 // 用户昵称
    5: string phone                    // 手机号
    6: string remark                   // 备注
    7: base.PageRequest PageRequest

    255: base.BaseRequest BaseRequest
}

struct SystemRoleUserResponse {
    1: i64 roleId                       // 角色ID
    2: string roleName                  // 角色名称
    3: i64 userId                       // 用户ID
    4: string username                  // 用户名
    5: string nickname                  //用户昵称
    6: i32 gender                       // 性别 1:男 2:女
    7: string avatar                    // 头像
    8: string phone                     // 手机号
    9: constant.BaseStatus status       // 状态
    10: string remark                   // 备注

    255: base.BaseResponse BaseResponse
}

struct SystemRoleUserPageResponse {
    1: required i64 total,
    2: list<SystemRoleUserResponse> records
}