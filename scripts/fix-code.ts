import "dotenv/config";
import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
async function main() {
  const updated = await prisma.facility.updateMany({
    where: { code: "SPECTRA-ASSIN FOSU" },
    data: { code: "SPECTRA-ASSIN" },
  });
  console.log(`Updated ${updated.count} facility code: SPECTRA-ASSIN FOSU → SPECTRA-ASSIN`);
}
main().catch(console.error).finally(() => prisma.$disconnect());
