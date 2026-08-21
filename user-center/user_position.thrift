namespace java user

include "../common/base.thrift"

struct UserPositionRequest {
    1: optional i64 userId                  // 用户id
    2: optional double latitude             // 纬度
    3: optional double longitude            // 经度
    4: optional string province             // 省/州
    5: optional string city                 // 城市
    6: optional string district             // 区县
    7: optional string street               // 街道
    8: optional string fullAddress          // 完整地址
    9: optional string country              // 国家
    10: optional string countryCode         // 国家代码
    11: optional base.PageRequest PageRequest
    255: optional base.BaseRequest BaseRequest
}

struct UserPositionResponse {
    1: optional i64 userId                  // 用户id
    2: optional double latitude             // 纬度
    3: optional double longitude            // 经度
    4: optional string province             // 省/州
    5: optional string city                 // 城市
    6: optional string district             // 区县
    7: optional string street               // 街道
    8: optional string fullAddress          // 完整地址
    9: optional string country              // 国家
    10: optional string countryCode         // 国家代码

    255: base.BaseResponse BaseResponse
}

struct UserPositionPageResponse {
    1: required i64 total,
    2: required list<UserPositionResponse> records
}
