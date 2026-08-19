namespace java user

include "../common/base.thrift"

struct PageRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
}

struct UserPositionRequest {
    // 用户id
    1: optional i64 userId
    // 纬度
    2: optional double latitude
    // 经度
    3: optional double longitude
    // 省/州
    4: optional string province
    // 城市
    5: optional string city
    // 区县
    6: optional string district
    // 街道
    7: optional string street
    // 完整地址
    8: optional string fullAddress
    // 国家
    9: optional string country
    // 国家代码
    10: optional string countryCode
    11: optional PageRequest PageRequest
    255: optional base.BaseRequest BaseRequest
}

struct UserPositionResponse {
    // 用户id
    1: optional i64 userId
    // 纬度
    2: optional double latitude
    // 经度
    3: optional double longitude
    // 省/州
    4: optional string province
    // 城市
    5: optional string city
    // 区县
    6: optional string district
    // 街道
    7: optional string street
    // 完整地址
    8: optional string fullAddress
    // 国家
    9: optional string country
    // 国家代码
    10: optional string countryCode

    255: base.BaseResponse BaseResponse
}

struct UserPositionPageResponse {
    1: required i64 total,
    2: required list<UserPositionResponse> records
}
