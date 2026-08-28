namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

struct SystemTemplateRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id              // ID
    4: string templateCode          // 模板编码
    5: string templateName          // 模板名称
    6: string templateType          // 模板类型
    7: string templateContent       // 模板内容
    8: optional i8 status           // 状态
    9: string remark                // 备注
    10: optional i8 isDelete        // 删除标识 1：删除 0：未删除
    11: optional i64 createdBy      // 创建人
    12: optional i64 updatedBy      // 修改人
    13: optional i64 createTime     // 创建时间
}

struct SystemTemplateResponse {
    1: i64 id                       // ID
    2: string templateCode          // 模板编码
    3: string templateName          // 模板名称
    4: string templateType          // 模板类型
    5: string templateContent       // 模板内容
    6: i8 status                    // 状态
    7: string remark                // 备注
    8: i8 isDelete                  // 删除标识 1：删除 0：未删除
    9: i64 createdBy                // 创建人
    10: i64 updatedBy               // 修改人
    11: i64 createTime              // 创建时间
    12: i64 updateTime              // 修改时间
}

struct SystemTemplatePageResponse {
    1: required i64 total,
    2: list<SystemTemplateResponse> records
}