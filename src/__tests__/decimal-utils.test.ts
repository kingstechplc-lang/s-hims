import { describe, it, expect } from "vitest";
import { Decimal } from "@prisma/client/runtime/library";
import { toNum, toNumOr, decToNum, decToNumArr } from "@/lib/decimal-utils";

describe("decimal-utils", () => {
  describe("toNum", () => {
    it("converts Decimal to number", () => {
      const d = new Decimal("123.45");
      expect(toNum(d)).toBe(123.45);
    });

    it("returns number as-is", () => {
      expect(toNum(42)).toBe(42);
    });

    it("returns null for null", () => {
      expect(toNum(null)).toBeNull();
    });

    it("returns null for undefined", () => {
      expect(toNum(undefined)).toBeNull();
    });

    it("converts string to number", () => {
      expect(toNum("99.99")).toBe(99.99);
    });
  });

  describe("toNumOr", () => {
    it("returns converted number", () => {
      expect(toNumOr(new Decimal("10"), 0)).toBe(10);
    });

    it("returns fallback for null", () => {
      expect(toNumOr(null, 5)).toBe(5);
    });

    it("returns fallback for undefined", () => {
      expect(toNumOr(undefined, 0)).toBe(0);
    });
  });

  describe("decToNum", () => {
    it("converts all Decimal fields in an object", () => {
      const obj = {
        id: "123",
        name: "Test",
        price: new Decimal("29.99"),
        qty: 5,
      };
      const result = decToNum(obj);
      expect(result.price).toBe(29.99);
      expect(result.name).toBe("Test");
      expect(result.qty).toBe(5);
    });

    it("preserves null Decimal fields", () => {
      const obj = { price: null as unknown as Decimal };
      const result = decToNum(obj);
      expect(result.price).toBeNull();
    });
  });

  describe("decToNumArr", () => {
    it("converts Decimal fields in an array of objects", () => {
      const arr = [
        { id: "1", price: new Decimal("10") },
        { id: "2", price: new Decimal("20") },
      ];
      const result = decToNumArr(arr);
      expect(result[0].price).toBe(10);
      expect(result[1].price).toBe(20);
    });
  });
});
