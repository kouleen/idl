namespace java user

struct UserPositionRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id
    4: optional i64 userId                      // 用户id
    5: optional double latitude                 // 纬度
    6: optional double longitude                // 经度
    7: string province                          // 省/州
    8: string city                              // 城市
    9: string district                          // 区县
    10: string street                           // 街道
    11: string fullAddress                      // 完整地址
    12: string country                          // 国家
    13: string countryCode                      // 国家代码
    14: optional i8 isDelete                    // 删除标识 1：删除 0：未删除
    15: optional i64 createdBy                  // 创建人
    16: optional i64 updatedBy                  // 修改人
    17: optional i64 createTime                 // 创建时间
    18: optional i64 updateTime                 // 修改时间
    19: list<i64> idList
}

struct UserPositionResponse {
    1: i64 id                                   // ID
    2: i64 userId                               // 用户id
    3: double latitude                          // 纬度
    4: double longitude                         // 经度
    5: string province                          // 省/州
    6: string city                              // 城市
    7: string district                          // 区县
    8: string street                            // 街道
    9: string fullAddress                       // 完整地址
    10: string country                          // 国家
    11: string countryCode                      // 国家代码
    12: optional i8 isDelete                    // 删除标识 1：删除 0：未删除
    13: i64 createdBy                           // 创建人
    14: i64 updatedBy                           // 修改人
    15: i64 createTime                          // 创建时间
    16: i64 updateTime                          // 修改时间
}

struct UserPositionPageResponse {
    1: required i64 total,
    2: list<UserPositionResponse> records
}
