namespace go user

struct UserInfo {
    1: i64    UserId
    2: string Username
    3: string Email
}

struct GetUserRequest {
    1: i64 UserId
}

struct CreateUserRequest {
    1: string Username
    2: string Email
}

struct CommonResponse {
    1: i32  Code
    2: string Msg
    3: UserInfo Data
}

service UserService {
    CommonResponse GetUser(1: GetUserRequest req)
    CommonResponse CreateUser(1: CreateUserRequest req)
}
