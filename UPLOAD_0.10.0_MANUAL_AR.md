# رفع يدوي — YALBENA 0.10.0

1. احتفظ بنسخة احتياطية من المستودع الحالي قبل الرفع.
2. فك ضغط `YALBENA_0.10.0_MANUAL_UPLOAD.zip`.
3. ارفع **محتويات المجلد** إلى جذر مستودع التطبيق على GitHub، مع عدم رفع ملف ZIP نفسه.
4. تأكد أن `web-preview/corporate.html` و`backend/src/corporate/corporate.controller.ts` و`database/migrations/022_corporate_employee_transport.sql` موجودة بعد الرفع.
5. شغّل ترحيلات قاعدة البيانات بعد النسخ الاحتياطي: من مجلد `backend` نفّذ `npm install` ثم `npm run migrate:database` ثم `npm run build`.
6. رابط الصفحة بعد نشر GitHub Pages سيكون: `https://klabsh59-hue.github.io/Yalabena/corporate.html` إذا كان النشر من جذر المستودع ويشمل مجلد `web-preview`، أو من مسار مجلد المعاينة حسب إعداد النشر.
7. صفحة الشركات واجهة تعريفية وحجز متصل بالـ API عند ضبط رابط الخادم؛ لا تعتبر الحجوزات مفعلة قبل ربط حسابات الموظفين واعتماد الشركات والخطوط.

**الإصدار 0.9.9 محفوظ في الحزمة السابقة. هذا إصدار جديد 0.10.0.**
