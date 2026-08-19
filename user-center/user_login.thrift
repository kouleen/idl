namespace java io.github.kouleen.thrift.user
namespace go user
namespace py user

struct LoginRequest {
    1: string username
    2: string phone
    3: string code
    4: string password
    5: optional i32 loginType
    6: string uuid
}

struct LoginResponse {
    1: string accessToken
    2: optional i64 expireTime
}

