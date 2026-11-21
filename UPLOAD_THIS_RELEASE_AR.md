# رفع إصدار YALBENA 0.10.0

1. فك ضغط الحزمة على جهازك.
2. ارفع **محتويات المجلد من الداخل** إلى جذر المستودع `klabsh59-hue/Yalabena` على فرع `main`.
3. وافق على استبدال الملفات الموجودة عند طلب ذلك، ولا تحذف مجلدات المشروع.
4. لا ترفع أي ملف `.env` حقيقي أو كلمات مرور أو مفاتيح سرية.
5. بعد اكتمال الرفع، راجع وجود:
   - `web-preview/corporate.html`
   - `backend/src/corporate/corporate.controller.ts`
   - `database/migrations/022_corporate_employee_transport.sql`
   - `VERSION` ويجب أن يحتوي `0.10.0`

ملاحظة: رفع الملفات إلى GitHub لا يشغّل قاعدة البيانات أو ينشر API تلقائيًا. اتبع `UPLOAD_0.10.0_MANUAL_AR.md` و`DEPLOY_RENDER_AR.md` لإكمال الإعداد، ثم نفّذ اختبارات ما قبل الإطلاق.
