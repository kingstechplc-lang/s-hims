import "dotenv/config";
import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
async function main() {
  const updated = await prisma.facility.updateMany({
    where: { code: "SPECTRA-KASOA" },
    data: {
      name: "Spectra Health — Assin Fosu",
      code: "SPECTRA-ASSIN",
      address: "Assin Fosu, Central Region",
      city: "Assin Fosu",
      email: "assin@spectrahealth.org",
    },
  });
  console.log(`Updated ${updated.count} facility from Kasoa → Assin Fosu`);
}
main().catch(console.error).finally(() => prisma.$disconnect());
