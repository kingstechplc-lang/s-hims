import { describe, it, expect } from "vitest";
import { PERMISSIONS, ROLE_PERMISSIONS } from "@/lib/permissions";

describe("permissions", () => {
  describe("PERMISSIONS constants", () => {
    it("has all core permission categories", () => {
      expect(PERMISSIONS.PATIENT_VIEW).toBe("patient.view");
      expect(PERMISSIONS.CLINICAL_VIEW).toBe("clinical.view");
      expect(PERMISSIONS.BILLING_VIEW).toBe("billing.view");
      expect(PERMISSIONS.LAB_VIEW).toBe("lab.view");
      expect(PERMISSIONS.ADMISSION_CREATE).toBe("admission.create");
      expect(PERMISSIONS.INVENTORY_VIEW).toBe("inventory.view");
    });

    it("permissions follow dot notation convention", () => {
      for (const perm of Object.values(PERMISSIONS)) {
        expect(perm).toMatch(/^[a-z]+\.[a-z_]+$/);
      }
    });

    it("has no duplicate values", () => {
      const values = Object.values(PERMISSIONS);
      const unique = new Set(values);
      expect(unique.size).toBe(values.length);
    });
  });

  describe("ROLE_PERMISSIONS", () => {
    it("has super_admin with all permissions", () => {
      expect(ROLE_PERMISSIONS.super_admin).toBeDefined();
      expect(ROLE_PERMISSIONS.super_admin.length).toBeGreaterThan(100);
    });

    it("every role has at least one permission", () => {
      for (const [role, perms] of Object.entries(ROLE_PERMISSIONS)) {
        expect(perms.length).toBeGreaterThan(0);
        expect(typeof role).toBe("string");
      }
    });

    it("doctor role has clinical permissions", () => {
      const perms = ROLE_PERMISSIONS.doctor || [];
      expect(perms).toContain(PERMISSIONS.CLINICAL_VIEW);
      expect(perms).toContain(PERMISSIONS.CLINICAL_CREATE);
    });

    it("nurse role has clinical view permissions", () => {
      const perms = ROLE_PERMISSIONS.nurse || [];
      expect(perms).toContain(PERMISSIONS.CLINICAL_VIEW);
    });

    it("pharmacist role has pharmacy permissions", () => {
      const perms = ROLE_PERMISSIONS.pharmacist || [];
      expect(perms).toContain(PERMISSIONS.PHARMACY_DISPENSE);
    });
  });
});
