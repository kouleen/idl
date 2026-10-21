namespace java io.github.kouleen.thrift.workflow
namespace go workflow
namespace py workflow

include "../common/base_query.thrift"

struct WorkflowSegmentRequest {
    1: optional i64 current
    2: optional i64 size
    3: optional i64 id                              // ID
    4: string bizTag                                // 业务标识
    5: optional i64 maxId                           // 已分配到的最大ID
    6: optional i64 step                            // 每次申领步长
    7: optional i64 startId                         // 起始ID
    8: optional i64 endId                           // 上限ID
    9: optional i8 status                           // 状态
    10: string remark                               // 备注
    11: optional i8 isDelete
    12: optional i64 createdBy
    13: optional i64 updatedBy
    14: optional i64 createTime
    15: optional i64 updateTime

    254: list<i64> idList
    255: optional base_query.BaseQueryRequest params
}

struct WorkflowSegmentResponse {
    3: i64 id                              // ID
    4: string bizTag                       // 业务标识
    5: i64 maxId                           // 已分配到的最大ID
    6: i64 step                            // 每次申领步长
    7: i64 startId                         // 起始ID
    8: i64 endId                           // 上限ID
    9: optional i8 status                  // 状态
    10: string remark                      // 备注
    11: optional i8 isDelete
    12: i64 createdBy
    13: i64 updatedBy
    14: i64 createTime
    15: i64 updateTime
}

struct WorkflowSegmentPageResponse {
    1: required i64 total,
    2: list<WorkflowSegmentResponse> records
}