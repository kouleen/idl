namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base.thrift"
include "../common/constant.thrift"

struct SystemDictHeaderRequest {
    1: string dictName                     // 字典名称
    2: string dictType                     // 字典类型
    3: optional constant.BaseStatus status          // 状态
    4: string remark                       // 备注
    5: base.PageRequest PageRequest

    255: base.BaseRequest BaseRequest
}

struct SystemDictHeaderResponse {
    1: string dictName                              // 字典名称
    2: string dictType                              // 字典类型
    3: constant.BaseStatus status                   // 状态
    4: string remark                                // 备注

    255: base.BaseResponse BaseResponse
}

struct SystemDictHeaderPageResponse {
    1: required i64 total,
    2: list<SystemDictHeaderResponse> records
}

struct SystemDictLineRequest {
    1: string dictCode                     // 字典编码
    2: string dictValue                    // 字典值
    3: optional i32 dictSort                        // 健值排序
    4: string dictType                     // 字典类型
    5: string listClass                    // 表格回显样式
    6: optional constant.BaseStatus status          // 状态
    7: string remark                       // 备注
    8: base.PageRequest PageRequest

    255: base.BaseRequest BaseRequest
}

struct SystemDictLineResponse {
    1: string dictCode                              // 字典编码
    2: string dictValue                             // 字典值
    3: i32 dictSort                                 // 健值排序
    4: string dictType                              // 字典类型
    5: string listClass                             // 表格回显样式
    6: constant.BaseStatus status                   // 状态
    7: string remark                                // 备注

    255: base.BaseResponse BaseResponse
}

struct SystemDictLinePageResponse {
    1: required i64 total,
    2: list<SystemDictLineResponse> records
}

