namespace java io.github.kouleen.thrift.payment
namespace go payment
namespace py payment

include 'payment_recharge.thrift'
include 'payment_recharge_source.thrift'

service PaymentService {
    // 分页查询充值订单列表
    payment_recharge.PaymentRechargePageResponse QueryPaymentRechargePage(1: payment_recharge.PaymentRechargeRequest req)
    payment_recharge.PaymentRechargeResponse QueryPaymentRecharge(1: payment_recharge.PaymentRechargeRequest req)
    // 创建充值订单
    payment_recharge.PaymentRechargeResponse SyncPaymentRecharge(1: payment_recharge.PaymentRechargeRequest req)

    // 创建充值订单
    bool CreatePaymentRecharge(1: payment_recharge.PaymentRechargeRequest req)
    // 修改充值订单
    bool UpdatePaymentRecharge(1: payment_recharge.PaymentRechargeRequest req)
    // 提交充值订单
    bool CommitPaymentRecharge(1: payment_recharge.PaymentRechargeRequest req)
    // 关闭充值订单
    bool ClosePaymentRecharge(1: payment_recharge.PaymentRechargeRequest req)
}