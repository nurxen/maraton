# Maratón · Guía de instalación (gratis, unos 20 minutos)

> **¿Ya la tenéis instalada y venís a actualizar a la v2?** Solo dos pasos:
> 1. Supabase → **SQL Editor** → New query → pega todo `schema-v2.sql` → **Run**.
> 2. GitHub → vuestro repositorio → **Add file → Upload files** → sube el `index.html` nuevo (reemplaza al antiguo) → **Commit changes**.
> En un par de minutos todos tienen la versión nueva al abrir la app.

Solo lo hace **una persona, una vez**. Los otros tres solo tendrán que abrir un enlace e instalarla.

Necesitáis dos cosas gratuitas:
- **GitHub** (ya la tienes): es donde vive la app. Te da una dirección web tipo `tuusuario.github.io/maraton`.
- **Supabase**: es la base de datos compartida, donde se guarda todo lo de los cuatro.

---

## Paso 1 · Crear la base de datos (Supabase)

1. Entra en **supabase.com** → **Start your project** → **Continue with GitHub** (usa tu cuenta de GitHub, no hace falta otra).
2. **New project**:
   - Name: `maraton`
   - Database password: invéntate una y guárdala (no la usaréis en el día a día).
   - Region: **West EU (Paris)** o **Central EU (Frankfurt)**.
   - Pulsa **Create new project** y espera un par de minutos.
3. Menú izquierdo → **SQL Editor** → **New query**. Abre el archivo `schema.sql`, copia **todo** su contenido, pégalo y pulsa **Run**. Debe decir *Success*.
4. Crea la cuenta del grupo (la que usaréis los cuatro para entrar):
   - Menú izquierdo → **Authentication** → **Users** → **Add user** → **Create new user**.
   - Pon un email (vale cualquiera vuestro, ej. el del grupo) y una contraseña que os sepáis los cuatro.
   - Marca **Auto Confirm User** y crea.
5. Cierra la puerta a desconocidos: **Authentication** → **Sign In / Providers** (o *Settings*) → desactiva **Allow new users to sign up** → **Save**.
6. Copia los dos datos de conexión: engranaje **Project Settings** → **API** (o *Data API* / *API Keys*):
   - **Project URL** (empieza por `https://` y acaba en `.supabase.co`)
   - **anon public** key (o la **publishable** key, empieza por `sb_publishable_`)

## Paso 2 · Pegar esos datos en la app

Abre `config.js` y sustituye los dos `PEGA_AQUI…` por la URL y la clave del paso anterior. Si queréis otro nombre para la app, cámbialo ahí también (`appName`).

> Esa clave puede ser pública sin problema: sin la contraseña del grupo nadie puede leer ni tocar nada.

## Paso 3 · Publicar la app (GitHub Pages)

1. En **github.com** → botón **+** (arriba a la derecha) → **New repository**.
   - Name: `maraton` · **Public** · **Create repository**.
2. En el repositorio vacío pulsa **uploading an existing file**, arrastra **todos** los archivos de esta carpeta (`index.html`, `config.js`, `sw.js`, `manifest.json`, `icon-192.png`, `icon-512.png`; `schema.sql` y esta guía también pueden ir) y pulsa **Commit changes**.
3. **Settings** → **Pages** → en *Branch* elige **main** y **/(root)** → **Save**.
4. En 1-2 minutos tendréis la app en `https://TUUSUARIO.github.io/maraton/`.

## Paso 4 · Primera vez dentro

1. Abre el enlace → entra con el **email y la contraseña del grupo**.
2. Escribe los **4 nombres** y elige avatares. Esto solo se hace una vez.
3. Elige tu perfil → icono de tu avatar (arriba a la derecha) → **Claves de búsqueda**:
   - **TMDB** (pelis y series): crea una cuenta gratis en **themoviedb.org** → tu avatar → **Ajustes** → **API** → solicita una clave (*Developer*, uso personal) → copia la **Clave de la API**. Pégala y guarda.
   - **RAWG** (videojuegos, opcional): **rawg.io/apidocs** → *Get API key* → pégala.
   - Libros, audiolibros, música y podcasts no necesitan clave.
   Solo lo hace uno; sirve para los cuatro.

## Paso 5 · Instalarla en cada móvil

Mandad el enlace por WhatsApp a los otros tres.

