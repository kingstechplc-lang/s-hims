import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  reactStrictMode: true,
  typescript: {
    ignoreBuildErrors: false,
  },
  serverExternalPackages: ["@prisma/client", "bcryptjs"],
};

// Wrap with Sentry if SENTRY_DSN is set (avoids breaking builds without it)
export default nextConfig;
