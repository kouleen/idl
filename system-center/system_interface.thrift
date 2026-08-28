namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base.thrift"
include "../common/constant.thrift"

struct SystemInterfaceRequest {
    1: string requestPath                   // 请求路径
    2: string interfaceName                 // 接口全类名
    3: optional MethodType methodType       // 方法类型
    4: string methodName                    // 方法名称
    5: string paramTypes                    // 方法参数类型
    6: string version                       // 接口版本
    7: optional constant.BaseStatus status  // 状态
    8: string remark                        // 备注
    9: base.PageRequest PageRequest

    255: base.BaseRequest BaseRequest
}

struct SystemInterfaceResponse {
    1: string requestPath               // 请求路径
    2: string interfaceName             // 接口全类名
    3: MethodType methodType            // 方法类型
    4: string methodName                // 方法名称
    5: string paramTypes                // 方法参数类型
    6: string version                   // 接口版本
    7: constant.BaseStatus status       // 状态
    8: string remark                    // 备注

    255: base.BaseResponse BaseResponse
}

struct SystemInterfacePageResponse {
    1: required i64 total,
    2: list<SystemInterfaceResponse> records
}

enum MethodType {
    GET     = 1
    HEAD    = 2
    POST    = 3
    PUT     = 4
    PATCH   = 5
    DELETE  = 6
    OPTIONS = 7
    TRACE   = 8
}