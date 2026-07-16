# Smart Karyera Pro 💼📱

**Smart Karyera Pro** — Azərbaycan Respublikası Dövlət Məşğulluq Agentliyinin (DMA) fəaliyyət istiqamətlərinə, aktiv məşğulluq tədbirlərinə və karyera planlaması alətlərinə inteqrasiya olunmuş, **Swift** dili ilə hazırlanmış müasir mobil tətbiqdir.

Tətbiq işaxtaranların, gənclərin və karyera qurmaq istəyənlərin öz potensiallarını kəşf etməsinə, DMA-nın xidmətlərindən (əmək fəaliyyəti, peşə hazırlığı kursları, özünüməşğulluq proqramları və s.) daha çevik yararlanmasına kömək edir.

---

## 🚀 Əsas Özəlliklər (Features)

*   **Karyera Məsləhəti və Testlər:** İstifadəçilərin peşəyönümlü meyllərini müəyyən etmək üçün intellektual testlər və fərdi karyera xəritəsinin (Roadmap) vizuallaşdırılması.
*   **Vakansiya və Peşə Hazırlığı:** Dövlət Məşğulluq Agentliyinin təqdim etdiyi ən son vakansiyaların, peşə hazırlığı mərkəzlərindəki kursların siyahısı və birbaşa müraciət imkanı.
*   **Özünüməşğulluq Proqramı Dəstəyi:** Proqramın şərtləri, tələb olunan sənədlər və biznes planın ilkin qiymətləndirilməsi üçün kalkulyator.
*   **CV Generator:** Gənclərin peşəkar standartlara uyğun CV-lər hazırlaması və ixrac etməsi (PDF formatında) üçün daxili modul.
*   **İnteraktiv Bildirişlər (Push Notifications):** Yeni iş elanları, kurslar və dövlət tərəfindən təşkil edilən karyera sərgiləri haqqında anında məlumatlandırma.

---

## 🛠 Texnoloji Stack (Tech Stack)

Tətbiq iOS platformasının ən müasir standartları və dizayn prinsipləri əsasında sıfırdan yığılmışdır:

*   **Dil:** Swift 5.x
*   **UI Çərçivəsi (Framework):** UIKit (və ya tətbiq etdiyinizə görə SwiftUI) — *Proqramınıza uyğun olaraq dəyişə bilərsiniz*
*   **Memarlıq (Architecture):** MVVM (Model-View-ViewModel) / Clean Architecture — təmiz, test edilə bilən və genişləndirilə bilən kod strukturu.
*   **Şəbəkə (Networking):** URLSession / Alamofire (API məlumatlarının sürətli və təhlükəsiz idarə olunması üçün).
*   **Yerli Verilənlər Bazası:** CoreData / Realm (istifadəçi profili və CV məlumatlarının cihazda saxlanılması üçün).
*   **Asinxron Proqramlaşdırma:** Combine / Swift Concurrency (async/await).

---

## 📦 Quraşdırılma (Installation)

Layihəni yerli kompüterinizdə işə salmaq üçün aşağıdakı addımları izləyin:

1.  **Repozitoriyanı klonlayın:**
    ```bash
    git clone [https://github.com/istifadəçi_adınız/SmartKaryeraPro.git](https://github.com/istifadəçi_adınız/SmartKaryeraPro.git)
    cd SmartKaryeraPro
    ```

2.  **Pod asılılıqlarını quraşdırın (əgər CocoaPods istifadə edirsinizsə):**
    ```bash
    pod install
    ```
    *(Əgər Swift Package Manager istifadə edirsinizsə, birbaşa `.xcodeproj` faylını Xcode-da açın).*

3.  **Layihəni Xcode-da açın:**
    ```bash
    open SmartKaryeraPro.xcworkspace  # və ya .xcodeproj
    ```

4.  **İşə salın:** Simulyator və ya real iOS cihazı seçib `Cmd + R` düyməsini sıxın.

---

## 📐 Qovluq Strukturu (Folder Structure)

```text
SmartKaryeraPro/
├── App/                # AppDelegate, SceneDelegate və tətbiqin əsas sazlamaları
├── Core/               # NetworkManager, Extensions, Utilities, Səlahiyyətləndirmə
├── Modules/            # Ekranlar (MVVM strukturuna uyğun)
│   ├── Home/           # Əsas Ekran (Dövlət Agentliyi xidmətləri, xəbərlər)
│   ├── CareerTest/     # Karyera yönümlü testlər bölməsi
│   ├── CVGenerator/    # CV hazırlama modulu
│   └── Profile/        # İstifadəçi kabineti və tənzimləmələr
├── Models/             # Verilənlər modeli (Vakansiya, Kurs, İstifadəçi və s.)
└── Resources/          # Assets, Şriftlər, Səslər və yerli tərcümə faylları
