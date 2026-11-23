# BazaPodataka-RAMPU 

Praktični iOS projekt izrađen u programskom jeziku Swift za kolegij Razvoj aplikacija za mobilne i pametne uređaje

Projekt demonstrira teorijske i praktične koncepte lokalne pohrane podataka na iOS platformi koristeći preporučene Appleove tehnologije i najbolje prakse.

---

## Korištene tehnologije i mehanizmi pohrane

* SwiftData - Appleov moderni ORM (Object-Relational Mapping) okvir za rad s lokalnom bazom podataka
* Verzioniranje i migracije sheme - upravljanje verzijama modela podataka i lagana migracija 
* Izolirana pohrana (App Sandbox & FileManager) - spremanje izolirane baze podataka u `Application Support` direktorij (`IzoliranaBaza_V2.store`) te izvoz i čitanje tekstualnih izvještaja (`studenti_izolirano.txt`) unutar `Documents` direktorija
* @AppStorage (UserDefaults) – pohrana jednostavnih korisničkih postavki i stanja sučelja

---

## Model podataka i normalizacija

Baza podataka modelirana je kroz tri povezana entiteta uz primjenu normalizacije i slabog entiteta s kaskadnim brisanjem (`deleteRule: .cascade`):

* `Student` – osnovni entitet s jedinstvenim identifikatorom (`studentId`), imenom, prezimenom i e-mail adresom.
* `Kolegij` – osnovni entitet s jedinstvenim identifikatorom (`kolegijId`), nazivom i godinom studija.
* `Kolokvij` (slabi entitet) – povezuje studenta i kolegij (`1:N` veze putem `@Relationship`) te bilježi redni broj kolokvija i ostvarenu ocjenu.

---

## Struktura projekta

BazaPodatakaSwift/
├── Preview Content/
├── SwiftBazaPodataka/
│   ├── BazaSchema.swift
│   ├── Kolegij.swift
│   ├── Kolokvij.swift
│   ├── MigracijaSchema.swift
│   └── Student.swift
├── SwiftEkrani/
│   ├── DodajKolegij.swift
│   ├── DodajKolokvij.swift
│   ├── DodajStudenta.swift
│   ├── IzoliranaPohrana.swift
│   └── UrediStudenta.swift
├── Assets.xcassets
└── BazaPodatakaSwiftApp.swift


## Objašnjenje koda

#BazaPodatakaSwiftApp

Odabire scheme koja se koristi za SwiftData bazu na početku te ukoliko ne postoji direktorij napravi direktorij za izoliranu pohranu. Nakon toga otvara Dodaj Studenta.

##DodajStudenta

Ponudi 3 text fielda za unos informacija novog entiteta student. Prikazuje nekoliko gumba koji dozvoljavaju navigaciju na druge ekrane i prikazuje sve studente u bazi kroz for petlju

##DodajKolegij

Ponudi 2 text fielda za unos informacija nvoog entiteta kolegij. Sa for petljom prikazuje sve postojeće kolegije

##DodajKolokvij

Ponudi 2 text fielda i 2 drop down polja u kojima se nude opcije dodati postojeće studente i kolegije kao vanjske ključeve na kolokvij. Nakon toga for petlja prikazuje sve kolokvije i pretraživanjem preko veze nalazi imena studenta i kolegija na koji su vezanu

##UrediStudenta

Sa query se filtriraju studenti prema unesenom imenu filtriraju. Nakon toga je gumb koji vodi do uređivanja entiteta ili brisanje. Kog uređivanja se nude text fieldovi koji odma mijenjaju sve informacije o studentu

##IzoliranaPohrana

Dvije funkcije koje spremaju informacije u datoteku i čitaju iz nje te jednostavan primjer app storage koji sprema vrijednosti dvije varijable

##Kolegij i Student

Dvije jednostave SwiftData tablice koje imaju relationship sa kolokvijem (slabim entitetom) preko kojeg ukoliko su obrisanu brišu vezani kolokvij. 

#Kolokvij

SwiftData tablica koja se nadovezuje na studenta i kolegij sa referencama na njih

##BazaSchema

Opisuje sve scheme na projektu i određuje koja se schema trenutno koristi

##MigracijaSchema 

Popisuje sve schema I implementira migraciju među njima
