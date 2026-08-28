namespace java user

struct UserPositionRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 userId                      // 用户id
    4: optional double latitude                 // 纬度
    5: optional double longitude                // 经度
    6: string province                          // 省/州
    7: string city                              // 城市
    8: string district                          // 区县
    9: string street                            // 街道
    10: string fullAddress                      // 完整地址
    11: string country                          // 国家
    12: string countryCode                      // 国家代码
    13: optional i8 isDelete                    // 删除标识 1：删除 0：未删除
    14: optional i64 createdBy                  // 创建人
    15: optional i64 updatedBy                  // 修改人
    16: optional i64 createTime                 // 创建时间
    17: optional i64 updateTime                 // 修改时间
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
    12: i8 isDelete                             // 删除标识 1：删除 0：未删除
    13: i64 createdBy                           // 创建人
    14: i64 updatedBy                           // 修改人
    15: i64 createTime                          // 创建时间
    16: i64 updateTime                          // 修改时间
}

struct UserPositionPageResponse {
    1: required i64 total,
    2: list<UserPositionResponse> records
}
