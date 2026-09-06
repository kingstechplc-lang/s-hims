"use client";
import React, { Suspense } from "react";
import { useSession } from "next-auth/react";
import { Card, CardContent } from "@/components/ui/card";
import { ShieldAlert, Loader2 } from "lucide-react";
import type { ViewKey } from "@/stores/app-store";

// =====================================================================
// Lazy-loaded view components — code-split by route for faster initial load
// =====================================================================
function lazyView<T extends React.ComponentType<any>>(
  factory: () => Promise<{ default: T }>
): React.LazyExoticComponent<T> {
  return React.lazy(factory);
}

// Core views
const DashboardView = lazyView(() => import("@/components/views/dashboard-view").then(m => ({ default: m.DashboardView })));
const RecordsDeskView = lazyView(() => import("@/components/views/clinical/records-desk-view").then(m => ({ default: m.RecordsDeskView })));
const NhisWorkflowView = lazyView(() => import("@/components/views/clinical/nhis-workflow/nhis-workflow-view").then(m => ({ default: m.NhisWorkflowView })));
const OPDView = lazyView(() => import("@/components/views/clinical/opd-view").then(m => ({ default: m.OPDView })));
const PatientsView = lazyView(() => import("@/components/views/patients/patients-view").then(m => ({ default: m.PatientsView })));
const PatientRegistrationView = lazyView(() => import("@/components/views/patients/patient-registration-view").then(m => ({ default: m.PatientRegistrationView })));
const Patient360View = lazyView(() => import("@/components/views/patients/patient-360-view").then(m => ({ default: m.Patient360View })));
const EncountersView = lazyView(() => import("@/components/views/clinical/encounters-view").then(m => ({ default: m.EncountersView })));
const AppointmentsView = lazyView(() => import("@/components/views/clinical/appointments-view").then(m => ({ default: m.AppointmentsView })));
const QueueView = lazyView(() => import("@/components/views/clinical/queue-view").then(m => ({ default: m.QueueView })));
const TriageView = lazyView(() => import("@/components/views/clinical/triage-view").then(m => ({ default: m.TriageView })));
const ConsultationsView = lazyView(() => import("@/components/views/clinical/consultations-view").then(m => ({ default: m.ConsultationsView })));
const PrescriptionsView = lazyView(() => import("@/components/views/pharmacy/prescriptions-view").then(m => ({ default: m.PrescriptionsView })));
const DispenseView = lazyView(() => import("@/components/views/pharmacy/dispense-view").then(m => ({ default: m.DispenseView })));
const ReferralsView = lazyView(() => import("@/components/views/clinical/referrals-view").then(m => ({ default: m.ReferralsView })));
const ImmunizationsView = lazyView(() => import("@/components/views/clinical/immunizations-view").then(m => ({ default: m.ImmunizationsView })));
const MaternityView = lazyView(() => import("@/components/views/clinical/maternity-view").then(m => ({ default: m.MaternityView })));

// Diagnostics
const LabOrdersView = lazyView(() => import("@/components/views/lab/lab-orders-view").then(m => ({ default: m.LabOrdersView })));
const LabResultsView = lazyView(() => import("@/components/views/lab/lab-results-view").then(m => ({ default: m.LabResultsView })));
const ImagingView = lazyView(() => import("@/components/views/imaging/imaging-view").then(m => ({ default: m.ImagingView })));
const ProceduresView = lazyView(() => import("@/components/views/procedures/procedures-view").then(m => ({ default: m.ProceduresView })));
const DiagnosticsDashboardView = lazyView(() => import("@/components/views/diagnostics/diagnostics-dashboard-view").then(m => ({ default: m.DiagnosticsDashboardView })));

// Inpatient
const AdmissionsView = lazyView(() => import("@/components/views/inpatient/admissions-view").then(m => ({ default: m.AdmissionsView })));
const BedsView = lazyView(() => import("@/components/views/inpatient/beds-view").then(m => ({ default: m.BedsView })));
const NursingView = lazyView(() => import("@/components/views/inpatient/nursing-view").then(m => ({ default: m.NursingView })));
const DischargesView = lazyView(() => import("@/components/views/inpatient/discharges-view").then(m => ({ default: m.DischargesView })));
const TransfersView = lazyView(() => import("@/components/views/inpatient/transfers-view").then(m => ({ default: m.TransfersView })));
const WardRoundsView = lazyView(() => import("@/components/views/inpatient/ward-rounds-view").then(m => ({ default: m.WardRoundsView })));
const IntakeOutputView = lazyView(() => import("@/components/views/inpatient/intake-output-view").then(m => ({ default: m.IntakeOutputView })));

