namespace java io.github.kouleen.thrift.user
namespace go user
namespace py user

include "../common/base.thrift"

struct PageRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
}

struct UserHeaderRequest {
    1: optional list<i64> userIdList
    2: optional string username
    3: optional string password
    4: optional string nickname
    5: optional i32 gender
    6: optional string avatar
    7: optional string phone
    8: optional i32 status
    9: optional PageRequest PageRequest

    255: optional base.BaseRequest BaseRequest
}

struct UserHeaderResponse {
    1: string username
    2: string password
    3: string nickname
    4: required i32 gender
    5: string avatar
    6: string phone
    7: required i32 status

    255: base.BaseResponse BaseResponse
}

struct UserHeaderPageResponse {
    1: required i64 total,
    2: required list<UserHeaderResponse> records
}

