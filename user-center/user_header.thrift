namespace java io.github.kouleen.thrift.user
namespace go user
namespace py user

include "../common/base.thrift"
include "../common/constant.thrift"

struct UserHeaderRequest {
    1: list<i64> userIdList
    2: string username                     // 用户名
    3: string password                     // 用户密码
    4: string nickname                     // 用户昵称
    5: optional i32 gender                          // 性别 1：男 2：女
    6: string avatar                       // 头像
    7: string phone                        // 手机号
    8: optional constant.BaseStatus status          // 状态
    9: base.PageRequest PageRequest

    255: base.BaseRequest BaseRequest
}

struct UserHeaderResponse {
    1: string username                              // 用户名
    2: string password                              // 用户密码
    3: string nickname                              // 用户昵称
    4: required i32 gender                          // 性别 1：男 2：女
    5: string avatar                                // 头像
    6: string phone                                 // 手机号
    7: constant.BaseStatus status          // 状态

    255: base.BaseResponse BaseResponse
}

struct UserHeaderPageResponse {
    1: required i64 total,
    2: list<UserHeaderResponse> records
}