- **iPhone**: ábrelo en **Safari** → botón **Compartir** (cuadrado con flecha) → **Añadir a pantalla de inicio**.
- **Android**: ábrelo en **Chrome** → menú **⋮** → **Instalar aplicación** (o *Añadir a pantalla de inicio*).
- **Ordenador**: el mismo enlace en cualquier navegador. En Chrome o Edge podéis instalarla con el icono de la barra de direcciones.

Cada uno entra con la cuenta del grupo una sola vez y elige su perfil.

---

## Cómo se actualiza

Cuando haya una versión nueva, se sube el `index.html` nuevo a GitHub (*Add file → Upload files*, reemplazando). En un par de minutos, los cuatro la tienen al abrir la app; si no aparece, cerradla del todo y volved a abrirla. No hay que reinstalar nada.

## Importar Letterboxd

Quien lo use: en letterboxd.com → **Settings → Data → Export your data**. Descarga un `.zip`. En la app: perfil → **Importar desde Letterboxd** → elige el zip. Se importa en **su** perfil: vistas, notas (½-5 estrellas pasan a 1-10), fechas y watchlist. Si ya está puesta la clave de TMDB, trae también carátulas y géneros.

## Cosas que conviene saber

- **Todo es gratis.** El plan gratuito de Supabase da de sobra para cuatro personas. Si en algún momento nadie abre la app durante una semana, Supabase puede **pausar** el proyecto: se reactiva entrando en supabase.com y pulsando *Restore*. No se pierde nada.
- **Copia de seguridad**: perfil → *Descargar copia de seguridad*. Recomendable de vez en cuando.
- **Sin conexión**: la app abre y muestra lo último guardado; lo que hagáis sin red se sube solo al recuperarla.
- **Temporizador**: sigue contando aunque cierres la app. Si se te olvida pararlo y pasan más de 4 horas, te pregunta cuánto guardar. Con *+ Tiempo* añades minutos a mano.
- **Seguridad**: entrar requiere la contraseña del grupo; elegir perfil no. Es lo que pedisteis: cómodo y entre amigos.

## Qué incluye esta versión (fase 1)

Perfiles de los 4 · inventario común con búsqueda automática (TMDB, Google Books/Open Library, Apple Music/Podcasts, RAWG) o a mano · estados Wishlist → Pendiente → Viendo/Leyendo/Escuchando/Jugando → Terminado → Abandonado · nota 1-10 y media del grupo · comentarios con spoilers ocultos · recomendaciones entre vosotros · temporizador y tiempo manual · progreso (página, temporada/capítulo con «siguiente capítulo», minuto, episodio, %) · fechas automáticas de inicio y fin · contador de relecturas/revisionados · «lo tenemos», formato y ubicación · dónde ver cada peli/serie en España · enlaces a Spotify, iVoox, IMDb, Goodreads · muro de actividad · ruleta «¿qué vemos hoy?» con filtros · estadísticas (tiempo por tipo y periodo, rachas, géneros, autores/directores, comparativa del grupo, compatibilidad de gustos) · importación de Letterboxd · copia de seguridad · funciona sin conexión.

## Novedades de la versión 2

- **🍿 Ver juntos**: botón de palomitas arriba. Proponéis títulos desde su ficha, cada uno vota «Me apunto», el más votado sale con corona y «La vimos» lo marca como visto para todos los que votaron.
- **🎯 Retos anuales** (Estadísticas): «24 libros en 2026», con barra y aviso de si vas por delante o por detrás del ritmo.
- **🏆 Ranking** del grupo: tiempo, terminados y racha. Se desactiva desde el perfil.
- **🎁 Tu año en Maratón**: resumen tipo Wrapped en Estadísticas, en formato historias.
- **Listas compartidas** (otoño, Navidad…): se crean desde la Biblioteca o la ficha y salen como filas en Inicio.
- **📝 Citas y notas** en cada ficha, y todas juntas desde el perfil.
- **📤 Préstamos**: en la ficha de lo que tenéis. Aviso en Inicio si algo lleva más de 30 días fuera.
- **📅 Próximos estrenos**: la app revisa las series que seguís (cada 12 h, al abrirla) y avisa en Actividad cuando sale una temporada nueva.
- **📷 Escanear ISBN** al añadir libros: con la cámara o con una foto del código.

Sobre los avisos de estreno: aparecen dentro de la app (fila en Inicio y muro de Actividad). Las notificaciones al móvil con la app cerrada necesitan un servidor que las envíe; se puede montar gratis más adelante si os interesa.
