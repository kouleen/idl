namespace java io.github.kouleen.thrift.common
namespace go common
namespace py common

struct BaseResp {
    1: string sign
    2: required HttpStatus code
    3: string message
    4: optional string data
    5: required string traceId
    6: required i64 timestamp
}

enum HttpStatus {
    SUCCESS = 200,
    ERROR = 500,
    UNAUTHORIZED = 401,
    FORBIDDEN = 403
}

