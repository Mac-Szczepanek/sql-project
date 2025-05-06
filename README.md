#📌 Opis bazy danych

## 🎯 Cel projektu:
Baza danych ma za zadanie umożliwić sprawne gromadzenie, przechowywanie, zarządzanie i analizę informacji medycznych oraz administracyjnych dotyczących pacjentów, lekarzy, wizyt, diagnoz, recept, oddziałów, zabiegów i innych elementów związanych z funkcjonowaniem placówki ochrony zdrowia.

## 🧱 Zawartość bazy danych – struktura logiczna:
Na podstawie dotychczasowych fragmentów projektu można wyodrębnić następujące tabele i ich znaczenie:
    • Pacjenci (Pacjent) – zawiera dane osobowe pacjentów (imię, nazwisko, PESEL, kontakt).
    • Lekarze (Lekarz) – przechowuje dane lekarzy (imię, nazwisko, specjalizacja, numer prawa wykonywania zawodu).
    • Oddziały (Oddzial) – opisuje różne jednostki organizacyjne placówki, np. interna, chirurgia, kardiologia.
    • Wizyty (Wizyta) – rejestruje szczegóły dotyczące wizyt pacjentów, łącznie z lekarzem prowadzącym, datą i diagnozą.
    • Diagnozy (Diagnoza) – przechowuje kody i opisy rozpoznań stawianych pacjentom.
    • Recepty (Recepta) – zawiera dane o wystawionych receptach, przypisanych do wizyt.
    • Zabiegi (Zabieg) – rejestruje przeprowadzone zabiegi medyczne, daty, przypisanych lekarzy i pacjentów.
    • Leki (Lek) – lista leków dostępnych w systemie i przypisywanych na receptach.
    • Łączeniowe tabele – mogą występować dla relacji wiele-do-wielu, np. Lek_Recepta.

## 🛠️ Funkcjonalność i zastosowanie:
🔍 Zarządzanie pacjentami i ich historią leczenia:
    • Możliwość przeglądania historii wizyt i diagnoz pacjenta.
    • Rejestrowanie zabiegów i przepisywanych leków.
👩‍⚕️ Wspomaganie pracy personelu medycznego:
    • Przypisywanie lekarzy do wizyt i zabiegów.
    • Przegląd harmonogramów wizyt i historii pacjentów.
💊 Obsługa leków i recept:
    • Ewidencjonowanie leków, które zostały przepisane.
    • Umożliwienie raportowania, jakie leki są najczęściej stosowane.
🏥 Zarządzanie strukturą organizacyjną placówki:
    • Przypisanie lekarzy do oddziałów.
    • Analiza obłożenia oddziałów, liczby wykonanych zabiegów.

## 🧩 Rozwiązywany problem:
Placówki medyczne generują ogromne ilości danych – od informacji o pacjentach po dane kliniczne, recepty i dokumentację leczenia. Ręczne zarządzanie tymi danymi jest czasochłonne, podatne na błędy i niewydajne.

Projektowana baza danych rozwiązuje problem braku centralizacji i automatyzacji danych medycznych, oferując:
    • uporządkowane przechowywanie danych,
    • łatwy dostęp do pełnej historii leczenia,
    • zwiększenie efektywności pracy personelu,
    • możliwość analizowania danych medycznych i statystycznych,
    • ograniczenie błędów dzięki spójności i integralności danych.
