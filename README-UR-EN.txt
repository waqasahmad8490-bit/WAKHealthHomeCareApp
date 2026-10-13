WAK Health & Home Care Android app starter
===========================================

Included:
- Mobile-first patient management (add, edit, search)
- Invoice/receipt creation with paid/balance calculations
- WhatsApp sharing of invoice/receipt text
- Existing Supabase Auth login using the current project's URL/public key
- Capacitor Android project configuration and GitHub Actions workflow to build an APK
- SQL setup for patient and invoice tables with authenticated-only RLS

IMPORTANT SAFETY / SETUP:
1. This app uses the existing Supabase project URL and publishable/anon key from your public website config. Never put a Supabase service_role/secret key in this app.
2. Before using real patient information, review access policies with a qualified developer. The included policies allow any authenticated user in this Supabase project to manage records; use only trusted admin accounts or tighten policies to a specific admin role.
3. The app will not save patient/invoice records until the SQL file is run in Supabase SQL Editor.
4. WhatsApp sharing opens WhatsApp with text; it does not send automatically. Review the content before sending.
5. This is a starter implementation. It does not yet generate a PDF invoice or provide offline storage.
6. The existing website files are not overwritten by this package. Keep this as a separate project until tested.

BUILD NOTES:
- Upload the package contents to a separate GitHub repository (or merge carefully).
- GitHub > Actions > Build WAK Android APK > Run workflow.
- Download the workflow artifact named WAK-Health-Home-Care-APK.
- For production use, configure signed release builds and test on a spare device first.

The app uses the same Supabase Auth and project as the existing WAK admin website. Existing wak_updates records are untouched.
