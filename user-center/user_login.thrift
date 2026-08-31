namespace java io.github.kouleen.thrift.user
namespace go user
namespace py user

struct LoginRequest {
    1: string username                  // 用户名
    2: string phone                     // 手机号
    3: string code                      // 验证码
    4: string password                  // 密码
    5: optional i8 loginType            // 登录方式
    6: string uuid                      // 验证码唯一标识
    7: bool remember                    // 记住
}

struct LoginResponse {
    1: string accessToken
    2: i64 expireTime
}

struct CaptchaResponse {
    1: bool captchaEnabled
    2: string img
    3: string uuid
}

enum LoginType {
    LOGIN_PHONE = 1         // 手机号登录
    LOGIN_PWD   = 2         // 密码登录
}

