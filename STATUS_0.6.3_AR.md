# YALBENA 0.6.3 — سجل الإصدار

## ما أُضيف
- إضافة مشغّل ترحيلات PostgreSQL بالأمر `npm run migrate:database`.
- ترتيب صريح للترحيلات: `001_core.sql` ثم `002_admin_console.sql` ثم `003_order_service_area.sql` ثم `004_server_routing.sql`.
- حفظ بصمة SHA-256 لكل ترحيل مطبق؛ يوقف المشغّل التنفيذ إذا تغير ملف ترحيل سبق تطبيقه، ويوجه المطور لإنشاء ترحيل جديد بدل تعديل التاريخ.
- استخدام PostgreSQL advisory lock لمنع تشغيل عمليتي ترحيل متزامنتين.
- تطبيق كل ترحيل ومعه تسجيله في معاملة واحدة، مع rollback عند الفشل.
- إضافة `docker-compose.yml` لتشغيل PostgreSQL 16 محليًا مع volume دائم وفحص صحة وربط المنفذ على localhost فقط.
- إضافة `.env.docker.example` لتوضيح كلمة مرور قاعدة البيانات المحلية.

## تشغيل قاعدة البيانات محليًا
1. انسخ `.env.docker.example` إلى `.env` بجوار `docker-compose.yml` وغيّر كلمة المرور.
2. شغّل `docker compose up -d postgres`.
3. في `backend/.env` اضبط `DATABASE_URL=postgresql://yalbena:كلمة_المرور@localhost:5432/yalbena`، واضبط `JWT_ACCESS_SECRET` بقيمة عشوائية قوية، وبقية المتغيرات المطلوبة.
4. من مجلد `backend` شغّل `npm install` ثم `npm run migrate:database` ثم `npm run verify:database`.
5. بعد ذلك شغّل `npm run build` ثم `npm run start`.

## التحقق المنفذ في هذه الحزمة
- `node --check` لملفات JavaScript الخاصة بمشغّل الترحيلات وفاحص قاعدة البيانات وفاحص الإصدار.
- `node backend/scripts/verify-release.cjs` للفحوصات الساكنة.
- `unzip -t` للتحقق من سلامة الأرشيف النهائي.

## ما لم يتم التحقق منه
- محاولة تثبيت اعتماديات npm انتهت بمهلة في بيئة التطوير؛ لذلك لم يكتمل تثبيت `pg` واعتماديات NestJS.
- لا تتوفر Docker أو PostgreSQL أو psql في بيئة التطوير الحالية؛ لم يتم تشغيل compose أو تطبيق الترحيلات على قاعدة فعلية.
- لم يتم TypeScript build أو اختبار API end-to-end.
- لا يزال مزود الخرائط ومفاتيح التشغيل مسؤولية إعداد بيئة النشر، ولا تُعد هذه النسخة إطلاقًا إنتاجيًا.
