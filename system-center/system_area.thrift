namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base_query.thrift"

struct SystemAreaRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id                              // ID
    4: string areaCode                              // 地区代码
    5: string areaName                              // 地区名称
    6: string areaDesc                              // 地区描述
    7: string parentCode                            // 上级地区代码
    8: string parentName                            // 上级地区名称
    9: string regionCode                            // 区域代码
    10: string regionName                           // 区域名称
    11: string regionDesc                           // 区域描述
    12: string countryCode                          // 国家二字码
    13: string countryName                          // 国家名称
    14: string countryDesc                          // 国家描述
    15: string phoneCode                            // 电话区号
    16: string areaLevelCode                        // 级别
    17: string remark                               // 备注
    18: optional i8 isDelete
    19: optional i64 createdBy
    20: optional i64 updatedBy
    21: optional i64 createTime
    22: optional i64 updateTime

    254: optional list<i64> idList
    255: optional base_query.BaseQueryRequest params
}

struct SystemAreaResponse {
    3: i64 id                                       // ID
    4: string areaCode                              // 地区代码
    5: string areaName                              // 地区名称
    6: string areaDesc                              // 地区描述
    7: string parentCode                            // 上级地区代码
    8: string parentName                            // 上级地区名称
    9: string regionCode                            // 区域代码
    10: string regionName                           // 区域名称
    11: string regionDesc                           // 区域描述
    12: string countryCode                          // 国家二字码
    13: string countryName                          // 国家名称
    14: string countryDesc                          // 国家描述
    15: string phoneCode                            // 电话区号
    16: string areaLevelCode                        // 级别
    17: string remark                               // 备注
    18: optional i8 isDelete
    19: i64 createdBy
    20: i64 updatedBy
    21: i64 createTime
    22: i64 updateTime
}

struct SystemAreaPageResponse {
    1: required i64 total,
    2: list<SystemAreaResponse> records
}