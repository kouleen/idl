namespace java user

include "../common/base.thrift"

struct UserPositionRequest {
    1: optional i64 userId                  // 用户id
    2: optional double latitude             // 纬度
    3: optional double longitude            // 经度
    4: string province             // 省/州
    5: string city                 // 城市
    6: string district             // 区县
    7: string street               // 街道
    8: string fullAddress          // 完整地址
    9: string country              // 国家
    10: string countryCode         // 国家代码
    11: base.PageRequest PageRequest
    255: base.BaseRequest BaseRequest
}

struct UserPositionResponse {
    1: i64 userId                  // 用户id
    2: double latitude             // 纬度
    3: double longitude            // 经度
    4: string province             // 省/州
    5: string city                 // 城市
    6: string district             // 区县
    7: string street               // 街道
    8: string fullAddress          // 完整地址
    9: string country              // 国家
    10: string countryCode         // 国家代码

    255: base.BaseResponse BaseResponse
}

struct UserPositionPageResponse {
    1: required i64 total,
    2: list<UserPositionResponse> records
}
