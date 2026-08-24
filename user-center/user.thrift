namespace java io.github.kouleen.thrift.user
namespace go user
namespace py user

include "user_login.thrift"
include "user_header.thrift"
include "user_register.thrift"
include "user_position.thrift"

service UserService {
    // 发送图形验证码
    bool Captcha(1: user_login.LoginRequest req)
    // 发送手机号验证码
    bool SmsCode(1: string phone)
    // 用户登录
    user_login.LoginResponse Login(1: user_login.LoginRequest req)
    // 用户注册
    bool Register(1: user_register.RegisterRequest req)
    // 重置密码
    bool ResetPwd(1: user_login.LoginRequest req)
    // 退出登录
    bool Logout(1: user_login.LoginRequest req)
    // 分页查询用户信息
    user_header.UserHeaderPageResponse QueryUserHeaderPage(1: user_header.UserHeaderRequest req)
    // 查询用户信息
    list<user_header.UserHeaderResponse> QueryUserHeaderList(1: user_header.UserHeaderRequest req)
    // 查询登录用户信息
    user_header.UserHeaderResponse QueryUserHeaderInfo(1: user_header.UserHeaderRequest req)

    // 分页查询用户位置信息
    user_position.UserPositionPageResponse QueryUserPositionPage(1: user_position.UserPositionRequest req)
    // 创建用户位置
    bool SaveUserPosition(1: user_position.UserPositionRequest req)
    // 修改用户位置
    bool UpdateUserPosition(1: user_position.UserPositionRequest req)
    // 删除用户位置
    bool DeleteUserPosition(1: user_position.UserPositionRequest req)
}