// Finance
const InvoicesView = lazyView(() => import("@/components/views/billing/invoices-view").then(m => ({ default: m.InvoicesView })));
const PaymentsView = lazyView(() => import("@/components/views/billing/payments-view").then(m => ({ default: m.PaymentsView })));
const RefundsView = lazyView(() => import("@/components/views/billing/refunds-view").then(m => ({ default: m.RefundsView })));
const InsuranceClaimsView = lazyView(() => import("@/components/views/billing/insurance-claims-view").then(m => ({ default: m.InsuranceClaimsView })));
const NhiaClaimsView = lazyView(() => import("@/components/views/finance/nhia-claims-view").then(m => ({ default: m.NhiaClaimsView })));
const PayrollView = lazyView(() => import("@/components/views/finance/payroll-view").then(m => ({ default: m.PayrollView })));

// Inventory
const InventoryView = lazyView(() => import("@/components/views/inventory/inventory-view").then(m => ({ default: m.InventoryView })));
const SuppliersView = lazyView(() => import("@/components/views/inventory/suppliers-view").then(m => ({ default: m.SuppliersView })));
const PurchaseOrdersView = lazyView(() => import("@/components/views/inventory/purchase-orders-view").then(m => ({ default: m.PurchaseOrdersView })));
const StockTransfersView = lazyView(() => import("@/components/views/inventory/stock-transfers-view").then(m => ({ default: m.StockTransfersView })));
const EquipmentView = lazyView(() => import("@/components/views/inventory/equipment-view").then(m => ({ default: m.EquipmentView })));

// HR
const StaffView = lazyView(() => import("@/components/views/hr/staff-view").then(m => ({ default: m.StaffView })));
const ShiftsView = lazyView(() => import("@/components/views/hr/shifts-view").then(m => ({ default: m.ShiftsView })));
const AttendanceView = lazyView(() => import("@/components/views/hr/attendance-view").then(m => ({ default: m.AttendanceView })));
const TrainingView = lazyView(() => import("@/components/views/hr/training-view").then(m => ({ default: m.TrainingView })));
const CertificationsView = lazyView(() => import("@/components/views/hr/certifications-view").then(m => ({ default: m.CertificationsView })));

// Operations
const DocumentsView = lazyView(() => import("@/components/views/operations/documents-view").then(m => ({ default: m.DocumentsView })));
const TasksView = lazyView(() => import("@/components/views/operations/tasks-view").then(m => ({ default: m.TasksView })));
const IncidentReportsView = lazyView(() => import("@/components/views/operations/incident-reports-view").then(m => ({ default: m.IncidentReportsView })));
const HandoverView = lazyView(() => import("@/components/views/operations/handover-view").then(m => ({ default: m.HandoverView })));

// Admin
const AuditLogsView = lazyView(() => import("@/components/views/admin/audit-logs-view").then(m => ({ default: m.AuditLogsView })));
const SecurityView = lazyView(() => import("@/components/views/admin/security-view").then(m => ({ default: m.SecurityView })));
const ReportsView = lazyView(() => import("@/components/views/admin/reports-view").then(m => ({ default: m.ReportsView })));
const FacilitiesAdminView = lazyView(() => import("@/components/views/admin/facilities-admin-view").then(m => ({ default: m.FacilitiesAdminView })));
const DepartmentsAdminView = lazyView(() => import("@/components/views/admin/departments-admin-view").then(m => ({ default: m.DepartmentsAdminView })));
const DepartmentDashboardView = lazyView(() => import("@/components/views/admin/department-dashboard-view").then(m => ({ default: m.DepartmentDashboardView })));
const UsersAdminView = lazyView(() => import("@/components/views/admin/users-admin-view").then(m => ({ default: m.UsersAdminView })));
const RolesAdminView = lazyView(() => import("@/components/views/admin/roles-admin-view").then(m => ({ default: m.RolesAdminView })));
const PermissionsAdminView = lazyView(() => import("@/components/views/admin/permissions-admin-view").then(m => ({ default: m.PermissionsAdminView })));
const ServicesAdminView = lazyView(() => import("@/components/views/admin/services-admin-view").then(m => ({ default: m.ServicesAdminView })));
const LabTestsAdminView = lazyView(() => import("@/components/views/admin/lab-tests-admin-view").then(m => ({ default: m.LabTestsAdminView })));
const MedicationsAdminView = lazyView(() => import("@/components/views/admin/medications-admin-view").then(m => ({ default: m.MedicationsAdminView })));
const DiagnosisEngineView = lazyView(() => import("@/components/views/admin/diagnosis-engine-view").then(m => ({ default: m.DiagnosisEngineView })));
const InsuranceProvidersAdminView = lazyView(() => import("@/components/views/admin/insurance-providers-admin-view").then(m => ({ default: m.InsuranceProvidersAdminView })));
const SystemSettingsView = lazyView(() => import("@/components/views/admin/system-settings-view").then(m => ({ default: m.SystemSettingsView })));

