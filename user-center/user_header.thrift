namespace java io.github.kouleen.thrift.user
namespace go user
namespace py user

include "../common/base.thrift"
include "../common/constant.thrift"

struct UserHeaderRequest {
    1: optional list<i64> userIdList
    2: optional string username                     // 用户名
    3: optional string password                     // 用户密码
    4: optional string nickname                     // 用户昵称
    5: optional i32 gender                          // 性别 1：男 2：女
    6: optional string avatar                       // 头像
    7: optional string phone                        // 手机号
    8: optional constant.BaseStatus status          // 状态
    9: optional base.PageRequest PageRequest

    255: optional base.BaseRequest BaseRequest
}

struct UserHeaderResponse {
    1: string username                              // 用户名
    2: string password                              // 用户密码
    3: string nickname                              // 用户昵称
    4: required i32 gender                          // 性别 1：男 2：女
    5: string avatar                                // 头像
    6: string phone                                 // 手机号
    7: required constant.BaseStatus status          // 状态

    255: base.BaseResponse BaseResponse
}

struct UserHeaderPageResponse {
    1: required i64 total,
    2: required list<UserHeaderResponse> records
}

