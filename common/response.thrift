namespace java io.github.kouleen.thrift.common
namespace go common
namespace py common

struct BaseResponse {
    1: optional string sign
    2: required HttpStatus code
    3: optional string message
    4: optional string data
    5: optional string traceId
}

enum HttpStatus {
    SUCCESS = 200,
    ERROR = 500,
    UNAUTHORIZED = 401,
    FORBIDDEN = 403
}

