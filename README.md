# صيدلي ذكي

تطبيق "صيدلي ذكي" (أو "دوائي") يهدف إلى مساعدة الصيدلي أو المستخدم على معرفة معلومات شاملة عن الأدوية مع دعم طرق بحث متعددة.

## أهم المزايا

- **حفظ ونطق أسماء الأدوية:** يقدم التطبيق طريقة نطق صوتية صحيحة للاسم العلمي والتجاري.
- **معلومات الدواء:** يشمل دواعي الاستعمال، الجرعات المعتادة، التحذيرات، التداخلات الدوائية، والأعراض الجانبية.
- **طرق البحث:**
  - تصوير علبة الدواء للتعرف على الاسم أو التركيبة (OCR/التعرف على الصور).
  - البحث النصي عن الاسم أو المادة الفعالة.
  - البحث الصوتي عبر نطق اسم الدواء.
- **ميزات إضافية:** سجل للبحث، مشاركة المعلومات عبر واتساب أو البريد الإلكتروني، ووضع ليلي/نهاري.

## تصميم مبسط لواجهة المستخدم

1. **الصفحة الرئيسية**
   - زر "تصوير علبة الدواء".
   - مربع بحث لكتابة الاسم أو التركيبة.
   - زر "بحث صوتي".
2. **صفحة معلومات الدواء**
   - اسم الدواء مع زر لسماع النطق.
   - عرض منظم لجميع البيانات المذكورة أعلاه.

## التقنيات المقترحة

- الواجهة: **Flutter** لدعم أندرويد و iOS.
- التعرف على النص/الصور: **Google ML Kit** أو **Tesseract OCR**.
- قاعدة بيانات الأدوية: مثل **DrugBank** أو **OpenFDA**.
- تحويل النص إلى صوت: **Google Text-to-Speech** أو **Azure Speech**.
- البحث الصوتي: **Google Speech Recognition API**.

## المتطلبات المسبقة

لتشغيل التطبيق أو تعديله يجب تثبيت حزم **Flutter** و **Dart** على النظام. يمكن تثبيتهما على توزيعات لينكس عبر الأوامر التالية:

```bash
sudo apt-get update
sudo apt-get install -y apt-transport-https wget gpg
wget -qO- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /usr/share/keyrings/dart.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/dart.gpg] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main" | sudo tee /etc/apt/sources.list.d/dart_stable.list
sudo apt-get update
sudo apt-get install dart
curl -L -o flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.19.5-stable.tar.xz
sudo tar xf flutter.tar.xz -C /opt
export PATH="/opt/flutter/bin:$PATH"
```

بعد الانتهاء يُنصح بتشغيل `flutter doctor` للتحقق من سلامة الإعدادات.
## مخطط تدفق مبسط

```
[الرئيسية]
   |-- تصوير علبة الدواء --> [التعرف على النص/الصورة] --> [جلب بيانات الدواء]
   |-- كتابة اسم/تركيبة الدواء --> [جلب بيانات الدواء]
   |-- البحث الصوتي --> [تحويل الكلام لنص] --> [جلب بيانات الدواء]

[عرض معلومات الدواء]
```
