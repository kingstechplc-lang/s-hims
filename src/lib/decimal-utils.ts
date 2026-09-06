// =====================================================================
// PRISMA DECIMAL HELPERS
// =====================================================================
// Prisma returns `Decimal` objects for fields typed as `Decimal` in schema.
// These don't serialize to JSON as numbers — they become strings.
// Use these helpers when returning data in API responses.

import { Decimal } from "@prisma/client/runtime/library";

/** Convert a Decimal to a number safely. Returns the input as-is if already a number. */
export function toNum(value: Decimal | number | null | undefined): number | null {
  if (value == null) return null;
  if (typeof value === "number") return value;
  if (value instanceof Decimal) return value.toNumber();
  return Number(value);
}

/** Convert a Decimal to a number with a fallback default. */
export function toNumOr(value: Decimal | number | null | undefined, fallback: number): number {
  return toNum(value) ?? fallback;
}

/** Convert all Decimal fields in an object to numbers (shallow, 1 level deep). */
export function decToNum<T extends Record<string, unknown>>(obj: T): T {
  const result = { ...obj };
  for (const [key, val] of Object.entries(result)) {
    if (val instanceof Decimal) {
      (result as Record<string, unknown>)[key] = val.toNumber();
    }
  }
  return result;
}

/** Convert all Decimal fields in an array of objects to numbers. */
export function decToNumArr<T extends Record<string, unknown>>(arr: T[]): ReturnType<typeof decToNum>[] {
  return arr.map(decToNum);
}
