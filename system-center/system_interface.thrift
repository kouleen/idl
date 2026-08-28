namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

struct SystemInterfaceRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id                      // ID
    4: string requestPath                   // 请求路径
    5: string interfaceName                 // 接口全类名
    6: optional i8 methodType               // 方法类型
    7: string methodName                    // 方法名称
    8: string paramTypes                    // 方法参数类型
    9: string version                       // 接口版本
    10: optional i8 status                  // 状态
    11: string remark                       // 备注
    12: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    13: optional i64 createdBy              // 创建人
    14: optional i64 updatedBy              // 修改人
    15: optional i64 createTime             // 创建时间
    16: optional i64 updateTime             // 修改时间
}

struct SystemInterfaceResponse {
    1: i64 id                           // ID
    2: string requestPath               // 请求路径
    3: string interfaceName             // 接口全类名
    4: i8 methodType                    // 方法类型
    5: string methodName                // 方法名称
    6: string paramTypes                // 方法参数类型
    7: string version                   // 接口版本
    8: i8 status                        // 状态
    9: string remark                    // 备注
    10: i8 isDelete                     // 删除标识 1：删除 0：未删除
    11: i64 createdBy                   // 创建人
    12: i64 updatedBy                   // 修改人
    13: i64 createTime                  // 创建时间
    14: i64 updateTime                  // 修改时间
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