// Extended modules
const MortuaryView = lazyView(() => import("@/components/views/extended/mortuary-view").then(m => ({ default: m.MortuaryView })));
const WorkflowDashboardView = lazyView(() => import("@/components/views/extended/workflow-dashboard-view").then(m => ({ default: m.WorkflowDashboardView })));
const ITSupportView = lazyView(() => import("@/components/views/extended/it-support-view").then(m => ({ default: m.ITSupportView })));
const SupportServicesView = lazyView(() => import("@/components/views/extended/support-services-view").then(m => ({ default: m.SupportServicesView })));
const AmbulanceView = lazyView(() => import("@/components/views/extended/ambulance-view").then(m => ({ default: m.AmbulanceView })));
const BloodBankView = lazyView(() => import("@/components/views/extended/blood-bank-view").then(m => ({ default: m.BloodBankView })));
const SpecialtyClinicsView = lazyView(() => import("@/components/views/extended/specialty-clinics-view").then(m => ({ default: m.SpecialtyClinicsView })));

// Extended — barrel exports
const BloodDonorsView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.BloodDonorsView })));
const BloodUnitsView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.BloodUnitsView })));
const BloodTransfusionsView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.BloodTransfusionsView })));
const TheatreView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.TheatreView })));
const CriticalCareView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.CriticalCareView })));
const PatientRelationsView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.PatientRelationsView })));
const QualityAssuranceView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.QualityAssuranceView })));
const RiskManagementView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.RiskManagementView })));
const LegalComplianceView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.LegalComplianceView })));
const ResearchView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.ResearchView })));
const PublicRelationsView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.PublicRelationsView })));
const CodingClaimsView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.CodingClaimsView })));
const CommunityHealthView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.CommunityHealthView })));
const HomeCareView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.HomeCareView })));
const HistopathologyView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.HistopathologyView })));
const RecoveryRoomView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.RecoveryRoomView })));
const InternalAuditView = lazyView(() => import("@/components/views/extended").then(m => ({ default: m.InternalAuditView })));

// =====================================================================
// Error boundary for lazy-loaded views
// =====================================================================
class ViewErrorBoundary extends React.Component<
  { children: React.ReactNode },
  { hasError: boolean }
> {
  state = { hasError: false };
  static getDerivedStateFromError() {
    return { hasError: true };
  }
  render() {
    if (this.state.hasError) {
      return (
        <Card>
          <CardContent className="p-12 text-center">
            <ShieldAlert className="w-12 h-12 mx-auto mb-4 text-red-500" />
            <h3 className="text-lg font-semibold text-slate-900 mb-1">Something went wrong</h3>
            <p className="text-sm text-slate-500">
              An error occurred while rendering this view. Please try refreshing the page.
            </p>
          </CardContent>
        </Card>
      );
    }
    return this.props.children;
  }
}

function ViewFallback() {
  return (
    <div className="flex items-center justify-center h-64">
      <Loader2 className="w-8 h-8 animate-spin text-slate-400" />
    </div>
  );
}

