-- Portfolio content seed, based on the supplied 2026-10-20 export.
-- Apply EF migrations first. Reapplying restores these seeded rows.
-- Migration history and database ownership are intentionally excluded.
BEGIN;
SET LOCAL client_encoding = 'UTF8';

-- Languages
INSERT INTO public."Languages" ("id", "name", "code", "direction", "flag", "isDefault") VALUES (1, 'English', 'en', 'ltr', 'US', true)
ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "code" = EXCLUDED."code", "direction" = EXCLUDED."direction", "flag" = EXCLUDED."flag", "isDefault" = EXCLUDED."isDefault";
INSERT INTO public."Languages" ("id", "name", "code", "direction", "flag", "isDefault") VALUES (2, 'Arabic', 'ar', 'rtl', 'LB', false)
ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "code" = EXCLUDED."code", "direction" = EXCLUDED."direction", "flag" = EXCLUDED."flag", "isDefault" = EXCLUDED."isDefault";

-- Technologies
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (1, 'typescript', 'TypeScript', 'https://cdn.simpleicons.org/typescript')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (2, 'javascript', 'JavaScript', 'https://cdn.simpleicons.org/javascript')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (3, 'csharp', 'C#', '/Uploads/images/a8c94f4394aa4398b4d9d0f6e40ec855.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (4, 'react', 'React', 'https://cdn.simpleicons.org/react')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (5, 'nextjs', 'Next.js', 'https://cdn.simpleicons.org/nextdotjs')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (6, 'tailwind-css', 'Tailwind CSS', 'https://cdn.simpleicons.org/tailwindcss')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (7, 'html5', 'HTML5', 'https://cdn.simpleicons.org/html5')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (8, 'css3', 'CSS3', '/Uploads/images/d0c34cc3efec4d2a8effe615acf9e548.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (9, 'dotnet', 'Dotnet', '/Uploads/images/56c002fa12b94e069c9d44b9dd191f51.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (10, 'nodejs', 'Node.js', 'https://cdn.simpleicons.org/nodedotjs')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (11, 'sql-server', 'SQL Server', '/Uploads/images/710774dfe7704462baaa5d1512801592.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (12, 'postgresql', 'PostgreSQL', '/Uploads/images/7855b80ed54b4dc889bcfda277c7a137.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (13, 'docker', 'Docker', 'https://cdn.simpleicons.org/docker')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (14, 'postman', 'Postman', 'https://cdn.simpleicons.org/postman')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (15, 'rest-apis', 'REST APIs', 'https://cdn.simpleicons.org/openapiinitiative')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (16, 'php', 'PHP', 'https://cdn.simpleicons.org/php')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (17, 'mysql', 'MySQL', 'https://cdn.simpleicons.org/mysql')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (18, 'flutter', 'Flutter', '/Uploads/images/aab4c77c9cf3498ea0ea04edb173b688.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (19, 'dart', 'Dart', 'https://cdn.simpleicons.org/dart')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (20, 'postgis', 'PostGIS', '/Uploads/images/18f76c1e52d641419dd819f63888562d.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (21, 'woocommerce', 'WooCommerce', '/Uploads/images/c9ee74e900124eedb0c71f62b2596cac.webp')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (22, 'wordpress-rest-api', 'WordPress REST API', 'https://cdn.simpleicons.org/wordpress')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (23, 'linux-vps', 'Linux VPS', 'https://cdn.simpleicons.org/linux')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (24, 'vite', 'Vite', 'https://cdn.simpleicons.org/vite')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (25, 'ssr', 'Server-Side Rendering', 'https://cdn.simpleicons.org/react')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (26, 'meta-pixel', 'Meta Pixel', 'https://cdn.simpleicons.org/meta')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (27, 'codex', 'Codex', '/Uploads/images/4f11c8e3a747403eabbee102bdb14490.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (28, 'claude', 'Claude', '/Uploads/images/8b5ce369defd4a9ea7b4910d6522f61b.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (29, 'supabase', 'Supabase', '/Uploads/images/e8ac32e766c7452889de2bb0e252b7fd.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (30, 'firebase', 'Firebase', '/Uploads/images/1e1cd3e6bfa84fcca089501c1834bfce.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (31, 'vs-code', 'VS Code', '/Uploads/images/d0ff4c672b9143fd93f151309f6cf2ac.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (32, 'xcode', 'Xcode', '/Uploads/images/5d378880af504085a2b0b280149905ff.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (33, 'swagger', 'Swagger', '/Uploads/images/0f77b3f980c44bc6999820a41f8952fa.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (34, 'mongo-db', 'Mongo DB', '/Uploads/images/2fb8eedf86954046979d9751f5674c80.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (35, 'lovable', 'Lovable', '/Uploads/images/52531be49f714a92b1547f1d038506b9.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (36, 'visual-studio', 'Visual Studio', '/Uploads/images/7c9d82796ebe498eb4ce61a2645a2fe4.webp')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (37, 'iis', 'IIS', '/Uploads/images/3debc7c6fc214ea88766738e009123aa.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (38, 'netsuite', 'Oracle Netsuite', '/Uploads/images/b46d6f35ae954d7193923e604d267d7d.png')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";
INSERT INTO public."Technologies" ("id", "key", "name", "imageUrl") VALUES (39, 'wordpress', 'Wordpress', '/Uploads/images/1c844d0e98e242c2961400f3a3134b6f.webp')
ON CONFLICT ("id") DO UPDATE SET "key" = EXCLUDED."key", "name" = EXCLUDED."name", "imageUrl" = EXCLUDED."imageUrl";

-- Globals
INSERT INTO public."Globals" ("id", "languageId", "key", "content") VALUES (1, 1, 'site', '{
  "siteUrl": "https://www.mostafaabbas.dev",
  "siteName": "Mostafa Abbas",
  "contactEmail": "contact@mostafaabbas.dev",
  "githubUrl": "https://github.com/mostafaabbas0001",
  "linkedinUrl": "https://www.linkedin.com/in/mostafaabbas0001",
  "ogImage": "/Uploads/images/og-image.jpg",
  "personSchema": {
    "@context": "https://schema.org",
    "@type": "Person",
    "name": "Mostafa Abbas",
    "url": "https://www.mostafaabbas.dev",
    "jobTitle": "Full-Stack Developer & Software Engineer",
    "description": "Full-Stack Developer and Software Engineer building maintainable web applications and business systems.",
    "sameAs": [
      "https://github.com/mostafaabbas0001",
      "https://www.linkedin.com/in/mostafaabbas0001"
    ]
  },
  "websiteSchema": {
    "@context": "https://schema.org",
    "@type": "WebSite",
    "name": "Mostafa Abbas",
    "url": "https://www.mostafaabbas.dev"
  },
  "ogImageAlt": "Mostafa Abbas - Full-Stack Software Engineer",
  "faviconUrl": "/Uploads/images/e7278c89972d43c1a21cce99c845ead8.webp",
  "googleSiteVerification": "",
  "bingSiteVerification": ""
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Globals" ("id", "languageId", "key", "content") VALUES (2, 1, 'header', '{
  "logoUrl": "/Uploads/images/e7278c89972d43c1a21cce99c845ead8.webp",
  "logoAlt": "Mostafa Abbas",
  "homeAriaLabel": "Mostafa Abbas - home",
  "openMenuLabel": "Open menu",
  "closeMenuLabel": "Close menu",
  "navItems": [
    {
      "to": "/",
      "label": "Home"
    },
    {
      "to": "/about",
      "label": "About"
    },
    {
      "to": "/projects",
      "label": "Projects"
    },
    {
      "to": "/experience",
      "label": "Experience"
    },
    {
      "to": "/contact",
      "label": "Contact"
    }
  ],
  "externalLinks": [
    {
      "href": "https://github.com/mostafaabbas0001",
      "label": "GitHub"
    },
    {
      "href": "https://www.linkedin.com/in/mostafaabbas0001",
      "label": "LinkedIn"
    },
    {
      "href": "/Site/media/resume",
      "label": "Resume ↗"
    }
  ],
  "logoDarkUrl": ""
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Globals" ("id", "languageId", "key", "content") VALUES (3, 1, 'footer', '{
  "availability": "Open to opportunities",
  "headline": "Let''s build software that <span class=\"text-primary\">makes a difference</span>.",
  "emailCta": "Get in touch",
  "replyText": "Typical response time",
  "replyHighlight": "Within 24 hours",
  "focusLabel": "What I focus on",
  "focusAreas": [
    "Web & Mobile Applications",
    "Business Systems",
    "Backend & APIs",
    "User Experience"
  ],
  "navigationLabel": "Explore",
  "copyright": "© {year} Mostafa Abbas - Full-Stack Software Engineer",
  "backToTop": "Back to top ↑",
  "heroTechnologyKeys": []
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Globals" ("id", "languageId", "key", "content") VALUES (4, 2, 'site', '{
  "siteUrl": "https://www.mostafaabbas.dev",
  "siteName": "مصطفى عباس",
  "contactEmail": "contact@mostafaabbas.dev",
  "githubUrl": "https://github.com/mostafaabbas0001",
  "linkedinUrl": "https://www.linkedin.com/in/mostafaabbas0001",
  "ogImage": "/Uploads/images/og-image.jpg",
  "personSchema": {
    "@context": "https://schema.org",
    "@type": "Person",
    "name": "مصطفى عباس",
    "url": "https://www.mostafaabbas.dev",
    "jobTitle": "مطور ويب متكامل ومهندس برمجيات",
    "description": "مطور ويب متكامل ومهندس برمجيات يبني تطبيقات ويب وأنظمة أعمال قابلة للصيانة.",
    "sameAs": [
      "https://github.com/mostafaabbas0001",
      "https://www.linkedin.com/in/mostafaabbas0001"
    ]
  },
  "websiteSchema": {
    "@context": "https://schema.org",
    "@type": "WebSite",
    "name": "مصطفى عباس",
    "url": "https://www.mostafaabbas.dev"
  },
  "ogImageAlt": "مصطفى عباس - مهندس برمجيات Full-Stack",
  "faviconUrl": "/Uploads/images/e7278c89972d43c1a21cce99c845ead8.webp",
  "googleSiteVerification": "",
  "bingSiteVerification": ""
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Globals" ("id", "languageId", "key", "content") VALUES (5, 2, 'header', '{
  "logoUrl": "/Uploads/images/e7278c89972d43c1a21cce99c845ead8.webp",
  "logoAlt": "مصطفى عباس",
  "homeAriaLabel": "مصطفى عباس - الرئيسية",
  "openMenuLabel": "فتح القائمة",
  "closeMenuLabel": "إغلاق القائمة",
  "navItems": [
    {
      "to": "/",
      "label": "الرئيسية"
    },
    {
      "to": "/about",
      "label": "نبذة"
    },
    {
      "to": "/projects",
      "label": "المشاريع"
    },
    {
      "to": "/experience",
      "label": "الخبرة"
    },
    {
      "to": "/contact",
      "label": "تواصل"
    }
  ],
  "externalLinks": [
    {
      "href": "https://github.com/mostafaabbas0001",
      "label": "GitHub"
    },
    {
      "href": "https://www.linkedin.com/in/mostafaabbas0001",
      "label": "LinkedIn"
    },
    {
      "href": "/Site/media/resume",
      "label": "السيرة الذاتية ↗"
    }
  ],
  "logoDarkUrl": ""
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Globals" ("id", "languageId", "key", "content") VALUES (6, 2, 'footer', '{
  "availability": "منفتح على الفرص",
  "headline": "لنبنِ برمجيات <span class=\"text-primary\">تُحدث فرقًا</span>.",
  "emailCta": "تواصل معي",
  "replyText": "وقت الرد المعتاد",
  "replyHighlight": "خلال 24 ساعة",
  "focusLabel": "مجالات تركيزي",
  "focusAreas": [
    "تطبيقات الويب والموبايل",
    "أنظمة الأعمال",
    "الأنظمة الخلفية وواجهات API",
    "تجربة المستخدم"
  ],
  "navigationLabel": "استكشف",
  "copyright": "© {year} مصطفى عباس - مهندس برمجيات Full-Stack",
  "backToTop": "العودة إلى الأعلى ↑",
  "heroTechnologyKeys": []
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Globals" ("id", "languageId", "key", "content") VALUES (7, 1, 'interface', '{
  "skipToContent": "Skip to content",
  "primaryNav": "Primary",
  "footerNav": "Footer",
  "language": "Language",
  "menu": "Menu",
  "home": "Home",
  "projects": "Projects",
  "inProduction": "In production",
  "inProductionNote": "Systems I built that are running today. Public sites are checked live from this server.",
  "statusChecking": "Checking",
  "statusLive": "Online",
  "statusDown": "Not responding",
  "privateDeployment": "Private deployment",
  "appStores": "App Store and Google Play",
  "theme": "Theme",
  "themeLight": "Light",
  "themeDark": "Dark",
  "themeSystem": "System",
  "readCaseStudy": "Read case study",
  "letsTalk": "Let''s talk",
  "scroll": "Scroll",
  "yearsOfExperience": "Years of experience",
  "productionSystems": "Production systems",
  "technologiesShipped": "Technologies used",
  "replyTime": "Reply time",
  "career": "Career",
  "caseStudy": "Case study",
  "allProjects": "All projects",
  "emailMe": "Email me",
  "visitSite": "Visit site",
  "overview": "Overview",
  "problem": "The problem",
  "solution": "The solution",
  "challenges": "Challenges",
  "outcome": "Outcome",
  "contribution": "What I built",
  "decisions": "Engineering decisions",
  "screenshots": "Screenshots",
  "atAGlance": "At a glance",
  "year": "Year",
  "role": "Role",
  "category": "Category",
  "stack": "Stack",
  "status": "Status",
  "nextProject": "Next project",
  "notFoundTitle": "This page doesn''t exist.",
  "notFoundBody": "The link may be old, or the address may have a typo.",
  "backHome": "Back to the homepage",
  "errorTitle": "This page didn''t load.",
  "errorBody": "The content service didn''t respond. Try again in a moment.",
  "tryAgain": "Try again",
  "statusLiveDetail": "Online, responded in {ms} ms",
  "moreTechnologies": "+{count} more",
  "checkedNow": "Checked just now",
  "checkedAgo": {
    "zero": "Checked just now",
    "one": "Checked {count} min ago",
    "two": "Checked {count} min ago",
    "few": "Checked {count} min ago",
    "many": "Checked {count} min ago",
    "other": "Checked {count} min ago"
  },
  "systemsShipped": {
    "zero": "{count} production systems",
    "one": "{count} production system",
    "two": "{count} production systems",
    "few": "{count} production systems",
    "many": "{count} production systems",
    "other": "{count} production systems"
  },
  "languageEnglish": "English",
  "languageArabic": "العربية",
  "appleAppStore": "App Store",
  "googlePlay": "Google Play",
  "github": "GitHub",
  "experienceYears": {
    "zero": "{count} years of experience",
    "one": "{count} year of experience",
    "two": "{count} years of experience",
    "few": "{count} years of experience",
    "many": "{count} years of experience",
    "other": "{count} years of experience"
  },
  "experienceExact": "{years}",
  "experienceOver": "Over {years}",
  "experienceApproaching": "Approaching {years}"
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Globals" ("id", "languageId", "key", "content") VALUES (8, 2, 'interface', '{
  "skipToContent": "انتقل إلى المحتوى",
  "primaryNav": "التنقل الرئيسي",
  "footerNav": "روابط التذييل",
  "language": "اللغة",
  "menu": "القائمة",
  "home": "الرئيسية",
  "projects": "المشاريع",
  "inProduction": "قيد التشغيل",
  "inProductionNote": "أنظمة بنيتها وتعمل اليوم. يتم فحص المواقع العامة مباشرةً من هذا الخادم.",
  "statusChecking": "جارٍ الفحص",
  "statusLive": "يعمل",
  "statusDown": "لا يستجيب",
  "privateDeployment": "نشر خاص",
  "appStores": "App Store وGoogle Play",
  "theme": "المظهر",
  "themeLight": "فاتح",
  "themeDark": "داكن",
  "themeSystem": "حسب النظام",
  "readCaseStudy": "اقرأ دراسة الحالة",
  "letsTalk": "لنتحدث",
  "scroll": "مرّر",
  "yearsOfExperience": "سنوات من الخبرة",
  "productionSystems": "أنظمة قيد الإنتاج",
  "technologiesShipped": "تقنية مستخدمة",
  "replyTime": "مدة الرد",
  "career": "المسيرة المهنية",
  "caseStudy": "دراسة الحالة",
  "allProjects": "كل المشاريع",
  "emailMe": "راسلني",
  "visitSite": "زيارة الموقع",
  "overview": "نظرة عامة",
  "problem": "المشكلة",
  "solution": "الحل",
  "challenges": "التحديات",
  "outcome": "النتيجة",
  "contribution": "ما بنيته",
  "decisions": "القرارات الهندسية",
  "screenshots": "لقطات الشاشة",
  "atAGlance": "لمحة سريعة",
  "year": "السنة",
  "role": "الدور",
  "category": "الفئة",
  "stack": "التقنيات",
  "status": "الحالة",
  "nextProject": "المشروع التالي",
  "notFoundTitle": "هذه الصفحة غير موجودة.",
  "notFoundBody": "قد يكون الرابط قديمًا أو قد يحتوي العنوان على خطأ.",
  "backHome": "العودة إلى الصفحة الرئيسية",
  "errorTitle": "تعذّر تحميل هذه الصفحة.",
  "errorBody": "لم تستجب خدمة المحتوى. حاول مرة أخرى بعد قليل.",
  "tryAgain": "حاول مرة أخرى",
  "statusLiveDetail": "يعمل، استجاب خلال {ms} ملي ثانية",
  "moreTechnologies": "+{count} أخرى",
  "checkedNow": "تم الفحص الآن",
  "checkedAgo": {
    "zero": "تم الفحص الآن",
    "one": "تم الفحص قبل دقيقة",
    "two": "تم الفحص قبل دقيقتين",
    "few": "تم الفحص قبل {count} دقائق",
    "many": "تم الفحص قبل {count} دقيقة",
    "other": "تم الفحص قبل {count} دقيقة"
  },
  "systemsShipped": {
    "zero": "{count} نظامًا قيد الإنتاج",
    "one": "نظام واحد قيد الإنتاج",
    "two": "نظامان قيد الإنتاج",
    "few": "{count} أنظمة قيد الإنتاج",
    "many": "{count} نظامًا قيد الإنتاج",
    "other": "{count} نظامًا قيد الإنتاج"
  },
  "languageEnglish": "English",
  "languageArabic": "العربية",
  "appleAppStore": "App Store",
  "googlePlay": "Google Play",
  "github": "GitHub",
  "experienceYears": {
    "zero": "{count} سنة من الخبرة",
    "one": "سنة من الخبرة",
    "two": "سنتين من الخبرة",
    "few": "{count} سنوات من الخبرة",
    "many": "{count} سنة من الخبرة",
    "other": "{count} سنة من الخبرة"
  },
  "experienceExact": "{years}",
  "experienceOver": "أكثر من {years}",
  "experienceApproaching": "ما يقارب {years}"
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";

-- Pages
INSERT INTO public."Pages" ("id", "languageId", "key", "slug", "content", "seoData") VALUES (1, 1, 'home', '/', '{"label":"Full-Stack Developer / Software Engineer","headline":"Software that \u003Cspan class=\u0022text-primary\u0022\u003Eholds up\u003C/span\u003E in production.","description":"I build reliable business systems end to end from data models and APIs to clean UIs and operational tooling. Clarity, correctness, and speed to value.","heroImageUrl":"/Uploads/images/portrait-cutout.png","heroImageAlt":"Mostafa Abbas, full-stack developer and software engineer","heroCircuitMessages":["Reliable systems","Clean architecture","Production focused"],"primaryCta":{"label":"View selected work","href":"/projects"},"secondaryCta":{"label":"Get in touch","href":"/contact"}}', '{
  "title": "Mostafa Abbas - Full-Stack Software Engineer",
  "description": "Portfolio of Mostafa Abbas, a Full-Stack Software Engineer building modern web and mobile applications, scalable backend systems, APIs and maintainable software solutions.",
  "path": "/",
  "ogType": "website",
  "ogImage": "",
  "ogImageAlt": "",
  "noindex": false
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "slug" = EXCLUDED."slug", "content" = EXCLUDED."content", "seoData" = EXCLUDED."seoData";
INSERT INTO public."Pages" ("id", "languageId", "key", "slug", "content", "seoData") VALUES (2, 1, 'about', '/about', '{"label":"About","headline":"I build software that people \u003Cspan class=\u0022text-primary\u0022\u003Edepend on every day\u003C/span\u003E.","intro":"I\u0027m a Full-Stack Software Engineer focused on building reliable web and mobile applications. Much of my work sits where real business processes meet software - from operations and inventory to customer-facing products - where clarity, correctness and maintainability matter.","paragraphs":["I work across the stack, typically using React and TypeScript on the front end, Flutter for mobile applications, and .NET or Node.js for backend services and APIs. I design around clear data models, strong validation and systems that remain understandable as they grow.","My approach starts with understanding the problem before writing the solution. I prefer simple architecture, predictable state changes, meaningful tests and code that is easier for the next developer to understand and extend.","I care just as much about the experience users interact with: responsive interfaces, accessible interactions, clear typography and fast, intuitive applications that work consistently across devices."],"experienceLinkLabel":"View my professional experience"}', '{
  "title": "About Mostafa Abbas - Full-Stack Software Engineer",
  "description": "Learn about Mostafa Abbas, a Full-Stack Software Engineer building reliable, maintainable web applications with modern frontend, backend and cloud technologies.",
  "path": "/about",
  "ogType": "website",
  "ogImage": "",
  "ogImageAlt": "",
  "noindex": false
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "slug" = EXCLUDED."slug", "content" = EXCLUDED."content", "seoData" = EXCLUDED."seoData";
INSERT INTO public."Pages" ("id", "languageId", "key", "slug", "content", "seoData") VALUES (3, 1, 'projects', '/projects', '{"label":"Selected projects","headline":"Web and mobile software \u003Cspan class=\u0022text-primary\u0022\u003Ebuilt to solve real problems\u003C/span\u003E.","description":"Explore projects I\u0027ve designed and developed across web, mobile, backend systems, APIs, and business applications."}', '{
  "title": "Projects - Mostafa Abbas | Full-Stack Software Engineer",
  "description": "Explore full-stack software projects by Mostafa Abbas, including web applications, mobile apps, backend systems, APIs, e-commerce platforms and business software.",
  "path": "/projects",
  "ogType": "website",
  "ogImage": "",
  "ogImageAlt": "",
  "noindex": false
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "slug" = EXCLUDED."slug", "content" = EXCLUDED."content", "seoData" = EXCLUDED."seoData";
INSERT INTO public."Pages" ("id", "languageId", "key", "slug", "content", "seoData") VALUES (4, 1, 'experience', '/experience', '{"label":"Experience","headline":"Experience building \u003Cspan class=\u0022text-primary\u0022\u003Esoftware that delivers\u003C/span\u003E.","description":"Professional experience across full-stack development, web and mobile applications, backend systems and business software."}', '{
  "title": "Experience - Mostafa Abbas | Full-Stack Software Engineer",
  "description": "Explore the professional experience of Mostafa Abbas, a Full-Stack Software Engineer building web and mobile applications, backend systems and business software.",
  "path": "/experience",
  "ogType": "website",
  "ogImage": "",
  "ogImageAlt": "",
  "noindex": false
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "slug" = EXCLUDED."slug", "content" = EXCLUDED."content", "seoData" = EXCLUDED."seoData";
INSERT INTO public."Pages" ("id", "languageId", "key", "slug", "content", "seoData") VALUES (5, 1, 'contact', '/contact', '{"label":"Contact","headline":"Let\u0027s build something \u003Cspan class=\u0022text-primary\u0022\u003Eworth using\u003C/span\u003E.","description":"I\u0027m open to software engineering opportunities, full-stack development roles and selected freelance projects across web, mobile and backend systems.","emailLabel":"Email","elsewhereLabel":"Elsewhere","note":"For project inquiries, a short overview of what you\u0027re building, your current stack and your goals is enough to get the conversation started."}', '{
  "title": "Contact Mostafa Abbas - Full-Stack Software Engineer",
  "description": "Contact Mostafa Abbas about software engineering opportunities, full-stack development, web and mobile applications, backend systems and freelance projects.",
  "path": "/contact",
  "ogType": "website",
  "ogImage": "",
  "ogImageAlt": "",
  "noindex": false
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "slug" = EXCLUDED."slug", "content" = EXCLUDED."content", "seoData" = EXCLUDED."seoData";
INSERT INTO public."Pages" ("id", "languageId", "key", "slug", "content", "seoData") VALUES (6, 2, 'home', '/', '{"label":"\u0645\u0637\u0648\u0631 Full-Stack / \u0645\u0647\u0646\u062F\u0633 \u0628\u0631\u0645\u062C\u064A\u0627\u062A","headline":"\u0628\u0631\u0645\u062C\u064A\u0627\u062A \u003Cspan class=\u0022text-primary\u0022\u003E\u062A\u0635\u0645\u062F \u0628\u0643\u0641\u0627\u0621\u0629\u003C/span\u003E \u0641\u064A \u0628\u064A\u0626\u0627\u062A \u0627\u0644\u0625\u0646\u062A\u0627\u062C.","description":"\u0623\u0628\u0646\u064A \u0623\u0646\u0638\u0645\u0629 \u0623\u0639\u0645\u0627\u0644 \u0645\u0648\u062B\u0648\u0642\u0629 \u0648\u0645\u062A\u0643\u0627\u0645\u0644\u0629\u060C \u0628\u062F\u0621\u064B\u0627 \u0645\u0646 \u0646\u0645\u0627\u0630\u062C \u0627\u0644\u0628\u064A\u0627\u0646\u0627\u062A \u0648\u0648\u0627\u062C\u0647\u0627\u062A API \u0648\u0635\u0648\u0644\u064B\u0627 \u0625\u0644\u0649 \u0648\u0627\u062C\u0647\u0627\u062A \u0627\u0633\u062A\u062E\u062F\u0627\u0645 \u0648\u0627\u0636\u062D\u0629 \u0648\u0623\u062F\u0648\u0627\u062A \u062A\u0634\u063A\u064A\u0644 \u0641\u0639\u0651\u0627\u0644\u0629. \u0623\u0631\u0643\u0651\u0632 \u0639\u0644\u0649 \u0627\u0644\u0648\u0636\u0648\u062D\u060C \u0648\u0627\u0644\u062F\u0642\u0629\u060C \u0648\u062A\u062D\u0642\u064A\u0642 \u0627\u0644\u0642\u064A\u0645\u0629 \u0628\u0633\u0631\u0639\u0629.","heroImageUrl":"/Uploads/images/portrait-cutout.png","heroImageAlt":"\u0645\u0635\u0637\u0641\u0649 \u0639\u0628\u0627\u0633\u060C \u0645\u0637\u0648\u0631 Full-Stack \u0648\u0645\u0647\u0646\u062F\u0633 \u0628\u0631\u0645\u062C\u064A\u0627\u062A","heroCircuitMessages":["\u0623\u0646\u0638\u0645\u0629 \u0645\u0648\u062B\u0648\u0642\u0629","\u0628\u0646\u064A\u0629 \u0628\u0631\u0645\u062C\u064A\u0629 \u0646\u0638\u064A\u0641\u0629","\u062C\u0627\u0647\u0632\u064A\u0629 \u0644\u0628\u064A\u0626\u0627\u062A \u0627\u0644\u0625\u0646\u062A\u0627\u062C"],"primaryCta":{"label":"\u0627\u0633\u062A\u0639\u0631\u0636 \u0623\u0628\u0631\u0632 \u0627\u0644\u0645\u0634\u0627\u0631\u064A\u0639","href":"/projects"},"secondaryCta":{"label":"\u062A\u0648\u0627\u0635\u0644 \u0645\u0639\u064A","href":"/contact"}}', '{
  "title": "مصطفى عباس - مهندس برمجيات Full-Stack",
  "description": "الموقع الشخصي لمصطفى عباس، مهندس برمجيات Full-Stack يطوّر تطبيقات ويب وموبايل حديثة، وأنظمة خلفية قابلة للتوسع، وواجهات API، وحلولًا برمجية موثوقة وسهلة الصيانة.",
  "path": "/",
  "ogType": "website",
  "ogImage": "",
  "ogImageAlt": "",
  "noindex": false
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "slug" = EXCLUDED."slug", "content" = EXCLUDED."content", "seoData" = EXCLUDED."seoData";
INSERT INTO public."Pages" ("id", "languageId", "key", "slug", "content", "seoData") VALUES (7, 2, 'about', '/about', '{"label":"\u0646\u0628\u0630\u0629 \u0639\u0646\u064A","headline":"\u0623\u0628\u0646\u064A \u0628\u0631\u0645\u062C\u064A\u0627\u062A \u064A\u0639\u062A\u0645\u062F \u0639\u0644\u064A\u0647\u0627 \u0627\u0644\u0645\u0633\u062A\u062E\u062F\u0645\u0648\u0646 \u003Cspan class=\u0022text-primary\u0022\u003E\u0643\u0644 \u064A\u0648\u0645\u003C/span\u003E.","intro":"\u0623\u0646\u0627 \u0645\u0647\u0646\u062F\u0633 \u0628\u0631\u0645\u062C\u064A\u0627\u062A Full-Stack \u0623\u0631\u0643\u0651\u0632 \u0639\u0644\u0649 \u0628\u0646\u0627\u0621 \u062A\u0637\u0628\u064A\u0642\u0627\u062A \u0648\u064A\u0628 \u0648\u0645\u0648\u0628\u0627\u064A\u0644 \u0645\u0648\u062B\u0648\u0642\u0629. \u064A\u062A\u0631\u0643\u0632 \u062C\u0632\u0621 \u0643\u0628\u064A\u0631 \u0645\u0646 \u0639\u0645\u0644\u064A \u0639\u0646\u062F \u0646\u0642\u0637\u0629 \u0627\u0644\u062A\u0642\u0627\u0621 \u0627\u0644\u0639\u0645\u0644\u064A\u0627\u062A \u0627\u0644\u062A\u062C\u0627\u0631\u064A\u0629 \u0627\u0644\u0641\u0639\u0644\u064A\u0629 \u0628\u0627\u0644\u0628\u0631\u0645\u062C\u064A\u0627\u062A - \u0645\u0646 \u0627\u0644\u0639\u0645\u0644\u064A\u0627\u062A \u0648\u0625\u062F\u0627\u0631\u0629 \u0627\u0644\u0645\u062E\u0632\u0648\u0646 \u0625\u0644\u0649 \u0627\u0644\u0645\u0646\u062A\u062C\u0627\u062A \u0627\u0644\u0645\u0648\u062C\u0647\u0629 \u0644\u0644\u0639\u0645\u0644\u0627\u0621 - \u062D\u064A\u062B \u064A\u0643\u0648\u0646 \u0627\u0644\u0648\u0636\u0648\u062D \u0648\u0627\u0644\u062F\u0642\u0629 \u0648\u0633\u0647\u0648\u0644\u0629 \u0627\u0644\u0635\u064A\u0627\u0646\u0629 \u0639\u0648\u0627\u0645\u0644 \u0623\u0633\u0627\u0633\u064A\u0629.","paragraphs":["\u0623\u0639\u0645\u0644 \u0639\u0644\u0649 \u0645\u062E\u062A\u0644\u0641 \u0623\u062C\u0632\u0627\u0621 \u0627\u0644\u0646\u0638\u0627\u0645\u060C \u0648\u0639\u0627\u062F\u0629\u064B \u0645\u0627 \u0623\u0633\u062A\u062E\u062F\u0645 React \u0648TypeScript \u0641\u064A \u0627\u0644\u0648\u0627\u062C\u0647\u0629 \u0627\u0644\u0623\u0645\u0627\u0645\u064A\u0629\u060C \u0648Flutter \u0644\u062A\u0637\u0628\u064A\u0642\u0627\u062A \u0627\u0644\u0645\u0648\u0628\u0627\u064A\u0644\u060C \u0648.NET \u0623\u0648 Node.js \u0644\u062E\u062F\u0645\u0627\u062A \u0627\u0644\u0648\u0627\u062C\u0647\u0629 \u0627\u0644\u062E\u0644\u0641\u064A\u0629 \u0648\u0648\u0627\u062C\u0647\u0627\u062A API. \u0623\u062D\u0631\u0635 \u0639\u0644\u0649 \u062A\u0635\u0645\u064A\u0645 \u0646\u0645\u0627\u0630\u062C \u0628\u064A\u0627\u0646\u0627\u062A \u0648\u0627\u0636\u062D\u0629\u060C \u0648\u0627\u0644\u062A\u062D\u0642\u0642 \u0627\u0644\u0635\u0627\u0631\u0645 \u0645\u0646 \u0635\u062D\u0629 \u0627\u0644\u0628\u064A\u0627\u0646\u0627\u062A\u060C \u0648\u0628\u0646\u0627\u0621 \u0623\u0646\u0638\u0645\u0629 \u062A\u0638\u0644 \u0645\u0641\u0647\u0648\u0645\u0629 \u0648\u0642\u0627\u0628\u0644\u0629 \u0644\u0644\u062A\u0637\u0648\u064A\u0631 \u0645\u0639 \u0646\u0645\u0648\u0647\u0627.","\u064A\u0628\u062F\u0623 \u0623\u0633\u0644\u0648\u0628\u064A \u0628\u0641\u0647\u0645 \u0627\u0644\u0645\u0634\u0643\u0644\u0629 \u0642\u0628\u0644 \u0643\u062A\u0627\u0628\u0629 \u0627\u0644\u062D\u0644. \u0623\u0641\u0636\u0651\u0644 \u0627\u0644\u0628\u0646\u064A\u0629 \u0627\u0644\u0628\u0631\u0645\u062C\u064A\u0629 \u0627\u0644\u0628\u0633\u064A\u0637\u0629\u060C \u0648\u062A\u063A\u064A\u0651\u0631\u0627\u062A \u0627\u0644\u062D\u0627\u0644\u0629 \u0627\u0644\u0645\u062A\u0648\u0642\u0639\u0629\u060C \u0648\u0627\u0644\u0627\u062E\u062A\u0628\u0627\u0631\u0627\u062A \u0630\u0627\u062A \u0627\u0644\u0642\u064A\u0645\u0629\u060C \u0648\u0643\u062A\u0627\u0628\u0629 \u0643\u0648\u062F \u064A\u0643\u0648\u0646 \u0623\u0633\u0647\u0644 \u0644\u0644\u0645\u0637\u0648\u0631 \u0627\u0644\u062A\u0627\u0644\u064A \u0641\u064A \u0641\u0647\u0645\u0647 \u0648\u062A\u0637\u0648\u064A\u0631\u0647.","\u0648\u0623\u0647\u062A\u0645 \u0628\u0627\u0644\u0642\u062F\u0631 \u0646\u0641\u0633\u0647 \u0628\u062A\u062C\u0631\u0628\u0629 \u0627\u0644\u0645\u0633\u062A\u062E\u062F\u0645: \u0648\u0627\u062C\u0647\u0627\u062A \u0645\u062A\u062C\u0627\u0648\u0628\u0629\u060C \u0648\u062A\u0641\u0627\u0639\u0644\u0627\u062A \u0633\u0647\u0644\u0629 \u0627\u0644\u0648\u0635\u0648\u0644\u060C \u0648\u0646\u0635\u0648\u0635 \u0648\u0627\u0636\u062D\u0629\u060C \u0648\u062A\u0637\u0628\u064A\u0642\u0627\u062A \u0633\u0631\u064A\u0639\u0629 \u0648\u0628\u062F\u064A\u0647\u064A\u0629 \u062A\u0639\u0645\u0644 \u0628\u0634\u0643\u0644 \u0645\u062A\u0646\u0627\u0633\u0642 \u0639\u0644\u0649 \u0645\u062E\u062A\u0644\u0641 \u0627\u0644\u0623\u062C\u0647\u0632\u0629."],"experienceLinkLabel":"\u0627\u0633\u062A\u0639\u0631\u0636 \u062E\u0628\u0631\u062A\u064A \u0627\u0644\u0645\u0647\u0646\u064A\u0629"}', '{
  "title": "عن مصطفى عباس - مهندس برمجيات Full-Stack",
  "description": "تعرّف على مصطفى عباس، مهندس برمجيات Full-Stack يبني تطبيقات ويب موثوقة وسهلة الصيانة باستخدام تقنيات حديثة للواجهة الأمامية والخلفية والحوسبة السحابية.",
  "path": "/about",
  "ogType": "website",
  "ogImage": "",
  "ogImageAlt": "",
  "noindex": false
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "slug" = EXCLUDED."slug", "content" = EXCLUDED."content", "seoData" = EXCLUDED."seoData";
INSERT INTO public."Pages" ("id", "languageId", "key", "slug", "content", "seoData") VALUES (8, 2, 'projects', '/projects', '{"label":"\u0645\u0634\u0627\u0631\u064A\u0639 \u0645\u062E\u062A\u0627\u0631\u0629","headline":"\u0628\u0631\u0645\u062C\u064A\u0627\u062A \u0648\u064A\u0628 \u0648\u0645\u0648\u0628\u0627\u064A\u0644 \u003Cspan class=\u0022text-primary\u0022\u003E\u0645\u0635\u0645\u0645\u0629 \u0644\u062D\u0644 \u0645\u0634\u0643\u0644\u0627\u062A \u062D\u0642\u064A\u0642\u064A\u0629\u003C/span\u003E.","description":"\u0627\u0633\u062A\u0643\u0634\u0641 \u0645\u062C\u0645\u0648\u0639\u0629 \u0645\u0646 \u0627\u0644\u0645\u0634\u0627\u0631\u064A\u0639 \u0627\u0644\u062A\u064A \u0635\u0645\u0645\u062A\u0647\u0627 \u0648\u0637\u0648\u0631\u062A\u0647\u0627 \u0641\u064A \u0645\u062C\u0627\u0644\u0627\u062A \u0627\u0644\u0648\u064A\u0628\u060C \u0648\u062A\u0637\u0628\u064A\u0642\u0627\u062A \u0627\u0644\u0645\u0648\u0628\u0627\u064A\u0644\u060C \u0648\u0627\u0644\u0623\u0646\u0638\u0645\u0629 \u0627\u0644\u062E\u0644\u0641\u064A\u0629\u060C \u0648\u0648\u0627\u062C\u0647\u0627\u062A API\u060C \u0648\u062A\u0637\u0628\u064A\u0642\u0627\u062A \u0627\u0644\u0623\u0639\u0645\u0627\u0644."}', '{
  "title": "مشاريع مصطفى عباس | مهندس برمجيات Full-Stack",
  "description": "استكشف مشاريع البرمجيات Full-Stack التي طوّرها مصطفى عباس، بما يشمل تطبيقات الويب والموبايل، والأنظمة الخلفية، وواجهات API، ومنصات التجارة الإلكترونية، وبرمجيات الأعمال.",
  "path": "/projects",
  "ogType": "website",
  "ogImage": "",
  "ogImageAlt": "",
  "noindex": false
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "slug" = EXCLUDED."slug", "content" = EXCLUDED."content", "seoData" = EXCLUDED."seoData";
INSERT INTO public."Pages" ("id", "languageId", "key", "slug", "content", "seoData") VALUES (9, 2, 'experience', '/experience', '{"label":"\u0627\u0644\u062E\u0628\u0631\u0629 \u0627\u0644\u0645\u0647\u0646\u064A\u0629","headline":"\u062E\u0628\u0631\u0629 \u0641\u064A \u0628\u0646\u0627\u0621 \u003Cspan class=\u0022text-primary\u0022\u003E\u0628\u0631\u0645\u062C\u064A\u0627\u062A \u062A\u062D\u0642\u0642 \u0646\u062A\u0627\u0626\u062C \u0641\u0639\u0644\u064A\u0629\u003C/span\u003E.","description":"\u062E\u0628\u0631\u0629 \u0645\u0647\u0646\u064A\u0629 \u0641\u064A \u062A\u0637\u0648\u064A\u0631 Full-Stack\u060C \u0648\u062A\u0637\u0628\u064A\u0642\u0627\u062A \u0627\u0644\u0648\u064A\u0628 \u0648\u0627\u0644\u0645\u0648\u0628\u0627\u064A\u0644\u060C \u0648\u0627\u0644\u0623\u0646\u0638\u0645\u0629 \u0627\u0644\u062E\u0644\u0641\u064A\u0629\u060C \u0648\u0628\u0631\u0645\u062C\u064A\u0627\u062A \u0627\u0644\u0623\u0639\u0645\u0627\u0644."}', '{
  "title": "خبرة مصطفى عباس | مهندس برمجيات Full-Stack",
  "description": "استكشف الخبرة المهنية لمصطفى عباس، مهندس برمجيات Full-Stack يعمل على تطوير تطبيقات الويب والموبايل، والأنظمة الخلفية، وبرمجيات الأعمال.",
  "path": "/experience",
  "ogType": "website",
  "ogImage": "",
  "ogImageAlt": "",
  "noindex": false
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "slug" = EXCLUDED."slug", "content" = EXCLUDED."content", "seoData" = EXCLUDED."seoData";
INSERT INTO public."Pages" ("id", "languageId", "key", "slug", "content", "seoData") VALUES (10, 2, 'contact', '/contact', '{"label":"\u062A\u0648\u0627\u0635\u0644 \u0645\u0639\u064A","headline":"\u0644\u0646\u0628\u0646\u0650 \u0634\u064A\u0626\u064B\u0627 \u003Cspan class=\u0022text-primary\u0022\u003E\u064A\u0633\u062A\u062D\u0642 \u0627\u0644\u0627\u0633\u062A\u062E\u062F\u0627\u0645\u003C/span\u003E.","description":"\u0623\u0646\u0627 \u0645\u0646\u0641\u062A\u062D \u0639\u0644\u0649 \u0641\u0631\u0635 \u0647\u0646\u062F\u0633\u0629 \u0627\u0644\u0628\u0631\u0645\u062C\u064A\u0627\u062A\u060C \u0648\u0623\u062F\u0648\u0627\u0631 \u062A\u0637\u0648\u064A\u0631 Full-Stack\u060C \u0648\u0645\u0634\u0627\u0631\u064A\u0639 \u0627\u0644\u0639\u0645\u0644 \u0627\u0644\u062D\u0631 \u0627\u0644\u0645\u062E\u062A\u0627\u0631\u0629 \u0641\u064A \u0645\u062C\u0627\u0644\u0627\u062A \u0627\u0644\u0648\u064A\u0628 \u0648\u0627\u0644\u0645\u0648\u0628\u0627\u064A\u0644 \u0648\u0627\u0644\u0623\u0646\u0638\u0645\u0629 \u0627\u0644\u062E\u0644\u0641\u064A\u0629.","emailLabel":"\u0627\u0644\u0628\u0631\u064A\u062F \u0627\u0644\u0625\u0644\u0643\u062A\u0631\u0648\u0646\u064A","elsewhereLabel":"\u0631\u0648\u0627\u0628\u0637 \u0623\u062E\u0631\u0649","note":"\u0628\u0627\u0644\u0646\u0633\u0628\u0629 \u0625\u0644\u0649 \u0627\u0633\u062A\u0641\u0633\u0627\u0631\u0627\u062A \u0627\u0644\u0645\u0634\u0627\u0631\u064A\u0639\u060C \u064A\u0643\u0641\u064A \u062A\u0642\u062F\u064A\u0645 \u0646\u0628\u0630\u0629 \u0642\u0635\u064A\u0631\u0629 \u0639\u0645\u0627 \u062A\u0639\u0645\u0644 \u0639\u0644\u0649 \u0628\u0646\u0627\u0626\u0647\u060C \u0648\u0627\u0644\u062A\u0642\u0646\u064A\u0627\u062A \u0627\u0644\u062A\u064A \u062A\u0633\u062A\u062E\u062F\u0645\u0647\u0627 \u062D\u0627\u0644\u064A\u064B\u0627\u060C \u0648\u0627\u0644\u0623\u0647\u062F\u0627\u0641 \u0627\u0644\u062A\u064A \u062A\u0631\u064A\u062F \u062A\u062D\u0642\u064A\u0642\u0647\u0627 \u0644\u0628\u062F\u0621 \u0645\u062D\u0627\u062F\u062B\u0629 \u0645\u0641\u064A\u062F\u0629."}', '{
  "title": "تواصل مع مصطفى عباس - مهندس برمجيات Full-Stack",
  "description": "تواصل مع مصطفى عباس بشأن فرص هندسة البرمجيات، وتطوير Full-Stack، وتطبيقات الويب والموبايل، والأنظمة الخلفية، ومشاريع العمل الحر.",
  "path": "/contact",
  "ogType": "website",
  "ogImage": "",
  "ogImageAlt": "",
  "noindex": false
}')
ON CONFLICT ("id") DO UPDATE SET "languageId" = EXCLUDED."languageId", "key" = EXCLUDED."key", "slug" = EXCLUDED."slug", "content" = EXCLUDED."content", "seoData" = EXCLUDED."seoData";

-- Sections
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (2, 1, 'tech-strip', '{
  "label": "Technologies I work with",
  "linkLabel": "More on the stack",
  "technologyKeys": [
    "react",
    "typescript",
    "nodejs",
    "flutter",
    "tailwind-css",
    "dotnet",
    "docker",
    "postgresql"
  ]
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (3, 1, 'featured-work', '{
  "label": "Featured projects",
  "headline": "Web and mobile products <span class=\"text-primary\">built for real-world use</span>.",
  "linkLabel": "Explore all projects",
  "projectSlugs": [
    "triple-h-broker-cms",
    "promo-plus-ecommerce",
    "house-of-soap-mobile-app",
    "stockify-pos"
  ]
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (4, 1, 'experience-preview', '{
  "headline": "<span class=\"text-primary\">Experience</span>",
  "linkLabel": "Full history",
  "count": 2
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (5, 2, 'technologies', '{
  "label": "Technologies",
  "groups": [
    {
      "label": "Languages",
      "technologyKeys": [
        "typescript",
        "csharp",
        "javascript"
      ]
    },
    {
      "label": "Web Frontend",
      "technologyKeys": [
        "react",
        "nextjs",
        "tailwind-css",
        "html5",
        "css3"
      ]
    },
    {
      "label": "Mobile",
      "technologyKeys": [
        "flutter"
      ]
    },
    {
      "label": "Backend",
      "technologyKeys": [
        "dotnet",
        "nodejs"
      ]
    },
    {
      "label": "Databases",
      "technologyKeys": [
        "postgresql",
        "sql-server",
        "mongo-db"
      ]
    },
    {
      "label": "Backend & Cloud Services",
      "technologyKeys": [
        "supabase",
        "firebase"
      ]
    },
    {
      "label": "Infrastructure & Deployment",
      "technologyKeys": [
        "docker",
        "linux-vps"
      ]
    },
    {
      "label": "Development & API Tools",
      "technologyKeys": [
        "vs-code",
        "visual-studio",
        "postman",
        "swagger",
        "xcode"
      ]
    },
    {
      "label": "AI Development Tools",
      "technologyKeys": [
        "codex",
        "claude",
        "lovable"
      ]
    }
  ]
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (6, 3, 'projects-list', '{
  "items": [
    {
      "slug": "safi-ticket-service-desk",
      "projectUrl": "",
      "logoUrl": "/Uploads/images/343f789e4235414a8857a118a68583f9.png",
      "title": "Safi Ticket - IT Service Desk",
      "shortDescription": "An IT service desk platform that centralizes support requests, automatically converts incoming support emails into trackable tickets, and gives the IT department a structured workflow for managing issues.",
      "description": "A custom IT service desk platform developed for Safi Cosmetics to centralize and organize technical support requests across the company. The system integrates with a dedicated IT support email address, automatically ingesting incoming messages and converting them into tickets that can be tracked and managed through the application. This replaces fragmented email-based support with a structured workflow that gives the IT department better visibility into requests, ownership, status and pending work.",
      "year": "2026",
      "role": "Software Engineer",
      "category": "IT Service Management / Business Software",
      "technologyKeys": [
        "react",
        "typescript",
        "dotnet",
        "postgresql",
        "docker"
      ],
      "problem": "IT requests were primarily received through email, making it difficult to maintain a centralized view of department needs, track unresolved issues, follow request history and ensure that important support requests were not lost inside email conversations.",
      "solution": "Built Safi Ticket as a centralized service desk platform that manages IT support requests as structured tickets. The system integrates with a dedicated support mailbox, ingests incoming emails and automatically creates tickets so requests received through email become part of the same trackable workflow as requests created directly in the application.",
      "contributions": [
        "Designed and developed the Safi Ticket service desk platform for IT support operations",
        "Implemented an email ingestion workflow that automatically converts messages sent to the IT support mailbox into tickets",
        "Centralized support requests into a structured ticketing system instead of relying on individual email conversations",
        "Built workflows for tracking ticket status, ownership and request history",
        "Designed the system around the day-to-day operational needs of the IT department",
        "Translated existing support processes into a more organized and traceable software workflow"
      ],
      "engineeringDecisions": [
        "Used tickets as the central source of truth for IT requests instead of relying on email threads",
        "Integrated the existing support email workflow so employees can continue requesting assistance by email without changing their normal process",
        "Automatically transformed incoming support emails into structured tickets to improve traceability",
        "Centralized request history, ownership and status so the IT team can clearly identify pending, completed and follow-up work",
        "Designed the platform around existing IT workflows to minimize adoption friction"
      ],
      "challenges": "The main challenge was introducing structured ticket management without forcing employees to change how they normally contact the IT department. The system needed to preserve the convenience of email while transforming those requests into organized and trackable service desk records.",
      "outcome": "Delivered a centralized IT service desk system that makes incoming requests easier to track, prioritize and manage while reducing reliance on manually reviewing email conversations to understand outstanding department needs.",
      "featured": true,
      "githubUrl": "",
      "liveUrl": "",
      "appStoreUrl": "",
      "playStoreUrl": "",
      "screenshots": [],
      "seo": {
        "title": "",
        "description": "",
        "ogImage": "",
        "ogImageAlt": "",
        "noindex": false
      }
    },
    {
      "slug": "house-of-soap-mobile-app",
      "projectUrl": "",
      "logoUrl": "/Uploads/images/1215cf65e8c24f8a97c1885dacf4fad6.webp",
      "title": "House of Soap Mobile Application",
      "shortDescription": "A production Flutter commerce application published on the Apple App Store and Google Play, backed by a secure .NET integration layer connecting multiple regional WooCommerce stores.",
      "description": "A production cross-platform mobile commerce application developed for House of Soap using Flutter and supported by a custom C# ASP.NET Core backend. The backend acts as a secure bridge between the mobile application and multiple regional WooCommerce websites through WordPress and WooCommerce REST APIs while keeping privileged credentials securely on the server. A React administration dashboard provides centralized management of regional application configuration. I also handled the complete mobile release process and personally published the application to both the Apple App Store and Google Play.",
      "year": "2026",
      "role": "Full-Stack Developer",
      "category": "Mobile / E-Commerce",
      "technologyKeys": [
        "flutter",
        "react",
        "typescript",
        "dotnet",
        "postgis",
        "woocommerce",
        "wordpress-rest-api",
        "rest-apis",
        "docker",
        "firebase",
        "linux-vps"
      ],
      "problem": "House of Soap operated separate WooCommerce stores across multiple regional subdomains and needed a single production mobile application capable of connecting users to the correct regional source of truth. Connecting Flutter directly to WooCommerce would also have exposed privileged API credentials inside distributable client code.",
      "solution": "Designed a custom ASP.NET Core integration layer that securely stores WooCommerce and WordPress API credentials and acts as the communication bridge between the Flutter application and the regional stores. PostgreSQL, PostGIS and geographic information are used to determine the appropriate region and route requests to the correct WooCommerce source. I also prepared, configured and released the mobile application for production distribution on both iOS and Android.",
      "contributions": [
        "Developed the cross-platform customer mobile application using Flutter",
        "Designed and built the ASP.NET Core backend connecting the mobile application to WooCommerce",
        "Integrated WordPress and WooCommerce REST APIs for transferring commerce data to the mobile application",
        "Kept privileged WooCommerce and WordPress credentials exclusively on the backend instead of embedding them in the Flutter client",
        "Built a React administration dashboard for managing regional configuration",
        "Implemented support for multiple regional WooCommerce subdomains through a centralized backend",
        "Integrated PostgreSQL and PostGIS for geographic and region-aware application logic",
        "Prepared and configured production builds for both iOS and Android",
        "Managed the Apple App Store release process and personally published the iOS application",
        "Managed the Google Play release process and personally published the Android application",
        "Containerized the application infrastructure with Docker and deployed it to a custom VPS",
        "Configured, secured and managed the production Linux server environment from scratch"
      ],
      "engineeringDecisions": [
        "Introduced a backend-for-frontend layer instead of allowing the Flutter client to communicate with privileged WooCommerce APIs directly",
        "Stored API secrets exclusively on the server to prevent credentials from being exposed through reverse engineering of the mobile application",
        "Used the custom .NET backend as a routing and integration layer across multiple regional WooCommerce installations",
        "Used PostgreSQL and PostGIS to support geographic and region-aware routing",
        "Kept each regional WooCommerce instance as the source of truth for its respective market",
        "Used a single Flutter codebase to deliver production applications for both iOS and Android",
        "Managed the production release lifecycle for both the Apple App Store and Google Play",
        "Containerized application services with Docker and operated them on a self-managed Linux VPS"
      ],
      "challenges": "The primary challenge was creating a single production mobile experience on top of multiple independent WooCommerce stores while securely handling privileged API credentials, routing users to the correct regional data source, and preparing the application for production distribution across both iOS and Android.",
      "outcome": "Delivered and personally published a production mobile commerce application on both the Apple App Store and Google Play, providing users with a unified experience across multiple regional WooCommerce stores while keeping sensitive credentials secure behind a custom backend.",
      "featured": true,
      "githubUrl": "",
      "liveUrl": "",
      "appStoreUrl": "",
      "playStoreUrl": "",
      "screenshots": [],
      "seo": {
        "title": "",
        "description": "",
        "ogImage": "",
        "ogImageAlt": "",
        "noindex": false
      }
    },
    {
      "slug": "triple-h-broker-cms",
      "projectUrl": "https://triplehbroker.com",
      "logoUrl": "/Uploads/images/69cbd131e74747569890a3d0bdee22b3.webp",
      "title": "Triple H Broker CMS Website",
      "shortDescription": "A fully dynamic corporate website and CMS for an insurance brokerage, giving administrators complete control over pages, sections and site content without requiring code changes.",
      "description": "A full-stack CMS-driven website developed for Triple H Broker using React with Vite on the client side and C# with ASP.NET Core on the backend. The platform exposes REST APIs consumed by the frontend and includes a comprehensive administration panel that allows authorized users to dynamically create, edit and manage pages, sections and website content without hardcoded frontend changes.",
      "year": "2025",
      "role": "Full-Stack Developer",
      "category": "CMS / Business Website",
      "technologyKeys": [
        "react",
        "vite",
        "typescript",
        "csharp",
        "dotnet",
        "postgresql",
        "rest-apis",
        "docker",
        "linux-vps"
      ],
      "problem": "The company needed a professional website that could continuously evolve without requiring developer involvement whenever a new page, section or piece of content needed to be added or modified.",
      "solution": "Built a dynamic CMS architecture where website structure and content are managed through an administration panel and persisted in PostgreSQL. The ASP.NET Core backend exposes structured REST APIs that allow the React frontend to dynamically render administrator-defined pages and sections.",
      "contributions": [
        "Developed the React and Vite frontend and integrated it with the ASP.NET Core backend",
        "Built the administration panel for dynamically creating and managing pages, sections and website content",
        "Designed the PostgreSQL data model supporting configurable website structures and content",
        "Implemented REST API endpoints used by the frontend to render dynamic content without hardcoded pages",
        "Containerized the application with Docker and deployed it to a custom VPS",
        "Configured and managed the production Linux server environment from scratch"
      ],
      "engineeringDecisions": [
        "Separated content management from presentation so administrators can update the website without requiring frontend code changes",
        "Used the backend API as the source of truth for dynamically generated pages and sections",
        "Used PostgreSQL as the relational database for CMS content and application configuration",
        "Containerized the application with Docker to provide consistent and reproducible deployments",
        "Hosted the platform on a self-managed Linux VPS to maintain full control over the production infrastructure"
      ],
      "challenges": "The main architectural challenge was designing a flexible content model that allowed administrators to create arbitrary pages and sections while keeping the frontend component system structured, reusable and maintainable.",
      "outcome": "Delivered a production-ready CMS platform that gives the company full administrative control over its website and allows new pages and sections to be created without modifying or redeploying frontend code.",
      "featured": true,
      "githubUrl": "",
      "liveUrl": "",
      "appStoreUrl": "",
      "playStoreUrl": "",
      "screenshots": [],
      "seo": {
        "title": "",
        "description": "",
        "ogImage": "",
        "ogImageAlt": "",
        "noindex": false
      }
    },
    {
      "slug": "promo-plus-ecommerce",
      "projectUrl": "https://promopluslb.com",
      "logoUrl": "/Uploads/images/c1de1fe4abb1401eb272bc96d190050c.webp",
      "title": "Promo Plus E-Commerce Platform",
      "shortDescription": "A full-stack server-side rendered e-commerce platform with centralized product management, dynamic storefront content and Meta advertising integrations.",
      "description": "A complete online shopping platform developed for Promo Plus using React with Vite for the storefront and C# with ASP.NET Core for the backend. The application uses server-side rendering and includes a comprehensive administration panel that provides control over products and storefront content. Meta Pixel integration captures relevant customer events for conversion tracking, analytics and targeted advertising.",
      "year": "2026",
      "role": "Full-Stack Developer",
      "category": "E-Commerce",
      "technologyKeys": [
        "react",
        "vite",
        "javascript",
        "csharp",
        "dotnet",
        "postgresql",
        "rest-apis",
        "ssr",
        "meta-pixel",
        "docker",
        "linux-vps"
      ],
      "problem": "The business needed a complete online sales platform that could be managed internally while supporting dynamic product management, search-engine-friendly rendering and advertising event tracking.",
      "solution": "Developed a server-side rendered React storefront connected to a custom ASP.NET Core backend and PostgreSQL database. The administration panel centralizes management of products and storefront content, while Meta Pixel captures relevant customer events for analytics, conversion tracking and advertising campaigns.",
      "contributions": [
        "Developed the customer-facing e-commerce storefront using React and Vite",
        "Implemented server-side rendering for public storefront pages",
        "Built the ASP.NET Core backend and REST APIs powering the storefront and administration panel",
        "Developed administrative functionality for managing products and dynamic website content",
        "Integrated Meta Pixel for customer event tracking, advertising and conversion analytics",
        "Designed and integrated the PostgreSQL database",
        "Containerized the application using Docker and deployed it to a custom VPS",
        "Configured and managed the production Linux server environment from scratch"
      ],
      "engineeringDecisions": [
        "Used server-side rendering for public storefront pages to improve initial rendering and search-engine visibility",
        "Centralized product and content management through the administration panel instead of coupling storefront changes to frontend deployments",
        "Kept Meta Pixel and event-tracking integrations separated from the core commerce logic",
        "Used PostgreSQL as the primary relational database for application and commerce data",
        "Used Docker for reproducible deployments on a self-managed Linux VPS"
      ],
      "challenges": "Supporting a dynamic e-commerce experience with server-side rendering required careful separation between server-rendered application logic, browser-specific functionality and third-party tracking integrations.",
      "outcome": "Delivered a production-ready e-commerce platform where the business can independently manage its products and storefront while benefiting from server-side rendering, conversion tracking and Meta advertising integrations.",
      "featured": true,
      "githubUrl": "",
      "liveUrl": "",
      "appStoreUrl": "",
      "playStoreUrl": "",
      "screenshots": [],
      "seo": {
        "title": "",
        "description": "",
        "ogImage": "",
        "ogImageAlt": "",
        "noindex": false
      }
    },
    {
      "slug": "stockify-pos",
      "projectUrl": "",
      "logoUrl": "/Uploads/images/fd02472072a044f883d4264dce200e58.webp",
      "title": "Stockify POS",
      "shortDescription": "A modular point-of-sale and business management platform supporting multiple branches, multiple currencies, inventory operations and expense tracking.",
      "description": "A full-stack point-of-sale and business management platform designed to support multiple business models through a modular architecture. Stockify combines point-of-sale operations, inventory management, expense tracking, multi-branch management and multi-currency support within a centralized application backed by PostgreSQL.",
      "year": "2025",
      "role": "Full-Stack Developer",
      "category": "POS / Business Management",
      "technologyKeys": [
        "react",
        "typescript",
        "dotnet",
        "postgresql",
        "rest-apis",
        "docker",
        "linux-vps"
      ],
      "problem": "Businesses often rely on separate systems for sales, inventory, expenses and branch operations, making it difficult to maintain a consistent and centralized view of their day-to-day activities.",
      "solution": "Built Stockify as a modular business platform where point-of-sale operations, inventory management, expense tracking, branch management and currencies operate through a shared backend and PostgreSQL data model.",
      "contributions": [
        "Developed the point-of-sale module covering daily sales workflows and transaction processing",
        "Built the inventory management module for managing products and stock operations",
        "Implemented the expense management module as part of the broader business platform",
        "Developed support for businesses operating across multiple branches",
        "Implemented multi-currency support across relevant application workflows",
        "Designed the ASP.NET Core backend and PostgreSQL persistence layer",
        "Structured the application around separate business modules while maintaining shared infrastructure and business data",
        "Containerized application services using Docker and deployed the platform to a custom VPS",
        "Configured and managed the production Linux server environment from scratch"
      ],
      "engineeringDecisions": [
        "Structured the platform around modular business domains so POS, inventory, expenses and future functionality can evolve independently",
        "Centralized core business data in PostgreSQL to maintain consistency between sales, inventory and financial operations",
        "Designed branch-aware workflows so the same system can support businesses operating from multiple locations",
        "Handled currencies as explicit business entities rather than assuming a single application-wide currency",
        "Used REST APIs to separate frontend concerns from backend business logic and persistence",
        "Used Docker to standardize deployment and simplify production operation on a self-managed Linux VPS"
      ],
      "challenges": "Designing the system to support different business models required keeping the platform flexible while maintaining consistency between interconnected modules such as sales, inventory, expenses, branches and currencies.",
      "outcome": "Delivered a centralized and extensible business management platform combining point-of-sale, inventory, expenses, multi-branch operations and multi-currency support within a single system.",
      "featured": false,
      "githubUrl": "",
      "liveUrl": "",
      "appStoreUrl": "",
      "playStoreUrl": "",
      "screenshots": [],
      "seo": {
        "title": "",
        "description": "",
        "ogImage": "",
        "ogImageAlt": "",
        "noindex": false
      }
    }
  ]
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (7, 4, 'experience-list', '{
  "labels": {
    "responsibilities": "Key responsibilities",
    "technologies": "Technologies",
    "skills": "Professional skills",
    "relatedProject": "View {title} project"
  },
  "items": [
    {
      "role": "Software Engineer",
      "company": "Safi Cosmetics",
      "companyLogoUrl": "https://media.licdn.com/dms/image/v2/C4E0BAQFu2m7DFeS3CQ/company-logo_200_200/company-logo_200_200/0/1679305686348/safi_health__beauty_logo?e=2147483647&v=beta&t=O8dUHqK_ZW4Cdy6Om0aV6OHr2DbPzsXJIKcrYJfb4zU",
      "period": "Feb 2026 – Present",
      "location": "Adliyeh, Lebanon",
      "description": "Design and develop custom software solutions for Safi Cosmetics across web, mobile and internal business systems. Developed and released a production mobile commerce application published on both the Apple App Store and Google Play, including its backend integrations and release process. I also designed and built Safi Ticket, an IT service desk platform that centralizes support requests and automatically converts incoming support emails into trackable tickets. Alongside software development, I support NetSuite ERP workflows, maintain and improve the company''s WooCommerce ecosystem, and translate operational requirements into reliable and maintainable software solutions.",
      "responsibilities": [
        "Design and develop full-stack web and mobile applications based on business requirements",
        "Develop and maintain a production mobile application published on the Apple App Store and Google Play",
        "Manage mobile application preparation, configuration and production releases for both iOS and Android",
        "Designed and developed Safi Ticket, a centralized IT service desk platform for managing support requests",
        "Implemented email ingestion that automatically converts messages sent to the IT support mailbox into trackable tickets",
        "Build workflows for tracking ticket status, ownership, history and pending IT requests",
        "Translate business processes and operational requirements into maintainable software solutions",
        "Support and troubleshoot NetSuite ERP workflows across different business functions",
        "Maintain and improve the company''s WooCommerce-based websites and related integrations",
        "Investigate application, integration and workflow issues across business systems",
        "Work directly with users and departments to identify process improvements and opportunities for automation"
      ],
      "technologyKeys": [
        "netsuite",
        "wordpress",
        "woocommerce",
        "flutter",
        "react",
        "dotnet",
        "firebase",
        "docker"
      ],
      "skills": [
        "Software Engineering",
        "Full-Stack Development",
        "Web Application Development",
        "Mobile Application Development",
        "Business Process Analysis",
        "Requirements Analysis",
        "Workflow Automation",
        "Systems Integration",
        "IT Service Management",
        "ERP Support",
        "Technical Troubleshooting",
        "Problem Solving",
        "Stakeholder Communication",
        "Process Improvement",
        "Cross-Functional Collaboration"
      ]
    },
    {
      "role": "Support Engineer",
      "company": "Allied Engineering Group",
      "companyLogoUrl": "https://media.licdn.com/dms/image/v2/C560BAQEuN7opGUnh2Q/company-logo_200_200/company-logo_200_200/0/1630634768305/aeg_mea_logo?e=2147483647&v=beta&t=cebIhXcaoTRndMzmeUl6K1ICXu_Ip0YyeXER811mnfU",
      "period": "May 2025 – Feb 2026",
      "location": "Verdun, Lebanon",
      "description": "Supported enterprise software systems by investigating functional and performance issues, validating new features, analyzing database behavior, and collaborating with development teams to resolve production problems. Worked closely with clients and technical teams to diagnose issues, understand business workflows, and maintain the stability and performance of interconnected applications.",
      "responsibilities": [
        "Test and validate new enterprise software features",
        "Investigate functional, integration, and performance issues",
        "Analyze data flows and troubleshoot issues across SQL Server databases",
        "Optimize SQL queries and create indexes to improve performance",
        "Deploy, configure, and monitor Windows services",
        "Collaborate with clients and development teams to diagnose and resolve technical issues"
      ],
      "technologyKeys": [
        "sql-server"
      ],
      "skills": [
        "Technical Troubleshooting",
        "Root Cause Analysis",
        "SQL Performance Analysis",
        "Problem Solving",
        "Client Communication",
        "Business Process Understanding",
        "Incident Prioritization",
        "Cross-Team Collaboration"
      ]
    },
    {
      "role": "IT Helpdesk Support",
      "company": "Safi Cosmetics",
      "companyLogoUrl": "https://media.licdn.com/dms/image/v2/C4E0BAQFu2m7DFeS3CQ/company-logo_200_200/company-logo_200_200/0/1679305686348/safi_health__beauty_logo?e=2147483647&v=beta&t=O8dUHqK_ZW4Cdy6Om0aV6OHr2DbPzsXJIKcrYJfb4zU",
      "period": "Dec 2023 – May 2025",
      "location": "Adliyeh, Lebanon",
      "description": "Provided technical support across the company''s IT environment and business systems, helping users resolve hardware, software, and ERP-related issues. Supported day-to-day operations by investigating technical problems, assisting with business workflows, and coordinating solutions between users and technical teams.",
      "responsibilities": [
        "Provide day-to-day technical support for users, systems, and business applications",
        "Investigate hardware, software, and ERP-related issues",
        "Support users across business workflows and internal systems",
        "Coordinate technical issues and solutions with users and external technical teams",
        "Evaluate hardware requirements and recommend suitable specifications",
        "Document recurring issues and help improve support processes"
      ],
      "technologyKeys": [
        "netsuite"
      ],
      "skills": [
        "Technical Support",
        "Troubleshooting",
        "User Support",
        "ERP Support",
        "Communication",
        "Problem Solving",
        "Hardware Assessment",
        "Business Process Understanding",
        "Service Orientation"
      ]
    },
    {
      "role": "Software Developer Intern",
      "company": "The Net Global",
      "companyLogoUrl": "https://www.thenetglobal.group/images/The-Net-Global-Logo.png",
      "period": "May 2023 – Jul 2023",
      "location": "Karantina, Lebanon",
      "description": "Gained practical exposure to production software systems while assisting with SQL maintenance, debugging, and technical troubleshooting. Worked alongside experienced developers to understand how applications interact with databases and services and how technical solutions are applied in a professional software environment.",
      "responsibilities": [
        "Assist with SQL maintenance and debugging tasks",
        "Support technical troubleshooting and investigation",
        "Observe how applications interact with databases and backend services",
        "Contribute to day-to-day technical tasks alongside experienced developers"
      ],
      "technologyKeys": [
        "sql-server",
        "csharp"
      ],
      "skills": [
        "SQL Troubleshooting",
        "Technical Problem Solving",
        "Analytical Thinking",
        "Team Collaboration",
        "Professional Communication",
        "Self-Learning",
        "Attention to Detail",
        "Adaptability"
      ]
    }
  ]
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (8, 5, 'contact-links', '{
  "items": [
    {
      "label": "GitHub - projects and source code",
      "href": "https://github.com/mostafaabbas0001",
      "external": true
    },
    {
      "label": "LinkedIn - professional profile",
      "href": "https://www.linkedin.com/in/mostafaabbas0001",
      "external": true
    },
    {
      "label": "Projects - selected software work",
      "href": "/projects",
      "external": false
    }
  ]
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (9, 8, 'projects-list', '{
  "items": [
    {
      "slug": "safi-ticket-service-desk",
      "projectUrl": "",
      "logoUrl": "/Uploads/images/343f789e4235414a8857a118a68583f9.png",
      "title": "Safi Ticket - مكتب خدمات تقنية المعلومات",
      "shortDescription": "منصة لإدارة خدمات تقنية المعلومات تعمل على توحيد طلبات الدعم، وتحويل رسائل البريد الإلكتروني الواردة تلقائيًا إلى تذاكر قابلة للتتبع، وتوفير سير عمل منظم لقسم تقنية المعلومات لإدارة المشكلات.",
      "description": "منصة مخصصة لإدارة خدمات تقنية المعلومات تم تطويرها لصالح Safi Cosmetics بهدف توحيد وتنظيم طلبات الدعم التقني في مختلف أقسام الشركة. يتكامل النظام مع عنوان بريد إلكتروني مخصص لدعم تقنية المعلومات، حيث يقوم تلقائيًا باستقبال الرسائل الواردة وتحويلها إلى تذاكر يمكن تتبعها وإدارتها من خلال التطبيق. يحل هذا النظام محل أسلوب الدعم المشتت عبر البريد الإلكتروني بسير عمل منظم يمنح قسم تقنية المعلومات رؤية أوضح للطلبات، والمسؤوليات، والحالات، والأعمال المعلقة.",
      "year": "2026",
      "role": "مهندس برمجيات",
      "category": "إدارة خدمات تقنية المعلومات / برمجيات الأعمال",
      "technologyKeys": [
        "react",
        "typescript",
        "dotnet",
        "postgresql",
        "docker"
      ],
      "problem": "كانت طلبات تقنية المعلومات تصل بشكل أساسي عبر البريد الإلكتروني، مما جعل من الصعب الحصول على رؤية مركزية لاحتياجات الأقسام، وتتبع المشكلات غير المحلولة، ومراجعة سجل الطلبات، وضمان عدم ضياع طلبات الدعم المهمة ضمن محادثات البريد الإلكتروني.",
      "solution": "بنيت Safi Ticket كمنصة مركزية لإدارة خدمات تقنية المعلومات، حيث يتم التعامل مع طلبات الدعم على شكل تذاكر منظمة. يتكامل النظام مع صندوق بريد مخصص للدعم، ويستقبل رسائل البريد الإلكتروني الواردة ويحوّلها تلقائيًا إلى تذاكر، بحيث تصبح الطلبات المرسلة عبر البريد الإلكتروني جزءًا من سير العمل نفسه القابل للتتبع إلى جانب الطلبات التي يتم إنشاؤها مباشرة من داخل التطبيق.",
      "contributions": [
        "صممت وطورت منصة Safi Ticket لإدارة عمليات دعم تقنية المعلومات",
        "نفذت آلية لاستقبال رسائل البريد الإلكتروني وتحويل الرسائل المرسلة إلى صندوق دعم تقنية المعلومات تلقائيًا إلى تذاكر",
        "وحّدت طلبات الدعم ضمن نظام تذاكر منظم بدلًا من الاعتماد على محادثات البريد الإلكتروني المنفصلة",
        "بنيت مسارات عمل لتتبع حالة التذكرة والمسؤول عنها وسجل الطلب",
        "صممت النظام بما يتناسب مع الاحتياجات التشغيلية اليومية لقسم تقنية المعلومات",
        "حوّلت إجراءات الدعم الحالية إلى سير عمل برمجي أكثر تنظيمًا وقابلية للتتبع"
      ],
      "engineeringDecisions": [
        "اعتمدت التذاكر كمصدر مركزي وأساسي لطلبات تقنية المعلومات بدلًا من الاعتماد على سلاسل رسائل البريد الإلكتروني",
        "دمجت سير عمل البريد الإلكتروني الحالي بحيث يستطيع الموظفون الاستمرار في طلب المساعدة عبر البريد الإلكتروني دون الحاجة إلى تغيير طريقتهم المعتادة",
        "حوّلت رسائل الدعم الواردة تلقائيًا إلى تذاكر منظمة لتحسين إمكانية التتبع",
        "وحّدت سجل الطلبات والمسؤوليات والحالات بحيث يتمكن فريق تقنية المعلومات من تحديد الأعمال المعلقة والمكتملة والتي تحتاج إلى متابعة بوضوح",
        "صممت المنصة حول إجراءات تقنية المعلومات الحالية لتسهيل اعتماد النظام وتقليل التغيير المطلوب من المستخدمين"
      ],
      "challenges": "كان التحدي الرئيسي هو إدخال نظام منظم لإدارة التذاكر دون إجبار الموظفين على تغيير الطريقة التي يستخدمونها عادةً للتواصل مع قسم تقنية المعلومات. كان من الضروري الحفاظ على سهولة استخدام البريد الإلكتروني مع تحويل هذه الطلبات في الوقت نفسه إلى سجلات منظمة وقابلة للتتبع داخل نظام مكتب الخدمات.",
      "outcome": "تم تقديم نظام مركزي لمكتب خدمات تقنية المعلومات يجعل الطلبات الواردة أسهل في التتبع وتحديد الأولويات والإدارة، مع تقليل الاعتماد على مراجعة محادثات البريد الإلكتروني يدويًا لمعرفة احتياجات الأقسام والطلبات المعلقة.",
      "featured": true,
      "githubUrl": "",
      "liveUrl": "",
      "appStoreUrl": "",
      "playStoreUrl": "",
      "screenshots": [],
      "seo": {
        "title": "",
        "description": "",
        "ogImage": "",
        "ogImageAlt": "",
        "noindex": false
      }
    },
    {
      "slug": "house-of-soap-mobile-app",
      "projectUrl": "",
      "logoUrl": "/Uploads/images/1215cf65e8c24f8a97c1885dacf4fad6.webp",
      "title": "تطبيق House of Soap للموبايل",
      "shortDescription": "تطبيق تجارة إلكترونية إنتاجي مبني باستخدام Flutter ومنشور على Apple App Store وGoogle Play، ومدعوم بطبقة تكامل آمنة باستخدام .NET تربط عدة متاجر WooCommerce إقليمية.",
      "description": "تطبيق تجارة إلكترونية إنتاجي متعدد المنصات تم تطويره لصالح House of Soap باستخدام Flutter ومدعوم بواجهة خلفية مخصصة باستخدام C# وASP.NET Core. تعمل الواجهة الخلفية كجسر آمن بين تطبيق الموبايل وعدة مواقع WooCommerce إقليمية من خلال واجهات WordPress وWooCommerce REST API، مع الحفاظ على بيانات الاعتماد الحساسة بشكل آمن على الخادم. كما توفر لوحة إدارة مبنية باستخدام React إدارة مركزية لإعدادات التطبيق الإقليمية. وتوليت أيضًا عملية إصدار تطبيق الموبايل بالكامل، وقمت شخصيًا بنشر التطبيق على كل من Apple App Store وGoogle Play.",
      "year": "2026",
      "role": "مطور Full-Stack",
      "category": "موبايل / تجارة إلكترونية",
      "technologyKeys": [
        "flutter",
        "react",
        "typescript",
        "dotnet",
        "postgis",
        "woocommerce",
        "wordpress-rest-api",
        "rest-apis",
        "docker",
        "firebase",
        "linux-vps"
      ],
      "problem": "كانت House of Soap تدير متاجر WooCommerce منفصلة عبر عدة نطاقات فرعية إقليمية، وكانت بحاجة إلى تطبيق موبايل إنتاجي موحد قادر على ربط المستخدمين بمصدر البيانات الإقليمي الصحيح. كما أن ربط Flutter مباشرةً بـ WooCommerce كان سيؤدي إلى كشف بيانات اعتماد API ذات الصلاحيات العالية داخل كود التطبيق القابل للتوزيع.",
      "solution": "صممت طبقة تكامل مخصصة باستخدام ASP.NET Core تقوم بتخزين بيانات اعتماد WooCommerce وWordPress بشكل آمن وتعمل كجسر اتصال بين تطبيق Flutter والمتاجر الإقليمية. يتم استخدام PostgreSQL وPostGIS والمعلومات الجغرافية لتحديد المنطقة المناسبة وتوجيه الطلبات إلى مصدر WooCommerce الصحيح. كما قمت بإعداد وتهيئة وإصدار تطبيق الموبايل للتوزيع الإنتاجي على كل من iOS وAndroid.",
      "contributions": [
        "طورت تطبيق الموبايل متعدد المنصات الموجه للعملاء باستخدام Flutter",
        "صممت وبنيت الواجهة الخلفية باستخدام ASP.NET Core لربط تطبيق الموبايل بـ WooCommerce",
        "دمجت واجهات WordPress وWooCommerce REST API لنقل بيانات التجارة الإلكترونية إلى تطبيق الموبايل",
        "أبقيت بيانات اعتماد WooCommerce وWordPress الحساسة محفوظة حصريًا في الواجهة الخلفية بدلًا من تضمينها في تطبيق Flutter",
        "بنيت لوحة إدارة باستخدام React لإدارة الإعدادات الإقليمية",
        "نفذت دعم عدة نطاقات WooCommerce فرعية إقليمية من خلال واجهة خلفية مركزية",
        "دمجت PostgreSQL وPostGIS لدعم منطق التطبيق الجغرافي وتحديد المناطق",
        "أعددت وهيأت نسخ الإنتاج لكل من iOS وAndroid",
        "أدرت عملية الإصدار على Apple App Store وقمت شخصيًا بنشر تطبيق iOS",
        "أدرت عملية الإصدار على Google Play وقمت شخصيًا بنشر تطبيق Android",
        "حوّلت البنية التحتية للتطبيق إلى حاويات باستخدام Docker ونشرتها على خادم VPS خاص",
        "قمت بإعداد وتأمين وإدارة بيئة خادم Linux الإنتاجية بالكامل من الصفر"
      ],
      "engineeringDecisions": [
        "أنشأت طبقة Backend-for-Frontend بدلًا من السماح لتطبيق Flutter بالتواصل مباشرةً مع واجهات WooCommerce الحساسة",
        "خزنت أسرار ومفاتيح API حصريًا على الخادم لمنع كشف بيانات الاعتماد من خلال الهندسة العكسية لتطبيق الموبايل",
        "استخدمت الواجهة الخلفية المخصصة المبنية باستخدام .NET كطبقة توجيه وتكامل بين عدة متاجر WooCommerce إقليمية",
        "استخدمت PostgreSQL وPostGIS لدعم التوجيه الجغرافي وتحديد المناطق",
        "أبقيت كل متجر WooCommerce إقليمي كمصدر البيانات الأساسي للسوق الخاص به",
        "استخدمت قاعدة كود واحدة باستخدام Flutter لتوفير تطبيقات إنتاجية لكل من iOS وAndroid",
        "أدرت دورة الإصدار الإنتاجية لكل من Apple App Store وGoogle Play",
        "حوّلت خدمات التطبيق إلى حاويات باستخدام Docker وقمت بتشغيلها على خادم Linux VPS تتم إدارته بشكل مستقل"
      ],
      "challenges": "كان التحدي الأساسي هو إنشاء تجربة موبايل إنتاجية موحدة فوق عدة متاجر WooCommerce مستقلة، مع التعامل الآمن مع بيانات اعتماد API الحساسة، وتوجيه المستخدمين إلى مصدر البيانات الإقليمي الصحيح، وإعداد التطبيق للتوزيع الإنتاجي على كل من iOS وAndroid.",
      "outcome": "تم تقديم تطبيق تجارة إلكترونية إنتاجي للموبايل وقمت شخصيًا بنشره على كل من Apple App Store وGoogle Play، مما وفر للمستخدمين تجربة موحدة عبر عدة متاجر WooCommerce إقليمية مع الحفاظ على بيانات الاعتماد الحساسة بشكل آمن خلف واجهة خلفية مخصصة.",
      "featured": true,
      "githubUrl": "",
      "liveUrl": "",
      "appStoreUrl": "",
      "playStoreUrl": "",
      "screenshots": [],
      "seo": {
        "title": "",
        "description": "",
        "ogImage": "",
        "ogImageAlt": "",
        "noindex": false
      }
    },
    {
      "slug": "triple-h-broker-cms",
      "projectUrl": "https://triplehbroker.com",
      "logoUrl": "/Uploads/images/69cbd131e74747569890a3d0bdee22b3.webp",
      "title": "موقع Triple H Broker ونظام إدارة المحتوى",
      "shortDescription": "موقع مؤسسي ديناميكي بالكامل مع نظام إدارة محتوى لشركة وساطة تأمين، يمنح المسؤولين تحكمًا كاملًا بالصفحات والأقسام ومحتوى الموقع دون الحاجة إلى تعديل الكود.",
      "description": "موقع Full-Stack قائم على نظام إدارة محتوى تم تطويره لصالح Triple H Broker باستخدام React مع Vite في الواجهة الأمامية وC# مع ASP.NET Core في الواجهة الخلفية. توفر المنصة واجهات REST API تستهلكها الواجهة الأمامية، بالإضافة إلى لوحة إدارة شاملة تتيح للمستخدمين المخولين إنشاء الصفحات والأقسام ومحتوى الموقع وتعديلها وإدارتها ديناميكيًا دون الحاجة إلى تغييرات ثابتة في كود الواجهة الأمامية.",
      "year": "2025",
      "role": "مطور Full-Stack",
      "category": "نظام إدارة محتوى / موقع أعمال",
      "technologyKeys": [
        "react",
        "vite",
        "typescript",
        "csharp",
        "dotnet",
        "postgresql",
        "rest-apis",
        "docker",
        "linux-vps"
      ],
      "problem": "كانت الشركة بحاجة إلى موقع احترافي يمكن تطويره وتحديثه باستمرار دون الحاجة إلى تدخل مطور في كل مرة تتم فيها إضافة صفحة أو قسم أو محتوى جديد أو تعديل المحتوى الحالي.",
      "solution": "بنيت بنية CMS ديناميكية تتم من خلالها إدارة هيكل الموقع ومحتواه عبر لوحة الإدارة وتخزين البيانات في PostgreSQL. توفر الواجهة الخلفية المبنية باستخدام ASP.NET Core واجهات REST API منظمة تسمح لواجهة React بعرض الصفحات والأقسام التي يحددها المسؤولون بشكل ديناميكي.",
      "contributions": [
        "طورت الواجهة الأمامية باستخدام React وVite وربطتها بالواجهة الخلفية المبنية باستخدام ASP.NET Core",
        "بنيت لوحة الإدارة لإنشاء الصفحات والأقسام ومحتوى الموقع وإدارتها بشكل ديناميكي",
        "صممت نموذج البيانات في PostgreSQL لدعم هياكل الموقع والمحتوى القابل للتخصيص",
        "نفذت واجهات REST API التي تستخدمها الواجهة الأمامية لعرض المحتوى الديناميكي دون صفحات ثابتة في الكود",
        "حوّلت التطبيق إلى حاويات باستخدام Docker ونشرته على خادم VPS خاص",
        "قمت بإعداد وإدارة بيئة خادم Linux الإنتاجية بالكامل من الصفر"
      ],
      "engineeringDecisions": [
        "فصلت إدارة المحتوى عن طبقة العرض حتى يتمكن المسؤولون من تحديث الموقع دون الحاجة إلى تعديل كود الواجهة الأمامية",
        "اعتمدت الواجهة الخلفية وواجهات API كمصدر أساسي للصفحات والأقسام التي يتم إنشاؤها ديناميكيًا",
        "استخدمت PostgreSQL كقاعدة بيانات علائقية لمحتوى نظام إدارة المحتوى وإعدادات التطبيق",
        "استخدمت Docker لتوفير عمليات نشر متناسقة وقابلة لإعادة التنفيذ",
        "استضفت المنصة على خادم Linux VPS تتم إدارته بشكل مستقل للحفاظ على التحكم الكامل بالبنية التحتية الإنتاجية"
      ],
      "challenges": "كان التحدي المعماري الرئيسي هو تصميم نموذج محتوى مرن يسمح للمسؤولين بإنشاء صفحات وأقسام متنوعة، مع الحفاظ على نظام مكونات الواجهة الأمامية منظمًا وقابلًا لإعادة الاستخدام وسهل الصيانة.",
      "outcome": "تم تقديم منصة CMS جاهزة للاستخدام الفعلي تمنح الشركة تحكمًا إداريًا كاملًا بموقعها وتتيح إنشاء صفحات وأقسام جديدة دون تعديل أو إعادة نشر كود الواجهة الأمامية.",
      "featured": true,
      "githubUrl": "",
      "liveUrl": "",
      "appStoreUrl": "",
      "playStoreUrl": "",
      "screenshots": [],
      "seo": {
        "title": "",
        "description": "",
        "ogImage": "",
        "ogImageAlt": "",
        "noindex": false
      }
    },
    {
      "slug": "promo-plus-ecommerce",
      "projectUrl": "https://promopluslb.com",
      "logoUrl": "/Uploads/images/c1de1fe4abb1401eb272bc96d190050c.webp",
      "title": "منصة Promo Plus للتجارة الإلكترونية",
      "shortDescription": "منصة تجارة إلكترونية Full-Stack تعتمد على العرض من جهة الخادم، مع إدارة مركزية للمنتجات والمحتوى الديناميكي للمتجر وتكاملات إعلانية مع Meta.",
      "description": "منصة تسوق إلكترونية متكاملة تم تطويرها لصالح Promo Plus باستخدام React مع Vite لواجهة المتجر وC# مع ASP.NET Core للواجهة الخلفية. يعتمد التطبيق على العرض من جهة الخادم ويتضمن لوحة إدارة شاملة تتيح التحكم بالمنتجات ومحتوى المتجر. كما تم دمج Meta Pixel لتسجيل أحداث العملاء المهمة لأغراض تتبع التحويلات والتحليلات والإعلانات الموجهة.",
      "year": "2026",
      "role": "مطور Full-Stack",
      "category": "تجارة إلكترونية",
      "technologyKeys": [
        "react",
        "vite",
        "javascript",
        "csharp",
        "dotnet",
        "postgresql",
        "rest-apis",
        "ssr",
        "meta-pixel",
        "docker",
        "linux-vps"
      ],
      "problem": "كانت الشركة بحاجة إلى منصة مبيعات إلكترونية متكاملة يمكن إدارتها داخليًا، مع دعم الإدارة الديناميكية للمنتجات، والعرض الملائم لمحركات البحث، وتتبع أحداث الحملات الإعلانية.",
      "solution": "طورت واجهة متجر باستخدام React تعتمد على العرض من جهة الخادم، ومتصلة بواجهة خلفية مخصصة باستخدام ASP.NET Core وقاعدة بيانات PostgreSQL. توحّد لوحة الإدارة عمليات إدارة المنتجات ومحتوى المتجر، بينما يسجل Meta Pixel أحداث العملاء المهمة لاستخدامها في التحليلات وتتبع التحويلات والحملات الإعلانية.",
      "contributions": [
        "طورت واجهة متجر التجارة الإلكترونية الموجهة للعملاء باستخدام React وVite",
        "نفذت العرض من جهة الخادم للصفحات العامة للمتجر",
        "بنيت الواجهة الخلفية باستخدام ASP.NET Core وواجهات REST API التي تشغّل المتجر ولوحة الإدارة",
        "طورت وظائف إدارية لإدارة المنتجات ومحتوى الموقع الديناميكي",
        "دمجت Meta Pixel لتتبع أحداث العملاء والإعلانات وتحليلات التحويل",
        "صممت وربطت قاعدة بيانات PostgreSQL",
        "حوّلت التطبيق إلى حاويات باستخدام Docker ونشرته على خادم VPS خاص",
        "قمت بإعداد وإدارة بيئة خادم Linux الإنتاجية بالكامل من الصفر"
      ],
      "engineeringDecisions": [
        "استخدمت العرض من جهة الخادم للصفحات العامة للمتجر لتحسين العرض الأولي وظهور الصفحات في محركات البحث",
        "وحّدت إدارة المنتجات والمحتوى من خلال لوحة الإدارة بدلًا من ربط تغييرات المتجر بعمليات نشر جديدة للواجهة الأمامية",
        "فصلت تكاملات Meta Pixel وتتبع الأحداث عن منطق التجارة الأساسي للتطبيق",
        "استخدمت PostgreSQL كقاعدة البيانات العلائقية الأساسية لبيانات التطبيق والتجارة الإلكترونية",
        "استخدمت Docker لتوفير عمليات نشر قابلة لإعادة التنفيذ على خادم Linux VPS تتم إدارته بشكل مستقل"
      ],
      "challenges": "تطلب دعم تجربة تجارة إلكترونية ديناميكية مع العرض من جهة الخادم فصلًا دقيقًا بين منطق التطبيق الذي يعمل على الخادم، والوظائف الخاصة بالمتصفح، وتكاملات التتبع الخارجية.",
      "outcome": "تم تقديم منصة تجارة إلكترونية جاهزة للاستخدام الفعلي تتيح للشركة إدارة المنتجات والمتجر بشكل مستقل، مع الاستفادة من العرض من جهة الخادم وتتبع التحويلات وتكاملات إعلانات Meta.",
      "featured": true,
      "githubUrl": "",
      "liveUrl": "",
      "appStoreUrl": "",
      "playStoreUrl": "",
      "screenshots": [],
      "seo": {
        "title": "",
        "description": "",
        "ogImage": "",
        "ogImageAlt": "",
        "noindex": false
      }
    },
    {
      "slug": "stockify-pos",
      "projectUrl": "",
      "logoUrl": "/Uploads/images/fd02472072a044f883d4264dce200e58.webp",
      "title": "Stockify POS",
      "shortDescription": "منصة معيارية لنقاط البيع وإدارة الأعمال تدعم تعدد الفروع والعملات وعمليات المخزون وتتبع المصروفات.",
      "description": "منصة Full-Stack لنقاط البيع وإدارة الأعمال تم تصميمها لدعم نماذج أعمال متعددة من خلال بنية معيارية. تجمع Stockify بين عمليات نقاط البيع، وإدارة المخزون، وتتبع المصروفات، وإدارة الفروع المتعددة، ودعم العملات المتعددة ضمن تطبيق مركزي مدعوم بقاعدة بيانات PostgreSQL.",
      "year": "2025",
      "role": "مطور Full-Stack",
      "category": "نقاط بيع / إدارة أعمال",
      "technologyKeys": [
        "react",
        "typescript",
        "dotnet",
        "postgresql",
        "rest-apis",
        "docker",
        "linux-vps"
      ],
      "problem": "تعتمد العديد من الشركات على أنظمة منفصلة للمبيعات والمخزون والمصروفات وإدارة الفروع، مما يجعل من الصعب الحفاظ على رؤية موحدة ومتناسقة للعمليات اليومية.",
      "solution": "بنيت Stockify كمنصة أعمال معيارية تعمل فيها عمليات نقاط البيع وإدارة المخزون وتتبع المصروفات وإدارة الفروع والعملات من خلال واجهة خلفية مشتركة ونموذج بيانات مركزي في PostgreSQL.",
      "contributions": [
        "طورت وحدة نقاط البيع التي تغطي عمليات البيع اليومية ومعالجة المعاملات",
        "بنيت وحدة إدارة المخزون لإدارة المنتجات وعمليات المخزون",
        "نفذت وحدة إدارة المصروفات كجزء من منصة إدارة الأعمال",
        "طورت دعم الشركات التي تعمل عبر عدة فروع",
        "نفذت دعم تعدد العملات ضمن العمليات المناسبة في التطبيق",
        "صممت الواجهة الخلفية باستخدام ASP.NET Core وطبقة تخزين البيانات باستخدام PostgreSQL",
        "هيكلت التطبيق حول وحدات أعمال مستقلة مع الحفاظ على بنية تحتية وبيانات أعمال مشتركة",
        "حوّلت خدمات التطبيق إلى حاويات باستخدام Docker ونشرت المنصة على خادم VPS خاص",
        "قمت بإعداد وإدارة بيئة خادم Linux الإنتاجية بالكامل من الصفر"
      ],
      "engineeringDecisions": [
        "هيكلت المنصة حول مجالات أعمال معيارية بحيث يمكن لوحدات نقاط البيع والمخزون والمصروفات والوظائف المستقبلية التطور بشكل مستقل",
        "وحّدت بيانات الأعمال الأساسية في PostgreSQL للحفاظ على الاتساق بين المبيعات والمخزون والعمليات المالية",
        "صممت تدفقات عمل تراعي الفروع بحيث يستطيع النظام نفسه دعم الشركات التي تعمل من عدة مواقع",
        "تعاملت مع العملات ككيانات أعمال مستقلة بدلًا من افتراض وجود عملة واحدة ثابتة على مستوى التطبيق",
        "استخدمت REST API لفصل مسؤوليات الواجهة الأمامية عن منطق الأعمال والتخزين في الواجهة الخلفية",
        "استخدمت Docker لتوحيد عمليات النشر وتبسيط تشغيل المنصة في بيئة الإنتاج على خادم Linux VPS تتم إدارته بشكل مستقل"
      ],
      "challenges": "تطلب تصميم النظام لدعم نماذج أعمال مختلفة الحفاظ على مرونة المنصة مع ضمان الاتساق بين الوحدات المترابطة مثل المبيعات والمخزون والمصروفات والفروع والعملات.",
      "outcome": "تم تقديم منصة مركزية وقابلة للتوسع لإدارة الأعمال تجمع بين نقاط البيع والمخزون والمصروفات وعمليات الفروع المتعددة ودعم العملات المتعددة ضمن نظام واحد.",
      "featured": false,
      "githubUrl": "",
      "liveUrl": "",
      "appStoreUrl": "",
      "playStoreUrl": "",
      "screenshots": [],
      "seo": {
        "title": "",
        "description": "",
        "ogImage": "",
        "ogImageAlt": "",
        "noindex": false
      }
    }
  ]
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (10, 9, 'experience-list', '{
  "labels": {
    "responsibilities": "المسؤوليات الرئيسية",
    "technologies": "التقنيات",
    "skills": "المهارات المهنية",
    "relatedProject": "عرض مشروع {title}"
  },
  "items": [
    {
      "role": "مهندس برمجيات",
      "company": "Safi Cosmetics",
      "companyLogoUrl": "https://media.licdn.com/dms/image/v2/C4E0BAQFu2m7DFeS3CQ/company-logo_200_200/company-logo_200_200/0/1679305686348/safi_health__beauty_logo?e=2147483647&v=beta&t=O8dUHqK_ZW4Cdy6Om0aV6OHr2DbPzsXJIKcrYJfb4zU",
      "period": "فبراير 2026 – حتى الآن",
      "location": "العدلية، لبنان",
      "description": "أصمم وأطور حلولًا برمجية مخصصة لصالح Safi Cosmetics تشمل تطبيقات الويب والموبايل وأنظمة الأعمال الداخلية. طورت وأطلقت تطبيق تجارة إلكترونية إنتاجيًا للموبايل، وتم نشره على كل من Apple App Store وGoogle Play، بما في ذلك تطوير التكاملات الخلفية وإدارة عملية الإصدار. كما صممت وطورت Safi Ticket، وهو نظام لإدارة خدمات تقنية المعلومات يعمل على توحيد طلبات الدعم وتحويل رسائل البريد الإلكتروني الواردة تلقائيًا إلى تذاكر قابلة للتتبع. وإلى جانب تطوير البرمجيات، أدعم عمليات NetSuite ERP، وأعمل على صيانة وتحسين منظومة WooCommerce الخاصة بالشركة، وتحويل المتطلبات التشغيلية إلى حلول برمجية موثوقة وسهلة الصيانة.",
      "responsibilities": [
        "تصميم وتطوير تطبيقات ويب وموبايل Full-Stack بناءً على متطلبات العمل",
        "تطوير وصيانة تطبيق موبايل إنتاجي منشور على Apple App Store وGoogle Play",
        "إدارة إعداد وتهيئة وإصدارات تطبيق الموبايل الإنتاجية لكل من iOS وAndroid",
        "تصميم وتطوير Safi Ticket، وهو نظام مركزي لإدارة خدمات تقنية المعلومات وطلبات الدعم",
        "تنفيذ نظام لاستقبال رسائل البريد الإلكتروني وتحويل الرسائل المرسلة إلى صندوق دعم تقنية المعلومات تلقائيًا إلى تذاكر قابلة للتتبع",
        "بناء مسارات عمل لتتبع حالة التذاكر والمسؤول عنها وسجلها وطلبات تقنية المعلومات المعلقة",
        "تحويل العمليات التجارية والمتطلبات التشغيلية إلى حلول برمجية قابلة للصيانة",
        "دعم واستكشاف مشكلات عمليات NetSuite ERP عبر وظائف العمل المختلفة",
        "صيانة وتحسين مواقع الشركة المبنية باستخدام WooCommerce والتكاملات المرتبطة بها",
        "التحقيق في مشكلات التطبيقات والتكاملات وسير العمل عبر أنظمة الأعمال",
        "العمل مباشرةً مع المستخدمين والأقسام لتحديد فرص تحسين العمليات وأتمتتها"
      ],
      "technologyKeys": [
        "netsuite",
        "wordpress",
        "woocommerce",
        "flutter",
        "react",
        "dotnet",
        "firebase",
        "docker"
      ],
      "skills": [
        "هندسة البرمجيات",
        "تطوير Full-Stack",
        "تطوير تطبيقات الويب",
        "تطوير تطبيقات الموبايل",
        "تحليل العمليات التجارية",
        "تحليل المتطلبات",
        "أتمتة سير العمل",
        "تكامل الأنظمة",
        "إدارة خدمات تقنية المعلومات",
        "دعم أنظمة ERP",
        "استكشاف المشكلات التقنية",
        "حل المشكلات",
        "التواصل مع أصحاب المصلحة",
        "تحسين العمليات",
        "التعاون بين الفرق"
      ]
    },
    {
      "role": "مهندس دعم",
      "company": "Allied Engineering Group",
      "companyLogoUrl": "https://media.licdn.com/dms/image/v2/C560BAQEuN7opGUnh2Q/company-logo_200_200/company-logo_200_200/0/1630634768305/aeg_mea_logo?e=2147483647&v=beta&t=cebIhXcaoTRndMzmeUl6K1ICXu_Ip0YyeXER811mnfU",
      "period": "مايو 2025 – فبراير 2026",
      "location": "فردان، لبنان",
      "description": "قدمت الدعم لأنظمة برمجية مؤسسية من خلال التحقيق في المشكلات الوظيفية ومشكلات الأداء، والتحقق من الميزات الجديدة، وتحليل سلوك قواعد البيانات، والتعاون مع فرق التطوير لحل المشكلات في بيئات الإنتاج. عملت بشكل مباشر مع العملاء والفرق التقنية لتشخيص المشكلات وفهم سير العمليات التجارية والحفاظ على استقرار وأداء التطبيقات المترابطة.",
      "responsibilities": [
        "اختبار الميزات الجديدة في الأنظمة البرمجية المؤسسية والتحقق من عملها",
        "التحقيق في المشكلات الوظيفية ومشكلات التكامل والأداء",
        "تحليل تدفقات البيانات واستكشاف المشكلات ضمن قواعد بيانات SQL Server",
        "تحسين استعلامات SQL وإنشاء الفهارس لتحسين الأداء",
        "نشر خدمات Windows وإعدادها ومراقبتها",
        "التعاون مع العملاء وفرق التطوير لتشخيص المشكلات التقنية وحلها"
      ],
      "technologyKeys": [
        "sql-server"
      ],
      "skills": [
        "استكشاف المشكلات التقنية",
        "تحليل السبب الجذري",
        "تحليل أداء SQL",
        "حل المشكلات",
        "التواصل مع العملاء",
        "فهم العمليات التجارية",
        "تحديد أولويات الحوادث",
        "التعاون بين الفرق"
      ]
    },
    {
      "role": "دعم فني ومكتب مساعدة IT",
      "company": "Safi Cosmetics",
      "companyLogoUrl": "https://media.licdn.com/dms/image/v2/C4E0BAQFu2m7DFeS3CQ/company-logo_200_200/company-logo_200_200/0/1679305686348/safi_health__beauty_logo?e=2147483647&v=beta&t=O8dUHqK_ZW4Cdy6Om0aV6OHr2DbPzsXJIKcrYJfb4zU",
      "period": "ديسمبر 2023 – مايو 2025",
      "location": "العدلية، لبنان",
      "description": "قدمت الدعم التقني ضمن بيئة تكنولوجيا المعلومات وأنظمة الأعمال في الشركة، وساعدت المستخدمين على حل المشكلات المتعلقة بالأجهزة والبرمجيات وأنظمة ERP. كما دعمت العمليات اليومية من خلال التحقيق في المشكلات التقنية، والمساعدة في سير العمليات التجارية، وتنسيق الحلول بين المستخدمين والفرق التقنية.",
      "responsibilities": [
        "تقديم الدعم التقني اليومي للمستخدمين والأنظمة وتطبيقات الأعمال",
        "التحقيق في المشكلات المتعلقة بالأجهزة والبرمجيات وأنظمة ERP",
        "دعم المستخدمين عبر مختلف عمليات العمل والأنظمة الداخلية",
        "تنسيق المشكلات التقنية والحلول بين المستخدمين والفرق التقنية الخارجية",
        "تقييم متطلبات الأجهزة والتوصية بالمواصفات المناسبة",
        "توثيق المشكلات المتكررة والمساهمة في تحسين إجراءات الدعم"
      ],
      "technologyKeys": [
        "netsuite"
      ],
      "skills": [
        "الدعم التقني",
        "استكشاف الأخطاء وإصلاحها",
        "دعم المستخدمين",
        "دعم أنظمة ERP",
        "التواصل",
        "حل المشكلات",
        "تقييم الأجهزة",
        "فهم العمليات التجارية",
        "التركيز على جودة الخدمة"
      ]
    },
    {
      "role": "متدرب في تطوير البرمجيات",
      "company": "The Net Global",
      "companyLogoUrl": "https://www.thenetglobal.group/images/The-Net-Global-Logo.png",
      "period": "مايو 2023 – يوليو 2023",
      "location": "الكرنتينا، لبنان",
      "description": "اكتسبت خبرة عملية في التعامل مع أنظمة برمجية مستخدمة في بيئات فعلية من خلال المساعدة في صيانة SQL وتصحيح الأخطاء واستكشاف المشكلات التقنية. عملت إلى جانب مطورين ذوي خبرة لفهم كيفية تفاعل التطبيقات مع قواعد البيانات والخدمات، وكيفية تطبيق الحلول التقنية ضمن بيئة برمجية مهنية.",
      "responsibilities": [
        "المساعدة في مهام صيانة SQL وتصحيح الأخطاء",
        "دعم عمليات استكشاف المشكلات التقنية والتحقيق فيها",
        "فهم كيفية تفاعل التطبيقات مع قواعد البيانات والخدمات الخلفية",
        "المساهمة في المهام التقنية اليومية إلى جانب مطورين ذوي خبرة"
      ],
      "technologyKeys": [
        "sql-server",
        "csharp"
      ],
      "skills": [
        "استكشاف مشكلات SQL",
        "حل المشكلات التقنية",
        "التفكير التحليلي",
        "العمل الجماعي",
        "التواصل المهني",
        "التعلم الذاتي",
        "الاهتمام بالتفاصيل",
        "القدرة على التكيف"
      ]
    }
  ]
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (11, 10, 'contact-links', '{
  "items": [
    {
      "label": "GitHub - المشاريع والكود المصدري",
      "href": "https://github.com/mostafaabbas0001",
      "external": true
    },
    {
      "label": "LinkedIn - الملف المهني",
      "href": "https://www.linkedin.com/in/mostafaabbas0001",
      "external": true
    },
    {
      "label": "المشاريع - أعمال برمجية مختارة",
      "href": "/projects",
      "external": false
    }
  ]
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (12, 7, 'technologies', '{
  "label": "التقنيات",
  "groups": [
    {
      "label": "لغات البرمجة",
      "technologyKeys": [
        "typescript",
        "csharp",
        "javascript"
      ]
    },
    {
      "label": "واجهات الويب",
      "technologyKeys": [
        "react",
        "nextjs",
        "tailwind-css",
        "html5",
        "css3"
      ]
    },
    {
      "label": "تطبيقات الموبايل",
      "technologyKeys": [
        "flutter"
      ]
    },
    {
      "label": "الواجهة الخلفية",
      "technologyKeys": [
        "dotnet",
        "nodejs"
      ]
    },
    {
      "label": "قواعد البيانات",
      "technologyKeys": [
        "postgresql",
        "sql-server",
        "mongo-db"
      ]
    },
    {
      "label": "خدمات الواجهة الخلفية والسحابة",
      "technologyKeys": [
        "supabase",
        "firebase"
      ]
    },
    {
      "label": "البنية التحتية والنشر",
      "technologyKeys": [
        "docker",
        "linux-vps"
      ]
    },
    {
      "label": "أدوات التطوير وواجهات API",
      "technologyKeys": [
        "vs-code",
        "visual-studio",
        "postman",
        "swagger",
        "xcode"
      ]
    },
    {
      "label": "أدوات الذكاء الاصطناعي للتطوير",
      "technologyKeys": [
        "codex",
        "claude",
        "lovable"
      ]
    }
  ]
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (14, 6, 'tech-strip', '{
  "label": "التقنيات التي أعمل بها",
  "linkLabel": "المزيد عن التقنيات",
  "technologyKeys": [
    "typescript",
    "react",
    "nodejs",
    "dotnet",
    "postgresql",
    "docker",
    "flutter",
    "tailwind-css"
  ]
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (15, 6, 'featured-work', '{
  "label": "مشاريع مميزة",
  "headline": "تطبيقات ويب وموبايل <span class=\"text-primary\">مصممة للاستخدام الفعلي</span>.",
  "linkLabel": "استكشف جميع المشاريع",
  "projectSlugs": [
    "triple-h-broker-cms",
    "promo-plus-ecommerce",
    "house-of-soap-mobile-app",
    "stockify-pos"
  ]
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";
INSERT INTO public."Sections" ("id", "pageId", "key", "content") VALUES (16, 6, 'experience-preview', '{
  "headline": "<span class=\"text-primary\">الخبرة</span>",
  "linkLabel": "السجل الكامل",
  "count": 2
}')
ON CONFLICT ("id") DO UPDATE SET "pageId" = EXCLUDED."pageId", "key" = EXCLUDED."key", "content" = EXCLUDED."content";

-- ProfessionalExperiences
INSERT INTO public."ProfessionalExperiences" ("id", "start_date", "created_at", "updated_at") VALUES (1, '2023-12-01', '2026-09-21 13:15:01.895833+00', '2026-09-21 13:15:01.895833+00')
ON CONFLICT ("id") DO UPDATE SET "start_date" = EXCLUDED."start_date", "created_at" = EXCLUDED."created_at", "updated_at" = EXCLUDED."updated_at";

SELECT pg_catalog.setval(pg_get_serial_sequence('public."Languages"', 'id'), (SELECT MAX(id) FROM public."Languages"), true);
SELECT pg_catalog.setval(pg_get_serial_sequence('public."Technologies"', 'id'), (SELECT MAX(id) FROM public."Technologies"), true);
SELECT pg_catalog.setval(pg_get_serial_sequence('public."Globals"', 'id'), (SELECT MAX(id) FROM public."Globals"), true);
SELECT pg_catalog.setval(pg_get_serial_sequence('public."Pages"', 'id'), (SELECT MAX(id) FROM public."Pages"), true);
SELECT pg_catalog.setval(pg_get_serial_sequence('public."Sections"', 'id'), (SELECT MAX(id) FROM public."Sections"), true);
SELECT pg_catalog.setval(pg_get_serial_sequence('public."ProfessionalExperiences"', 'id'), (SELECT MAX(id) FROM public."ProfessionalExperiences"), true);

COMMIT;
