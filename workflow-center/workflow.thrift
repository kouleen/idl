namespace java io.github.kouleen.thrift.workflow
namespace go workflow
namespace py workflow

include "workflow_segment.thrift"
include "workflow_process.thrift"

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
    // 抢占一段工作流程号段(该方法设计为仅内部 RPC 调用)
    bool FetchWorkflowSegment(1: workflow_segment.WorkflowSegmentRequest req)

    // 分页查询工作流程单据信息
    workflow_process.WorkflowProcessPageResponse QueryWorkflowProcessPage(1: workflow_process.WorkflowProcessRequest req)
    // 查询工作流程单据信息
    workflow_process.WorkflowProcessResponse QueryWorkflowProcess(1: workflow_process.WorkflowProcessRequest req)
    // 创建工作流程单据信息
    workflow_process.WorkflowProcessResponse SaveWorkflowProcess(1: workflow_process.WorkflowProcessRequest req)
    // 修改工作流程单据信息
    bool UpdateWorkflowProcess(1: workflow_process.WorkflowProcessRequest req)
    // 删除工作流程单据信息
    bool DeleteWorkflowProcess(1: workflow_process.WorkflowProcessRequest req)
}