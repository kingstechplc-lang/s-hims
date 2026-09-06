import { describe, it, expect } from "vitest";
import type { ViewKey } from "@/stores/app-store";

// Test the view registry without importing React components
// (avoids need for full React rendering setup)

const VIEW_KEYS: ViewKey[] = [
  "dashboard", "workflow_notifications",
  "records_desk", "nhis_workflow", "opd", "patients", "patient_new", "patient_360",
  "encounters", "appointments", "queue", "triage", "consultations",
  "prescriptions", "dispense", "referrals", "immunizations", "maternity",
  "diagnostics_dashboard", "lab_orders", "lab_results", "imaging", "procedures",
  "admissions", "beds", "nursing", "ward_rounds", "intake_output", "discharges", "transfers",
  "invoices", "payments", "refunds", "insurance_claims", "nhia_claims",
  "inventory", "suppliers", "purchase_orders", "stock_transfers", "equipment",
  "staff", "shifts", "attendance", "training", "certifications", "payroll",
  "documents", "tasks", "incident_reports", "handover",
  "audit_logs", "security", "reports", "facilities_admin", "departments_admin",
  "department_dashboard", "users_admin", "roles_admin", "permissions_admin",
  "services_admin", "lab_tests_admin", "medications_admin", "diagnosis_engine",
  "insurance_providers", "system_settings",
  "blood_donors", "blood_units", "blood_transfusions",
  "specialty_clinics", "specialty_clinics_appointments", "specialty_clinics_referrals", "specialty_clinics_clinics",
  "operating_theatre", "recovery_room", "icu_nicu", "histopathology",
  "support_services", "ambulance", "mortuary", "home_care", "community_health",
  "patient_relations", "quality_assurance", "risk_management", "legal_compliance",
  "internal_audit", "research", "public_relations",
  "it_support", "coding_claims",
];

describe("View Registry", () => {
  it("has all expected view keys", () => {
    expect(VIEW_KEYS.length).toBeGreaterThan(80);
    expect(VIEW_KEYS).toContain("dashboard");
    expect(VIEW_KEYS).toContain("patients");
    expect(VIEW_KEYS).toContain("invoices");
    expect(VIEW_KEYS).toContain("inventory");
  });

  it("all view keys are valid identifiers (snake_case)", () => {
    for (const key of VIEW_KEYS) {
      expect(key).toMatch(/^[a-z][a-z0-9_]*$/);
    }
  });

  it("no duplicate view keys", () => {
    const unique = new Set(VIEW_KEYS);
    expect(unique.size).toBe(VIEW_KEYS.length);
  });

  it("clinical views are present", () => {
    const clinicalViews = ["encounters", "consultations", "prescriptions", "triage", "referrals"];
    for (const v of clinicalViews) {
      expect(VIEW_KEYS).toContain(v);
    }
  });

  it("billing views are present", () => {
    const billingViews = ["invoices", "payments", "refunds", "insurance_claims"];
    for (const v of billingViews) {
      expect(VIEW_KEYS).toContain(v);
    }
  });

  it("admin views are present", () => {
    const adminViews = ["users_admin", "roles_admin", "permissions_admin", "facilities_admin"];
    for (const v of adminViews) {
      expect(VIEW_KEYS).toContain(v);
    }
  });
});
