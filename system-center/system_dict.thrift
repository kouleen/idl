namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

struct SystemDictHeaderRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id                              // ID
    4: string dictName                              // 字典名称
    5: string dictType                              // 字典类型
    6: optional i8 status                           // 状态  1:启用 0:禁用
    7: string remark                                // 备注
    8: optional i8 isDelete                         // 删除标识 1：删除 0：未删除
    9: optional i64 createdBy                       // 创建人
    10: optional i64 updatedBy                      // 修改人
    11: optional i64 createTime                     // 创建时间
    12: optional i64 updateTime                     // 修改时间
}

struct SystemDictHeaderResponse {
    1: i64 id                                       // ID
    2: string dictName                              // 字典名称
    3: string dictType                              // 字典类型
    4: i8 status                                    // 状态  1:启用 0:禁用
    5: string remark                                // 备注
    6: i8 isDelete                                  // 删除标识 1：删除 0：未删除
    7: i64 createdBy                                // 创建人
    8: i64 updatedBy                                // 修改人
    9: i64 createTime                               // 创建时间
    10: i64 updateTime                              // 修改时间
}

struct SystemDictHeaderPageResponse {
    1: required i64 total,
    2: list<SystemDictHeaderResponse> records
}

struct SystemDictLineRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: i64 id                                       // ID
    4: string dictCode                              // 字典编码
    5: string dictValue                             // 字典值
    6: optional i32 dictSort                        // 健值排序
    7: string dictType                              // 字典类型
    8: string listClass                             // 表格回显样式
    9: optional i8 status                           // 状态   1:启用 0:禁用
    10: string remark                                // 备注
    11: optional i8 isDelete                        // 删除标识 1：删除 0：未删除
    12: optional i64 createdBy                      // 创建人
    13: optional i64 updatedBy                      // 修改人
    14: optional i64 createTime                     // 创建时间
    15: optional i64 updateTime                     // 修改时间
}

struct SystemDictLineResponse {
    1: i64 id                                       // ID
    2: string dictCode                              // 字典编码
    3: string dictValue                             // 字典值
    4: i32 dictSort                                 // 健值排序
    5: string dictType                              // 字典类型
    6: string listClass                             // 表格回显样式
    7: i8 status                                    // 状态   1:启用 0:禁用
    8: string remark                                // 备注
    9: i8 isDelete                                  // 删除标识 1：删除 0：未删除
    10: i64 createdBy                               // 创建人
    11: i64 updatedBy                               // 修改人
    12: i64 createTime                              // 创建时间
    13: i64 updateTime                              // 修改时间
}

struct SystemDictLinePageResponse {
    1: required i64 total,
    2: list<SystemDictLineResponse> records
}

