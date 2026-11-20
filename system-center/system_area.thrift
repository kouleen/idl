namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base_query.thrift"

struct SystemAreaRequest {
    1: optional i64 current
    2: optional i64 size
    3: optional i64 id                              // ID
    4: string areaCode                              // 地区代码
    5: string areaName                              // 地区英文名称
    6: string areaDesc                              // 地区中文名称
    7: string parentCode                            // 上级地区代码
    8: string parentName                            // 上级地区英文名称
    9: string parentDesc                            // 上级地区中文名称
    10: string regionCode                           // 区域代码
    11: string regionName                           // 区域英文名称
    12: string regionDesc                           // 区域中文名称
    13: string countryCode                          // 国家二字码
    14: string countryName                          // 国家英文名称
    15: string countryDesc                          // 国家中文名称
    16: string phoneCode                            // 电话区号
    17: string postalCode                           // 邮政编码
    18: string areaLevelCode                        // 级别

    90: string remark                               // 备注
    91: optional i8 isDelete
    92: optional i64 createdBy
    93: optional i64 updatedBy
    94: optional i64 createTime
    95: optional i64 updateTime

    254: list<i64> idList
    255: optional base_query.BaseQueryRequest params
}

struct SystemAreaResponse {
    3: i64 id                                       // ID
    4: string areaCode                              // 地区代码
    5: string areaName                              // 地区英文名称
    6: string areaDesc                              // 地区中文名称
    7: string parentCode                            // 上级地区代码
    8: string parentName                            // 上级地区英文名称
    9: string parentDesc                            // 上级地区中文名称
    10: string regionCode                           // 区域代码
    11: string regionName                           // 区域英文名称
    12: string regionDesc                           // 区域中文名称
    13: string countryCode                          // 国家二字码
    14: string countryName                          // 国家英文名称
    15: string countryDesc                          // 国家中文名称
    16: string phoneCode                            // 电话区号
    17: string postalCode                           // 邮政编码
    18: string areaLevelCode                        // 级别

    90: string remark                               // 备注
    91: optional i8 isDelete
    92: i64 createdBy
    93: i64 updatedBy
    94: i64 createTime
    95: i64 updateTime
}

struct SystemAreaPageResponse {
    1: required i64 total,
    2: list<SystemAreaResponse> records
}