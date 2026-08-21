namespace java io.github.kouleen.thrift.user
namespace go user
namespace py user

include "user_login.thrift"
include "user_header.thrift"
include "user_position.thrift"

service UserHeaderService {
    // 用户登录
    user_login.LoginResponse Login(1: user_login.LoginRequest loginRequest)
    // 发送手机号验证码
    bool SendSmsMessage(1: user_login.LoginRequest loginRequest)
    // 退出登录
    bool Logout(1: user_login.LoginRequest loginRequest)
    // 分页查询用户信息
    user_header.UserHeaderPageResponse QueryUserHeaderPage(1: user_header.UserHeaderRequest userHeaderRequest)
    // 查询用户信息
    list<user_header.UserHeaderResponse> QueryUserHeaderList(1: user_header.UserHeaderRequest userHeaderRequest)
    // 查询登录用户信息
    user_header.UserHeaderResponse QueryUserHeaderInfo(1: user_header.UserHeaderRequest userHeaderRequest)

    // 分页查询用户位置信息
    user_position.UserPositionPageResponse QueryUserPositionPage(1: user_position.UserPositionRequest userPositionRequest)
    // 创建用户位置
    bool SaveUserPosition(1: user_position.UserPositionRequest userPositionRequest)
    // 修改用户位置
    bool UpdateUserPosition(1: user_position.UserPositionRequest userPositionRequest)
    // 删除用户位置
    bool DeleteUserPosition(1: user_position.UserPositionRequest userPositionRequest)
}