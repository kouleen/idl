namespace java io.github.kouleen.thrift.user
namespace go user
namespace py user

struct RegisterRequest {
    1: string username      // 用户名称
    2: string password      // 用户密码
    3: string nickname
    4: string gender
    5: string phone
    6: string code
    7: string uuid
}
