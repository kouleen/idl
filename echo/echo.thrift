namespace go echo

struct EchoRequest {
    1: string Message
}

struct EchoResponse {
    1: string Message
    2: i32    Code
}

service EchoService {
    EchoResponse Echo(1: EchoRequest req)
}
