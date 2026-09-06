// =====================================================================
// SENTRY CONFIGURATION — Client-side error tracking
// =====================================================================
// Set SENTRY_DSN in .env to enable. Get yours at https://sentry.io
//
// Usage: import this in your root layout.tsx or app layout:
//   import "@/lib/sentry-client";
// =====================================================================

if (process.env.NEXT_PUBLIC_SENTRY_DSN) {
  import("@sentry/nextjs").then((Sentry) => {
    Sentry.init({
      dsn: process.env.NEXT_PUBLIC_SENTRY_DSN,
      environment: process.env.NODE_ENV || "development",
      tracesSampleRate: process.env.NODE_ENV === "production" ? 0.1 : 1.0,
      replaysSessionSampleRate: 0,
      replaysOnErrorSampleRate: 1.0,
      enabled:
        process.env.NODE_ENV === "production" ||
        process.env.NODE_ENV === "development",
    });
  });
}
