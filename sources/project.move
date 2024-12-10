module MyModule::SubscriptionService {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct Subscription has store, key {
        payment_amount: u64, // Amount to be paid per cycle
        next_payment_due: u64, // Timestamp of the next payment
    }

    /// Function to start a new subscription by setting the payment amount and next payment due date.
    public fun start_subscription(subscriber: &signer, amount: u64, due_date: u64) {
        let subscription = Subscription {
            payment_amount: amount,
            next_payment_due: due_date,
        };
        move_to(subscriber, subscription);
    }

}
