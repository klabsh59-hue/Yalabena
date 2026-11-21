# دورة طلبات السحب — 0.8.1

## مسارات الكابتن
- `POST /v1/wallet/captain/withdrawals` — body: `amount`, `payoutMethod` (`instapay|bank_transfer|mobile_wallet|cash`), `payoutDestination`.
- `GET /v1/wallet/captain/withdrawals` — يعرض طلبات المستخدم الحالي فقط.
- `GET /v1/wallet/captain/summary` — يتضمن `available_balance` و`reserved_balance`.

## مسارات الإدارة
- `GET /v1/wallet/admin/withdrawals` — قائمة الطلبات.
- `POST /v1/wallet/admin/withdrawals/:id/review` — body: `{"decision":"approve"}` أو `{"decision":"reject","rejectionReason":"..."}`.
- `POST /v1/wallet/admin/withdrawals/:id/paid` — body: `{"externalReference":"..."}` بعد تنفيذ الصرف فعليًا.

## القيود المالية
- إنشاء الطلب يقفل صف الكابتن ويحسب دفتر القيود داخل معاملة واحدة، ثم يضيف قيد `payout` سالبًا للحجز.
- الرفض يضيف قيد `payout_reversal` موجبًا؛ قيد فريد لكل نوع مرتبط بطلب السحب يمنع التكرار.
- الاعتماد لا يضيف خصمًا جديدًا. تسجيل `paid` لا يخصم مرة ثانية لأن الحجز تم وقت إنشاء الطلب.
- لا يمكن صرف طلب غير معتمد أو صرف الطلب نفسه مرتين.
- كل المسارات محمية JWT والأدوار؛ الطلبات الخاصة بالكابتن مقيدة بهوية التوكن.
