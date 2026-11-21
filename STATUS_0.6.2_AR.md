# YALBENA 0.6.2 — سجل الإصدار

## ما أُضيف
- فصل فحص حياة خدمة API عن فحص جاهزيتها المرتبط بقاعدة البيانات.
- `GET /v1/health/live` لا يعتمد على PostgreSQL، ليسهل استخدامه مع مراقبة الحاويات وموازنات التحميل.
- `GET /v1/health/ready` (مع الإبقاء على `/v1/health`) ينفذ `SELECT 1` بمهلة 3 ثوانٍ ويعيد `503` برسالة عربية عند تعذر قاعدة البيانات.
- إضافة `backend/scripts/check-database.cjs` لفحص اتصال PostgreSQL فعليًا والتحقق من الجداول والأعمدة الأساسية المطلوبة، بما فيها أعمدة بيانات المسار.
- إضافة أمر `npm run verify:database` وتوثيقه.

## التحقق المنفذ في حزمة التطوير
- فحوصات الإصدار الساكنة عبر `node backend/scripts/verify-release.cjs`.
- فحص صياغة ملفات JavaScript عبر `node --check`.
- فحص سلامة ملف ZIP عبر `unzip -t`.

## ما لم يتم التحقق منه
- لم يتم تشغيل PostgreSQL فعليًا في بيئة التطوير الحالية، لذلك لم يُشغّل `npm run verify:database` على قاعدة حقيقية.
- لم يتم تثبيت اعتماديات NestJS أو إجراء TypeScript build أو اختبار API end-to-end.
- يلزم ضبط `DATABASE_URL` و`ROUTING_PROVIDER_URL` ومفاتيح التشغيل في بيئة آمنة قبل الاختبار التشغيلي.
