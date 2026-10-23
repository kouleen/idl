namespace java io.github.kouleen.thrift.workflow
namespace go workflow
namespace py workflow

include "workflow_segment.thrift"

service WorkflowService {
    // 分页工作流程号段信息
    workflow_segment.WorkflowSegmentPageResponse QueryWorkflowSegmentPage(1: workflow_segment.WorkflowSegmentRequest req)
    // 查询工作流程号段信息
    list<workflow_segment.WorkflowSegmentResponse> QueryWorkflowSegmentList(1: workflow_segment.WorkflowSegmentRequest req)
    workflow_segment.WorkflowSegmentResponse QueryWorkflowSegment(1: workflow_segment.WorkflowSegmentRequest req)
    // 创建工作流程号段信息
    bool SaveWorkflowSegment(1: workflow_segment.WorkflowSegmentRequest req)
    // 修改工作流程号段信息
    bool UpdateWorkflowSegment(1: workflow_segment.WorkflowSegmentRequest req)
    bool UpdateWorkflowSegmentStatus(1: workflow_segment.WorkflowSegmentRequest req)
    // 删除工作流程号段信息
    bool DeleteWorkflowSegment(1: workflow_segment.WorkflowSegmentRequest req)
    // 抢占一段工作流程号段
    bool FetchWorkflowSegment(1: workflow_segment.WorkflowSegmentRequest req)
}