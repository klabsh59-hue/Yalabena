# دليل رفع يلا بينا 0.9.8 يدويًا

1. فك ضغط `YALBENA_0.9.8_MANUAL_UPLOAD.zip`.
2. افتح مستودع GitHub `klabsh59-hue/Yalabena` واختر **Add file → Upload files**.
3. ارفع محتويات المجلد إلى جذر المستودع، بحيث تظهر مجلدات `backend/` و`apps/` و`database/` و`web-preview/` و`tools/` مباشرة.
4. لا ترفع ملف ZIP نفسه، ولا ترفع `.env` أو مفاتيح Firebase أو كلمات مرور.
5. استخدم رسالة الالتزام: `Develop YALBENA 0.9.8 homepage and HQ map`.

## الملفات الأبرز في هذا التطوير
- `web-preview/index.html` — الصفحة الرئيسية والخريطة.
- `web-preview/admin.html` — علامة المقر في خريطة الإدارة.
- `apps/customer_app/lib/main.dart` — علامة المقر على خريطة العميل.
- `backend/package.json` وملفات `pubspec.yaml` — أرقام الإصدار.

**مهم:** موضع المقر الظاهر حاليًا مبدئي عند مركز سوهاج. أرسل رابط موقع المكتب من خرائط Google أو الإحداثيات لتثبيت النقطة الفعلية قبل الإطلاق.
