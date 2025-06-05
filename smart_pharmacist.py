import json
from pathlib import Path
from typing import Optional

try:
    from gtts import gTTS
    from playsound import playsound
except ImportError:
    gTTS = None  # type: ignore
    playsound = None  # type: ignore

DATA_PATH = Path(__file__).parent / "data" / "drugs.json"


def load_data() -> list[dict]:
    with open(DATA_PATH, "r", encoding="utf-8") as f:
        return json.load(f)


def find_drug(name: str) -> Optional[dict]:
    """Search for a drug by name (case-insensitive)."""
    data = load_data()
    for drug in data:
        if drug["name"].lower() == name.lower() or drug["brand"].lower() == name.lower():
            return drug
    return None


def pronounce(name: str) -> None:
    """Pronounce a given drug name using gTTS if available."""
    if gTTS is None or playsound is None:
        print("[تحذير] مكتبة gTTS أو playsound غير متوفرة.")
        return
    tts = gTTS(text=name, lang="en")
    filename = "voice.mp3"
    tts.save(filename)
    playsound(filename)


def show_info(drug: dict) -> None:
    print(f"\nاسم الدواء: {drug['name']} ({drug['brand']})")
    print(f"\nدواعي الاستعمال: {drug['uses']}")
    print(f"الجرعة المعتادة: {drug['dosage']}")
    print(f"التحذيرات: {drug['warnings']}")
    print(f"التداخلات الدوائية: {drug['interactions']}")
    print(f"الأعراض الجانبية: {drug['side_effects']}")


def main() -> None:
    print("مرحبا بك في تطبيق صيدلي ذكي (نسخة سطر الأوامر)")
    name = input("أدخل اسم الدواء أو اسمه التجاري: ")
    drug = find_drug(name)
    if not drug:
        print("لم يتم العثور على الدواء.")
        return
    show_info(drug)

    choice = input("\nهل تريد سماع طريقة النطق؟ (y/n): ")
    if choice.lower() == "y":
        pronounce(drug["name"])


if __name__ == "__main__":
    main()
