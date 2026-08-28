namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base.thrift"
include "../common/constant.thrift"

struct SystemTemplateRequest {
    1: string templateCode          // 模板编码
    2: string templateName          // 模板名称
    3: string templateType          // 模板类型
    4: string templateContent       // 模板内容
    5: optional constant.BaseStatus status   // 状态
    6: string remark                // 备注
    7: base.PageRequest PageRequest

    255: base.BaseRequest BaseRequest
}

struct SystemTemplateResponse {
    1: string templateCode          // 模板编码
    2: string templateName          // 模板名称
    3: string templateType          // 模板类型
    4: string templateContent       // 模板内容
    5: constant.BaseStatus status   // 状态
    6: string remark                // 备注

    255: base.BaseResponse BaseResponse
}

struct SystemTemplatePageResponse {
    1: required i64 total,
    2: list<SystemTemplateResponse> records
}