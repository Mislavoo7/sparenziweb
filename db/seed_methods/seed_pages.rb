def seed_home
  page = Page.create!(
    image:  Rails.root.join("app/assets/images/seed_imgs/home.jpg").open,
    name: "home",
    page_translations_attributes: {
      0 => {
        title: "Sparenzi",
        locale: "hr"
      },
      1 => {
        title: "Sparenzi",
        locale: "en"
      },
      2 => {
        title: "Sparenzi",
        locale: "de"
      },
    },
    seos_attributes: {
      0 => {
        image:  Rails.root.join("app/assets/images/seed_imgs/home.jpg").open,
        seo_translations_attributes: {
          0 => {
            title: "Sparenzi",
            description: "Sparenzi je najjednostavniji način za praćenje vaših troškova, upravljanje budžetom i ostvarenje štednih ciljeva. Jednostavno bilježite troškove, analizirajte svoje navike potrošnje i otkrijte personalizirane savjete za uštedu novca. Savršeno za sve koji žele pojednostaviti upravljanje novcem, izgraditi bolje financijske navike ili samo pratiti rast cijena",
            keywords: "praćenje troškova, izrada budžeta, planer budžeta, praćenje potrošnje, osobne financije, upravljanje novcem",
            locale: "hr"
          },
          1 => {
            title: "Sparenzi",
            description: "Sparenzi is the simplest way to track your spending, manage your budget, and reach your savings goals. Easily log expenses, analyze your spending habits, and discover personalized tips to save more money. Perfect for anyone looking to simplify money management, build better financial habits, or just keep an eye on rising costs.",
            keywords: "expense tracker, budgeting, budget planner, spending tracker, personal finance, money management",
            locale: "en"
          },
          2 => {
            title: "Sparenzi",
            description: "Sparenzi ist der einfachste Weg, deine Ausgaben zu verfolgen, dein Budget zu verwalten und deine Sparziele zu erreichen. Erfasse Ausgaben ganz einfach, analysiere deine Ausgabengewohnheiten und entdecke personalisierte Tipps, um mehr Geld zu sparen. Perfekt für alle, die ihre Finanzen einfacher verwalten, bessere finanzielle Gewohnheiten entwickeln oder einfach die steigenden Preise im Blick behalten möchten",
            keywords: "Ausgaben-Tracker, Budgetierung, Budgetplaner, Ausgabenverfolgung, persönliche Finanzen, Geldmanagement",
            locale: "de"
          }
        }
      }
    }
  )

  s1 = Section.create!(
    section_translations_attributes: {
      0 => {
        title: "Kontrola troškova",
        content: "<p>Pratite vaše troškove, upravljajte budžetom i uštedite novac. </p>",
        locale: "hr"
      },
      1 => {
        title: "Expense Control",
        content: "<p>Track your expenses, manage your budget, and save money.</p>",
        locale: "en"
      },
      2 => {
        title: "Kostenkontrolle",
        content: "<p>Verfolgen Sie Ihre Ausgaben, verwalten Sie Ihr Budget und sparen Sie.</p",
        locale: "de"
      },

    },
    position: 0
  )
  page.sections << s1

  s2 = Section.create!(
    section_type: "gray-box",
    section_translations_attributes: {
      0 => {
        title: "Preuzmite kontrolu nad svojim troškovima",
        content: "<p>Sparenzi je najjednostavniji način za praćenje vaših troškova, upravljanje budžetom i ostvarenje štednih ciljeva. Jednostavno bilježite troškove, analizirajte svoje navike potrošnje i otkrijte personalizirane savjete za uštedu novca. Savršeno za sve koji žele pojednostaviti upravljanje novcem, izgraditi bolje financijske navike ili samo pratiti rast cijena.</p>",
        locale: "hr"
      },
      1 => {
        title: "Take control of your spending",
        content: "<p>Sparenzi is the simplest way to track your spending, manage your budget, and reach your savings goals. Easily log expenses, analyze your spending habits, and discover personalized tips to save more money. Perfect for anyone looking to simplify money management, build better financial habits, or just keep an eye on rising costs.</p>",
        locale: "en"
      },
      2 => {
        title: "Behalte deine Ausgaben im Griff",
        content: "<p>Sparenzi ist der einfachste Weg, deine Ausgaben zu verfolgen, dein Budget zu verwalten und deine Sparziele zu erreichen. Erfasse Ausgaben ganz einfach, analysiere deine Ausgabengewohnheiten und entdecke personalisierte Tipps, um mehr Geld zu sparen. Perfekt für alle, die ihre Finanzen einfacher verwalten, bessere finanzielle Gewohnheiten entwickeln oder einfach die steigenden Preise im Blick behalten möchten.</p>",
        locale: "de"
      },

    },
    position: 1
  )
  page.sections << s2
end