// =====================================================================
// View map — all views registered here
// =====================================================================
const VIEW_MAP: Record<ViewKey, React.ComponentType<any>> = {
  dashboard: DashboardView,
  workflow_dashboard: WorkflowDashboardView,
  records_desk: RecordsDeskView,
  nhis_workflow: NhisWorkflowView,
  opd: OPDView,
  patients: PatientsView,
  patient_new: PatientRegistrationView,
  patient_360: Patient360View,
  encounters: EncountersView,
  appointments: AppointmentsView,
  queue: QueueView,
  triage: TriageView,
  consultations: ConsultationsView,
  prescriptions: PrescriptionsView,
  dispense: DispenseView,
  referrals: ReferralsView,
  immunizations: ImmunizationsView,
  maternity: MaternityView,
  lab_orders: LabOrdersView,
  lab_results: LabResultsView,
  imaging: ImagingView,
  procedures: ProceduresView,
  diagnostics_dashboard: DiagnosticsDashboardView,
  admissions: AdmissionsView,
  beds: BedsView,
  nursing: NursingView,
  discharges: DischargesView,
  transfers: TransfersView,
  billing_invoices: InvoicesView,
  billing_payments: PaymentsView,
  billing_refunds: RefundsView,
  insurance_claims: InsuranceClaimsView,
  nhia_claims: NhiaClaimsView,
  inventory: InventoryView,
  suppliers: SuppliersView,
  purchase_orders: PurchaseOrdersView,
  stock_transfers: StockTransfersView,
  equipment: EquipmentView,
  staff: StaffView,
  shifts: ShiftsView,
  attendance: AttendanceView,
  training: TrainingView,
  certifications: CertificationsView,
  payroll: PayrollView,
  documents: DocumentsView,
  tasks: TasksView,
  incident_reports: IncidentReportsView,
  handover: HandoverView,
  ward_rounds: WardRoundsView,
  intake_output: IntakeOutputView,
  audit_logs: AuditLogsView,
  security: SecurityView,
  reports: ReportsView,
  settings_facilities: FacilitiesAdminView,
  settings_departments: DepartmentsAdminView,
  department_dashboard: DepartmentDashboardView,
  settings_users: UsersAdminView,
  settings_roles: RolesAdminView,
  settings_permissions: PermissionsAdminView,
  settings_services: ServicesAdminView,
  settings_lab_tests: LabTestsAdminView,
  settings_medications: MedicationsAdminView,
  settings_diagnoses: DiagnosisEngineView,
  settings_insurance_providers: InsuranceProvidersAdminView,
  settings_system: SystemSettingsView,
  mortuary: MortuaryView,
  blood_donors: BloodBankView,
  blood_units: BloodBankView,
  blood_transfusions: BloodBankView,
  theatre: TheatreView,
  critical_care: CriticalCareView,
  specialty_clinics: SpecialtyClinicsView,
  specialty_clinics_appointments: SpecialtyClinicsView,
  specialty_clinics_referrals: SpecialtyClinicsView,
  specialty_clinics_clinics: SpecialtyClinicsView,
  support_services: SupportServicesView,
  ambulance: AmbulanceView,
  patient_relations: PatientRelationsView,
  quality_assurance: QualityAssuranceView,
  risk_management: RiskManagementView,
  legal_compliance: LegalComplianceView,
  research: ResearchView,
  public_relations: PublicRelationsView,
  it_support: ITSupportView,
  coding_claims: CodingClaimsView,
  community_health: CommunityHealthView,
  home_care: HomeCareView,
  histopathology: HistopathologyView,
  recovery_room: RecoveryRoomView,
  internal_audit: InternalAuditView,
};

