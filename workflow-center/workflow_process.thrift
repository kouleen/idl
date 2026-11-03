namespace java io.github.kouleen.thrift.workflow
namespace go workflow
namespace py workflow

include "../common/base_query.thrift"

struct WorkflowProcessRequest {
    1: optional i64 current
    2: optional i64 size
    3: optional i64 id                              // ID
    4: string flowNo                                // 流程号
    5: string module                                // 模块类型
    6: string business                              // 业务类型
    7: string tradeNo                               // 关联单号
    9: optional i8 status                           // 流程状态
    10: string remark                               // 备注
    11: optional i8 isDelete                        // 删除
    12: optional i64 createdBy
    13: optional i64 updatedBy
    14: optional i64 createTime
    15: optional i64 updateTime

    253: bool auto                                  // 自动审批标识
    254: list<i64> idList
    255: optional base_query.BaseQueryRequest params
}

struct WorkflowProcessResponse {
    3: i64 id                                       // ID
    4: string flowNo                                // 流程号
    5: string module                                // 模块类型
    6: string business                              // 业务类型
    7: string tradeNo                               // 关联单号
    9: optional i8 status                           // 流程状态
    10: string remark                               // 备注
    11: optional i8 isDelete
    12: i64 createdBy
    13: i64 updatedBy
    14: i64 createTime
    15: i64 updateTime

    254:string createByName
}

struct WorkflowProcessPageResponse {
    1: required i64 total,
    2: list<WorkflowProcessResponse> records
}