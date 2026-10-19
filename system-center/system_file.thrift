namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

struct SystemFileRequest {
    1: binary fileData              // 文件二进制
    2: string fileName              // 原始文件名称
    3: string contentType           // mime类型
    4: i64 fileSize                 // 文件大小
}

struct SystemFileResponse {
    1: string contentType
    2: string fileName
    3: i64 fileSize
    4: string downloadUrl
}

