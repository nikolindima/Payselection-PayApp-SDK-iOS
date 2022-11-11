## Payselection-PayApp-SDK-iOS

PaySelection PayApp SDK позволяет интегрировать прием платежей в мобильное приложение для платформы iOS.

### Требования
Для работы PaySelection PayApp SDK необходима iOS версии 13.0 или выше

### Подключение
#### SPM

```
 dependencies: [
  .package(url: "https://github.com/Payselection/Payselection-PayApp-SDK-iOS", from: "1.0.0"),
  ]
```
#### Cocoapods

```
 pod 'PayselectionPayAppSDK'
```

### Полезные ссылки

[Личный кабинет](https://merchant.payselection.com/login/)

[Разработчикам](https://api.payselection.com/#section/Request-signature)

### Структура проекта:

* **Sources/PayselectionPayAppSDK** - Исходный код SDK


### Возможности PaySelection PayApp SDK:

Вы можете с помощью SDK:

* создать заказ и совершить платеж картой
* получить все транзакции по заказу
* получить детализацию по конкретной транзации
* запросить возврат по заказу

### Инициализация PaySelection SDK:

1.	Создайте структуру с данными из личного кабинета мерчанта

```
let merchantId = "20176" // Site ID
let pubkey = "04a30442ffd031bd4f1837f1f3651e6b0bb296b3cc837462b93967cb8ad0faf3c6d011d46b94377832ddfcbd0bb05de8084a9dd7048ee91d172f075ff3e33e832d" // Публичный ключ
let merchantSecretKey = "PE4svxAN4Rm5RvUf" // Секретный ключ

let merchantCreds = MerchantCredentials(merchantId: merchantId, 
                                        publicKey: pubkey, 
                                        secretKey: merchantSecretKey)
```

2.	Создайте экземпляр PaySelectionApi для работы с API

```
let api = PaySelectionApi(merchantCredentials: merchantCreds)
```

### Оплата с использованием PaySelection SDK:

1. Создайте структуру CustomerInfo с информацией о клиенте, обязактельным является лишь поле "ip", остальные - опциональные.

```
let customerInfo = CustomerInfo(ip: "10.0.42.42")
```


2. Создайте структуру PaymentFormData с информацией о транзакции и данными карты, передав туда customerInfo. Внимание! Все поля обязательны для заполнения. Так же необходимо валидировать передаваемые данные, иначе сервер вернет ошибку. Подробнее о форматах можно прочесть в документации  [Payselection API](https://api.payselection.com/#section/Request-signature).

```
 let messageExpiration = String(Int64(Date().timeIntervalSince1970 * 1000 + 86400000)) // 24 часа 
 
 let paymentFormData = PaymentFormData(amount: "123",
                                       currency: .rub,
                                       cardNumber: "4129436949329530",
                                       cardExpMonth: "06",
                                       cardExpYear: "24",
                                       cardHolderName: "Card Holder",
                                       cvc: "321",
                                       messageExpiration: messageExpiration, // строковое значение времени в миллисекундах, пример получения указан выше
                                       orderId: "",                          // уникальный номер заказа. Можно использовать UUID().uuidString
                                       description: "My Transaction",        // строка должна быть не пустой, иначе сервер вернет ошибку
                                       customerInfo: customerInfo)
```

4. Вызовите метод pay

```
 api.pay(paymentFormData: paymentFormData) { result in
            switch result {
            case .success(let payResult):
                print(payResult)
            case .failure(let error):
                print(error)
            }
        }
```

### Другие методы PaySelection SDK:

1. Получение всех транзакций по заказку

```
 api.getOrderStatus(orderId: payResult.orderId) { result in
            switch result {
            case .success(let statusResult):
                print(statusResult)
            case .failure(let error):
                print(error)
            }
        }
```

2. Получение статуса одной транзакции

```
 api.getTransactionStatus(transactionId: payResult.transactionId) { result in
            switch result {
            case .success(let statusResult):
                print(statusResult)
            case .failure(let error):
                print(error)
            }
        }
```

3. Оформление возврата

```
 let refundData = RefundData(transactionId: payResult.transactionId,
                                    amount: payResult.amount,
                                    currency: payResult.currency)
        
 api.refund(refundData: refundData) { result in
        switch result {
        case .success(let refundResult):
            print(refundResult)
        case .failure(let error):
            print(error)
        }
     }
```

4. Завершения одностадийной/двухстадийной операции оплаты

```
let confirmData = ConfirmData(transactionId: payResult.orderId,
                                      orderId: payResult.transactionId,
                                      paReq: "String",
                                      md: "String")
        
 api.confirm(confirmData: confirmData) { result in
         switch result {
         case .success(let confirmResult):
             print(confirmResult)
         case .failure(let error):
             print(error)
         }
      }
```

### Поддержка

По возникающим вопросам техничечкого характера обращайтесь на support@payselection.com