const PERMISSION_MAP: Partial<Record<ViewKey, string>> = {
  records_desk: "patient.view",
  nhis_workflow: "encounter_coverage.view",
  opd: "encounter.view",
  patients: "patient.view",
  patient_new: "patient.create",
  patient_360: "patient.view",
  encounters: "encounter.view",
  appointments: "appointment.view",
  queue: "encounter.view",
  triage: "triage.view",
  consultations: "clinical.create",
  prescriptions: "pharmacy.view",
  dispense: "pharmacy.dispense",
  referrals: "clinical.view",
  immunizations: "immunization.view",
  maternity: "maternity.view",
  lab_orders: "lab.view",
  lab_results: "lab.view",
  imaging: "imaging.view",
  procedures: "procedure.view",
  diagnostics_dashboard: "lab.view",
  admissions: "admission.view",
  beds: "bed.manage",
  nursing: "clinical.view",
  discharges: "admission.view",
  transfers: "admission.view",
  billing_invoices: "billing.view",
  billing_payments: "billing.view",
  billing_refunds: "billing.view",
  insurance_claims: "insurance.view",
  nhia_claims: "nhia_claim.view",
  inventory: "inventory.view",
  suppliers: "inventory.view",
  purchase_orders: "procurement.manage",
  stock_transfers: "inventory.transfer",
  equipment: "inventory.view",
  staff: "staff.view",
  shifts: "staff.view",
  attendance: "staff.view",
  training: "staff.view",
  certifications: "staff.view",
  payroll: "payroll.view",
  documents: "document.view",
  tasks: "task.assign",
  incident_reports: "task.assign",
  handover: "clinical.view",
  ward_rounds: "admission.view",
  intake_output: "clinical.view",
  audit_logs: "audit.view",
  security: "security.dashboard",
  reports: "report.view",
  settings_facilities: "facility.manage",
  settings_departments: "department.manage",
  department_dashboard: "department.manage",
  settings_users: "user.view",
  settings_roles: "role.view",
  settings_permissions: "permission.assign",
  settings_services: "settings.view",
  settings_lab_tests: "settings.view",
  settings_medications: "settings.view",
  settings_diagnoses: "diagnosis.view",
  settings_insurance_providers: "settings.view",
  settings_system: "settings.view",
  mortuary: "mortuary.view",
  blood_donors: "bloodbank.view",
  blood_units: "bloodbank.view",
  blood_transfusions: "bloodbank.view",
  theatre: "theatre.view",
  critical_care: "critical_care.view",
  specialty_clinics: "specialty.view",
  specialty_clinics_appointments: "specialty.view",
  specialty_clinics_referrals: "specialty.view",
  specialty_clinics_clinics: "specialty.view",
  support_services: "support_services.view",
  ambulance: "ambulance.view",
  patient_relations: "patient_relations.view",
  quality_assurance: "qa.view",
  risk_management: "risk.view",
  legal_compliance: "legal.view",
  research: "research.view",
  public_relations: "pr.view",
  it_support: "it.view",
  coding_claims: "coding.view",
  community_health: "community_health.view",
  home_care: "home_care.view",
  histopathology: "histopathology.view",
  recovery_room: "recovery.view",
  internal_audit: "audit.view",
};

// =====================================================================
// View Renderer — lazy-loads the selected view with Suspense fallback
// =====================================================================
export function ViewRenderer({ view }: { view: ViewKey }) {
  const { data: session } = useSession();
  const user = session?.user as any;
  const isSuperAdmin = user?.roles?.includes("super_admin");
  const userPermissions: string[] = user?.permissions || [];

  const isBloodBankView = view === "blood_donors" || view === "blood_units" || view === "blood_transfusions";
  const isSpecialtyClinicsView = view === "specialty_clinics" || view === "specialty_clinics_appointments" || view === "specialty_clinics_referrals" || view === "specialty_clinics_clinics";

  const requiredPerm = PERMISSION_MAP[view];
  if (requiredPerm && !isSuperAdmin && !userPermissions.includes(requiredPerm)) {
    return (
      <Card>
        <CardContent className="p-12 text-center">
          <ShieldAlert className="w-12 h-12 mx-auto mb-4 text-amber-500" />
          <h3 className="text-lg font-semibold text-slate-900 mb-1">Access Restricted</h3>
          <p className="text-sm text-slate-500">
            You don&apos;t have permission to access this module.
            <br />
            Required permission: <code className="bg-slate-100 px-1.5 py-0.5 rounded text-xs">{requiredPerm}</code>
          </p>
        </CardContent>
      </Card>
    );
  }

  if (isBloodBankView) {
    return (
      <ViewErrorBoundary>
        <Suspense fallback={<ViewFallback />}>
          <BloodBankView initialTab={view} />
        </Suspense>
      </ViewErrorBoundary>
    );
  }
  if (isSpecialtyClinicsView) {
    return (
      <ViewErrorBoundary>
        <Suspense fallback={<ViewFallback />}>
          <SpecialtyClinicsView initialTab={view} />
        </Suspense>
      </ViewErrorBoundary>
    );
  }

  const ViewComponent = VIEW_MAP[view] || DashboardView;
  return (
    <ViewErrorBoundary>
      <Suspense fallback={<ViewFallback />}>
        <ViewComponent />
      </Suspense>
    </ViewErrorBoundary>
  );
}
