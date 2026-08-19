namespace java io.github.kouleen.thrift.user
namespace go user
namespace py user

include "user_login.thrift"
include "user_header.thrift"
include "user_position.thrift"

service UserHeaderService {
    user_login.LoginResponse Login(1: user_login.LoginRequest loginRequest)
    bool SendSmsMessage(1: user_login.LoginRequest loginRequest)
    bool Logout(1: user_login.LoginRequest loginRequest)

    user_header.UserHeaderPageResponse QueryUserHeaderPage(1: user_header.UserHeaderRequest userHeaderRequest)
    list<user_header.UserHeaderResponse> QueryUserHeaderList(1: user_header.UserHeaderRequest userHeaderRequest)
    user_header.UserHeaderResponse QueryUserHeaderInfo(1: user_header.UserHeaderRequest userHeaderRequest)

    user_position.UserPositionPageResponse QueryUserPositionPage(1: user_position.UserPositionRequest userPositionRequest)
    bool SaveUserPosition(1: user_position.UserPositionRequest userPositionRequest)
    bool UpdateUserPosition(1: user_position.UserPositionRequest userPositionRequest)
    bool DeleteUserPosition(1: user_position.UserPositionRequest userPositionRequest)
}