def seed_about
  page = Page.create!(
    image:  Rails.root.join("app/assets/images/seed_imgs/about.jpg").open,
    name: "about",
    page_translations_attributes: {
      0 => {
        title: "O projektu",
        locale: "hr"
      },
      1 => {
        title: "About the Project",
        locale: "en"
      },
      2 => {
        title: "Über das Projekt",
        locale: "de"
      },
    },
    seos_attributes: {
      0 => {
        image:  Rails.root.join("app/assets/images/seed_imgs/about.jpg").open,
        seo_translations_attributes: {
          0 => {
            title: "O projektu | Sparenzi",
            description: "Sparenzi je projekt osobnih financija koji sam prvotno napravio za sebe kako bih lakše pratio troškove i upravljao budžetom. Platforma uključuje praktičnu APK aplikaciju koja vam omogućuje jednostavno bilježenje troškova u pokretu, a svi se podaci sinkroniziraju s ovom web stranicom. Kao registrirani korisnik, možete pristupiti svom financijskom pregledu bilo kada i bilo gdje. Odlučio sam podijeliti Sparenzi s drugima koji žele jednostavan i učinkovit način za kontrolu svojih financija. Pridružite se zajednici i počnite graditi bolje financijske navike već danas!",
            keywords: "praćenje troškova, izrada budžeta, planer budžeta, praćenje potrošnje, osobne financije, upravljanje novcem",
            locale: "hr"
          },
          1 => {
            title: "About the Project | Sparenzi",
            description: "Sparenzi is a personal finance project I originally created for myself to better track my expenses and manage my budget. The platform features a convenient APK app that lets you easily log your spending on the go, with all data synced to this website. As a registered user, you can access your financial overview anytime and anywhere. I decided to share Sparenzi with others who want a simple and effective way to take control of their finances. Join the community and start building better money habits today!",
            keywords: "expense tracker, budgeting, budget planner, spending tracker, personal finance, money management",
            locale: "en"
          },
          2 => {
            title: "Über das Projekt | Sparenzi",
            description: "Sparenzi ist ein persönliches Finanzprojekt, das ich ursprünglich für mich selbst entwickelt habe, um meine Ausgaben besser zu verfolgen und mein Budget zu verwalten. Die Plattform bietet eine praktische APK-App, mit der du deine Ausgaben unterwegs ganz einfach erfassen kannst – alle Daten werden mit dieser Webseite synchronisiert. Als registrierter Nutzer hast du jederzeit und überall Zugriff auf deine Finanzübersicht. Ich wollte Sparenzi auch anderen zur Verfügung stellen, die eine einfache und effektive Lösung für ihre Finanzen suchen. Werde Teil der Community und entwickle noch heute bessere Geldgewohnheiten!",
            keywords: "Ausgaben-Tracker, Budgetierung, Budgetplaner, Ausgabenverfolgung, persönliche Finanzen, Geldmanagement",
            locale: "de"
          }
        }
      }
    }
  )

  s1 = Section.create!(
    section_translations_attributes: {
      0 => {
        title: "Ukratko rečeno",
        content: "",
        locale: "hr"
      },
      1 => {
        title: "In Short",
        content: "",
        locale: "en"
      },
      2 => {
        title: "Kurz gesagt",
        content: "",
        locale: "de"
      },
    },
    position: 0
  )
  page.sections << s1

  s2 = Section.create!(
    section_type: "gray-box",
    section_translations_attributes: {
      0 => {
        title: "Što je Sparenzi?",
        content: "<p>Sparenzi je projekt osobnih financija koji sam prvotno napravio za sebe kako bih lakše pratio troškove i upravljao budžetom. Platforma uključuje praktičnu APK aplikaciju koja vam omogućuje jednostavno bilježenje troškova u pokretu, a svi se podaci sinkroniziraju s ovom web stranicom. Kao registrirani korisnik, možete pristupiti svom financijskom pregledu bilo kada i bilo gdje. Odlučio sam podijeliti Sparenzi s drugima koji žele jednostavan i učinkovit način za kontrolu svojih financija. Pridružite se zajednici i počnite graditi bolje financijske navike već danas!</p>",
        locale: "hr"
      },
      1 => {
        title: "What is Sparenzi?",
        content: "<p>Sparenzi is a personal finance project I originally created for myself to better track my expenses and manage my budget. The platform features a convenient APK app that lets you easily log your spending on the go, with all data synced to this website. As a registered user, you can access your financial overview anytime and anywhere. I decided to share Sparenzi with others who want a simple and effective way to take control of their finances. Join the community and start building better money habits today!</p>",
        locale: "en"
      },
      2 => {
        title: "Was ist Sparenzi?",
        content: "<p>Sparenzi ist ein persönliches Finanzprojekt, das ich ursprünglich für mich selbst entwickelt habe, um meine Ausgaben besser zu verfolgen und mein Budget zu verwalten. Die Plattform bietet eine praktische APK-App, mit der du deine Ausgaben unterwegs ganz einfach erfassen kannst – alle Daten werden mit dieser Webseite synchronisiert. Als registrierter Nutzer hast du jederzeit und überall Zugriff auf deine Finanzübersicht. Ich wollte Sparenzi auch anderen zur Verfügung stellen, die eine einfache und effektive Lösung für ihre Finanzen suchen. Werde Teil der Community und entwickle noch heute bessere Geldgewohnheiten!</p>",
        locale: "de"
      },
    },
    position: 1
  )
  page.sections << s2
end

