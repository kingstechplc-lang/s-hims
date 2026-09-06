// =====================================================================
// SENTRY CONFIGURATION — Server-side error tracking
// =====================================================================
// Set SENTRY_DSN in .env to enable. Get yours at https://sentry.io
//
// Usage: import this in API routes or server components:
//   import "@/lib/sentry-server";
// =====================================================================

if (process.env.SENTRY_DSN) {
  import("@sentry/nextjs").then((Sentry) => {
    Sentry.init({
      dsn: process.env.SENTRY_DSN,
      environment: process.env.NODE_ENV || "development",
      tracesSampleRate: process.env.NODE_ENV === "production" ? 0.1 : 1.0,
      enabled:
        process.env.NODE_ENV === "production" ||
        process.env.NODE_ENV === "development",
    });
  });
}
