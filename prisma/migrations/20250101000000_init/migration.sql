-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "public";

-- CreateTable
CREATE TABLE "Organization" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "logoUrl" TEXT,
    "phone" TEXT,
    "email" TEXT,
    "address" TEXT,
    "website" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "settings" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Organization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Facility" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "facilityType" TEXT,
    "description" TEXT,
    "address" TEXT,
    "city" TEXT,
    "region" TEXT,
    "country" TEXT,
    "phone" TEXT,
    "email" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "timezone" TEXT,
    "settings" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Facility_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Department" (
    "id" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "category" TEXT DEFAULT 'Clinical',
    "description" TEXT,
    "headStaffId" TEXT,
    "location" TEXT,
    "contactExtension" TEXT,
    "operatingHours" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "settings" TEXT,
    "createdById" TEXT,
    "updatedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Department_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Unit" (
    "id" TEXT NOT NULL,
    "departmentId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "headStaffId" TEXT,
    "location" TEXT,
    "room" TEXT,
    "operatingHours" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Unit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ward" (
    "id" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "wardType" TEXT,
    "genderPolicy" TEXT,
    "capacity" INTEGER NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Ward_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Room" (
    "id" TEXT NOT NULL,
    "wardId" TEXT NOT NULL,
    "roomNumber" TEXT NOT NULL,
    "roomType" TEXT,
    "capacity" INTEGER NOT NULL DEFAULT 1,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Room_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bed" (
    "id" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "wardId" TEXT NOT NULL,
    "roomId" TEXT,
    "bedNumber" TEXT NOT NULL,
    "bedCode" TEXT,
    "bedType" TEXT,
    "building" TEXT,
    "floor" TEXT,
    "genderRestriction" TEXT,
    "ageRestriction" TEXT,
    "isolationCapable" BOOLEAN NOT NULL DEFAULT false,
    "oxygen" BOOLEAN NOT NULL DEFAULT false,
    "ventilator" BOOLEAN NOT NULL DEFAULT false,
    "cardiacMonitoring" BOOLEAN NOT NULL DEFAULT false,
    "icuMonitoring" BOOLEAN NOT NULL DEFAULT false,
    "suction" BOOLEAN NOT NULL DEFAULT false,
    "accessibility" BOOLEAN NOT NULL DEFAULT false,
    "description" TEXT,
    "status" TEXT NOT NULL DEFAULT 'available',
    "lifecycleStatus" TEXT NOT NULL DEFAULT 'active',
    "notes" TEXT,
    "createdById" TEXT,
    "updatedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Bed_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "middleName" TEXT,
    "lastName" TEXT NOT NULL,
    "phone" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "lastLoginAt" TIMESTAMP(3),
    "passwordChangedAt" TIMESTAMP(3),
    "mustChangePassword" BOOLEAN NOT NULL DEFAULT false,
    "failedLoginAttempts" INTEGER NOT NULL DEFAULT 0,
    "lockedUntil" TIMESTAMP(3),
    "mfaEnabled" BOOLEAN NOT NULL DEFAULT false,
    "mfaSecret" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Staff" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "staffNumber" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "middleName" TEXT,
    "lastName" TEXT NOT NULL,
    "dateOfBirth" TIMESTAMP(3),
    "phone" TEXT,
    "email" TEXT,
    "professionalRole" TEXT,
    "professionalRegistrationNumber" TEXT,
    "employmentStatus" TEXT NOT NULL DEFAULT 'active',
    "employmentType" TEXT DEFAULT 'permanent',
    "hireDate" TIMESTAMP(3),
    "terminationDate" TIMESTAMP(3),
    "employeeNumber" TEXT,
    "preferredName" TEXT,
    "gender" TEXT,
    "photoUrl" TEXT,
    "profession" TEXT,
    "specialty" TEXT,
    "secondarySpecialty" TEXT,
    "position" TEXT,
    "jobGrade" TEXT,
    "jobLevel" TEXT,
    "departmentId" TEXT,
    "facilityId" TEXT,
    "supervisorId" TEXT,
    "employmentStartDate" TIMESTAMP(3),
    "probationStartDate" TIMESTAMP(3),
    "probationEndDate" TIMESTAMP(3),
    "confirmationDate" TIMESTAMP(3),
    "contractStartDate" TIMESTAMP(3),
    "contractEndDate" TIMESTAMP(3),
    "resignationDate" TIMESTAMP(3),
    "retirementDate" TIMESTAMP(3),
    "separationDate" TIMESTAMP(3),
    "separationReason" TEXT,
    "separationType" TEXT,
    "alternativePhone" TEXT,
    "workEmail" TEXT,
    "address" TEXT,
    "city" TEXT,
    "region" TEXT,
    "country" TEXT,
    "emergencyContactName" TEXT,
    "emergencyContactRelationship" TEXT,
    "emergencyContactPhone" TEXT,
    "emergencyContactAltPhone" TEXT,
    "emergencyContactAddress" TEXT,
    "staffCategory" TEXT NOT NULL DEFAULT 'clinical',
    "isClinical" BOOLEAN NOT NULL DEFAULT true,
    "canPrescribe" BOOLEAN NOT NULL DEFAULT false,
    "licenseNumber" TEXT,
    "licensingAuthority" TEXT,
    "licenseExpiryDate" TIMESTAMP(3),
    "licenseStatus" TEXT NOT NULL DEFAULT 'active',
    "nationalId" TEXT,
    "taxIdNumber" TEXT,
    "bankName" TEXT,
    "bankAccountNumber" TEXT,
    "bankAccountName" TEXT,
    "payGrade" TEXT,
    "payrollId" TEXT,
    "notes" TEXT,
    "createdById" TEXT,
    "profileCompletion" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Staff_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffAssignment" (
    "id" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "position" TEXT,
    "supervisorId" TEXT,
    "startDate" TIMESTAMP(3),
    "endDate" TIMESTAMP(3),
    "assignmentType" TEXT NOT NULL DEFAULT 'assignment',
    "status" TEXT NOT NULL DEFAULT 'active',
    "reason" TEXT,
    "authorizedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StaffAssignment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffCredential" (
    "id" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "credentialType" TEXT,
    "credentialName" TEXT NOT NULL,
    "issuingInstitution" TEXT,
    "issueDate" TIMESTAMP(3),
    "expiryDate" TIMESTAMP(3),
    "verificationStatus" TEXT NOT NULL DEFAULT 'pending',
    "verifiedById" TEXT,
    "verifiedAt" TIMESTAMP(3),
    "licenseNumber" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StaffCredential_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffStatusHistory" (
    "id" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "previousStatus" TEXT,
    "newStatus" TEXT NOT NULL,
    "effectiveDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reason" TEXT,
    "authorizedById" TEXT,
    "authorizedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "StaffStatusHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffDocument" (
    "id" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "documentType" TEXT,
    "documentName" TEXT NOT NULL,
    "issueDate" TIMESTAMP(3),
    "expiryDate" TIMESTAMP(3),
    "verifiedById" TEXT,
    "verifiedAt" TIMESTAMP(3),
    "verificationStatus" TEXT NOT NULL DEFAULT 'pending',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StaffDocument_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffFacility" (
    "id" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "unitId" TEXT,
    "position" TEXT,
    "staffRole" TEXT,
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "startDate" TIMESTAMP(3),
    "endDate" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StaffFacility_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "isSystemRole" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Permission" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "module" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Permission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RolePermission" (
    "id" TEXT NOT NULL,
    "roleId" TEXT NOT NULL,
    "permissionId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RolePermission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserRole" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "roleId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserRole_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Patient" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "patientNumber" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "middleName" TEXT,
    "lastName" TEXT NOT NULL,
    "previousName" TEXT,
    "dateOfBirth" TIMESTAMP(3),
    "sex" TEXT,
    "gender" TEXT,
    "maritalStatus" TEXT,
    "nationality" TEXT,
    "occupation" TEXT,
    "phone" TEXT,
    "alternativePhone" TEXT,
    "email" TEXT,
    "address" TEXT,
    "city" TEXT,
    "region" TEXT,
    "country" TEXT,
    "preferredLanguage" TEXT,
    "photoUrl" TEXT,
    "bloodGroup" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "registeredAtFacilityId" TEXT,
    "registeredBy" TEXT,
    "registrationDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Patient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PatientIdentifier" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "identifierType" TEXT NOT NULL,
    "identifierValue" TEXT NOT NULL,
    "issuingAuthority" TEXT,
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "verifiedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PatientIdentifier_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PatientContact" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "contactType" TEXT,
    "name" TEXT NOT NULL,
    "relationship" TEXT,
    "phone" TEXT,
    "alternativePhone" TEXT,
    "email" TEXT,
    "address" TEXT,
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PatientContact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmergencyContact" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "relationship" TEXT,
    "phone" TEXT,
    "alternativePhone" TEXT,
    "address" TEXT,
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EmergencyContact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NextOfKin" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "relationship" TEXT,
    "phone" TEXT,
    "alternativePhone" TEXT,
    "email" TEXT,
    "address" TEXT,
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "NextOfKin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InsuranceProvider" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "legalName" TEXT,
    "shortName" TEXT,
    "displayName" TEXT,
    "providerType" TEXT NOT NULL DEFAULT 'private',
    "organizationType" TEXT,
    "country" TEXT,
    "region" TEXT,
    "phone" TEXT,
    "email" TEXT,
    "website" TEXT,
    "address" TEXT,
    "postalAddress" TEXT,
    "contactPerson" TEXT,
    "claimsContact" TEXT,
    "financeContact" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "effectiveDate" TIMESTAMP(3),
    "endDate" TIMESTAMP(3),
    "notes" TEXT,
    "settings" TEXT,
    "createdById" TEXT,
    "updatedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InsuranceProvider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InsurancePlan" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "insuranceProviderId" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "shortName" TEXT,
    "description" TEXT,
    "planType" TEXT NOT NULL DEFAULT 'individual',
    "coveragePercentage" DOUBLE PRECISION,
    "fixedCopayment" DECIMAL(65,30),
    "deductible" DECIMAL(65,30),
    "annualLimit" DECIMAL(65,30),
    "visitLimit" INTEGER,
    "authorizationRequired" BOOLEAN NOT NULL DEFAULT false,
    "referralRequired" BOOLEAN NOT NULL DEFAULT false,
    "status" TEXT NOT NULL DEFAULT 'active',
    "effectiveDate" TIMESTAMP(3),
    "endDate" TIMESTAMP(3),
    "coverageRules" TEXT,
    "notes" TEXT,
    "createdById" TEXT,
    "updatedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InsurancePlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlanServiceCoverage" (
    "id" TEXT NOT NULL,
    "insurancePlanId" TEXT NOT NULL,
    "serviceId" TEXT,
    "coverageType" TEXT NOT NULL DEFAULT 'covered',
    "coveragePercentage" DOUBLE PRECISION,
    "fixedCopayment" DECIMAL(65,30),
    "patientResponsibility" DOUBLE PRECISION,
    "quantityLimit" INTEGER,
    "monetaryLimit" DECIMAL(65,30),
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PlanServiceCoverage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlanBenefit" (
    "id" TEXT NOT NULL,
    "insurancePlanId" TEXT NOT NULL,
    "benefitCategory" TEXT NOT NULL,
    "covered" BOOLEAN NOT NULL DEFAULT true,
    "coveragePercentage" DOUBLE PRECISION,
    "annualLimit" DECIMAL(65,30),
    "visitLimit" INTEGER,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PlanBenefit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProviderContact" (
    "id" TEXT NOT NULL,
    "insuranceProviderId" TEXT NOT NULL,
    "contactType" TEXT NOT NULL DEFAULT 'general',
    "name" TEXT NOT NULL,
    "position" TEXT,
    "phone" TEXT,
    "email" TEXT,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProviderContact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProviderFacilityRelationship" (
    "id" TEXT NOT NULL,
    "insuranceProviderId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "availability" TEXT NOT NULL DEFAULT 'available',
    "acceptedPlans" TEXT,
    "contractReference" TEXT,
    "effectiveDate" TIMESTAMP(3),
    "endDate" TIMESTAMP(3),
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProviderFacilityRelationship_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InsuranceAuthorization" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "insuranceProviderId" TEXT NOT NULL,
    "insurancePlanId" TEXT,
    "patientId" TEXT,
    "serviceId" TEXT,
    "authorizationNumber" TEXT,
    "authorizationDate" TIMESTAMP(3),
    "expiryDate" TIMESTAMP(3),
    "approvedService" TEXT,
    "approvedQuantity" INTEGER,
    "approvedAmount" DECIMAL(65,30),
    "status" TEXT NOT NULL DEFAULT 'pending',
    "notes" TEXT,
    "authorizedById" TEXT,
    "patientInsuranceId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InsuranceAuthorization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PatientInsurance" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "insuranceProviderId" TEXT NOT NULL,
    "membershipNumber" TEXT,
    "policyNumber" TEXT,
    "principalMember" TEXT,
    "relationshipToPrincipal" TEXT,
    "coverageStart" TIMESTAMP(3),
    "coverageEnd" TIMESTAMP(3),
    "verificationStatus" TEXT NOT NULL DEFAULT 'pending',
    "verifiedAt" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PatientInsurance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Encounter" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "unitId" TEXT,
    "encounterNumber" TEXT NOT NULL,
    "encounterType" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'open',
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "attendingStaffId" TEXT,
    "startAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endAt" TIMESTAMP(3),
    "createdById" TEXT,
    "source" TEXT NOT NULL DEFAULT 'walkin',
    "externalId" TEXT,
    "checkInAt" TIMESTAMP(3),
    "checkOutAt" TIMESTAMP(3),
    "cancelledAt" TIMESTAMP(3),
    "cancelledById" TEXT,
    "cancelReason" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Encounter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Appointment" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "unitId" TEXT,
    "staffId" TEXT,
    "serviceId" TEXT,
    "appointmentNumber" TEXT NOT NULL,
    "appointmentType" TEXT,
    "scheduledStart" TIMESTAMP(3) NOT NULL,
    "scheduledEnd" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'scheduled',
    "reason" TEXT,
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Appointment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClinicianSchedule" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "staffName" TEXT,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "dayOfWeek" TEXT NOT NULL,
    "startTime" TEXT NOT NULL,
    "endTime" TEXT NOT NULL,
    "breakStart" TEXT,
    "breakEnd" TEXT,
    "slotDurationMin" INTEGER NOT NULL DEFAULT 30,
    "maxDailyBookings" INTEGER NOT NULL DEFAULT 20,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ClinicianSchedule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClinicSession" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "staffId" TEXT,
    "staffName" TEXT,
    "sessionName" TEXT NOT NULL,
    "specialty" TEXT,
    "dayOfWeek" TEXT NOT NULL,
    "startTime" TEXT NOT NULL,
    "endTime" TEXT NOT NULL,
    "slotDurationMin" INTEGER NOT NULL DEFAULT 15,
    "maxBookings" INTEGER NOT NULL DEFAULT 20,
    "room" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ClinicSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BlockedSlot" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "staffId" TEXT,
    "blockedDate" TIMESTAMP(3) NOT NULL,
    "startTime" TEXT NOT NULL,
    "endTime" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "blockedById" TEXT,
    "blockedByName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BlockedSlot_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WaitingList" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "staffId" TEXT,
    "specialty" TEXT,
    "preferredDate" TIMESTAMP(3),
    "preferredTime" TEXT,
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "contactMethod" TEXT NOT NULL DEFAULT 'phone',
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'waiting',
    "notifiedAt" TIMESTAMP(3),
    "bookedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WaitingList_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppointmentHistory" (
    "id" TEXT NOT NULL,
    "appointmentId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "fromStatus" TEXT,
    "toStatus" TEXT,
    "fromDateTime" TIMESTAMP(3),
    "toDateTime" TIMESTAMP(3),
    "reason" TEXT,
    "changedById" TEXT,
    "changedByName" TEXT,
    "changedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AppointmentHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Queue" (
    "id" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "unitId" TEXT,
    "queueDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "queueType" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Queue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QueueEntry" (
    "id" TEXT NOT NULL,
    "queueId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT,
    "appointmentId" TEXT,
    "queueNumber" INTEGER NOT NULL,
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "status" TEXT NOT NULL DEFAULT 'waiting',
    "calledAt" TIMESTAMP(3),
    "startedAt" TIMESTAMP(3),
    "completedAt" TIMESTAMP(3),
    "onHoldAt" TIMESTAMP(3),
    "resumedAt" TIMESTAMP(3),
    "assignedStaffId" TEXT,
    "serviceId" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "QueueEntry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TriageRecord" (
    "id" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "temperature" DOUBLE PRECISION,
    "pulse" INTEGER,
    "respiratoryRate" INTEGER,
    "systolicBp" INTEGER,
    "diastolicBp" INTEGER,
    "oxygenSaturation" DOUBLE PRECISION,
    "weight" DOUBLE PRECISION,
    "height" DOUBLE PRECISION,
    "bmi" DOUBLE PRECISION,
    "bloodGlucose" DOUBLE PRECISION,
    "painScore" INTEGER,
    "consciousnessLevel" TEXT,
    "triageCategory" TEXT,
    "chiefComplaint" TEXT,
    "notes" TEXT,
    "generalAppearance" TEXT,
    "painLocation" TEXT,
    "painCharacter" TEXT,
    "gcsEye" INTEGER,
    "gcsVerbal" INTEGER,
    "gcsMotor" INTEGER,
    "gcsTotal" INTEGER,
    "isReassessment" BOOLEAN NOT NULL DEFAULT false,
    "parentTriageId" TEXT,
    "abnormalVitalsAlert" TEXT,
    "escalationLevel" TEXT,
    "escalationReason" TEXT,
    "recordedById" TEXT,
    "recordedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TriageRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VitalSign" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "temperature" DOUBLE PRECISION,
    "pulse" INTEGER,
    "respiratoryRate" INTEGER,
    "systolicBp" INTEGER,
    "diastolicBp" INTEGER,
    "oxygenSaturation" DOUBLE PRECISION,
    "weight" DOUBLE PRECISION,
    "height" DOUBLE PRECISION,
    "bmi" DOUBLE PRECISION,
    "bloodGlucose" DOUBLE PRECISION,
    "painScore" INTEGER,
    "recordedById" TEXT,
    "recordedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "VitalSign_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Consultation" (
    "id" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "clinicianId" TEXT,
    "chiefComplaint" TEXT,
    "historyPresentingIllness" TEXT,
    "pastMedicalHistory" TEXT,
    "pastSurgicalHistory" TEXT,
    "medicationHistory" TEXT,
    "familyHistory" TEXT,
    "socialHistory" TEXT,
    "reviewOfSystems" TEXT,
    "physicalExamination" TEXT,
    "assessment" TEXT,
    "treatmentPlan" TEXT,
    "followUpPlan" TEXT,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "signedById" TEXT,
    "signedAt" TIMESTAMP(3),
    "disposition" TEXT,
    "dispositionNotes" TEXT,
    "patientInstructions" TEXT,
    "addendumText" TEXT,
    "addendumById" TEXT,
    "addendumAt" TIMESTAMP(3),
    "consultationStart" TIMESTAMP(3),
    "consultationEnd" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Consultation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Diagnosis" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "catalogId" TEXT,
    "diagnosisCode" TEXT,
    "codeSystem" TEXT DEFAULT 'ICD-10',
    "diagnosisName" TEXT NOT NULL,
    "diagnosisType" TEXT NOT NULL DEFAULT 'primary',
    "clinicalStatus" TEXT NOT NULL DEFAULT 'active',
    "verificationStatus" TEXT NOT NULL DEFAULT 'confirmed',
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "isChronic" BOOLEAN NOT NULL DEFAULT false,
    "onsetDate" TIMESTAMP(3),
    "resolvedDate" TIMESTAMP(3),
    "diagnosedById" TEXT,
    "diagnosedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "notes" TEXT,
    "amendedFromId" TEXT,
    "amendmentReason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Diagnosis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DiagnosisCatalog" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "codeSystem" TEXT NOT NULL DEFAULT 'ICD-10',
    "name" TEXT NOT NULL,
    "description" TEXT,
    "category" TEXT,
    "parentCategory" TEXT,
    "synonyms" TEXT,
    "searchTerms" TEXT,
    "sexRestriction" TEXT,
    "minAgeYears" INTEGER,
    "maxAgeYears" INTEGER,
    "isChronicDefault" BOOLEAN NOT NULL DEFAULT false,
    "specialty" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "version" TEXT,
    "source" TEXT,
    "nhisGdrgCode" TEXT,
    "nhisGdrgName" TEXT,
    "nhisTariff" DECIMAL(65,30),
    "isNhisClaimable" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DiagnosisCatalog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DiagnosisStatusHistory" (
    "id" TEXT NOT NULL,
    "diagnosisId" TEXT NOT NULL,
    "fromStatus" TEXT,
    "toStatus" TEXT NOT NULL,
    "fromVerification" TEXT,
    "toVerification" TEXT,
    "changedById" TEXT,
    "changedByName" TEXT,
    "reason" TEXT,
    "changedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DiagnosisStatusHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DiagnosisFavorite" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "catalogId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DiagnosisFavorite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Allergy" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "allergen" TEXT NOT NULL,
    "reaction" TEXT,
    "severity" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "recordedById" TEXT,
    "recordedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Allergy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MedicalHistory" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "condition" TEXT NOT NULL,
    "description" TEXT,
    "diagnosedDate" TIMESTAMP(3),
    "resolvedDate" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'active',
    "recordedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MedicalHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SurgicalHistory" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "procedureName" TEXT NOT NULL,
    "procedureDate" TIMESTAMP(3),
    "facility" TEXT,
    "surgeon" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SurgicalHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FamilyHistory" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "relationship" TEXT NOT NULL,
    "condition" TEXT NOT NULL,
    "notes" TEXT,
    "recordedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FamilyHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SocialHistory" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "smokingStatus" TEXT,
    "alcoholStatus" TEXT,
    "occupation" TEXT,
    "livingSituation" TEXT,
    "otherInformation" TEXT,
    "recordedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SocialHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Medication" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "genericName" TEXT NOT NULL,
    "brandName" TEXT,
    "strength" TEXT,
    "strengthValue" DOUBLE PRECISION,
    "strengthUnit" TEXT,
    "dosageForm" TEXT,
    "route" TEXT,
    "unit" TEXT,
    "description" TEXT,
    "medicationCategory" TEXT,
    "therapeuticClass" TEXT,
    "atcCode" TEXT,
    "barcode" TEXT,
    "productCode" TEXT,
    "nhisCode" TEXT,
    "nhisTariffAmount" DECIMAL(65,30),
    "nhisPrescribingLevel" TEXT,
    "nhisUnitOfPricing" TEXT,
    "manufacturer" TEXT,
    "countryOfOrigin" TEXT,
    "prescriptionStatus" TEXT DEFAULT 'prescription_required',
    "controlledStatus" TEXT,
    "isHighAlert" BOOLEAN NOT NULL DEFAULT false,
    "pregnancyCategory" TEXT,
    "lactationSafety" TEXT,
    "defaultDose" TEXT,
    "defaultFrequency" TEXT,
    "defaultRoute" TEXT,
    "defaultDuration" TEXT,
    "formularyStatus" TEXT DEFAULT 'formulary',
    "storageConditions" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdById" TEXT,
    "updatedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Medication_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MedicationInteraction" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "medicationAId" TEXT,
    "medicationBId" TEXT,
    "therapeuticClassA" TEXT,
    "therapeuticClassB" TEXT,
    "severity" TEXT NOT NULL DEFAULT 'moderate',
    "description" TEXT NOT NULL,
    "clinicalAdvice" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MedicationInteraction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Prescription" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "prescriptionNumber" TEXT NOT NULL,
    "prescriberId" TEXT,
    "facilityId" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "prescribedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "finalizedAt" TIMESTAMP(3),
    "discontinuedAt" TIMESTAMP(3),
    "discontinuedById" TEXT,
    "discontinuedReason" TEXT,
    "cancelledReason" TEXT,
    "notes" TEXT,
    "allergyWarnings" TEXT,
    "duplicateWarnings" TEXT,
    "interactionWarnings" TEXT,
    "warningsAcknowledged" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Prescription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PrescriptionItem" (
    "id" TEXT NOT NULL,
    "prescriptionId" TEXT NOT NULL,
    "medicationId" TEXT NOT NULL,
    "dose" TEXT,
    "frequency" TEXT,
    "route" TEXT,
    "duration" TEXT,
    "durationValue" INTEGER,
    "durationUnit" TEXT,
    "quantity" INTEGER NOT NULL DEFAULT 0,
    "quantityCalculated" BOOLEAN NOT NULL DEFAULT false,
    "instructions" TEXT,
    "isPRN" BOOLEAN NOT NULL DEFAULT false,
    "prnIndication" TEXT,
    "prnMaxFrequency" TEXT,
    "isSTAT" BOOLEAN NOT NULL DEFAULT false,
    "isOneTime" BOOLEAN NOT NULL DEFAULT false,
    "startDate" TIMESTAMP(3),
    "endDate" TIMESTAMP(3),
    "diagnosisId" TEXT,
    "dispensedQuantity" INTEGER NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PrescriptionItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MedicationAdministration" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "prescriptionItemId" TEXT,
    "medicationId" TEXT NOT NULL,
    "doseGiven" TEXT,
    "route" TEXT,
    "administeredById" TEXT,
    "administeredAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL DEFAULT 'given',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MedicationAdministration_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LaboratoryTest" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "shortName" TEXT,
    "displayName" TEXT,
    "description" TEXT,
    "category" TEXT,
    "testType" TEXT NOT NULL DEFAULT 'single',
    "resultType" TEXT NOT NULL DEFAULT 'numeric',
    "specimenType" TEXT,
    "unit" TEXT,
    "referenceRange" TEXT,
    "price" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL DEFAULT 'active',
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "isPanel" BOOLEAN NOT NULL DEFAULT false,
    "isReferralOut" BOOLEAN NOT NULL DEFAULT false,
    "referralLab" TEXT,
    "isBillable" BOOLEAN NOT NULL DEFAULT true,
    "billableAs" TEXT NOT NULL DEFAULT 'individual',
    "tatMinutes" INTEGER,
    "tatRoutineMin" INTEGER,
    "tatUrgentMin" INTEGER,
    "tatStatMin" INTEGER,
    "serviceId" TEXT,
    "nhisEligible" BOOLEAN NOT NULL DEFAULT false,
    "nhisServiceCode" TEXT,
    "nhisTariffRef" TEXT,
    "claimableStatus" TEXT NOT NULL DEFAULT 'not_configured',
    "version" INTEGER NOT NULL DEFAULT 1,
    "createdById" TEXT,
    "updatedById" TEXT,
    "retiredAt" TIMESTAMP(3),
    "retiredById" TEXT,
    "retirementReason" TEXT,
    "configuration" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LaboratoryTest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabTestAlias" (
    "id" TEXT NOT NULL,
    "laboratoryTestId" TEXT NOT NULL,
    "alias" TEXT NOT NULL,
    "aliasType" TEXT NOT NULL DEFAULT 'synonym',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LabTestAlias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabTestCategory" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabTestCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabTestSpecimenType" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabTestSpecimenType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabTestUnit" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabTestUnit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabTestSpecimenConfig" (
    "id" TEXT NOT NULL,
    "laboratoryTestId" TEXT NOT NULL,
    "specimenType" TEXT NOT NULL,
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "container" TEXT,
    "minVolume" TEXT,
    "collectionRequirements" TEXT,
    "processingRequirements" TEXT,
    "storageRequirements" TEXT,
    "transportRequirements" TEXT,
    "stabilityInfo" TEXT,
    "fastingRequired" BOOLEAN NOT NULL DEFAULT false,
    "timingRequired" TEXT,
    "specialPreparation" TEXT,
    "collectionNotes" TEXT,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabTestSpecimenConfig_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabTestComponent" (
    "id" TEXT NOT NULL,
    "laboratoryTestId" TEXT NOT NULL,
    "componentName" TEXT NOT NULL,
    "componentCode" TEXT,
    "resultType" TEXT NOT NULL DEFAULT 'numeric',
    "unit" TEXT,
    "referenceRange" TEXT,
    "criticalLow" DOUBLE PRECISION,
    "criticalHigh" DOUBLE PRECISION,
    "decimalPrecision" INTEGER,
    "displayOrder" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabTestComponent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabTestPanelMember" (
    "id" TEXT NOT NULL,
    "panelTestId" TEXT NOT NULL,
    "componentTestId" TEXT NOT NULL,
    "displayOrder" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "addedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "removedAt" TIMESTAMP(3),

    CONSTRAINT "LabTestPanelMember_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabTestReferenceRange" (
    "id" TEXT NOT NULL,
    "laboratoryTestId" TEXT NOT NULL,
    "label" TEXT,
    "sex" TEXT,
    "ageGroup" TEXT,
    "ageMinDays" INTEGER,
    "ageMaxDays" INTEGER,
    "pregnancyApplicable" BOOLEAN NOT NULL DEFAULT false,
    "specimenType" TEXT,
    "facilityId" TEXT,
    "lowText" TEXT,
    "highText" TEXT,
    "rangeText" TEXT,
    "unit" TEXT,
    "criticalLowText" TEXT,
    "criticalHighText" TEXT,
    "notes" TEXT,
    "version" INTEGER NOT NULL DEFAULT 1,
    "effectiveFrom" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "effectiveTo" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabTestReferenceRange_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabTestCriticalValue" (
    "id" TEXT NOT NULL,
    "laboratoryTestId" TEXT NOT NULL,
    "sex" TEXT,
    "ageGroup" TEXT,
    "ageMinDays" INTEGER,
    "ageMaxDays" INTEGER,
    "criticalLow" DOUBLE PRECISION,
    "criticalHigh" DOUBLE PRECISION,
    "alertType" TEXT NOT NULL DEFAULT 'numeric',
    "alertValue" TEXT,
    "notificationBehavior" TEXT,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabTestCriticalValue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabTestResultOption" (
    "id" TEXT NOT NULL,
    "laboratoryTestId" TEXT NOT NULL,
    "optionValue" TEXT NOT NULL,
    "optionLabel" TEXT,
    "isCritical" BOOLEAN NOT NULL DEFAULT false,
    "displayOrder" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LabTestResultOption_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabTestFacilityAvailability" (
    "id" TEXT NOT NULL,
    "laboratoryTestId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "availability" TEXT NOT NULL DEFAULT 'available',
    "performingDepartmentId" TEXT,
    "facilityTatMinutes" INTEGER,
    "facilityReferralLab" TEXT,
    "facilityNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabTestFacilityAvailability_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabTestVersion" (
    "id" TEXT NOT NULL,
    "laboratoryTestId" TEXT NOT NULL,
    "version" INTEGER NOT NULL,
    "snapshot" TEXT NOT NULL,
    "changeSummary" TEXT,
    "changedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LabTestVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabTestCatalogAudit" (
    "id" TEXT NOT NULL,
    "laboratoryTestId" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "action" TEXT NOT NULL,
    "previousValue" TEXT,
    "newValue" TEXT,
    "reason" TEXT,
    "userId" TEXT,
    "userRole" TEXT,
    "ipAddress" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LabTestCatalogAudit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabOrder" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "orderingClinicianId" TEXT,
    "orderNumber" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'ordered',
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "orderedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "notes" TEXT,
    "clinicalIndication" TEXT,
    "diagnosisRef" TEXT,
    "departmentId" TEXT,
    "collectedAt" TIMESTAMP(3),
    "receivedAt" TIMESTAMP(3),
    "resultedAt" TIMESTAMP(3),
    "verifiedAt" TIMESTAMP(3),
    "releasedAt" TIMESTAMP(3),
    "duplicateOfId" TEXT,
    "isDuplicateOverride" BOOLEAN NOT NULL DEFAULT false,
    "duplicateNote" TEXT,
    "recollectFromOrderId" TEXT,
    "cancelledAt" TIMESTAMP(3),
    "cancelledById" TEXT,
    "cancellationReason" TEXT,
    "serviceInvoiceItemId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabOrder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabOrderItem" (
    "id" TEXT NOT NULL,
    "labOrderId" TEXT NOT NULL,
    "laboratoryTestId" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'ordered',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabOrderItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabSample" (
    "id" TEXT NOT NULL,
    "labOrderId" TEXT NOT NULL,
    "sampleNumber" TEXT NOT NULL,
    "specimenType" TEXT,
    "collectedById" TEXT,
    "collectedAt" TIMESTAMP(3),
    "receivedById" TEXT,
    "receivedAt" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'pending',
    "rejectionReason" TEXT,
    "rejectionReasonCode" TEXT,
    "rejectionNotes" TEXT,
    "rejectedById" TEXT,
    "rejectedAt" TIMESTAMP(3),
    "recollectFromId" TEXT,
    "collectionLocation" TEXT,
    "container" TEXT,
    "volume" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabSample_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabResult" (
    "id" TEXT NOT NULL,
    "labOrderItemId" TEXT NOT NULL,
    "resultValue" TEXT,
    "numericValue" DOUBLE PRECISION,
    "unit" TEXT,
    "referenceRange" TEXT,
    "abnormalFlag" TEXT,
    "criticalFlag" BOOLEAN NOT NULL DEFAULT false,
    "flagSource" TEXT NOT NULL DEFAULT 'manual',
    "flagRangeApplied" TEXT,
    "componentId" TEXT,
    "componentName" TEXT,
    "resultOptionId" TEXT,
    "resultNotes" TEXT,
    "specimenComment" TEXT,
    "clinicianComment" TEXT,
    "performingLab" TEXT,
    "performingStaffId" TEXT,
    "enteredById" TEXT,
    "verifiedById" TEXT,
    "enteredAt" TIMESTAMP(3),
    "verifiedAt" TIMESTAMP(3),
    "releasedAt" TIMESTAMP(3),
    "releasedById" TEXT,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "amendedFromId" TEXT,
    "amendmentReason" TEXT,
    "amendmentApprovedById" TEXT,
    "version" INTEGER NOT NULL DEFAULT 1,
    "isCritical" BOOLEAN NOT NULL DEFAULT false,
    "criticalAcknowledgedById" TEXT,
    "criticalAcknowledgedAt" TIMESTAMP(3),
    "criticalAckMethod" TEXT,
    "criticalAckNotes" TEXT,
    "criticalEscalationLevel" INTEGER NOT NULL DEFAULT 0,
    "notifiedUserIds" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabResult_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ImagingOrder" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "orderingClinicianId" TEXT,
    "procedureName" TEXT NOT NULL,
    "procedureCode" TEXT,
    "modality" TEXT,
    "bodySite" TEXT,
    "laterality" TEXT,
    "contrastRequired" BOOLEAN NOT NULL DEFAULT false,
    "contrastNotes" TEXT,
    "clinicalIndication" TEXT,
    "diagnosisRef" TEXT,
    "departmentId" TEXT,
    "requestedAt" TIMESTAMP(3),
    "scheduledAt" TIMESTAMP(3),
    "scheduledById" TEXT,
    "imagingRoom" TEXT,
    "appointmentId" TEXT,
    "patientArrivedAt" TIMESTAMP(3),
    "accessionNumber" TEXT,
    "studyInstanceUid" TEXT,
    "seriesInstanceUid" TEXT,
    "performedAt" TIMESTAMP(3),
    "performedById" TEXT,
    "serviceId" TEXT,
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "status" TEXT NOT NULL DEFAULT 'ordered',
    "orderedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "notes" TEXT,
    "cancelledAt" TIMESTAMP(3),
    "cancelledById" TEXT,
    "cancellationReason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ImagingOrder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ImagingReport" (
    "id" TEXT NOT NULL,
    "imagingOrderId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "clinicalIndication" TEXT,
    "technique" TEXT,
    "findings" TEXT,
    "impression" TEXT,
    "recommendations" TEXT,
    "reportedById" TEXT,
    "verifiedById" TEXT,
    "reportedAt" TIMESTAMP(3),
    "verifiedAt" TIMESTAMP(3),
    "releasedAt" TIMESTAMP(3),
    "releasedById" TEXT,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "amendedFromId" TEXT,
    "amendmentReason" TEXT,
    "amendmentApprovedById" TEXT,
    "version" INTEGER NOT NULL DEFAULT 1,
    "differentialDiagnosis" TEXT,
    "followUpRecommendation" TEXT,
    "isLatest" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ImagingReport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Procedure" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "procedureCatalogId" TEXT,
    "procedureCode" TEXT,
    "procedureName" TEXT NOT NULL,
    "category" TEXT,
    "requestedById" TEXT,
    "requestedAt" TIMESTAMP(3),
    "scheduledAt" TIMESTAMP(3),
    "scheduledById" TEXT,
    "procedureRoom" TEXT,
    "appointmentId" TEXT,
    "performedById" TEXT,
    "performedAt" TIMESTAMP(3),
    "indication" TEXT,
    "diagnosisRef" TEXT,
    "preProcedureNotes" TEXT,
    "findings" TEXT,
    "outcome" TEXT,
    "complications" TEXT,
    "specimensSent" TEXT,
    "consumablesUsed" TEXT,
    "followUpInstructions" TEXT,
    "consentStatus" TEXT NOT NULL DEFAULT 'not_taken',
    "consentNotes" TEXT,
    "notes" TEXT,
    "serviceId" TEXT,
    "status" TEXT NOT NULL DEFAULT 'requested',
    "cancelledAt" TIMESTAMP(3),
    "cancelledById" TEXT,
    "cancellationReason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Procedure_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProcedureCatalog" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "shortName" TEXT,
    "description" TEXT,
    "category" TEXT NOT NULL DEFAULT 'minor',
    "procedureType" TEXT NOT NULL DEFAULT 'diagnostic',
    "departmentId" TEXT,
    "requiredStaffType" TEXT,
    "estimatedDurationMinutes" INTEGER,
    "serviceId" TEXT,
    "isBillable" BOOLEAN NOT NULL DEFAULT true,
    "billableAs" TEXT NOT NULL DEFAULT 'individual',
    "nhisEligible" BOOLEAN NOT NULL DEFAULT false,
    "nhisServiceCode" TEXT,
    "nhisTariffRef" TEXT,
    "claimableStatus" TEXT NOT NULL DEFAULT 'not_configured',
    "requiredConsumables" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "version" INTEGER NOT NULL DEFAULT 1,
    "createdById" TEXT,
    "updatedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProcedureCatalog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProcedureCatalogFacilityAvailability" (
    "id" TEXT NOT NULL,
    "procedureCatalogId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "availability" TEXT NOT NULL DEFAULT 'available',
    "performingDepartmentId" TEXT,
    "facilityNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProcedureCatalogFacilityAvailability_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Admission" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "admissionNumber" TEXT NOT NULL,
    "admissionType" TEXT,
    "admittedById" TEXT,
    "admissionReason" TEXT,
    "admissionDiagnosis" TEXT,
    "admittedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dischargedAt" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'admitted',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "requestedById" TEXT,
    "requestedAt" TIMESTAMP(3),
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "approvalDecision" TEXT,
    "approvalNotes" TEXT,
    "provisionalDiagnosis" TEXT,
    "clinicalIndication" TEXT,
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "departmentId" TEXT,
    "requestedWardId" TEXT,
    "requestedBedType" TEXT,
    "specialRequirements" TEXT,
    "expectedDischargeDate" TIMESTAMP(3),
    "dischargeReadiness" TEXT NOT NULL DEFAULT 'not_ready',
    "dischargePlannedAt" TIMESTAMP(3),
    "dischargePlannedById" TEXT,
    "pendingItems" TEXT,
    "attendingClinicianId" TEXT,
    "referringClinicianId" TEXT,
    "cancelledAt" TIMESTAMP(3),
    "cancelledById" TEXT,
    "cancellationReason" TEXT,
    "deceasedAt" TIMESTAMP(3),
    "deceasedDocumentedById" TEXT,
    "deathSummary" TEXT,
    "admissionSource" TEXT,
    "createdById" TEXT,
    "updatedById" TEXT,
    "notes" TEXT,

    CONSTRAINT "Admission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BedAssignment" (
    "id" TEXT NOT NULL,
    "admissionId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "wardId" TEXT NOT NULL,
    "roomId" TEXT,
    "bedId" TEXT NOT NULL,
    "assignedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "releasedAt" TIMESTAMP(3),
    "assignedById" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BedAssignment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PatientTransfer" (
    "id" TEXT NOT NULL,
    "transferNumber" TEXT,
    "patientId" TEXT NOT NULL,
    "admissionId" TEXT NOT NULL,
    "fromFacilityId" TEXT NOT NULL,
    "toFacilityId" TEXT NOT NULL,
    "fromWardId" TEXT,
    "fromBedId" TEXT,
    "toWardId" TEXT,
    "toBedId" TEXT,
    "transferType" TEXT NOT NULL DEFAULT 'internal',
    "transferCategory" TEXT,
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "reason" TEXT,
    "clinicalSummary" TEXT,
    "toDepartment" TEXT,
    "toAddress" TEXT,
    "toContactPerson" TEXT,
    "toContactPhone" TEXT,
    "toContactEmail" TEXT,
    "toDestinationNotes" TEXT,
    "receivingClinicianId" TEXT,
    "receivingClinicianName" TEXT,
    "referralId" TEXT,
    "ambulanceTripId" TEXT,
    "transportMethod" TEXT,
    "transportRequirements" TEXT,
    "oxygenRequired" BOOLEAN NOT NULL DEFAULT false,
    "cardiacMonitoring" BOOLEAN NOT NULL DEFAULT false,
    "ivAccess" BOOLEAN NOT NULL DEFAULT false,
    "isolationPrecautions" TEXT,
    "escortRequired" TEXT,
    "handoverSummary" TEXT,
    "nursingHandover" TEXT,
    "specialRequirements" TEXT,
    "clinicalNotes" TEXT,
    "nursingNotes" TEXT,
    "administrativeNotes" TEXT,
    "transportNotes" TEXT,
    "receivingNotes" TEXT,
    "requestedById" TEXT,
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "acceptedById" TEXT,
    "acceptedAt" TIMESTAMP(3),
    "rejectedAt" TIMESTAMP(3),
    "rejectedById" TEXT,
    "rejectionReason" TEXT,
    "departedAt" TIMESTAMP(3),
    "departedFrom" TEXT,
    "departedById" TEXT,
    "conditionAtDeparture" TEXT,
    "arrivedAt" TIMESTAMP(3),
    "arrivedAtLocation" TEXT,
    "arrivedById" TEXT,
    "conditionOnArrival" TEXT,
    "completedAt" TIMESTAMP(3),
    "completedById" TEXT,
    "isFinalized" BOOLEAN NOT NULL DEFAULT false,
    "cancelledAt" TIMESTAMP(3),
    "cancelledById" TEXT,
    "cancelReason" TEXT,
    "delayedAt" TIMESTAMP(3),
    "delayReason" TEXT,
    "delayDepartment" TEXT,
    "expectedTransferAt" TIMESTAMP(3),
    "amendedById" TEXT,
    "amendedAt" TIMESTAMP(3),
    "amendmentReason" TEXT,
    "version" INTEGER NOT NULL DEFAULT 1,
    "belongingsChecked" BOOLEAN NOT NULL DEFAULT false,
    "belongingsNotes" TEXT,
    "equipmentAccompanying" TEXT,
    "acknowledgedByPatient" BOOLEAN NOT NULL DEFAULT false,
    "acknowledgedByCaregiver" BOOLEAN NOT NULL DEFAULT false,
    "caregiverName" TEXT,
    "caregiverRelationship" TEXT,
    "requestedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL DEFAULT 'requested',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PatientTransfer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransferChecklistItem" (
    "id" TEXT NOT NULL,
    "transferId" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "completedById" TEXT,
    "completedAt" TIMESTAMP(3),
    "notes" TEXT,
    "required" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TransferChecklistItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransferCommunication" (
    "id" TEXT NOT NULL,
    "transferId" TEXT NOT NULL,
    "senderId" TEXT,
    "senderName" TEXT,
    "recipientName" TEXT,
    "recipientDepartment" TEXT,
    "recipientFacility" TEXT,
    "messageType" TEXT NOT NULL,
    "message" TEXT,
    "outcome" TEXT,
    "sentAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TransferCommunication_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DischargeRecord" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "admissionId" TEXT NOT NULL,
    "facilityId" TEXT,
    "dischargeNumber" TEXT,
    "dischargeSummary" TEXT,
    "finalDiagnosis" TEXT,
    "procedures" TEXT,
    "medications" TEXT,
    "followUpPlan" TEXT,
    "disposition" TEXT,
    "dischargedById" TEXT,
    "dischargedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "attendingClinicianId" TEXT,
    "admissionDate" TIMESTAMP(3),
    "primaryDiagnosisCode" TEXT,
    "primaryDiagnosisName" TEXT,
    "secondaryDiagnoses" TEXT,
    "investigationResults" TEXT,
    "dischargeConditions" TEXT,
    "adviceOnDischarge" TEXT,
    "sickLeaveDays" INTEGER,
    "followUpAppointmentDate" TIMESTAMP(3),
    "followUpClinic" TEXT,
    "followUpClinicianId" TEXT,
    "allergiesAtDischarge" TEXT,
    "billedAmount" DECIMAL(65,30),
    "insuranceProviderId" TEXT,
    "dischargeType" TEXT,
    "clinicalCleared" BOOLEAN NOT NULL DEFAULT false,
    "clinicalClearedById" TEXT,
    "clinicalClearedAt" TIMESTAMP(3),
    "nursingCleared" BOOLEAN NOT NULL DEFAULT false,
    "nursingClearedById" TEXT,
    "nursingClearedAt" TIMESTAMP(3),
    "financialCleared" BOOLEAN NOT NULL DEFAULT false,
    "financialClearedById" TEXT,
    "financialClearedAt" TIMESTAMP(3),
    "pharmacyCleared" BOOLEAN NOT NULL DEFAULT false,
    "pharmacyClearedById" TEXT,
    "pharmacyClearedAt" TIMESTAMP(3),
    "amendedFromId" TEXT,
    "amendmentReason" TEXT,
    "amendedById" TEXT,
    "amendedAt" TIMESTAMP(3),
    "version" INTEGER NOT NULL DEFAULT 1,
    "isLatest" BOOLEAN NOT NULL DEFAULT true,
    "status" TEXT NOT NULL DEFAULT 'requested',
    "requestedById" TEXT,
    "requestedAt" TIMESTAMP(3),
    "proposedDischargeAt" TIMESTAMP(3),
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "cancelledAt" TIMESTAMP(3),
    "cancelledById" TEXT,
    "cancelReason" TEXT,
    "delayedAt" TIMESTAMP(3),
    "delayReason" TEXT,
    "delayDepartment" TEXT,
    "expectedDischargeAt" TIMESTAMP(3),
    "finalizedAt" TIMESTAMP(3),
    "finalizedById" TEXT,
    "isFinalized" BOOLEAN NOT NULL DEFAULT false,
    "damaReason" TEXT,
    "damaRisksExplained" BOOLEAN NOT NULL DEFAULT false,
    "damaAdviceProvided" TEXT,
    "damaAcknowledgedById" TEXT,
    "damaAcknowledgedAt" TIMESTAMP(3),
    "damaWitnessName" TEXT,
    "transferDestination" TEXT,
    "transferReceivingFacility" TEXT,
    "transferReceivingDept" TEXT,
    "transferContactPerson" TEXT,
    "transferContactPhone" TEXT,
    "transferReason" TEXT,
    "transferTransportMethod" TEXT,
    "transferAmbulanceTripId" TEXT,
    "transferReferralId" TEXT,
    "deathDate" TIMESTAMP(3),
    "deathPronouncedById" TEXT,
    "deathCause" TEXT,
    "deathMortuaryAdmissionId" TEXT,
    "abscondedLastSeenAt" TIMESTAMP(3),
    "abscondedLastLocation" TEXT,
    "abscondedCircumstances" TEXT,
    "abscondedStaffNotified" TEXT,
    "patientEducationProvided" BOOLEAN NOT NULL DEFAULT false,
    "patientEducationTopics" TEXT,
    "patientEducationNotes" TEXT,
    "instructionsMedication" TEXT,
    "instructionsDiet" TEXT,
    "instructionsActivity" TEXT,
    "instructionsWoundCare" TEXT,
    "instructionsFollowUp" TEXT,
    "instructionsWarningSigns" TEXT,
    "instructionsEmergency" TEXT,
    "instructionsOther" TEXT,
    "acknowledgedByPatient" BOOLEAN NOT NULL DEFAULT false,
    "acknowledgedByCaregiver" BOOLEAN NOT NULL DEFAULT false,
    "caregiverName" TEXT,
    "caregiverRelationship" TEXT,
    "acknowledgedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DischargeRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DischargeChecklistItem" (
    "id" TEXT NOT NULL,
    "dischargeId" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "completedById" TEXT,
    "completedAt" TIMESTAMP(3),
    "notes" TEXT,
    "required" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DischargeChecklistItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DischargeMedication" (
    "id" TEXT NOT NULL,
    "dischargeId" TEXT NOT NULL,
    "medicationName" TEXT NOT NULL,
    "medicationId" TEXT,
    "strength" TEXT,
    "dose" TEXT,
    "route" TEXT,
    "frequency" TEXT,
    "duration" TEXT,
    "quantity" TEXT,
    "instructions" TEXT,
    "action" TEXT NOT NULL DEFAULT 'continue',
    "preAdmission" BOOLEAN NOT NULL DEFAULT false,
    "inpatient" BOOLEAN NOT NULL DEFAULT false,
    "dispensed" BOOLEAN NOT NULL DEFAULT false,
    "dispensedQuantity" TEXT,
    "dispensedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DischargeMedication_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BedReservation" (
    "id" TEXT NOT NULL,
    "admissionId" TEXT,
    "patientId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "wardId" TEXT NOT NULL,
    "roomId" TEXT,
    "bedId" TEXT NOT NULL,
    "reservedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expectedUseAt" TIMESTAMP(3),
    "expiresAt" TIMESTAMP(3),
    "reservedById" TEXT,
    "reason" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BedReservation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BedCleaning" (
    "id" TEXT NOT NULL,
    "bedId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "initiatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "startedAt" TIMESTAMP(3),
    "completedAt" TIMESTAMP(3),
    "initiatedById" TEXT,
    "cleanedById" TEXT,
    "cleaningType" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BedCleaning_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BedMaintenance" (
    "id" TEXT NOT NULL,
    "bedId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'reported',
    "reason" TEXT,
    "reportedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reportedById" TEXT,
    "startedAt" TIMESTAMP(3),
    "expectedCompletion" TIMESTAMP(3),
    "completedAt" TIMESTAMP(3),
    "technicianId" TEXT,
    "technicianName" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BedMaintenance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BedBlock" (
    "id" TEXT NOT NULL,
    "bedId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'active',
    "reason" TEXT,
    "reasonDetails" TEXT,
    "blockedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expectedEnd" TIMESTAMP(3),
    "actualEnd" TIMESTAMP(3),
    "blockedById" TEXT,
    "approvedById" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BedBlock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProgressNote" (
    "id" TEXT NOT NULL,
    "admissionId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT,
    "facilityId" TEXT NOT NULL,
    "subjective" TEXT,
    "objective" TEXT,
    "assessment" TEXT,
    "plan" TEXT,
    "diagnosisRef" TEXT,
    "orders" TEXT,
    "followUp" TEXT,
    "noteType" TEXT NOT NULL DEFAULT 'doctor',
    "authoredById" TEXT,
    "authoredAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL DEFAULT 'final',
    "amendedFromId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProgressNote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CareTeamMember" (
    "id" TEXT NOT NULL,
    "admissionId" TEXT NOT NULL,
    "userId" TEXT,
    "staffName" TEXT,
    "role" TEXT NOT NULL DEFAULT 'attending',
    "assignedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "unassignedAt" TIMESTAMP(3),
    "assignedById" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CareTeamMember_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NursingNote" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "admissionId" TEXT,
    "nurseId" TEXT,
    "noteType" TEXT,
    "content" TEXT NOT NULL,
    "shift" TEXT,
    "subjective" TEXT,
    "objective" TEXT,
    "assessment" TEXT,
    "plan" TEXT,
    "focusData" TEXT,
    "focusAction" TEXT,
    "focusResponse" TEXT,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "signedById" TEXT,
    "signedAt" TIMESTAMP(3),
    "amendedFromId" TEXT,
    "eventAt" TIMESTAMP(3),
    "isEscalation" BOOLEAN NOT NULL DEFAULT false,
    "wardId" TEXT,
    "bedId" TEXT,
    "facilityId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "NursingNote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CarePlan" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "admissionId" TEXT,
    "problem" TEXT,
    "goal" TEXT,
    "interventions" TEXT,
    "evaluation" TEXT,
    "createdById" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "priority" TEXT,
    "expectedOutcome" TEXT,
    "reviewDate" TIMESTAMP(3),
    "responsibleNurseId" TEXT,
    "facilityId" TEXT,
    "nursingDiagnosis" TEXT,
    "relatedFactors" TEXT,
    "patientResponse" TEXT,
    "outcome" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CarePlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NursingHandover" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "admissionId" TEXT,
    "encounterId" TEXT,
    "facilityId" TEXT,
    "wardId" TEXT,
    "shiftType" TEXT NOT NULL DEFAULT 'morning',
    "handoverDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "currentCondition" TEXT,
    "background" TEXT,
    "assessment" TEXT,
    "recommendation" TEXT,
    "medicationsDue" TEXT,
    "pendingTasks" TEXT,
    "safetyConcerns" TEXT,
    "allergies" TEXT,
    "recentVitals" TEXT,
    "pendingInvestigations" TEXT,
    "fromNurseId" TEXT,
    "toNurseId" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "acknowledgedAt" TIMESTAMP(3),
    "acknowledgedById" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "NursingHandover_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NursingEscalation" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "admissionId" TEXT,
    "encounterId" TEXT,
    "facilityId" TEXT,
    "concern" TEXT NOT NULL,
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "escalatedTo" TEXT,
    "escalatedToId" TEXT,
    "escalatedById" TEXT,
    "escalatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "response" TEXT,
    "responseById" TEXT,
    "respondedAt" TIMESTAMP(3),
    "resolution" TEXT,
    "resolvedAt" TIMESTAMP(3),
    "resolvedById" TEXT,
    "status" TEXT NOT NULL DEFAULT 'open',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "NursingEscalation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NursingTask" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "admissionId" TEXT,
    "encounterId" TEXT,
    "facilityId" TEXT,
    "wardId" TEXT,
    "taskType" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "frequency" TEXT,
    "assignedToId" TEXT,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "completedAt" TIMESTAMP(3),
    "completedById" TEXT,
    "completionNotes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "NursingTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WoundAssessment" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "admissionId" TEXT,
    "encounterId" TEXT,
    "facilityId" TEXT,
    "woundLocation" TEXT,
    "woundType" TEXT,
    "length" DOUBLE PRECISION,
    "width" DOUBLE PRECISION,
    "depth" DOUBLE PRECISION,
    "stage" TEXT,
    "appearance" TEXT,
    "exudateType" TEXT,
    "exudateAmount" TEXT,
    "surroundingSkin" TEXT,
    "odor" TEXT,
    "painScore" INTEGER,
    "dressingType" TEXT,
    "treatmentGiven" TEXT,
    "nextDressingChange" TIMESTAMP(3),
    "assessedById" TEXT,
    "assessedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "patientResponse" TEXT,
    "notes" TEXT,
    "photoUrl" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WoundAssessment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RiskAssessment" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "admissionId" TEXT,
    "encounterId" TEXT,
    "facilityId" TEXT,
    "assessmentType" TEXT NOT NULL,
    "riskLevel" TEXT,
    "riskScore" INTEGER,
    "riskFactors" TEXT,
    "preventionPlan" TEXT,
    "interventions" TEXT,
    "assessedById" TEXT,
    "assessedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reviewDate" TIMESTAMP(3),
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RiskAssessment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NursingIntervention" (
    "id" TEXT NOT NULL,
    "carePlanId" TEXT,
    "patientId" TEXT NOT NULL,
    "admissionId" TEXT,
    "encounterId" TEXT,
    "facilityId" TEXT,
    "interventionType" TEXT,
    "description" TEXT NOT NULL,
    "frequency" TEXT,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "executedById" TEXT,
    "executedAt" TIMESTAMP(3),
    "patientResponse" TEXT,
    "responseNotes" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "NursingIntervention_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Referral" (
    "id" TEXT NOT NULL,
    "referralNumber" TEXT,
    "kind" TEXT NOT NULL DEFAULT 'inter_facility',
    "toDepartmentCode" TEXT,
    "referralType" TEXT NOT NULL DEFAULT 'external',
    "patientIdFrom" TEXT NOT NULL,
    "patientIdTo" TEXT,
    "encounterId" TEXT,
    "referringFacilityId" TEXT NOT NULL,
    "receivingFacilityId" TEXT,
    "referringDepartmentId" TEXT,
    "receivingDepartmentId" TEXT,
    "referringStaffId" TEXT,
    "receivingStaffId" TEXT,
    "receivingFacilityName" TEXT,
    "receivingProviderName" TEXT,
    "receivingContact" TEXT,
    "reason" TEXT,
    "referralReasonCategory" TEXT,
    "clinicalSummary" TEXT,
    "primaryDiagnosisId" TEXT,
    "urgency" TEXT NOT NULL DEFAULT 'routine',
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "status" TEXT NOT NULL DEFAULT 'draft',
    "feedbackStatus" TEXT NOT NULL DEFAULT 'awaiting',
    "transportRequired" BOOLEAN NOT NULL DEFAULT false,
    "transportStatus" TEXT,
    "transportRequestId" TEXT,
    "appointmentId" TEXT,
    "appointmentDate" TIMESTAMP(3),
    "stabilizationPerformed" TEXT,
    "authorizedById" TEXT,
    "authorizedAt" TIMESTAMP(3),
    "closureReason" TEXT,
    "closedById" TEXT,
    "closedAt" TIMESTAMP(3),
    "referredAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "submittedAt" TIMESTAMP(3),
    "sentAt" TIMESTAMP(3),
    "acknowledgedAt" TIMESTAMP(3),
    "acceptedAt" TIMESTAMP(3),
    "rejectedAt" TIMESTAMP(3),
    "arrivedAt" TIMESTAMP(3),
    "completedAt" TIMESTAMP(3),
    "feedbackReceivedAt" TIMESTAMP(3),
    "cancelledAt" TIMESTAMP(3),
    "consentStatus" TEXT,
    "consentObtainedById" TEXT,
    "consentObtainedAt" TIMESTAMP(3),
    "originalReceivingFacilityId" TEXT,
    "parentReferralId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Referral_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReferralEvent" (
    "id" TEXT NOT NULL,
    "referralId" TEXT NOT NULL,
    "eventType" TEXT NOT NULL,
    "fromStatus" TEXT,
    "toStatus" TEXT,
    "actorUserId" TEXT,
    "facilityId" TEXT,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "metadata" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ReferralEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReferralFeedback" (
    "id" TEXT NOT NULL,
    "referralId" TEXT NOT NULL,
    "feedbackType" TEXT NOT NULL DEFAULT 'interim',
    "authorUserId" TEXT,
    "authorFacilityId" TEXT,
    "clinicalFindings" TEXT,
    "diagnosis" TEXT,
    "treatmentProvided" TEXT,
    "proceduresPerformed" TEXT,
    "investigationsDone" TEXT,
    "outcome" TEXT,
    "medicationsPrescribed" TEXT,
    "recommendations" TEXT,
    "followUpPlan" TEXT,
    "returnRecommendation" TEXT,
    "isFinal" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ReferralFeedback_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReferralMessage" (
    "id" TEXT NOT NULL,
    "referralId" TEXT NOT NULL,
    "senderUserId" TEXT,
    "senderFacilityId" TEXT,
    "direction" TEXT NOT NULL DEFAULT 'outbound',
    "message" TEXT NOT NULL,
    "messageType" TEXT NOT NULL DEFAULT 'message',
    "attachments" TEXT,
    "isRead" BOOLEAN NOT NULL DEFAULT false,
    "readAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ReferralMessage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Immunization" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "vaccineCatalogId" TEXT,
    "vaccineName" TEXT NOT NULL,
    "dose" TEXT,
    "doseNumber" INTEGER,
    "seriesId" TEXT,
    "batchId" TEXT,
    "batchNumber" TEXT,
    "manufacturer" TEXT,
    "expiryDate" TIMESTAMP(3),
    "route" TEXT,
    "site" TEXT,
    "administeredAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "nextDueAt" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'completed',
    "indication" TEXT,
    "encounterId" TEXT,
    "appointmentId" TEXT,
    "consentStatus" TEXT,
    "consentObtainedById" TEXT,
    "consentObtainedAt" TIMESTAMP(3),
    "guardianName" TEXT,
    "facilityId" TEXT NOT NULL,
    "administeredById" TEXT,
    "notes" TEXT,
    "deferralReason" TEXT,
    "deferredUntil" TIMESTAMP(3),
    "declineReason" TEXT,
    "amendedFromId" TEXT,
    "amendmentReason" TEXT,
    "recalledAt" TIMESTAMP(3),
    "recallStatus" TEXT,
    "communityOutreachId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Immunization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VaccineCatalog" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "genericName" TEXT,
    "description" TEXT,
    "diseasePrevented" TEXT,
    "vaccineType" TEXT,
    "ageGroup" TEXT,
    "defaultRoute" TEXT,
    "defaultSite" TEXT,
    "doseVolumeMl" DOUBLE PRECISION,
    "inventoryItemId" TEXT,
    "serviceId" TEXT,
    "totalDosesInSeries" INTEGER NOT NULL DEFAULT 1,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "VaccineCatalog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VaccineScheduleDose" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "vaccineCatalogId" TEXT NOT NULL,
    "doseNumber" INTEGER NOT NULL,
    "doseLabel" TEXT NOT NULL,
    "ageAtDueDays" INTEGER NOT NULL,
    "ageAtOverdueDays" INTEGER NOT NULL,
    "intervalFromPreviousDoseDays" INTEGER,
    "appliesToSex" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "VaccineScheduleDose_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AEFI" (
    "id" TEXT NOT NULL,
    "immunizationId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "onsetAt" TIMESTAMP(3) NOT NULL,
    "reportedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reportedById" TEXT,
    "symptoms" TEXT NOT NULL,
    "severity" TEXT NOT NULL DEFAULT 'mild',
    "actionTaken" TEXT,
    "treatment" TEXT,
    "outcome" TEXT,
    "status" TEXT NOT NULL DEFAULT 'open',
    "reviewedById" TEXT,
    "reviewedAt" TIMESTAMP(3),
    "followUpNotes" TEXT,
    "followUpDate" TIMESTAMP(3),
    "referredToFacilityId" TEXT,
    "referralNotes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AEFI_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VaccineWastage" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "inventoryItemId" TEXT,
    "batchId" TEXT,
    "vaccineName" TEXT NOT NULL,
    "batchNumber" TEXT,
    "quantity" INTEGER NOT NULL,
    "reason" TEXT NOT NULL,
    "notes" TEXT,
    "disposedById" TEXT,
    "disposedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "VaccineWastage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ColdChainAlert" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "equipmentName" TEXT,
    "storageLocation" TEXT,
    "temperatureC" DOUBLE PRECISION NOT NULL,
    "recordedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "recordedById" TEXT,
    "isExcursion" BOOLEAN NOT NULL DEFAULT false,
    "excursionDurationMinutes" INTEGER,
    "notes" TEXT,
    "acknowledgedById" TEXT,
    "acknowledgedAt" TIMESTAMP(3),
    "resolutionNotes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ColdChainAlert_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AmbulanceVehicle" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "vehicleNumber" TEXT NOT NULL,
    "registrationNumber" TEXT NOT NULL,
    "make" TEXT,
    "model" TEXT,
    "year" INTEGER,
    "ambulanceType" TEXT NOT NULL DEFAULT 'basic_life_support',
    "capacity" INTEGER NOT NULL DEFAULT 2,
    "status" TEXT NOT NULL DEFAULT 'available',
    "equipmentProfile" TEXT,
    "lastServiceDate" TIMESTAMP(3),
    "nextServiceDate" TIMESTAMP(3),
    "currentOdometer" INTEGER,
    "insuranceExpiry" TIMESTAMP(3),
    "roadworthinessExpiry" TIMESTAMP(3),
    "baseLocation" TEXT,
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AmbulanceVehicle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AmbulanceTrip" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "tripNumber" TEXT NOT NULL,
    "patientId" TEXT,
    "referralId" TEXT,
    "serviceRequestId" TEXT,
    "requestType" TEXT NOT NULL DEFAULT 'emergency',
    "priority" TEXT NOT NULL DEFAULT 'urgent',
    "pickupLocation" TEXT NOT NULL,
    "pickupFacilityId" TEXT,
    "pickupContactName" TEXT,
    "pickupContactPhone" TEXT,
    "pickupNotes" TEXT,
    "destinationLocation" TEXT NOT NULL,
    "destinationFacilityId" TEXT,
    "destinationDepartment" TEXT,
    "destinationContactName" TEXT,
    "destinationContactPhone" TEXT,
    "reasonForTransport" TEXT,
    "clinicalIndication" TEXT,
    "patientCondition" TEXT,
    "mobilityRequirement" TEXT,
    "oxygenRequired" BOOLEAN NOT NULL DEFAULT false,
    "accompanyingPerson" TEXT,
    "specialRequirements" TEXT,
    "vehicleId" TEXT,
    "driverStaffId" TEXT,
    "crewIds" TEXT,
    "requestedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "requestedDepartureAt" TIMESTAMP(3),
    "dispatchedAt" TIMESTAMP(3),
    "departedAt" TIMESTAMP(3),
    "arrivedAtPickupAt" TIMESTAMP(3),
    "patientOnBoardAt" TIMESTAMP(3),
    "departedPickupAt" TIMESTAMP(3),
    "arrivedAtDestinationAt" TIMESTAMP(3),
    "handoverAt" TIMESTAMP(3),
    "returnedAt" TIMESTAMP(3),
    "completedAt" TIMESTAMP(3),
    "cancelledAt" TIMESTAMP(3),
    "startMileage" INTEGER,
    "endMileage" INTEGER,
    "distance" DOUBLE PRECISION,
    "serviceId" TEXT,
    "invoiceId" TEXT,
    "billingStatus" TEXT NOT NULL DEFAULT 'unbilled',
    "handoverReceivedById" TEXT,
    "handoverNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'requested',
    "cancellationReason" TEXT,
    "requestedById" TEXT,
    "dispatchedById" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AmbulanceTrip_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AmbulanceIncident" (
    "id" TEXT NOT NULL,
    "tripId" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "incidentType" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "actionTaken" TEXT,
    "resolution" TEXT,
    "followUpRequired" BOOLEAN NOT NULL DEFAULT false,
    "reportedById" TEXT,
    "reportedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AmbulanceIncident_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MaternityRecord" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT,
    "facilityId" TEXT NOT NULL,
    "gravida" INTEGER,
    "para" INTEGER,
    "abortions" INTEGER,
    "livingChildren" INTEGER,
    "lmp" TIMESTAMP(3),
    "eddLmp" TIMESTAMP(3),
    "eddUltrasound" TIMESTAMP(3),
    "eddClinical" TIMESTAMP(3),
    "eddFinal" TIMESTAMP(3),
    "eddConfidenceReason" TEXT,
    "pregnancyNumber" INTEGER,
    "pregnancyStatus" TEXT NOT NULL DEFAULT 'active',
    "pregnancyType" TEXT,
    "riskLevel" TEXT NOT NULL DEFAULT 'low',
    "riskFactors" TEXT,
    "riskOverrideReason" TEXT,
    "bloodGroup" TEXT,
    "rhStatus" TEXT,
    "antenatalNotes" TEXT,
    "deliveryNotes" TEXT,
    "deliveryDate" TIMESTAMP(3),
    "deliveryType" TEXT,
    "birthOutcome" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MaternityRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NewbornRecord" (
    "id" TEXT NOT NULL,
    "motherPatientId" TEXT NOT NULL,
    "patientId" TEXT,
    "deliveryRecordId" TEXT NOT NULL,
    "birthDate" TIMESTAMP(3) NOT NULL,
    "sex" TEXT,
    "birthWeight" DOUBLE PRECISION,
    "birthLength" DOUBLE PRECISION,
    "headCircumference" DOUBLE PRECISION,
    "apgar1" INTEGER,
    "apgar5" INTEGER,
    "apgar10" INTEGER,
    "gestationalAge" INTEGER,
    "feedingStatus" TEXT,
    "resuscitation" TEXT,
    "complications" TEXT,
    "outcome" TEXT,
    "babyName" TEXT,
    "attendingStaffId" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "NewbornRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AncVisit" (
    "id" TEXT NOT NULL,
    "maternityRecordId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT,
    "facilityId" TEXT NOT NULL,
    "visitDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "gestationalAge" INTEGER,
    "weight" DOUBLE PRECISION,
    "bpSystolic" INTEGER,
    "bpDiastolic" INTEGER,
    "pulse" INTEGER,
    "temperature" DOUBLE PRECISION,
    "respiratoryRate" INTEGER,
    "oxygenSaturation" INTEGER,
    "fundalHeight" DOUBLE PRECISION,
    "fetalHeartRate" INTEGER,
    "fetalMovement" TEXT,
    "presentation" TEXT,
    "edema" TEXT,
    "symptoms" TEXT,
    "clinicalAssessment" TEXT,
    "riskFlags" TEXT,
    "nextVisitDate" TIMESTAMP(3),
    "educationTopics" TEXT,
    "notes" TEXT,
    "recordedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AncVisit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LaborAndDelivery" (
    "id" TEXT NOT NULL,
    "maternityRecordId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "admissionDate" TIMESTAMP(3),
    "admissionId" TEXT,
    "onsetOfLabor" TIMESTAMP(3),
    "ruptureOfMembranes" TIMESTAMP(3),
    "membraneStatus" TEXT,
    "liquorColor" TEXT,
    "cervicalDilation" INTEGER,
    "effacement" INTEGER,
    "station" INTEGER,
    "contractionFreq" INTEGER,
    "contractionDur" INTEGER,
    "contractionStrength" TEXT,
    "fetalHeartRate" INTEGER,
    "fetalHeartRateAbnormal" BOOLEAN NOT NULL DEFAULT false,
    "maternalPulse" INTEGER,
    "maternalBpSystolic" INTEGER,
    "maternalBpDiastolic" INTEGER,
    "maternalTemp" DOUBLE PRECISION,
    "deliveryDate" TIMESTAMP(3),
    "deliveryType" TEXT,
    "deliveryIndication" TEXT,
    "presentation" TEXT,
    "episiotomy" BOOLEAN NOT NULL DEFAULT false,
    "episiotomyType" TEXT,
    "placentaDelivered" BOOLEAN NOT NULL DEFAULT false,
    "placentaCondition" TEXT,
    "estimatedBloodLoss" INTEGER,
    "oxytocinUsed" BOOLEAN NOT NULL DEFAULT false,
    "ivFluidsGiven" TEXT,
    "urineOutput" TEXT,
    "maternalComplications" TEXT,
    "neonatalComplications" TEXT,
    "maternalOutcome" TEXT,
    "attendingClinicianId" TEXT,
    "attendingMidwifeId" TEXT,
    "partographData" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LaborAndDelivery_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostnatalVisit" (
    "id" TEXT NOT NULL,
    "maternityRecordId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "visitDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "visitType" TEXT NOT NULL DEFAULT 'routine',
    "maternalStatus" TEXT,
    "bpSystolic" INTEGER,
    "bpDiastolic" INTEGER,
    "pulse" INTEGER,
    "temperature" DOUBLE PRECISION,
    "bleeding" TEXT,
    "pain" TEXT,
    "woundCondition" TEXT,
    "uterineAssessment" TEXT,
    "breastfeeding" TEXT,
    "emotionalStatus" TEXT,
    "newbornStatus" TEXT,
    "newbornNotes" TEXT,
    "familyPlanningCounseling" BOOLEAN NOT NULL DEFAULT false,
    "familyPlanningMethod" TEXT,
    "educationTopics" TEXT,
    "nextFollowUpDate" TIMESTAMP(3),
    "notes" TEXT,
    "recordedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PostnatalVisit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Service" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "shortName" TEXT,
    "code" TEXT NOT NULL,
    "category" TEXT,
    "serviceType" TEXT,
    "departmentId" TEXT,
    "unitId" TEXT,
    "description" TEXT,
    "defaultPrice" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "nhisPrice" DECIMAL(65,30),
    "insurancePrice" DECIMAL(65,30),
    "cashPrice" DECIMAL(65,30),
    "isBillable" BOOLEAN NOT NULL DEFAULT true,
    "isTaxable" BOOLEAN NOT NULL DEFAULT false,
    "nhisEligible" BOOLEAN NOT NULL DEFAULT false,
    "nhisServiceCode" TEXT,
    "unitOfMeasure" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdById" TEXT,
    "updatedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Service_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FacilityServicePrice" (
    "id" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "serviceId" TEXT NOT NULL,
    "price" DECIMAL(65,30) NOT NULL,
    "nhisPrice" DECIMAL(65,30),
    "effectiveFrom" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "effectiveTo" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FacilityServicePrice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServicePriceHistory" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "serviceId" TEXT NOT NULL,
    "facilityId" TEXT,
    "oldPrice" DOUBLE PRECISION,
    "newPrice" DOUBLE PRECISION NOT NULL,
    "priceType" TEXT NOT NULL DEFAULT 'default',
    "effectiveDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reason" TEXT,
    "changedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ServicePriceHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServicePackage" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "packagePrice" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "nhisPrice" DECIMAL(65,30),
    "effectiveFrom" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "effectiveTo" TIMESTAMP(3),
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ServicePackage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServicePackageItem" (
    "id" TEXT NOT NULL,
    "packageId" TEXT NOT NULL,
    "serviceId" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL DEFAULT 1,
    "overridePrice" DECIMAL(65,30),
    "isMandatory" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ServicePackageItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Invoice" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT,
    "admissionId" TEXT,
    "facilityId" TEXT NOT NULL,
    "invoiceNumber" TEXT NOT NULL,
    "invoiceType" TEXT NOT NULL DEFAULT 'patient',
    "status" TEXT NOT NULL DEFAULT 'draft',
    "payerType" TEXT NOT NULL DEFAULT 'self_pay',
    "subtotal" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "discount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "discountReason" TEXT,
    "discountApprovedById" TEXT,
    "tax" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "taxRate" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "total" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "amountPaid" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "amountRefunded" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "amountCredited" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "balance" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "payerResponsibility" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "patientResponsibility" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "insuranceResponsibility" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "nhisResponsibility" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "insuranceProviderId" TEXT,
    "insurancePolicyNumber" TEXT,
    "insuranceAuthorization" TEXT,
    "nhisNumber" TEXT,
    "nhisClaimId" TEXT,
    "corporateName" TEXT,
    "corporateAccountNumber" TEXT,
    "currency" TEXT NOT NULL DEFAULT 'GHS',
    "issuedAt" TIMESTAMP(3),
    "dueAt" TIMESTAMP(3),
    "reviewedAt" TIMESTAMP(3),
    "reviewedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "approvedById" TEXT,
    "issuedById" TEXT,
    "voidedAt" TIMESTAMP(3),
    "voidedById" TEXT,
    "voidReason" TEXT,
    "cancelledAt" TIMESTAMP(3),
    "cancelledById" TEXT,
    "cancelReason" TEXT,
    "refundedAt" TIMESTAMP(3),
    "writtenOffAt" TIMESTAMP(3),
    "writtenOffById" TEXT,
    "writeOffReason" TEXT,
    "writeOffAmount" DOUBLE PRECISION,
    "internalNotes" TEXT,
    "patientNotes" TEXT,
    "paymentTerms" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Invoice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InvoiceItem" (
    "id" TEXT NOT NULL,
    "invoiceId" TEXT NOT NULL,
    "serviceId" TEXT,
    "description" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL DEFAULT 1,
    "unitPrice" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "discount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "tax" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "total" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "referenceType" TEXT,
    "referenceId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InvoiceItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Payment" (
    "id" TEXT NOT NULL,
    "invoiceId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "paymentNumber" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "paymentMethod" TEXT NOT NULL,
    "transactionReference" TEXT,
    "status" TEXT NOT NULL DEFAULT 'completed',
    "receivedById" TEXT,
    "receivedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Payment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Refund" (
    "id" TEXT NOT NULL,
    "refundNumber" TEXT,
    "paymentId" TEXT NOT NULL,
    "invoiceId" TEXT NOT NULL,
    "patientId" TEXT,
    "facilityId" TEXT,
    "amount" DOUBLE PRECISION NOT NULL,
    "approvedAmount" DOUBLE PRECISION,
    "processedAmount" DOUBLE PRECISION,
    "reason" TEXT,
    "refundType" TEXT NOT NULL DEFAULT 'full',
    "refundSource" TEXT,
    "refundMethod" TEXT,
    "externalReference" TEXT,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "reviewedAt" TIMESTAMP(3),
    "reviewedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "approvedById" TEXT,
    "rejectedAt" TIMESTAMP(3),
    "rejectedById" TEXT,
    "rejectionReason" TEXT,
    "processedAt" TIMESTAMP(3),
    "processedById" TEXT,
    "cancelledAt" TIMESTAMP(3),
    "cancelledById" TEXT,
    "cancelReason" TEXT,
    "reversedAt" TIMESTAMP(3),
    "reversedById" TEXT,
    "reversalReason" TEXT,
    "failedAt" TIMESTAMP(3),
    "failureReason" TEXT,
    "retryCount" INTEGER NOT NULL DEFAULT 0,
    "verifiedAt" TIMESTAMP(3),
    "verifiedById" TEXT,
    "requestedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Refund_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CreditNote" (
    "id" TEXT NOT NULL,
    "creditNoteNumber" TEXT NOT NULL,
    "invoiceId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "reason" TEXT NOT NULL,
    "description" TEXT,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "issuedAt" TIMESTAMP(3),
    "issuedById" TEXT,
    "appliedAt" TIMESTAMP(3),
    "reversedAt" TIMESTAMP(3),
    "reversalReason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CreditNote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InvoiceAdjustment" (
    "id" TEXT NOT NULL,
    "invoiceId" TEXT NOT NULL,
    "adjustmentType" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "reason" TEXT NOT NULL,
    "description" TEXT,
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InvoiceAdjustment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InsuranceClaim" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "insuranceProviderId" TEXT NOT NULL,
    "invoiceId" TEXT NOT NULL,
    "encounterId" TEXT,
    "claimNumber" TEXT NOT NULL,
    "claimAmount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "approvedAmount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "claimType" TEXT NOT NULL DEFAULT 'outpatient',
    "nhisNumber" TEXT,
    "primaryDiagnosisCode" TEXT,
    "primaryDiagnosisName" TEXT,
    "primaryDiagnosisCatalogId" TEXT,
    "secondaryDiagnosisCodes" TEXT,
    "gdrgCode" TEXT,
    "gdrgName" TEXT,
    "nhisTariff" DOUBLE PRECISION,
    "isNhisValidated" BOOLEAN NOT NULL DEFAULT false,
    "nhisValidationNotes" TEXT,
    "claimSubmissionRef" TEXT,
    "batchId" TEXT,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "submittedAt" TIMESTAMP(3),
    "approvedAt" TIMESTAMP(3),
    "rejectedAt" TIMESTAMP(3),
    "rejectionReason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InsuranceClaim_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClaimDiagnosis" (
    "id" TEXT NOT NULL,
    "claimId" TEXT NOT NULL,
    "catalogId" TEXT,
    "diagnosisCode" TEXT NOT NULL,
    "diagnosisName" TEXT NOT NULL,
    "diagnosisType" TEXT NOT NULL DEFAULT 'primary',
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ClaimDiagnosis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClaimItem" (
    "id" TEXT NOT NULL,
    "claimId" TEXT NOT NULL,
    "itemType" TEXT NOT NULL,
    "serviceCode" TEXT,
    "description" TEXT NOT NULL,
    "serviceDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "quantity" INTEGER NOT NULL DEFAULT 1,
    "unitPrice" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "claimedAmount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "approvedAmount" DOUBLE PRECISION,
    "rejectedAmount" DOUBLE PRECISION,
    "adjustmentReason" TEXT,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ClaimItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClaimBatch" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "batchNumber" TEXT NOT NULL,
    "insuranceProviderId" TEXT NOT NULL,
    "claimCount" INTEGER NOT NULL DEFAULT 0,
    "totalAmount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "submissionMethod" TEXT NOT NULL DEFAULT 'manual',
    "submissionRef" TEXT,
    "submittedAt" TIMESTAMP(3),
    "submittedById" TEXT,
    "submittedByName" TEXT,
    "responseReceivedAt" TIMESTAMP(3),
    "responseNotes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ClaimBatch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClaimQuery" (
    "id" TEXT NOT NULL,
    "claimId" TEXT NOT NULL,
    "queryReason" TEXT NOT NULL,
    "queryCode" TEXT,
    "queriedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "responseDeadline" TIMESTAMP(3),
    "assignedToId" TEXT,
    "assignedToName" TEXT,
    "response" TEXT,
    "responseAt" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'open',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ClaimQuery_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClaimPayment" (
    "id" TEXT NOT NULL,
    "claimId" TEXT NOT NULL,
    "paymentReference" TEXT,
    "paymentDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "amount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "adjustment" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "paymentStatus" TEXT NOT NULL DEFAULT 'received',
    "notes" TEXT,
    "recordedById" TEXT,
    "recordedByName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ClaimPayment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EligibilityVerification" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "insuranceProviderId" TEXT,
    "patientInsuranceId" TEXT,
    "membershipNumber" TEXT,
    "encounterId" TEXT,
    "facilityId" TEXT,
    "verificationDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "verificationStatus" TEXT NOT NULL DEFAULT 'not_verified',
    "coverageStatus" TEXT,
    "coverageStart" TIMESTAMP(3),
    "coverageEnd" TIMESTAMP(3),
    "verificationMethod" TEXT NOT NULL DEFAULT 'manual',
    "verificationSource" TEXT NOT NULL DEFAULT 'manual',
    "verificationReference" TEXT,
    "responseData" TEXT,
    "requestPayload" TEXT,
    "expiresAt" TIMESTAMP(3),
    "resultMessage" TEXT,
    "verifiedById" TEXT,
    "verifiedByName" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "attendanceVerificationId" TEXT,

    CONSTRAINT "EligibilityVerification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EncounterCoverage" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "payerType" TEXT NOT NULL DEFAULT 'self_pay',
    "patientInsuranceId" TEXT,
    "insuranceProviderId" TEXT,
    "insurancePlanId" TEXT,
    "insuranceAuthorizationId" TEXT,
    "coveragePercentage" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "patientCopay" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "patientResponsibility" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "payerResponsibility" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL DEFAULT 'active',
    "selectedById" TEXT,
    "selectedByName" TEXT,
    "selectedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EncounterCoverage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AttendanceVerification" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "encounterId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "patientInsuranceId" TEXT,
    "method" TEXT NOT NULL DEFAULT 'CCC',
    "code" TEXT,
    "codeHash" TEXT,
    "transactionRef" TEXT,
    "verificationStatus" TEXT NOT NULL DEFAULT 'pending',
    "verifiedAt" TIMESTAMP(3),
    "expiresAt" TIMESTAMP(3),
    "source" TEXT NOT NULL DEFAULT 'local',
    "resultMessage" TEXT,
    "responseData" TEXT,
    "capturedById" TEXT,
    "capturedByName" TEXT,
    "capturedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AttendanceVerification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClaimReadinessAssessment" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "encounterId" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT,
    "status" TEXT NOT NULL DEFAULT 'not_ready',
    "readinessScore" INTEGER NOT NULL DEFAULT 0,
    "checksTotal" INTEGER NOT NULL DEFAULT 0,
    "checksPassed" INTEGER NOT NULL DEFAULT 0,
    "checksFailed" INTEGER NOT NULL DEFAULT 0,
    "checksWarning" INTEGER NOT NULL DEFAULT 0,
    "checks" TEXT,
    "failureSummary" TEXT,
    "warningsSummary" TEXT,
    "coverageId" TEXT,
    "eligibilityVerificationId" TEXT,
    "attendanceVerificationId" TEXT,
    "invoiceId" TEXT,
    "insuranceClaimId" TEXT,
    "evaluatedById" TEXT,
    "evaluatedByName" TEXT,
    "evaluatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ClaimReadinessAssessment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InventoryItem" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "sku" TEXT NOT NULL,
    "barcode" TEXT,
    "itemType" TEXT NOT NULL,
    "category" TEXT,
    "subcategory" TEXT,
    "unit" TEXT,
    "packSize" TEXT,
    "description" TEXT,
    "reorderLevel" INTEGER NOT NULL DEFAULT 0,
    "minimumStock" INTEGER NOT NULL DEFAULT 0,
    "maximumStock" INTEGER NOT NULL DEFAULT 0,
    "reorderQuantity" INTEGER NOT NULL DEFAULT 0,
    "safetyStock" INTEGER NOT NULL DEFAULT 0,
    "manufacturer" TEXT,
    "brand" TEXT,
    "countryOfOrigin" TEXT,
    "storageConditions" TEXT,
    "isControlled" BOOLEAN NOT NULL DEFAULT false,
    "isConsumable" BOOLEAN NOT NULL DEFAULT true,
    "isRefrigerated" BOOLEAN NOT NULL DEFAULT false,
    "isHazardous" BOOLEAN NOT NULL DEFAULT false,
    "isSterile" BOOLEAN NOT NULL DEFAULT false,
    "preferredSupplierId" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "medicationId" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InventoryItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FacilityInventory" (
    "id" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "inventoryItemId" TEXT NOT NULL,
    "currentQuantity" INTEGER NOT NULL DEFAULT 0,
    "reservedQuantity" INTEGER NOT NULL DEFAULT 0,
    "quarantinedQuantity" INTEGER NOT NULL DEFAULT 0,
    "damagedQuantity" INTEGER NOT NULL DEFAULT 0,
    "minimumQuantity" INTEGER NOT NULL DEFAULT 0,
    "maximumQuantity" INTEGER NOT NULL DEFAULT 0,
    "storageLocation" TEXT,
    "storeName" TEXT,
    "binLocation" TEXT,
    "lastCostPrice" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "averageCost" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FacilityInventory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InventoryBatch" (
    "id" TEXT NOT NULL,
    "facilityInventoryId" TEXT NOT NULL,
    "batchNumber" TEXT NOT NULL,
    "expiryDate" TIMESTAMP(3),
    "manufactureDate" TIMESTAMP(3),
    "quantity" INTEGER NOT NULL DEFAULT 0,
    "costPrice" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "sellingPrice" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "supplierId" TEXT,
    "purchaseOrderId" TEXT,
    "goodsReceivedId" TEXT,
    "receivedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL DEFAULT 'active',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InventoryBatch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InventoryTransaction" (
    "id" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "inventoryItemId" TEXT NOT NULL,
    "batchId" TEXT,
    "transactionType" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "balanceBefore" INTEGER,
    "balanceAfter" INTEGER,
    "unitCost" DOUBLE PRECISION,
    "totalValue" DOUBLE PRECISION,
    "referenceType" TEXT,
    "referenceId" TEXT,
    "performedById" TEXT,
    "transactionAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reason" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "InventoryTransaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Supplier" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "contactPerson" TEXT,
    "phone" TEXT,
    "email" TEXT,
    "address" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "supplierType" TEXT,
    "category" TEXT,
    "legalBusinessName" TEXT,
    "tradingName" TEXT,
    "vendorId" TEXT,
    "registrationNumber" TEXT,
    "taxIdNumber" TEXT,
    "vatStatus" TEXT,
    "website" TEXT,
    "alternatePhone" TEXT,
    "postalAddress" TEXT,
    "city" TEXT,
    "region" TEXT,
    "country" TEXT,
    "digitalAddress" TEXT,
    "paymentTerms" TEXT,
    "creditLimit" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "bankName" TEXT,
    "bankAccountName" TEXT,
    "bankAccountNumber" TEXT,
    "bankBranch" TEXT,
    "swiftCode" TEXT,
    "isPreferred" BOOLEAN NOT NULL DEFAULT false,
    "complianceStatus" TEXT,
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "verifiedById" TEXT,
    "verifiedAt" TIMESTAMP(3),
    "suspendedAt" TIMESTAMP(3),
    "suspendedById" TEXT,
    "suspensionReason" TEXT,
    "performanceRating" DOUBLE PRECISION,
    "totalSpend" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "totalOrders" INTEGER NOT NULL DEFAULT 0,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Supplier_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplierContact" (
    "id" TEXT NOT NULL,
    "supplierId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "position" TEXT,
    "phone" TEXT,
    "email" TEXT,
    "department" TEXT,
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SupplierContact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplierDocument" (
    "id" TEXT NOT NULL,
    "supplierId" TEXT NOT NULL,
    "documentType" TEXT NOT NULL,
    "documentName" TEXT NOT NULL,
    "issueDate" TIMESTAMP(3),
    "expiryDate" TIMESTAMP(3),
    "verifiedById" TEXT,
    "verifiedAt" TIMESTAMP(3),
    "verificationStatus" TEXT NOT NULL DEFAULT 'pending',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SupplierDocument_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplierProduct" (
    "id" TEXT NOT NULL,
    "supplierId" TEXT NOT NULL,
    "inventoryItemId" TEXT NOT NULL,
    "supplierItemCode" TEXT,
    "supplierSku" TEXT,
    "purchasePrice" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "minimumOrderQuantity" INTEGER NOT NULL DEFAULT 1,
    "leadTimeDays" INTEGER NOT NULL DEFAULT 0,
    "isPreferred" BOOLEAN NOT NULL DEFAULT false,
    "lastPurchasePrice" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "lastPurchaseDate" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SupplierProduct_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplierEvaluation" (
    "id" TEXT NOT NULL,
    "supplierId" TEXT NOT NULL,
    "evaluationPeriod" TEXT NOT NULL,
    "criteria" TEXT NOT NULL,
    "score" DOUBLE PRECISION NOT NULL,
    "comments" TEXT,
    "evaluatedById" TEXT,
    "evaluatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "facilityId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SupplierEvaluation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplierComplaint" (
    "id" TEXT NOT NULL,
    "supplierId" TEXT NOT NULL,
    "complaintType" TEXT NOT NULL,
    "subject" TEXT NOT NULL,
    "description" TEXT,
    "severity" TEXT NOT NULL DEFAULT 'medium',
    "status" TEXT NOT NULL DEFAULT 'open',
    "resolvedAt" TIMESTAMP(3),
    "resolvedById" TEXT,
    "resolutionNotes" TEXT,
    "purchaseOrderId" TEXT,
    "facilityId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SupplierComplaint_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PurchaseOrder" (
    "id" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "supplierId" TEXT NOT NULL,
    "purchaseOrderNumber" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "subtotal" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "tax" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "total" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "departmentId" TEXT,
    "priority" TEXT NOT NULL DEFAULT 'normal',
    "expectedDeliveryDate" TIMESTAMP(3),
    "actualDeliveryDate" TIMESTAMP(3),
    "currency" TEXT NOT NULL DEFAULT 'GHS',
    "paymentTerms" TEXT,
    "deliveryTerms" TEXT,
    "shippingAddress" TEXT,
    "deliveryContact" TEXT,
    "deliveryPhone" TEXT,
    "shippingMethod" TEXT,
    "supplierReference" TEXT,
    "trackingNumber" TEXT,
    "notes" TEXT,
    "termsAndConditions" TEXT,
    "isEmergency" BOOLEAN NOT NULL DEFAULT false,
    "emergencyReason" TEXT,
    "revisionNumber" INTEGER NOT NULL DEFAULT 0,
    "sentToSupplierAt" TIMESTAMP(3),
    "sentById" TEXT,
    "acknowledgedAt" TIMESTAMP(3),
    "acknowledgedById" TEXT,
    "supplierAckStatus" TEXT,
    "supplierAckComments" TEXT,
    "requestedById" TEXT,
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "submittedAt" TIMESTAMP(3),
    "rejectedAt" TIMESTAMP(3),
    "rejectedById" TEXT,
    "rejectionReason" TEXT,
    "orderedAt" TIMESTAMP(3),
    "holdReason" TEXT,
    "heldAt" TIMESTAMP(3),
    "heldById" TEXT,
    "previousStatus" TEXT,
    "closedAt" TIMESTAMP(3),
    "closedById" TEXT,
    "closeNotes" TEXT,
    "cancelledAt" TIMESTAMP(3),
    "cancelledById" TEXT,
    "cancelReason" TEXT,
    "totalReceived" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "totalInvoiced" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "totalPaid" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PurchaseOrder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PurchaseOrderItem" (
    "id" TEXT NOT NULL,
    "purchaseOrderId" TEXT NOT NULL,
    "inventoryItemId" TEXT,
    "description" TEXT,
    "category" TEXT,
    "unit" TEXT,
    "quantity" INTEGER NOT NULL DEFAULT 0,
    "unitPrice" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "discount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "taxRate" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "taxAmount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "total" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "lineTotal" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "receivedQuantity" INTEGER NOT NULL DEFAULT 0,
    "rejectedQuantity" INTEGER NOT NULL DEFAULT 0,
    "invoicedQuantity" INTEGER NOT NULL DEFAULT 0,
    "paidQuantity" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PurchaseOrderItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GoodsReceived" (
    "id" TEXT NOT NULL,
    "purchaseOrderId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "receivedById" TEXT,
    "receivedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "referenceNumber" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "GoodsReceived_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StockTransfer" (
    "id" TEXT NOT NULL,
    "transferNumber" TEXT NOT NULL,
    "transferType" TEXT NOT NULL DEFAULT 'internal',
    "fromFacilityId" TEXT NOT NULL,
    "toFacilityId" TEXT NOT NULL,
    "fromDepartmentId" TEXT,
    "toDepartmentId" TEXT,
    "fromStoreName" TEXT,
    "toStoreName" TEXT,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "priority" TEXT NOT NULL DEFAULT 'normal',
    "reason" TEXT,
    "expectedDeliveryDate" TIMESTAMP(3),
    "actualDeliveryDate" TIMESTAMP(3),
    "requestedById" TEXT,
    "approvedById" TEXT,
    "rejectedById" TEXT,
    "rejectionReason" TEXT,
    "preparedById" TEXT,
    "preparedAt" TIMESTAMP(3),
    "dispatchedById" TEXT,
    "receivedById" TEXT,
    "verifiedById" TEXT,
    "verifiedAt" TIMESTAMP(3),
    "cancelledById" TEXT,
    "cancelReason" TEXT,
    "heldById" TEXT,
    "holdReason" TEXT,
    "carrierName" TEXT,
    "trackingNumber" TEXT,
    "dispatchNotes" TEXT,
    "returnTransferId" TEXT,
    "totalQuantity" INTEGER NOT NULL DEFAULT 0,
    "totalValue" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "submittedAt" TIMESTAMP(3),
    "approvedAt" TIMESTAMP(3),
    "rejectedAt" TIMESTAMP(3),
    "dispatchedAt" TIMESTAMP(3),
    "receivedAt" TIMESTAMP(3),
    "completedAt" TIMESTAMP(3),
    "cancelledAt" TIMESTAMP(3),
    "heldAt" TIMESTAMP(3),
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StockTransfer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StockTransferItem" (
    "id" TEXT NOT NULL,
    "stockTransferId" TEXT NOT NULL,
    "inventoryItemId" TEXT NOT NULL,
    "batchId" TEXT,
    "description" TEXT,
    "category" TEXT,
    "unit" TEXT,
    "requestedQuantity" INTEGER NOT NULL DEFAULT 0,
    "approvedQuantity" INTEGER NOT NULL DEFAULT 0,
    "preparedQuantity" INTEGER NOT NULL DEFAULT 0,
    "dispatchedQuantity" INTEGER NOT NULL DEFAULT 0,
    "receivedQuantity" INTEGER NOT NULL DEFAULT 0,
    "rejectedQuantity" INTEGER NOT NULL DEFAULT 0,
    "damagedQuantity" INTEGER NOT NULL DEFAULT 0,
    "unitCost" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "totalValue" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StockTransferItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StockAdjustment" (
    "id" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "inventoryItemId" TEXT NOT NULL,
    "batchId" TEXT,
    "adjustmentType" TEXT NOT NULL,
    "beforeQuantity" INTEGER NOT NULL,
    "adjustmentQuantity" INTEGER NOT NULL,
    "afterQuantity" INTEGER NOT NULL,
    "reason" TEXT NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "requestedById" TEXT,
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "completedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StockAdjustment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Equipment" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "assetNumber" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" TEXT,
    "manufacturer" TEXT,
    "model" TEXT,
    "serialNumber" TEXT,
    "purchaseDate" TIMESTAMP(3),
    "purchasePrice" DOUBLE PRECISION,
    "warrantyExpiry" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'active',
    "location" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Equipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EquipmentMaintenance" (
    "id" TEXT NOT NULL,
    "equipmentId" TEXT NOT NULL,
    "maintenanceType" TEXT,
    "description" TEXT,
    "performedById" TEXT,
    "performedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "nextDueAt" TIMESTAMP(3),
    "cost" DOUBLE PRECISION,
    "status" TEXT NOT NULL DEFAULT 'completed',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EquipmentMaintenance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffShift" (
    "id" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "shiftDate" TIMESTAMP(3) NOT NULL,
    "startTime" TIMESTAMP(3) NOT NULL,
    "endTime" TIMESTAMP(3),
    "shiftType" TEXT,
    "shiftTypeId" TEXT,
    "rosterId" TEXT,
    "supervisorId" TEXT,
    "status" TEXT NOT NULL DEFAULT 'scheduled',
    "shiftCategory" TEXT DEFAULT 'regular',
    "isOnCall" BOOLEAN NOT NULL DEFAULT false,
    "isOvernight" BOOLEAN NOT NULL DEFAULT false,
    "notes" TEXT,
    "breakMinutes" INTEGER NOT NULL DEFAULT 0,
    "paidBreak" BOOLEAN NOT NULL DEFAULT true,
    "workingHours" DOUBLE PRECISION,
    "overtimeMinutes" INTEGER NOT NULL DEFAULT 0,
    "attendanceReconciled" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StaffShift_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeaveRecord" (
    "id" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "leaveType" TEXT,
    "leaveTypeId" TEXT,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3),
    "returnDate" TIMESTAMP(3),
    "actualReturnDate" TIMESTAMP(3),
    "partialDay" TEXT DEFAULT 'full',
    "hoursOff" DOUBLE PRECISION,
    "reason" TEXT,
    "reasonCode" TEXT,
    "supportingDocUrl" TEXT,
    "contactDuringLeave" TEXT,
    "expectedDeliveryDate" TIMESTAMP(3),
    "institution" TEXT,
    "courseName" TEXT,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "approvedById" TEXT,
    "reviewedById" TEXT,
    "reviewComment" TEXT,
    "extendedFromId" TEXT,
    "rosterAdjusted" BOOLEAN NOT NULL DEFAULT false,
    "isSensitive" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LeaveRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShiftType" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "category" TEXT NOT NULL DEFAULT 'regular',
    "colorHex" TEXT,
    "startTime" TEXT,
    "endTime" TEXT,
    "overnight" BOOLEAN NOT NULL DEFAULT false,
    "isOnCall" BOOLEAN NOT NULL DEFAULT false,
    "defaultBreakMinutes" INTEGER,
    "paidBreak" BOOLEAN NOT NULL DEFAULT true,
    "workingHours" DOUBLE PRECISION,
    "description" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ShiftType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShiftTemplate" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "shiftTypeId" TEXT,
    "startTime" TEXT NOT NULL,
    "endTime" TEXT NOT NULL,
    "breakMinutes" INTEGER NOT NULL DEFAULT 0,
    "paidBreak" BOOLEAN NOT NULL DEFAULT true,
    "overnight" BOOLEAN NOT NULL DEFAULT false,
    "isOnCall" BOOLEAN NOT NULL DEFAULT false,
    "category" TEXT NOT NULL DEFAULT 'regular',
    "workingHours" DOUBLE PRECISION,
    "minStaff" INTEGER,
    "requiredSkillMix" TEXT,
    "description" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ShiftTemplate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Roster" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "name" TEXT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "lockedAt" TIMESTAMP(3),
    "lockedById" TEXT,
    "publishedAt" TIMESTAMP(3),
    "publishedById" TEXT,
    "versionNumber" INTEGER NOT NULL DEFAULT 1,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Roster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RosterVersion" (
    "id" TEXT NOT NULL,
    "rosterId" TEXT NOT NULL,
    "versionNumber" INTEGER NOT NULL,
    "snapshot" TEXT NOT NULL,
    "changedById" TEXT,
    "changeReason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RosterVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShiftSwap" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "requesterStaffId" TEXT NOT NULL,
    "targetStaffId" TEXT,
    "requesterShiftId" TEXT NOT NULL,
    "targetShiftId" TEXT,
    "reason" TEXT,
    "status" TEXT NOT NULL DEFAULT 'requested',
    "requesterApprovedAt" TIMESTAMP(3),
    "targetAcceptedAt" TIMESTAMP(3),
    "supervisorApprovedAt" TIMESTAMP(3),
    "supervisorApprovedById" TEXT,
    "rejectionReason" TEXT,
    "conflictWarnings" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ShiftSwap_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CoverageRequest" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "shiftId" TEXT,
    "originalStaffId" TEXT NOT NULL,
    "replacementStaffId" TEXT,
    "reason" TEXT,
    "requiredProfession" TEXT,
    "requiredSpecialty" TEXT,
    "shiftDate" TIMESTAMP(3) NOT NULL,
    "startTime" TIMESTAMP(3) NOT NULL,
    "endTime" TIMESTAMP(3),
    "priority" TEXT NOT NULL DEFAULT 'normal',
    "status" TEXT NOT NULL DEFAULT 'open',
    "assignedAt" TIMESTAMP(3),
    "assignedById" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CoverageRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffAvailability" (
    "id" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "facilityId" TEXT,
    "date" DATE NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'available',
    "reason" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StaffAvailability_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffPreference" (
    "id" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "preferredShiftTypes" TEXT,
    "preferredDays" TEXT,
    "unavailableDates" TEXT,
    "maxConsecutiveDays" INTEGER,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StaffPreference_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OnCallSchedule" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "staffId" TEXT NOT NULL,
    "specialty" TEXT,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3),
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "isBackup" BOOLEAN NOT NULL DEFAULT false,
    "contactMethod" TEXT,
    "contactValue" TEXT,
    "escalationOrder" INTEGER NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL DEFAULT 'scheduled',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OnCallSchedule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeaveType" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "category" TEXT NOT NULL DEFAULT 'paid',
    "colorHex" TEXT,
    "defaultDays" DOUBLE PRECISION,
    "accrualRatePerMonth" DOUBLE PRECISION,
    "carryForwardLimit" DOUBLE PRECISION,
    "carryForwardExpiryMonths" INTEGER,
    "minDurationDays" DOUBLE PRECISION NOT NULL DEFAULT 1,
    "maxDurationDays" DOUBLE PRECISION,
    "noticePeriodDays" INTEGER,
    "requiresDocumentation" BOOLEAN NOT NULL DEFAULT false,
    "requiresApprovalHierarchy" BOOLEAN NOT NULL DEFAULT true,
    "isSensitive" BOOLEAN NOT NULL DEFAULT false,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LeaveType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeavePolicy" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "leaveTypeId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "eligibilityRules" TEXT,
    "approvalHierarchy" TEXT,
    "accrualFrequency" TEXT,
    "accrualAmount" DOUBLE PRECISION,
    "carryForwardEnabled" BOOLEAN NOT NULL DEFAULT false,
    "carryForwardLimit" DOUBLE PRECISION,
    "carryForwardExpiryMonths" INTEGER,
    "negativeBalanceAllowed" BOOLEAN NOT NULL DEFAULT false,
    "negativeBalanceLimit" DOUBLE PRECISION,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "effectiveFrom" TIMESTAMP(3),
    "effectiveTo" TIMESTAMP(3),
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LeavePolicy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeaveBalance" (
    "id" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "leaveTypeId" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "leaveYear" TEXT NOT NULL,
    "yearStart" TIMESTAMP(3) NOT NULL,
    "yearEnd" TIMESTAMP(3) NOT NULL,
    "entitlement" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "accrued" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "used" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "pending" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "carriedForward" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "carriedForwardExpiry" TIMESTAMP(3),
    "adjustments" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "remaining" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LeaveBalance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeaveBalanceAdjustment" (
    "id" TEXT NOT NULL,
    "leaveBalanceId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "adjustmentType" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "reason" TEXT NOT NULL,
    "authorizedById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LeaveBalanceAdjustment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Holiday" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "name" TEXT NOT NULL,
    "date" DATE NOT NULL,
    "type" TEXT NOT NULL DEFAULT 'public',
    "description" TEXT,
    "isRecurring" BOOLEAN NOT NULL DEFAULT false,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Holiday_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffingRequirement" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "wardId" TEXT,
    "shiftType" TEXT,
    "dayType" TEXT NOT NULL DEFAULT 'weekday',
    "profession" TEXT,
    "specialty" TEXT,
    "seniority" TEXT,
    "minCount" INTEGER NOT NULL DEFAULT 1,
    "idealCount" INTEGER,
    "notes" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StaffingRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShiftChangeRequest" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "originalShiftId" TEXT,
    "requestedShiftDate" TIMESTAMP(3),
    "requestedShiftType" TEXT,
    "requestedStartTime" TIMESTAMP(3),
    "requestedEndTime" TIMESTAMP(3),
    "reasonCode" TEXT,
    "reason" TEXT,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "reviewedById" TEXT,
    "reviewComment" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ShiftChangeRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShiftBreak" (
    "id" TEXT NOT NULL,
    "shiftId" TEXT NOT NULL,
    "breakStart" TIMESTAMP(3) NOT NULL,
    "breakEnd" TIMESTAMP(3),
    "durationMinutes" INTEGER,
    "paid" BOOLEAN NOT NULL DEFAULT true,
    "breakType" TEXT NOT NULL DEFAULT 'meal',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ShiftBreak_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Document" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "patientId" TEXT,
    "encounterId" TEXT,
    "facilityId" TEXT,
    "documentType" TEXT,
    "fileName" TEXT NOT NULL,
    "fileUrl" TEXT NOT NULL,
    "mimeType" TEXT,
    "fileSize" INTEGER,
    "uploadedById" TEXT,
    "uploadedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "visibility" TEXT NOT NULL DEFAULT 'facility',
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Document_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Consent" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT,
    "consentType" TEXT,
    "status" TEXT NOT NULL DEFAULT 'given',
    "description" TEXT,
    "givenAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "withdrawnAt" TIMESTAMP(3),
    "recordedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Consent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Task" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "patientId" TEXT,
    "encounterId" TEXT,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "assignedToId" TEXT,
    "createdById" TEXT,
    "dueAt" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'pending',
    "completedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notification" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "facilityId" TEXT,
    "type" TEXT,
    "title" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "referenceType" TEXT,
    "referenceId" TEXT,
    "readAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT,
    "facilityId" TEXT,
    "userId" TEXT,
    "action" TEXT NOT NULL,
    "resourceType" TEXT,
    "resourceId" TEXT,
    "oldValues" TEXT,
    "newValues" TEXT,
    "ipAddress" TEXT,
    "userAgent" TEXT,
    "reason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PatientAccessLog" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "facilityId" TEXT,
    "accessType" TEXT NOT NULL,
    "resourceType" TEXT,
    "resourceId" TEXT,
    "reason" TEXT,
    "accessedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PatientAccessLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BreakGlassEvent" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "facilityId" TEXT,
    "reason" TEXT NOT NULL,
    "accessScope" TEXT,
    "startedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BreakGlassEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SystemSetting" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT,
    "facilityId" TEXT,
    "settingKey" TEXT NOT NULL,
    "settingValue" TEXT,
    "settingType" TEXT,
    "updatedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SystemSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PatientMergeEvent" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "sourcePatientId" TEXT NOT NULL,
    "targetPatientId" TEXT NOT NULL,
    "reason" TEXT,
    "metadata" TEXT,
    "mergedById" TEXT,
    "approvedById" TEXT,
    "mergedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PatientMergeEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffAttendance" (
    "id" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "date" DATE NOT NULL,
    "shiftId" TEXT,
    "checkInAt" TIMESTAMP(3),
    "checkOutAt" TIMESTAMP(3),
    "rawCheckInAt" TIMESTAMP(3),
    "rawCheckOutAt" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'present',
    "source" TEXT NOT NULL DEFAULT 'manual',
    "deviceId" TEXT,
    "deviceInfo" TEXT,
    "lateMinutes" INTEGER NOT NULL DEFAULT 0,
    "earlyDepartureMinutes" INTEGER NOT NULL DEFAULT 0,
    "workedMinutes" INTEGER NOT NULL DEFAULT 0,
    "grossMinutes" INTEGER NOT NULL DEFAULT 0,
    "breakMinutes" INTEGER NOT NULL DEFAULT 0,
    "overtimeMinutes" INTEGER NOT NULL DEFAULT 0,
    "expectedStart" TIMESTAMP(3),
    "expectedEnd" TIMESTAMP(3),
    "isOvernight" BOOLEAN NOT NULL DEFAULT false,
    "is24Hour" BOOLEAN NOT NULL DEFAULT false,
    "isUnscheduled" BOOLEAN NOT NULL DEFAULT false,
    "isEmergencyDuty" BOOLEAN NOT NULL DEFAULT false,
    "isOnCallWorked" BOOLEAN NOT NULL DEFAULT false,
    "isManualEntry" BOOLEAN NOT NULL DEFAULT false,
    "manualEntryReason" TEXT,
    "manualEntryById" TEXT,
    "periodId" TEXT,
    "isLocked" BOOLEAN NOT NULL DEFAULT false,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StaffAttendance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AttendanceEvent" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "attendanceId" TEXT,
    "timestamp" TIMESTAMP(3) NOT NULL,
    "eventType" TEXT NOT NULL,
    "source" TEXT NOT NULL,
    "deviceId" TEXT,
    "deviceInfo" TEXT,
    "location" TEXT,
    "processingStatus" TEXT NOT NULL DEFAULT 'pending',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AttendanceEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AttendanceCorrection" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "attendanceId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "originalCheckInAt" TIMESTAMP(3),
    "originalCheckOutAt" TIMESTAMP(3),
    "originalStatus" TEXT,
    "requestedCheckInAt" TIMESTAMP(3),
    "requestedCheckOutAt" TIMESTAMP(3),
    "requestedStatus" TEXT,
    "reason" TEXT NOT NULL,
    "supportingDocUrl" TEXT,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "reviewedById" TEXT,
    "reviewComment" TEXT,
    "reviewedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AttendanceCorrection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AttendanceException" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "attendanceId" TEXT,
    "staffId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "date" DATE NOT NULL,
    "exceptionType" TEXT NOT NULL,
    "severity" TEXT NOT NULL DEFAULT 'warning',
    "description" TEXT NOT NULL,
    "metadata" TEXT,
    "status" TEXT NOT NULL DEFAULT 'open',
    "resolvedById" TEXT,
    "resolutionNote" TEXT,
    "resolvedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AttendanceException_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AttendancePolicy" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "name" TEXT NOT NULL,
    "gracePeriodMinutes" INTEGER NOT NULL DEFAULT 10,
    "lateThresholdMinutes" INTEGER NOT NULL DEFAULT 0,
    "earlyDepartureThresholdMinutes" INTEGER NOT NULL DEFAULT 15,
    "maxDailyHours" DOUBLE PRECISION NOT NULL DEFAULT 13,
    "overtimeThresholdMinutes" INTEGER NOT NULL DEFAULT 480,
    "minRestHours" DOUBLE PRECISION NOT NULL DEFAULT 11,
    "breakDurationMinutes" INTEGER NOT NULL DEFAULT 30,
    "paidBreaks" BOOLEAN NOT NULL DEFAULT true,
    "roundingMinutes" INTEGER NOT NULL DEFAULT 0,
    "roundingMode" TEXT NOT NULL DEFAULT 'nearest',
    "missingCheckoutAction" TEXT NOT NULL DEFAULT 'flag',
    "autoCheckoutTime" TEXT,
    "absenceProcessingEnabled" BOOLEAN NOT NULL DEFAULT true,
    "absenceProcessingDelayMinutes" INTEGER NOT NULL DEFAULT 120,
    "nightStartHour" INTEGER NOT NULL DEFAULT 19,
    "nightEndHour" INTEGER NOT NULL DEFAULT 7,
    "weekendStartDay" INTEGER NOT NULL DEFAULT 6,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "effectiveFrom" TIMESTAMP(3),
    "effectiveTo" TIMESTAMP(3),
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AttendancePolicy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AttendancePeriod" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "name" TEXT NOT NULL,
    "startDate" DATE NOT NULL,
    "endDate" DATE NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'open',
    "lockedAt" TIMESTAMP(3),
    "lockedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "approvedById" TEXT,
    "totalRecords" INTEGER NOT NULL DEFAULT 0,
    "totalExceptions" INTEGER NOT NULL DEFAULT 0,
    "totalCorrections" INTEGER NOT NULL DEFAULT 0,
    "totalOvertimeMinutes" INTEGER NOT NULL DEFAULT 0,
    "totalWorkedMinutes" INTEGER NOT NULL DEFAULT 0,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AttendancePeriod_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OvertimeRecord" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "attendanceId" TEXT,
    "date" DATE NOT NULL,
    "overtimeMinutes" INTEGER NOT NULL,
    "category" TEXT NOT NULL DEFAULT 'regular',
    "reason" TEXT,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "rejectionReason" TEXT,
    "payrollConsumedAt" TIMESTAMP(3),
    "payrollPeriodId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OvertimeRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingRecord" (
    "id" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "trainingName" TEXT NOT NULL,
    "provider" TEXT,
    "trainingDate" TIMESTAMP(3) NOT NULL,
    "durationHours" DOUBLE PRECISION,
    "certificateIssued" BOOLEAN NOT NULL DEFAULT false,
    "certificateNumber" TEXT,
    "expiryDate" TIMESTAMP(3),
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Certification" (
    "id" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "certificationName" TEXT NOT NULL,
    "certificationTypeId" TEXT,
    "credentialType" TEXT NOT NULL DEFAULT 'certification',
    "category" TEXT,
    "issuingBody" TEXT,
    "issuerId" TEXT,
    "issuingCountry" TEXT,
    "certificateNumber" TEXT,
    "licenseNumber" TEXT,
    "registrationNumber" TEXT,
    "issueDate" TIMESTAMP(3) NOT NULL,
    "effectiveDate" TIMESTAMP(3),
    "expiryDate" TIMESTAMP(3),
    "renewalDate" TIMESTAMP(3),
    "gracePeriodDays" INTEGER,
    "status" TEXT NOT NULL DEFAULT 'active',
    "isMandatory" BOOLEAN NOT NULL DEFAULT false,
    "verificationStatus" TEXT NOT NULL DEFAULT 'pending',
    "verifiedById" TEXT,
    "verifiedAt" TIMESTAMP(3),
    "verificationMethod" TEXT,
    "verificationReference" TEXT,
    "verificationUrl" TEXT,
    "verificationNotes" TEXT,
    "renewalStatus" TEXT,
    "renewedFromId" TEXT,
    "documentUrl" TEXT,
    "notes" TEXT,
    "createdById" TEXT,
    "updatedById" TEXT,
    "suspendedAt" TIMESTAMP(3),
    "suspendedReason" TEXT,
    "suspendedById" TEXT,
    "revokedAt" TIMESTAMP(3),
    "revokedReason" TEXT,
    "revokedById" TEXT,
    "reactivatedAt" TIMESTAMP(3),
    "reactivatedReason" TEXT,
    "reactivatedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Certification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CertificationType" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "category" TEXT,
    "credentialType" TEXT NOT NULL DEFAULT 'certification',
    "description" TEXT,
    "isMandatory" BOOLEAN NOT NULL DEFAULT false,
    "defaultValidityMonths" INTEGER,
    "requiresVerification" BOOLEAN NOT NULL DEFAULT true,
    "requiresApproval" BOOLEAN NOT NULL DEFAULT true,
    "allowsExpiry" BOOLEAN NOT NULL DEFAULT true,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CertificationType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CertificationIssuer" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT,
    "country" TEXT,
    "contactPerson" TEXT,
    "email" TEXT,
    "phone" TEXT,
    "website" TEXT,
    "address" TEXT,
    "accreditation" TEXT,
    "verificationUrl" TEXT,
    "notes" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CertificationIssuer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CertificationRequirement" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "certificationTypeId" TEXT,
    "certificationName" TEXT NOT NULL,
    "profession" TEXT,
    "specialty" TEXT,
    "jobRole" TEXT,
    "employmentType" TEXT,
    "staffCategory" TEXT,
    "isMandatory" BOOLEAN NOT NULL DEFAULT true,
    "validityMonths" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CertificationRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CertificationVerification" (
    "id" TEXT NOT NULL,
    "certificationId" TEXT NOT NULL,
    "verifiedById" TEXT,
    "verificationStatus" TEXT NOT NULL,
    "verificationMethod" TEXT,
    "verificationReference" TEXT,
    "verificationUrl" TEXT,
    "verificationNotes" TEXT,
    "verifiedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CertificationVerification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CertificationRenewal" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "certificationId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "renewalDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "newIssueDate" TIMESTAMP(3) NOT NULL,
    "newExpiryDate" TIMESTAMP(3),
    "newCertificateNumber" TEXT,
    "documentUrl" TEXT,
    "status" TEXT NOT NULL DEFAULT 'submitted',
    "verifiedById" TEXT,
    "approvedById" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CertificationRenewal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CertificationStatusHistory" (
    "id" TEXT NOT NULL,
    "certificationId" TEXT NOT NULL,
    "previousStatus" TEXT,
    "newStatus" TEXT NOT NULL,
    "changedById" TEXT,
    "reason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CertificationStatusHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PayrollPeriod" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "name" TEXT NOT NULL,
    "periodType" TEXT NOT NULL DEFAULT 'monthly',
    "startDate" DATE NOT NULL,
    "endDate" DATE NOT NULL,
    "paymentDate" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'draft',
    "totalEmployees" INTEGER NOT NULL DEFAULT 0,
    "grossPayroll" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "totalDeductions" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "employerContributions" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "netPayroll" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "createdById" TEXT,
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "lockedAt" TIMESTAMP(3),
    "lockedById" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PayrollPeriod_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PayrollRun" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "payrollPeriodId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "basicSalary" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "totalAllowances" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "totalOvertime" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "totalBonus" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "grossPay" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "totalDeductions" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "employerContributions" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "netPay" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "paymentStatus" TEXT NOT NULL DEFAULT 'unpaid',
    "paymentMethod" TEXT,
    "paymentReference" TEXT,
    "paymentDate" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'draft',
    "exceptions" TEXT,
    "snapshot" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PayrollRun_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PayrollItem" (
    "id" TEXT NOT NULL,
    "payrollRunId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "itemType" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "amount" DECIMAL(14,2) NOT NULL,
    "rate" DOUBLE PRECISION,
    "hours" DOUBLE PRECISION,
    "isRecurring" BOOLEAN NOT NULL DEFAULT false,
    "isStatutory" BOOLEAN NOT NULL DEFAULT false,
    "referenceType" TEXT,
    "referenceId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PayrollItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SalaryStructure" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "basicSalary" DECIMAL(14,2) NOT NULL,
    "currency" TEXT NOT NULL DEFAULT 'GHS',
    "effectiveFrom" TIMESTAMP(3) NOT NULL,
    "effectiveTo" TIMESTAMP(3),
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SalaryStructure_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompensationComponent" (
    "id" TEXT NOT NULL,
    "salaryStructureId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "componentType" TEXT NOT NULL,
    "calculationType" TEXT NOT NULL DEFAULT 'fixed',
    "amount" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "percentage" DOUBLE PRECISION,
    "isTaxable" BOOLEAN NOT NULL DEFAULT false,
    "isStatutory" BOOLEAN NOT NULL DEFAULT false,
    "isRecurring" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CompensationComponent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffPayrollProfile" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "salaryStructureId" TEXT,
    "basicSalary" DECIMAL(14,2) NOT NULL,
    "payFrequency" TEXT NOT NULL DEFAULT 'monthly',
    "currency" TEXT NOT NULL DEFAULT 'GHS',
    "bankName" TEXT,
    "bankAccountNumber" TEXT,
    "bankAccountName" TEXT,
    "paymentMethod" TEXT NOT NULL DEFAULT 'bank_transfer',
    "taxIdNumber" TEXT,
    "taxExempt" BOOLEAN NOT NULL DEFAULT false,
    "payrollStatus" TEXT NOT NULL DEFAULT 'active',
    "effectiveDate" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StaffPayrollProfile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Allowance" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "allowanceType" TEXT NOT NULL DEFAULT 'fixed',
    "amount" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "percentage" DOUBLE PRECISION,
    "isTaxable" BOOLEAN NOT NULL DEFAULT true,
    "isRecurring" BOOLEAN NOT NULL DEFAULT true,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "profession" TEXT,
    "effectiveFrom" TIMESTAMP(3),
    "effectiveTo" TIMESTAMP(3),
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Allowance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Deduction" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "deductionType" TEXT NOT NULL DEFAULT 'fixed',
    "amount" DECIMAL(14,2) NOT NULL DEFAULT 0,
    "percentage" DOUBLE PRECISION,
    "isStatutory" BOOLEAN NOT NULL DEFAULT false,
    "isRecurring" BOOLEAN NOT NULL DEFAULT true,
    "priority" INTEGER NOT NULL DEFAULT 100,
    "requiresApproval" BOOLEAN NOT NULL DEFAULT false,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "effectiveFrom" TIMESTAMP(3),
    "effectiveTo" TIMESTAMP(3),
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Deduction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffLoan" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "loanAmount" DECIMAL(14,2) NOT NULL,
    "interestRate" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "principal" DECIMAL(14,2) NOT NULL,
    "balance" DECIMAL(14,2) NOT NULL,
    "installment" DECIMAL(14,2) NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3),
    "term" INTEGER NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StaffLoan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SalaryAdvance" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "amount" DECIMAL(14,2) NOT NULL,
    "balance" DECIMAL(14,2) NOT NULL,
    "installment" DECIMAL(14,2) NOT NULL,
    "requestDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "repaymentStartDate" TIMESTAMP(3),
    "repaymentMonths" INTEGER NOT NULL DEFAULT 1,
    "reason" TEXT,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SalaryAdvance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PayrollAdjustment" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "payrollRunId" TEXT,
    "staffId" TEXT NOT NULL,
    "adjustmentType" TEXT NOT NULL,
    "amount" DECIMAL(14,2) NOT NULL,
    "reason" TEXT NOT NULL,
    "period" TEXT,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PayrollAdjustment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StatutoryRule" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "ruleType" TEXT NOT NULL,
    "calculationType" TEXT NOT NULL DEFAULT 'percentage',
    "rate" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "fixedAmount" DECIMAL(14,2),
    "brackets" TEXT,
    "threshold" DECIMAL(14,2),
    "cap" DECIMAL(14,2),
    "borneBy" TEXT NOT NULL DEFAULT 'employee',
    "employerRate" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "effectiveFrom" TIMESTAMP(3) NOT NULL,
    "effectiveTo" TIMESTAMP(3),
    "facilityId" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StatutoryRule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CostCenter" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CostCenter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingProgram" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "title" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "category" TEXT,
    "subcategory" TEXT,
    "trainingType" TEXT NOT NULL DEFAULT 'internal',
    "deliveryMethod" TEXT NOT NULL DEFAULT 'in_person',
    "targetStaff" TEXT,
    "isMandatory" BOOLEAN NOT NULL DEFAULT false,
    "durationHours" DOUBLE PRECISION,
    "cpdPoints" DOUBLE PRECISION,
    "validityMonths" INTEGER,
    "renewalMonths" INTEGER,
    "assessmentRequired" BOOLEAN NOT NULL DEFAULT false,
    "passingScore" DOUBLE PRECISION,
    "certificateRequired" BOOLEAN NOT NULL DEFAULT true,
    "cost" DOUBLE PRECISION DEFAULT 0,
    "providerId" TEXT,
    "trainerId" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingProgram_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingProvider" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "providerType" TEXT,
    "contactPerson" TEXT,
    "email" TEXT,
    "phone" TEXT,
    "address" TEXT,
    "website" TEXT,
    "accreditation" TEXT,
    "notes" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingProvider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Trainer" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "staffId" TEXT,
    "name" TEXT NOT NULL,
    "isInternal" BOOLEAN NOT NULL DEFAULT true,
    "profession" TEXT,
    "qualification" TEXT,
    "specialty" TEXT,
    "contact" TEXT,
    "email" TEXT,
    "phone" TEXT,
    "organization2" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Trainer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingSession" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "programId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "sessionDate" TIMESTAMP(3) NOT NULL,
    "startTime" TIMESTAMP(3) NOT NULL,
    "endTime" TIMESTAMP(3),
    "venue" TEXT,
    "building" TEXT,
    "room" TEXT,
    "onlineLink" TEXT,
    "trainerId" TEXT,
    "deliveryMethod" TEXT,
    "maxCapacity" INTEGER,
    "minCapacity" INTEGER,
    "waitlistCapacity" INTEGER,
    "status" TEXT NOT NULL DEFAULT 'scheduled',
    "cancellationReason" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingEnrollment" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "programId" TEXT,
    "sessionId" TEXT,
    "enrollmentDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "enrollmentSource" TEXT NOT NULL DEFAULT 'hr',
    "status" TEXT NOT NULL DEFAULT 'pending',
    "priority" TEXT NOT NULL DEFAULT 'normal',
    "nominatedById" TEXT,
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingEnrollment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingAttendance" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "enrollmentId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "sessionId" TEXT,
    "checkInAt" TIMESTAMP(3),
    "checkOutAt" TIMESTAMP(3),
    "attendedMinutes" INTEGER,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "attendancePercentage" DOUBLE PRECISION,
    "recordedById" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingAttendance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingAssessment" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "programId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "assessmentType" TEXT NOT NULL DEFAULT 'post',
    "maxScore" DOUBLE PRECISION NOT NULL DEFAULT 100,
    "passingScore" DOUBLE PRECISION,
    "maxAttempts" INTEGER NOT NULL DEFAULT 1,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingAssessment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingAssessmentResult" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "assessmentId" TEXT NOT NULL,
    "enrollmentId" TEXT,
    "staffId" TEXT NOT NULL,
    "attemptNumber" INTEGER NOT NULL DEFAULT 1,
    "score" DOUBLE PRECISION NOT NULL,
    "maxScore" DOUBLE PRECISION NOT NULL DEFAULT 100,
    "percentage" DOUBLE PRECISION NOT NULL,
    "passed" BOOLEAN NOT NULL,
    "assessorId" TEXT,
    "assessmentDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "comments" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingAssessmentResult_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingCertificate" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "certificateNumber" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "programId" TEXT,
    "enrollmentId" TEXT,
    "title" TEXT NOT NULL,
    "issueDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiryDate" TIMESTAMP(3),
    "issuingOrganization" TEXT,
    "verificationCode" TEXT,
    "documentUrl" TEXT,
    "status" TEXT NOT NULL DEFAULT 'valid',
    "revokedAt" TIMESTAMP(3),
    "revokedReason" TEXT,
    "revokedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingCertificate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingRequirement" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "programId" TEXT,
    "profession" TEXT,
    "specialty" TEXT,
    "jobRole" TEXT,
    "employmentType" TEXT,
    "isMandatory" BOOLEAN NOT NULL DEFAULT true,
    "frequencyMonths" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingRequest" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "programId" TEXT,
    "requestedTraining" TEXT NOT NULL,
    "reason" TEXT,
    "numberOfStaff" INTEGER NOT NULL DEFAULT 1,
    "priority" TEXT NOT NULL DEFAULT 'normal',
    "requestedById" TEXT,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "reviewComment" TEXT,
    "reviewedById" TEXT,
    "reviewedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingPlan" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "departmentId" TEXT,
    "name" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "quarter" INTEGER,
    "programId" TEXT,
    "targetStaffCount" INTEGER,
    "budget" DOUBLE PRECISION,
    "actualCost" DOUBLE PRECISION,
    "responsibleOfficer" TEXT,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingPlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingEvaluation" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "programId" TEXT,
    "sessionId" TEXT,
    "staffId" TEXT NOT NULL,
    "contentRating" INTEGER,
    "trainerRating" INTEGER,
    "relevanceRating" INTEGER,
    "venueRating" INTEGER,
    "materialsRating" INTEGER,
    "overallRating" INTEGER,
    "comments" TEXT,
    "isAnonymous" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingEvaluation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrainingCompetency" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "category" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrainingCompetency_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffCompetency" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "competencyId" TEXT NOT NULL,
    "level" TEXT NOT NULL DEFAULT 'pending',
    "score" DOUBLE PRECISION,
    "assessorId" TEXT,
    "assessmentDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "nextAssessmentDate" TIMESTAMP(3),
    "comments" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StaffCompetency_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CPDRecord" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "activityName" TEXT NOT NULL,
    "activityType" TEXT,
    "cpdPoints" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "cpdHours" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "professionalBody" TEXT,
    "reportingPeriod" TEXT,
    "activityDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "certificateUrl" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CPDRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExternalTrainingRecord" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "courseName" TEXT NOT NULL,
    "providerId" TEXT,
    "providerName" TEXT,
    "trainingDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3),
    "location" TEXT,
    "cost" DOUBLE PRECISION,
    "certificateNumber" TEXT,
    "certificateUrl" TEXT,
    "cpdPoints" DOUBLE PRECISION,
    "approvalStatus" TEXT NOT NULL DEFAULT 'pending',
    "approvedById" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ExternalTrainingRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IncidentReport" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "incidentType" TEXT NOT NULL,
    "severity" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "location" TEXT,
    "peopleInvolved" TEXT,
    "immediateAction" TEXT,
    "status" TEXT NOT NULL DEFAULT 'reported',
    "resolvedAt" TIMESTAMP(3),
    "resolution" TEXT,
    "reportedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "IncidentReport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShiftHandover" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "departmentId" TEXT,
    "shiftType" TEXT NOT NULL,
    "handoverDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "outgoingStaffId" TEXT,
    "incomingStaffId" TEXT,
    "patientsToFlag" TEXT,
    "notes" TEXT NOT NULL,
    "pendingTasks" TEXT,
    "status" TEXT NOT NULL DEFAULT 'completed',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ShiftHandover_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WardRound" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "wardId" TEXT,
    "consultantId" TEXT,
    "roundDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "patientsSeen" TEXT,
    "notes" TEXT,
    "planChanges" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "roundType" TEXT NOT NULL DEFAULT 'daily',
    "status" TEXT NOT NULL DEFAULT 'scheduled',
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "leadClinicianId" TEXT,
    "startTime" TIMESTAMP(3),
    "endTime" TIMESTAMP(3),
    "expectedEndTime" TIMESTAMP(3),
    "completedAt" TIMESTAMP(3),
    "completedById" TEXT,
    "cancelledAt" TIMESTAMP(3),
    "cancelledById" TEXT,
    "cancellationReason" TEXT,
    "summary" TEXT,
    "participantsSummary" TEXT,

    CONSTRAINT "WardRound_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WardRoundPatient" (
    "id" TEXT NOT NULL,
    "wardRoundId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "admissionId" TEXT,
    "encounterId" TEXT,
    "facilityId" TEXT NOT NULL,
    "wardId" TEXT,
    "bedId" TEXT,
    "reviewStatus" TEXT NOT NULL DEFAULT 'pending',
    "reviewPriority" TEXT NOT NULL DEFAULT 'routine',
    "notReviewedReason" TEXT,
    "primaryDiagnosis" TEXT,
    "allergies" TEXT,
    "latestVitals" TEXT,
    "currentMedications" TEXT,
    "pendingLabs" TEXT,
    "pendingImaging" TEXT,
    "pendingProcedures" TEXT,
    "dischargeStatus" TEXT,
    "clinicalAlerts" TEXT,
    "progressStatus" TEXT,
    "overnightEvents" TEXT,
    "reviewedAt" TIMESTAMP(3),
    "reviewedById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WardRoundPatient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WardRoundNote" (
    "id" TEXT NOT NULL,
    "wardRoundId" TEXT NOT NULL,
    "wardRoundPatientId" TEXT,
    "patientId" TEXT NOT NULL,
    "admissionId" TEXT,
    "encounterId" TEXT,
    "facilityId" TEXT NOT NULL,
    "subjective" TEXT,
    "objective" TEXT,
    "assessment" TEXT,
    "plan" TEXT,
    "overnightEvents" TEXT,
    "examinationFindings" TEXT,
    "clinicalConcerns" TEXT,
    "responseToTreatment" TEXT,
    "content" TEXT,
    "progressStatus" TEXT,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "signedById" TEXT,
    "signedAt" TIMESTAMP(3),
    "amendedFromId" TEXT,
    "amendmentReason" TEXT,
    "authoredById" TEXT,
    "authoredAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "eventAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WardRoundNote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WardRoundAction" (
    "id" TEXT NOT NULL,
    "wardRoundId" TEXT NOT NULL,
    "wardRoundPatientId" TEXT,
    "patientId" TEXT,
    "facilityId" TEXT NOT NULL,
    "actionType" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "assignedToId" TEXT,
    "assignedToName" TEXT,
    "assignedToRole" TEXT,
    "dueDate" TIMESTAMP(3),
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "status" TEXT NOT NULL DEFAULT 'pending',
    "completedAt" TIMESTAMP(3),
    "completedById" TEXT,
    "completionNotes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WardRoundAction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WardRoundParticipant" (
    "id" TEXT NOT NULL,
    "wardRoundId" TEXT NOT NULL,
    "userId" TEXT,
    "staffName" TEXT,
    "role" TEXT NOT NULL DEFAULT 'doctor',
    "attendanceStatus" TEXT NOT NULL DEFAULT 'invited',
    "joinedAt" TIMESTAMP(3),
    "leftAt" TIMESTAMP(3),
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WardRoundParticipant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IntakeOutputEntry" (
    "id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "encounterId" TEXT,
    "admissionId" TEXT,
    "facilityId" TEXT NOT NULL,
    "entryType" TEXT NOT NULL,
    "fluidType" TEXT NOT NULL,
    "category" TEXT,
    "source" TEXT,
    "route" TEXT,
    "collectionMethod" TEXT,
    "drainLabel" TEXT,
    "catheterStatus" TEXT,
    "measurementType" TEXT,
    "unit" TEXT NOT NULL DEFAULT 'ml',
    "amount" DOUBLE PRECISION NOT NULL,
    "weightKg" DOUBLE PRECISION,
    "eventAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "recordedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "documentedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL DEFAULT 'recorded',
    "verifiedById" TEXT,
    "verifiedAt" TIMESTAMP(3),
    "amendedById" TEXT,
    "amendedAt" TIMESTAMP(3),
    "amendmentReason" TEXT,
    "originalAmount" DOUBLE PRECISION,
    "cancelledAt" TIMESTAMP(3),
    "cancelReason" TEXT,
    "recordedById" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "monitoringPeriodId" TEXT,

    CONSTRAINT "IntakeOutputEntry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IntakeOutputMonitoringPeriod" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "admissionId" TEXT,
    "encounterId" TEXT,
    "monitoringLevel" TEXT NOT NULL DEFAULT 'standard',
    "intervalMinutes" INTEGER NOT NULL DEFAULT 60,
    "shiftDefinition" TEXT,
    "dailyTargetMl" DOUBLE PRECISION,
    "dailyLimitMl" DOUBLE PRECISION,
    "targetSource" TEXT,
    "startedById" TEXT,
    "startedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endedById" TEXT,
    "endedAt" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'active',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "wardId" TEXT,

    CONSTRAINT "IntakeOutputMonitoringPeriod_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IntakeOutputAlertConfig" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "metric" TEXT NOT NULL,
    "operator" TEXT NOT NULL,
    "threshold" DOUBLE PRECISION NOT NULL,
    "windowMinutes" INTEGER NOT NULL DEFAULT 1440,
    "patientGroup" TEXT,
    "wardId" TEXT,
    "severity" TEXT NOT NULL DEFAULT 'warning',
    "recipients" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "IntakeOutputAlertConfig_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IntakeOutputAlert" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "admissionId" TEXT,
    "configId" TEXT,
    "code" TEXT NOT NULL,
    "severity" TEXT NOT NULL DEFAULT 'warning',
    "title" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "metric" TEXT,
    "thresholdValue" DOUBLE PRECISION,
    "actualValue" DOUBLE PRECISION,
    "raisedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "acknowledgedById" TEXT,
    "acknowledgedAt" TIMESTAMP(3),
    "actionTaken" TEXT,
    "ackNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "IntakeOutputAlert_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Account" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "sessionToken" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VerificationToken" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "MortuaryAdmission" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "admissionNumber" TEXT NOT NULL,
    "patientId" TEXT,
    "deceasedName" TEXT NOT NULL,
    "deceasedAge" INTEGER,
    "deceasedSex" TEXT,
    "deceasedDob" TIMESTAMP(3),
    "nationalId" TEXT,
    "nextOfKinName" TEXT,
    "nextOfKinPhone" TEXT,
    "nextOfKinRelation" TEXT,
    "dateOfDeath" TIMESTAMP(3) NOT NULL,
    "placeOfDeath" TEXT,
    "causeOfDeath" TEXT,
    "deathCertificateNo" TEXT,
    "broughtBy" TEXT,
    "broughtByPhone" TEXT,
    "sourceFacility" TEXT,
    "sourceNotes" TEXT,
    "storageUnitId" TEXT,
    "storageLocation" TEXT,
    "bodyTag" TEXT,
    "admissionStatus" TEXT NOT NULL DEFAULT 'admitted',
    "admittedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "releasedAt" TIMESTAMP(3),
    "releasedTo" TEXT,
    "releasedToPhone" TEXT,
    "releasedToIdType" TEXT,
    "releasedToIdNo" TEXT,
    "releaseNotes" TEXT,
    "undertakingCompany" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MortuaryAdmission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BloodDonor" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "donorNumber" TEXT NOT NULL,
    "donorType" TEXT NOT NULL DEFAULT 'voluntary',
    "fullName" TEXT NOT NULL,
    "age" INTEGER,
    "sex" TEXT,
    "bloodGroup" TEXT,
    "rhFactor" TEXT,
    "phone" TEXT,
    "email" TEXT,
    "address" TEXT,
    "occupation" TEXT,
    "lastDonationAt" TIMESTAMP(3),
    "donationCount" INTEGER NOT NULL DEFAULT 0,
    "eligibilityStatus" TEXT NOT NULL DEFAULT 'eligible',
    "deferralReason" TEXT,
    "deferralUntil" TIMESTAMP(3),
    "notes" TEXT,
    "hbsAg" TEXT,
    "hcvAb" TEXT,
    "hivAb" TEXT,
    "syphilis" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BloodDonor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BloodUnit" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "unitNumber" TEXT NOT NULL,
    "donorId" TEXT NOT NULL,
    "bloodGroup" TEXT NOT NULL,
    "componentType" TEXT NOT NULL DEFAULT 'whole_blood',
    "volumeMl" INTEGER NOT NULL DEFAULT 450,
    "collectionDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiryDate" TIMESTAMP(3) NOT NULL,
    "storageTemp" TEXT,
    "status" TEXT NOT NULL DEFAULT 'available',
    "reservedForPatientId" TEXT,
    "reservedForPatientName" TEXT,
    "reservedUntil" TIMESTAMP(3),
    "issuedAt" TIMESTAMP(3),
    "issuedToPatientId" TEXT,
    "issuedToPatientName" TEXT,
    "issuedById" TEXT,
    "transfusedAt" TIMESTAMP(3),
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BloodUnit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BloodTransfusion" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "transfusionNumber" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "patientBloodGroup" TEXT,
    "unitId" TEXT NOT NULL,
    "unitNumber" TEXT NOT NULL,
    "bloodGroup" TEXT NOT NULL,
    "componentType" TEXT NOT NULL,
    "volumeMl" INTEGER NOT NULL,
    "preTransfusionVitals" TEXT,
    "postTransfusionVitals" TEXT,
    "reactionObserved" BOOLEAN NOT NULL DEFAULT false,
    "reactionDetails" TEXT,
    "startedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completedAt" TIMESTAMP(3),
    "administeredById" TEXT,
    "status" TEXT NOT NULL DEFAULT 'in_progress',
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BloodTransfusion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TheatreCase" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "caseNumber" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "patientAge" INTEGER,
    "patientSex" TEXT,
    "encounterId" TEXT,
    "admissionId" TEXT,
    "procedureType" TEXT NOT NULL,
    "procedureName" TEXT NOT NULL,
    "procedureCode" TEXT,
    "surgeonId" TEXT,
    "surgeonName" TEXT,
    "anesthetistId" TEXT,
    "anesthetistName" TEXT,
    "scrubNurseId" TEXT,
    "scrubNurseName" TEXT,
    "theatreRoom" TEXT,
    "scheduledStart" TIMESTAMP(3) NOT NULL,
    "scheduledEnd" TIMESTAMP(3),
    "actualStart" TIMESTAMP(3),
    "actualEnd" TIMESTAMP(3),
    "anesthesiaType" TEXT,
    "preOpDiagnosis" TEXT,
    "postOpDiagnosis" TEXT,
    "findings" TEXT,
    "procedureNotes" TEXT,
    "complications" TEXT,
    "bloodLossMl" INTEGER,
    "specimensSent" TEXT,
    "implantUsed" TEXT,
    "status" TEXT NOT NULL DEFAULT 'scheduled',
    "recoveryStatus" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TheatreCase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CriticalCareAdmission" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "admissionNumber" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "patientAge" INTEGER,
    "patientSex" TEXT,
    "encounterId" TEXT,
    "admissionId" TEXT,
    "unitType" TEXT NOT NULL,
    "bedNumber" TEXT,
    "admittingDiagnosis" TEXT NOT NULL,
    "admissionReason" TEXT NOT NULL,
    "severity" TEXT NOT NULL DEFAULT 'critical',
    "apacheScore" INTEGER,
    "admittedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dischargedAt" TIMESTAMP(3),
    "dischargeDestination" TEXT,
    "attendingPhysicianId" TEXT,
    "attendingPhysicianName" TEXT,
    "ventilator" BOOLEAN NOT NULL DEFAULT false,
    "ventilatorSettings" TEXT,
    "dialysis" BOOLEAN NOT NULL DEFAULT false,
    "inotropes" TEXT,
    "monitoringData" TEXT,
    "status" TEXT NOT NULL DEFAULT 'admitted',
    "outcomeNotes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CriticalCareAdmission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SpecialtyEncounter" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "encounterNumber" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "patientAge" INTEGER,
    "patientSex" TEXT,
    "encounterId" TEXT,
    "departmentCode" TEXT NOT NULL,
    "clinicType" TEXT NOT NULL,
    "chiefComplaint" TEXT NOT NULL,
    "history" TEXT,
    "examination" TEXT,
    "diagnosis" TEXT,
    "treatmentPlan" TEXT,
    "procedureDone" TEXT,
    "prescription" TEXT,
    "followUpDate" TIMESTAMP(3),
    "nextAppointment" TIMESTAMP(3),
    "clinicianId" TEXT,
    "clinicianName" TEXT,
    "status" TEXT NOT NULL DEFAULT 'in_progress',
    "startTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endTime" TIMESTAMP(3),
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SpecialtyEncounter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SpecialtyClin" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "leadClinicianId" TEXT,
    "leadClinicianName" TEXT,
    "location" TEXT,
    "clinicDays" TEXT,
    "startTime" TEXT,
    "endTime" TEXT,
    "slotDurationMin" INTEGER NOT NULL DEFAULT 30,
    "maxDailyBookings" INTEGER NOT NULL DEFAULT 20,
    "color" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SpecialtyClin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SpecialtyAppointment" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "appointmentNumber" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "patientAge" INTEGER,
    "patientSex" TEXT,
    "patientPhone" TEXT,
    "departmentCode" TEXT NOT NULL,
    "clinicId" TEXT,
    "clinicianId" TEXT,
    "clinicianName" TEXT,
    "appointmentDate" TIMESTAMP(3) NOT NULL,
    "startTime" TEXT,
    "endTime" TEXT,
    "type" TEXT NOT NULL DEFAULT 'new',
    "reason" TEXT,
    "status" TEXT NOT NULL DEFAULT 'scheduled',
    "source" TEXT NOT NULL DEFAULT 'walk_in',
    "referralFrom" TEXT,
    "notes" TEXT,
    "checkedInAt" TIMESTAMP(3),
    "completedAt" TIMESTAMP(3),
    "encounterId" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SpecialtyAppointment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SpecialtyProcedure" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "specialtyEncounterId" TEXT NOT NULL,
    "procedureName" TEXT NOT NULL,
    "procedureCode" TEXT,
    "bodySite" TEXT,
    "laterality" TEXT,
    "performedById" TEXT,
    "performedByName" TEXT,
    "assistedBy" TEXT,
    "startedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endedAt" TIMESTAMP(3),
    "durationMin" INTEGER,
    "findings" TEXT,
    "complications" TEXT,
    "anesthesiaType" TEXT,
    "specimenSent" BOOLEAN NOT NULL DEFAULT false,
    "specimenLabel" TEXT,
    "status" TEXT NOT NULL DEFAULT 'in_progress',
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SpecialtyProcedure_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SpecialtyClinicalNote" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "specialtyEncounterId" TEXT NOT NULL,
    "noteType" TEXT NOT NULL DEFAULT 'addendum',
    "content" TEXT NOT NULL,
    "authoredById" TEXT,
    "authoredByName" TEXT,
    "authoredAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SpecialtyClinicalNote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SpecialtyReferral" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "referralNumber" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "patientAge" INTEGER,
    "patientSex" TEXT,
    "patientPhone" TEXT,
    "fromDepartment" TEXT,
    "toDepartmentCode" TEXT NOT NULL,
    "fromClinicianId" TEXT,
    "fromClinicianName" TEXT,
    "toClinicianId" TEXT,
    "toClinicianName" TEXT,
    "reason" TEXT NOT NULL,
    "clinicalSummary" TEXT,
    "urgency" TEXT NOT NULL DEFAULT 'routine',
    "status" TEXT NOT NULL DEFAULT 'pending',
    "referralDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "responseDate" TIMESTAMP(3),
    "responseNotes" TEXT,
    "encounterId" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SpecialtyReferral_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServiceRequest" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "requestNumber" TEXT NOT NULL,
    "serviceType" TEXT NOT NULL,
    "category" TEXT,
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "status" TEXT NOT NULL DEFAULT 'requested',
    "title" TEXT NOT NULL,
    "description" TEXT,
    "requestedById" TEXT,
    "requestedByName" TEXT,
    "assignedToId" TEXT,
    "assignedToName" TEXT,
    "location" TEXT,
    "departmentCode" TEXT,
    "patientId" TEXT,
    "patientName" TEXT,
    "encounterId" TEXT,
    "admissionId" TEXT,
    "scheduledAt" TIMESTAMP(3),
    "startedAt" TIMESTAMP(3),
    "completedAt" TIMESTAMP(3),
    "quantity" INTEGER,
    "unit" TEXT,
    "itemsDetail" TEXT,
    "equipmentId" TEXT,
    "verifiedAt" TIMESTAMP(3),
    "verifiedByName" TEXT,
    "cost" DOUBLE PRECISION,
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ServiceRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PatientFeedback" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "feedbackNumber" TEXT NOT NULL,
    "feedbackType" TEXT NOT NULL,
    "category" TEXT,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "patientPhone" TEXT,
    "departmentCode" TEXT,
    "encounterId" TEXT,
    "subject" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "severity" TEXT NOT NULL DEFAULT 'medium',
    "status" TEXT NOT NULL DEFAULT 'open',
    "resolution" TEXT,
    "resolvedAt" TIMESTAMP(3),
    "resolvedById" TEXT,
    "resolvedByName" TEXT,
    "satisfactionScore" INTEGER,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PatientFeedback_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QualityIndicator" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "indicatorCode" TEXT NOT NULL,
    "indicatorName" TEXT NOT NULL,
    "category" TEXT,
    "unit" TEXT,
    "target" TEXT,
    "description" TEXT,
    "measurementFrequency" TEXT DEFAULT 'monthly',
    "departmentCode" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "QualityIndicator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QualityIndicatorValue" (
    "id" TEXT NOT NULL,
    "indicatorId" TEXT NOT NULL,
    "periodStart" TIMESTAMP(3) NOT NULL,
    "periodEnd" TIMESTAMP(3) NOT NULL,
    "measuredValue" DOUBLE PRECISION NOT NULL,
    "targetValue" DOUBLE PRECISION,
    "numerator" INTEGER,
    "denominator" INTEGER,
    "notes" TEXT,
    "measuredById" TEXT,
    "measuredByName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "QualityIndicatorValue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RiskRegister" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "riskNumber" TEXT NOT NULL,
    "riskTitle" TEXT NOT NULL,
    "riskCategory" TEXT,
    "description" TEXT NOT NULL,
    "likelihood" TEXT NOT NULL DEFAULT 'medium',
    "impact" TEXT NOT NULL DEFAULT 'medium',
    "riskScore" TEXT,
    "owner" TEXT,
    "ownerId" TEXT,
    "mitigationPlan" TEXT,
    "residualRisk" TEXT,
    "status" TEXT NOT NULL DEFAULT 'open',
    "reviewDate" TIMESTAMP(3),
    "departmentCode" TEXT,
    "relatedIncidentId" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RiskRegister_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LegalCase" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "caseNumber" TEXT NOT NULL,
    "caseType" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "status" TEXT NOT NULL DEFAULT 'open',
    "priority" TEXT NOT NULL DEFAULT 'medium',
    "filingDate" TIMESTAMP(3),
    "courtDate" TIMESTAMP(3),
    "opposingParty" TEXT,
    "plaintiffName" TEXT,
    "defendantName" TEXT,
    "patientId" TEXT,
    "patientName" TEXT,
    "encounterId" TEXT,
    "departmentCode" TEXT,
    "assignedAttorney" TEXT,
    "estimatedValue" DOUBLE PRECISION,
    "settlementAmount" DOUBLE PRECISION,
    "resolutionNotes" TEXT,
    "closedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LegalCase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ResearchStudy" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "studyNumber" TEXT NOT NULL,
    "studyTitle" TEXT NOT NULL,
    "studyType" TEXT,
    "principalInvestigator" TEXT,
    "principalInvestigatorId" TEXT,
    "status" TEXT NOT NULL DEFAULT 'planning',
    "ethicsApprovalNo" TEXT,
    "ethicsApprovalDate" TIMESTAMP(3),
    "startDate" TIMESTAMP(3),
    "endDate" TIMESTAMP(3),
    "targetEnrollment" INTEGER,
    "currentEnrollment" INTEGER NOT NULL DEFAULT 0,
    "fundingSource" TEXT,
    "budget" DOUBLE PRECISION,
    "description" TEXT,
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ResearchStudy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ResearchParticipant" (
    "id" TEXT NOT NULL,
    "studyId" TEXT NOT NULL,
    "participantCode" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT,
    "enrollmentDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL DEFAULT 'enrolled',
    "withdrawalDate" TIMESTAMP(3),
    "withdrawalReason" TEXT,
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ResearchParticipant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PRActivity" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "activityNumber" TEXT NOT NULL,
    "activityType" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "status" TEXT NOT NULL DEFAULT 'planned',
    "priority" TEXT NOT NULL DEFAULT 'medium',
    "startDate" TIMESTAMP(3),
    "endDate" TIMESTAMP(3),
    "targetAudience" TEXT,
    "budget" DOUBLE PRECISION,
    "spentAmount" DOUBLE PRECISION,
    "mediaOutlet" TEXT,
    "contactPerson" TEXT,
    "contactPhone" TEXT,
    "outcomes" TEXT,
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PRActivity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ITTicket" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "ticketNumber" TEXT NOT NULL,
    "ticketType" TEXT NOT NULL,
    "category" TEXT,
    "priority" TEXT NOT NULL DEFAULT 'medium',
    "status" TEXT NOT NULL DEFAULT 'open',
    "subject" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "affectedSystem" TEXT,
    "reportedById" TEXT,
    "reportedByName" TEXT,
    "reportedByPhone" TEXT,
    "assignedToId" TEXT,
    "assignedToName" TEXT,
    "resolution" TEXT,
    "resolvedAt" TIMESTAMP(3),
    "resolutionTimeMins" INTEGER,
    "satisfactionScore" INTEGER,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ITTicket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CodingRecord" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "encounterId" TEXT,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "codingType" TEXT NOT NULL,
    "primaryCode" TEXT NOT NULL,
    "primaryDescription" TEXT NOT NULL,
    "secondaryCodes" TEXT,
    "coderId" TEXT,
    "coderName" TEXT,
    "codingDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "claimId" TEXT,
    "claimStatus" TEXT,
    "claimAmount" DOUBLE PRECISION,
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CodingRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CommunityOutreach" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "eventNumber" TEXT NOT NULL,
    "eventType" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "location" TEXT NOT NULL,
    "region" TEXT,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'planned',
    "targetPopulation" INTEGER,
    "participantsReached" INTEGER NOT NULL DEFAULT 0,
    "servicesProvided" TEXT,
    "teamLeadId" TEXT,
    "teamLeadName" TEXT,
    "teamMembers" TEXT,
    "budget" DOUBLE PRECISION,
    "spentAmount" DOUBLE PRECISION,
    "outcomes" TEXT,
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CommunityOutreach_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HomeCareVisit" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "visitNumber" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "patientAge" INTEGER,
    "patientSex" TEXT,
    "patientAddress" TEXT NOT NULL,
    "patientPhone" TEXT,
    "visitType" TEXT NOT NULL,
    "scheduledAt" TIMESTAMP(3) NOT NULL,
    "arrivedAt" TIMESTAMP(3),
    "departedAt" TIMESTAMP(3),
    "durationMins" INTEGER,
    "caregiverId" TEXT,
    "caregiverName" TEXT,
    "careProvided" TEXT,
    "vitalsRecorded" TEXT,
    "medicationsGiven" TEXT,
    "instructions" TEXT,
    "nextVisitDate" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'scheduled',
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "HomeCareVisit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HistopathologySpecimen" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "specimenNumber" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "patientAge" INTEGER,
    "patientSex" TEXT,
    "encounterId" TEXT,
    "specimenType" TEXT NOT NULL,
    "specimenSite" TEXT NOT NULL,
    "collectionMethod" TEXT,
    "collectedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fixedIn" TEXT,
    "clinicalHistory" TEXT,
    "requestingPhysicianId" TEXT,
    "requestingPhysicianName" TEXT,
    "grossExamination" TEXT,
    "microscopyFindings" TEXT,
    "diagnosis" TEXT,
    "differentialDiagnosis" TEXT,
    "specialStains" TEXT,
    "tumorType" TEXT,
    "tumorGrade" TEXT,
    "tumorStage" TEXT,
    "marginsStatus" TEXT,
    "pathologistId" TEXT,
    "pathologistName" TEXT,
    "reportedAt" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'received',
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "HistopathologySpecimen_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecoveryRoomRecord" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "recordNumber" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "theatreCaseId" TEXT,
    "theatreCaseNumber" TEXT,
    "admissionId" TEXT,
    "admittedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dischargedAt" TIMESTAMP(3),
    "aldergroveScore" INTEGER NOT NULL DEFAULT 0,
    "painScore" INTEGER NOT NULL DEFAULT 0,
    "vitals" TEXT,
    "complications" TEXT,
    "treatmentGiven" TEXT,
    "destination" TEXT,
    "status" TEXT NOT NULL DEFAULT 'recovering',
    "nurseId" TEXT,
    "nurseName" TEXT,
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RecoveryRoomRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditFinding" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "findingNumber" TEXT NOT NULL,
    "auditType" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "findingType" TEXT NOT NULL DEFAULT 'observation',
    "severity" TEXT NOT NULL DEFAULT 'medium',
    "status" TEXT NOT NULL DEFAULT 'open',
    "auditorId" TEXT,
    "auditorName" TEXT,
    "auditedPeriod" TEXT,
    "auditedDepartment" TEXT,
    "recommendation" TEXT,
    "managementResponse" TEXT,
    "remediationPlan" TEXT,
    "remediationDueDate" TIMESTAMP(3),
    "remediatedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AuditFinding_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ITTicketComment" (
    "id" TEXT NOT NULL,
    "ticketId" TEXT NOT NULL,
    "commentType" TEXT NOT NULL DEFAULT 'public',
    "body" TEXT NOT NULL,
    "authorId" TEXT,
    "authorName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ITTicketComment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ITTicketAttachment" (
    "id" TEXT NOT NULL,
    "ticketId" TEXT NOT NULL,
    "fileName" TEXT NOT NULL,
    "fileType" TEXT,
    "fileSize" INTEGER,
    "fileUrl" TEXT NOT NULL,
    "uploadedById" TEXT,
    "uploadedByName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ITTicketAttachment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "KnowledgeBaseArticle" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL DEFAULT 'general',
    "content" TEXT NOT NULL,
    "keywords" TEXT,
    "authorId" TEXT,
    "authorName" TEXT,
    "status" TEXT NOT NULL DEFAULT 'published',
    "viewCount" INTEGER NOT NULL DEFAULT 0,
    "helpfulCount" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "KnowledgeBaseArticle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ITAsset" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "assetTag" TEXT NOT NULL,
    "assetType" TEXT NOT NULL,
    "manufacturer" TEXT,
    "model" TEXT,
    "serialNumber" TEXT,
    "location" TEXT,
    "departmentCode" TEXT,
    "assignedToId" TEXT,
    "assignedToName" TEXT,
    "purchaseDate" TIMESTAMP(3),
    "warrantyExpiry" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'active',
    "condition" TEXT NOT NULL DEFAULT 'good',
    "operatingSystem" TEXT,
    "ipAddress" TEXT,
    "macAddress" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ITAsset_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ITTicketAssetLink" (
    "id" TEXT NOT NULL,
    "ticketId" TEXT NOT NULL,
    "assetId" TEXT NOT NULL,
    "linkType" TEXT NOT NULL DEFAULT 'related',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ITTicketAssetLink_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SLAPolicy" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "responseTimeMins" INTEGER NOT NULL,
    "resolutionTimeMins" INTEGER NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SLAPolicy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MaintenanceSchedule" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "equipmentId" TEXT,
    "maintenanceType" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "scheduledDate" TIMESTAMP(3) NOT NULL,
    "completedAt" TIMESTAMP(3),
    "assignedToName" TEXT,
    "status" TEXT NOT NULL DEFAULT 'scheduled',
    "frequency" TEXT,
    "nextDueAt" TIMESTAMP(3),
    "cost" DOUBLE PRECISION,
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MaintenanceSchedule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FacilityInspection" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "inspectionType" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "inspectorName" TEXT,
    "location" TEXT,
    "departmentCode" TEXT,
    "findings" TEXT,
    "severity" TEXT NOT NULL DEFAULT 'low',
    "correctiveAction" TEXT,
    "followUpDate" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'open',
    "inspectedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FacilityInspection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordRequest" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "requestNumber" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "patientNumber" TEXT,
    "requestingDepartment" TEXT,
    "requestingStaffName" TEXT,
    "purpose" TEXT,
    "priority" TEXT NOT NULL DEFAULT 'routine',
    "status" TEXT NOT NULL DEFAULT 'requested',
    "assignedToName" TEXT,
    "notes" TEXT,
    "requestedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "requiredBy" TIMESTAMP(3),
    "retrievedAt" TIMESTAMP(3),
    "issuedAt" TIMESTAMP(3),
    "returnedAt" TIMESTAMP(3),
    "closedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RecordRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordMovement" (
    "id" TEXT NOT NULL,
    "recordRequestId" TEXT,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "patientNumber" TEXT,
    "movementType" TEXT NOT NULL,
    "fromLocation" TEXT,
    "toLocation" TEXT,
    "departmentCode" TEXT,
    "staffName" TEXT,
    "notes" TEXT,
    "movedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordMovement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordAmendment" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "amendmentType" TEXT NOT NULL,
    "field" TEXT,
    "originalValue" TEXT,
    "correctedValue" TEXT,
    "reason" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "requestedById" TEXT,
    "requestedByName" TEXT,
    "approvedById" TEXT,
    "approvedByName" TEXT,
    "requestedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "approvedAt" TIMESTAMP(3),
    "appliedAt" TIMESTAMP(3),
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RecordAmendment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MortuaryStorage" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "name" TEXT NOT NULL,
    "storageType" TEXT NOT NULL DEFAULT 'refrigerator',
    "location" TEXT,
    "capacity" INTEGER NOT NULL DEFAULT 1,
    "status" TEXT NOT NULL DEFAULT 'available',
    "currentCaseId" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MortuaryStorage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MortuaryMovement" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "mortuaryAdmissionId" TEXT NOT NULL,
    "movementType" TEXT NOT NULL,
    "fromLocation" TEXT,
    "toLocation" TEXT,
    "movedById" TEXT,
    "movedByName" TEXT,
    "reason" TEXT,
    "notes" TEXT,
    "movedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MortuaryMovement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MortuaryViewing" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "mortuaryAdmissionId" TEXT NOT NULL,
    "viewerName" TEXT NOT NULL,
    "viewerRelation" TEXT,
    "viewerPhone" TEXT,
    "numVisitors" INTEGER NOT NULL DEFAULT 1,
    "scheduledAt" TIMESTAMP(3) NOT NULL,
    "completedAt" TIMESTAMP(3),
    "authorizedBy" TEXT,
    "status" TEXT NOT NULL DEFAULT 'requested',
    "notes" TEXT,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MortuaryViewing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MortuaryProperty" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "mortuaryAdmissionId" TEXT NOT NULL,
    "itemName" TEXT NOT NULL,
    "description" TEXT,
    "quantity" INTEGER NOT NULL DEFAULT 1,
    "condition" TEXT,
    "receivedBy" TEXT,
    "storedLocation" TEXT,
    "releasedWithBody" BOOLEAN NOT NULL DEFAULT false,
    "releasedAt" TIMESTAMP(3),
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MortuaryProperty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BloodDonation" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "donationNumber" TEXT NOT NULL,
    "donorId" TEXT NOT NULL,
    "donationType" TEXT NOT NULL DEFAULT 'whole_blood',
    "bloodGroup" TEXT NOT NULL,
    "volumeMl" INTEGER NOT NULL DEFAULT 450,
    "unitId" TEXT,
    "collectionDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL DEFAULT 'collected',
    "screeningResult" TEXT,
    "notes" TEXT,
    "collectedById" TEXT,
    "collectedByName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BloodDonation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BloodCrossmatch" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "crossmatchNumber" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT NOT NULL,
    "patientBloodGroup" TEXT,
    "unitId" TEXT NOT NULL,
    "unitNumber" TEXT NOT NULL,
    "donorBloodGroup" TEXT NOT NULL,
    "crossmatchResult" TEXT NOT NULL DEFAULT 'pending',
    "method" TEXT,
    "testedBy" TEXT,
    "testedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BloodCrossmatch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NhiaClaimExport" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "facilityId" TEXT,
    "encounterId" TEXT NOT NULL,
    "patientId" TEXT,
    "patientName" TEXT,
    "invoiceId" TEXT,
    "insuranceClaimId" TEXT,
    "claimNumber" TEXT NOT NULL,
    "batchRef" TEXT,
    "submissionPeriod" TEXT,
    "status" TEXT NOT NULL DEFAULT 'draft',
    "isValid" BOOLEAN NOT NULL DEFAULT false,
    "errorCount" INTEGER NOT NULL DEFAULT 0,
    "warningCount" INTEGER NOT NULL DEFAULT 0,
    "validationErrors" TEXT,
    "adapterWarnings" TEXT,
    "totalServiceAmount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "totalDrugAmount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "grossAmount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "nhisAmount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "patientAmount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "netAmount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "itemCount" INTEGER NOT NULL DEFAULT 0,
    "diagnosisCount" INTEGER NOT NULL DEFAULT 0,
    "xmlPayload" TEXT,
    "xmlSizeBytes" INTEGER,
    "transportMode" TEXT,
    "filePath" TEXT,
    "submissionRef" TEXT,
    "transportError" TEXT,
    "generatedById" TEXT,
    "generatedByName" TEXT,
    "generatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "downloadedAt" TIMESTAMP(3),
    "downloadCount" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "NhiaClaimExport_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Organization_code_key" ON "Organization"("code");

-- CreateIndex
CREATE UNIQUE INDEX "Facility_organizationId_code_key" ON "Facility"("organizationId", "code");

-- CreateIndex
CREATE INDEX "Department_facilityId_status_idx" ON "Department"("facilityId", "status");

-- CreateIndex
CREATE INDEX "Department_category_idx" ON "Department"("category");

-- CreateIndex
CREATE UNIQUE INDEX "Department_facilityId_code_key" ON "Department"("facilityId", "code");

-- CreateIndex
CREATE UNIQUE INDEX "Unit_departmentId_code_key" ON "Unit"("departmentId", "code");

-- CreateIndex
CREATE INDEX "Bed_facilityId_status_idx" ON "Bed"("facilityId", "status");

-- CreateIndex
CREATE INDEX "Bed_facilityId_lifecycleStatus_idx" ON "Bed"("facilityId", "lifecycleStatus");

-- CreateIndex
CREATE INDEX "Bed_wardId_status_idx" ON "Bed"("wardId", "status");

-- CreateIndex
CREATE INDEX "Bed_bedType_idx" ON "Bed"("bedType");

-- CreateIndex
CREATE UNIQUE INDEX "Bed_wardId_bedNumber_key" ON "Bed"("wardId", "bedNumber");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Staff_userId_key" ON "Staff"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Staff_staffNumber_key" ON "Staff"("staffNumber");

-- CreateIndex
CREATE INDEX "Staff_facilityId_idx" ON "Staff"("facilityId");

-- CreateIndex
CREATE INDEX "Staff_departmentId_idx" ON "Staff"("departmentId");

-- CreateIndex
CREATE INDEX "Staff_employmentStatus_idx" ON "Staff"("employmentStatus");

-- CreateIndex
CREATE INDEX "Staff_employmentType_idx" ON "Staff"("employmentType");

-- CreateIndex
CREATE INDEX "Staff_staffCategory_idx" ON "Staff"("staffCategory");

-- CreateIndex
CREATE INDEX "Staff_profession_idx" ON "Staff"("profession");

-- CreateIndex
CREATE INDEX "Staff_licenseExpiryDate_idx" ON "Staff"("licenseExpiryDate");

-- CreateIndex
CREATE INDEX "Staff_contractEndDate_idx" ON "Staff"("contractEndDate");

-- CreateIndex
CREATE INDEX "StaffAssignment_staffId_idx" ON "StaffAssignment"("staffId");

-- CreateIndex
CREATE INDEX "StaffAssignment_facilityId_idx" ON "StaffAssignment"("facilityId");

-- CreateIndex
CREATE INDEX "StaffAssignment_departmentId_idx" ON "StaffAssignment"("departmentId");

-- CreateIndex
CREATE INDEX "StaffAssignment_status_idx" ON "StaffAssignment"("status");

-- CreateIndex
CREATE INDEX "StaffCredential_staffId_idx" ON "StaffCredential"("staffId");

-- CreateIndex
CREATE INDEX "StaffCredential_expiryDate_idx" ON "StaffCredential"("expiryDate");

-- CreateIndex
CREATE INDEX "StaffCredential_verificationStatus_idx" ON "StaffCredential"("verificationStatus");

-- CreateIndex
CREATE INDEX "StaffStatusHistory_staffId_idx" ON "StaffStatusHistory"("staffId");

-- CreateIndex
CREATE INDEX "StaffStatusHistory_effectiveDate_idx" ON "StaffStatusHistory"("effectiveDate");

-- CreateIndex
CREATE INDEX "StaffStatusHistory_newStatus_idx" ON "StaffStatusHistory"("newStatus");

-- CreateIndex
CREATE INDEX "StaffDocument_staffId_idx" ON "StaffDocument"("staffId");

-- CreateIndex
CREATE INDEX "StaffDocument_expiryDate_idx" ON "StaffDocument"("expiryDate");

-- CreateIndex
CREATE INDEX "StaffDocument_verificationStatus_idx" ON "StaffDocument"("verificationStatus");

-- CreateIndex
CREATE UNIQUE INDEX "StaffFacility_staffId_facilityId_key" ON "StaffFacility"("staffId", "facilityId");

-- CreateIndex
CREATE UNIQUE INDEX "Role_organizationId_code_key" ON "Role"("organizationId", "code");

-- CreateIndex
CREATE UNIQUE INDEX "Permission_code_key" ON "Permission"("code");

-- CreateIndex
CREATE UNIQUE INDEX "RolePermission_roleId_permissionId_key" ON "RolePermission"("roleId", "permissionId");

-- CreateIndex
CREATE UNIQUE INDEX "UserRole_userId_roleId_facilityId_departmentId_key" ON "UserRole"("userId", "roleId", "facilityId", "departmentId");

-- CreateIndex
CREATE UNIQUE INDEX "Patient_organizationId_patientNumber_key" ON "Patient"("organizationId", "patientNumber");

-- CreateIndex
CREATE INDEX "PatientIdentifier_patientId_idx" ON "PatientIdentifier"("patientId");

-- CreateIndex
CREATE UNIQUE INDEX "PatientIdentifier_identifierType_identifierValue_key" ON "PatientIdentifier"("identifierType", "identifierValue");

-- CreateIndex
CREATE INDEX "PatientContact_patientId_idx" ON "PatientContact"("patientId");

-- CreateIndex
CREATE INDEX "EmergencyContact_patientId_idx" ON "EmergencyContact"("patientId");

-- CreateIndex
CREATE INDEX "NextOfKin_patientId_idx" ON "NextOfKin"("patientId");

-- CreateIndex
CREATE INDEX "InsuranceProvider_organizationId_status_idx" ON "InsuranceProvider"("organizationId", "status");

-- CreateIndex
CREATE INDEX "InsuranceProvider_organizationId_providerType_idx" ON "InsuranceProvider"("organizationId", "providerType");

-- CreateIndex
CREATE UNIQUE INDEX "InsuranceProvider_organizationId_code_key" ON "InsuranceProvider"("organizationId", "code");

-- CreateIndex
CREATE INDEX "InsurancePlan_insuranceProviderId_idx" ON "InsurancePlan"("insuranceProviderId");

-- CreateIndex
CREATE INDEX "InsurancePlan_organizationId_status_idx" ON "InsurancePlan"("organizationId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "InsurancePlan_organizationId_code_key" ON "InsurancePlan"("organizationId", "code");

-- CreateIndex
CREATE INDEX "PlanServiceCoverage_insurancePlanId_idx" ON "PlanServiceCoverage"("insurancePlanId");

-- CreateIndex
CREATE INDEX "PlanServiceCoverage_serviceId_idx" ON "PlanServiceCoverage"("serviceId");

-- CreateIndex
CREATE INDEX "PlanBenefit_insurancePlanId_idx" ON "PlanBenefit"("insurancePlanId");

-- CreateIndex
CREATE INDEX "PlanBenefit_benefitCategory_idx" ON "PlanBenefit"("benefitCategory");

-- CreateIndex
CREATE INDEX "ProviderContact_insuranceProviderId_idx" ON "ProviderContact"("insuranceProviderId");

-- CreateIndex
CREATE INDEX "ProviderContact_contactType_idx" ON "ProviderContact"("contactType");

-- CreateIndex
CREATE INDEX "ProviderFacilityRelationship_facilityId_idx" ON "ProviderFacilityRelationship"("facilityId");

-- CreateIndex
CREATE UNIQUE INDEX "ProviderFacilityRelationship_insuranceProviderId_facilityId_key" ON "ProviderFacilityRelationship"("insuranceProviderId", "facilityId");

-- CreateIndex
CREATE INDEX "InsuranceAuthorization_insuranceProviderId_idx" ON "InsuranceAuthorization"("insuranceProviderId");

-- CreateIndex
CREATE INDEX "InsuranceAuthorization_patientId_idx" ON "InsuranceAuthorization"("patientId");

-- CreateIndex
CREATE INDEX "InsuranceAuthorization_status_idx" ON "InsuranceAuthorization"("status");

-- CreateIndex
CREATE INDEX "PatientInsurance_patientId_idx" ON "PatientInsurance"("patientId");

-- CreateIndex
CREATE INDEX "Encounter_patientId_facilityId_idx" ON "Encounter"("patientId", "facilityId");

-- CreateIndex
CREATE INDEX "Encounter_facilityId_status_startAt_idx" ON "Encounter"("facilityId", "status", "startAt");

-- CreateIndex
CREATE INDEX "Encounter_facilityId_source_startAt_idx" ON "Encounter"("facilityId", "source", "startAt");

-- CreateIndex
CREATE UNIQUE INDEX "Encounter_facilityId_encounterNumber_key" ON "Encounter"("facilityId", "encounterNumber");

-- CreateIndex
CREATE INDEX "Appointment_patientId_idx" ON "Appointment"("patientId");

-- CreateIndex
CREATE INDEX "Appointment_facilityId_scheduledStart_status_idx" ON "Appointment"("facilityId", "scheduledStart", "status");

-- CreateIndex
CREATE INDEX "Appointment_staffId_idx" ON "Appointment"("staffId");

-- CreateIndex
CREATE INDEX "Appointment_status_idx" ON "Appointment"("status");

-- CreateIndex
CREATE UNIQUE INDEX "Appointment_facilityId_appointmentNumber_key" ON "Appointment"("facilityId", "appointmentNumber");

-- CreateIndex
CREATE INDEX "ClinicianSchedule_organizationId_staffId_idx" ON "ClinicianSchedule"("organizationId", "staffId");

-- CreateIndex
CREATE INDEX "ClinicianSchedule_organizationId_facilityId_idx" ON "ClinicianSchedule"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "ClinicSession_organizationId_facilityId_idx" ON "ClinicSession"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "ClinicSession_organizationId_specialty_idx" ON "ClinicSession"("organizationId", "specialty");

-- CreateIndex
CREATE INDEX "ClinicSession_organizationId_dayOfWeek_idx" ON "ClinicSession"("organizationId", "dayOfWeek");

-- CreateIndex
CREATE INDEX "BlockedSlot_organizationId_facilityId_blockedDate_idx" ON "BlockedSlot"("organizationId", "facilityId", "blockedDate");

-- CreateIndex
CREATE INDEX "BlockedSlot_organizationId_staffId_blockedDate_idx" ON "BlockedSlot"("organizationId", "staffId", "blockedDate");

-- CreateIndex
CREATE INDEX "WaitingList_organizationId_status_idx" ON "WaitingList"("organizationId", "status");

-- CreateIndex
CREATE INDEX "WaitingList_organizationId_facilityId_status_idx" ON "WaitingList"("organizationId", "facilityId", "status");

-- CreateIndex
CREATE INDEX "AppointmentHistory_appointmentId_idx" ON "AppointmentHistory"("appointmentId");

-- CreateIndex
CREATE INDEX "QueueEntry_queueId_status_idx" ON "QueueEntry"("queueId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "QueueEntry_queueId_queueNumber_key" ON "QueueEntry"("queueId", "queueNumber");

-- CreateIndex
CREATE INDEX "TriageRecord_patientId_idx" ON "TriageRecord"("patientId");

-- CreateIndex
CREATE INDEX "TriageRecord_encounterId_idx" ON "TriageRecord"("encounterId");

-- CreateIndex
CREATE INDEX "TriageRecord_triageCategory_idx" ON "TriageRecord"("triageCategory");

-- CreateIndex
CREATE INDEX "TriageRecord_isReassessment_idx" ON "TriageRecord"("isReassessment");

-- CreateIndex
CREATE INDEX "VitalSign_patientId_recordedAt_idx" ON "VitalSign"("patientId", "recordedAt");

-- CreateIndex
CREATE INDEX "VitalSign_encounterId_idx" ON "VitalSign"("encounterId");

-- CreateIndex
CREATE INDEX "Consultation_patientId_idx" ON "Consultation"("patientId");

-- CreateIndex
CREATE INDEX "Consultation_encounterId_idx" ON "Consultation"("encounterId");

-- CreateIndex
CREATE INDEX "Consultation_status_idx" ON "Consultation"("status");

-- CreateIndex
CREATE INDEX "Consultation_disposition_idx" ON "Consultation"("disposition");

-- CreateIndex
CREATE INDEX "Diagnosis_patientId_idx" ON "Diagnosis"("patientId");

-- CreateIndex
CREATE INDEX "Diagnosis_encounterId_idx" ON "Diagnosis"("encounterId");

-- CreateIndex
CREATE INDEX "Diagnosis_catalogId_idx" ON "Diagnosis"("catalogId");

-- CreateIndex
CREATE INDEX "Diagnosis_diagnosisCode_idx" ON "Diagnosis"("diagnosisCode");

-- CreateIndex
CREATE INDEX "Diagnosis_clinicalStatus_idx" ON "Diagnosis"("clinicalStatus");

-- CreateIndex
CREATE INDEX "DiagnosisCatalog_organizationId_category_idx" ON "DiagnosisCatalog"("organizationId", "category");

-- CreateIndex
CREATE INDEX "DiagnosisCatalog_organizationId_specialty_idx" ON "DiagnosisCatalog"("organizationId", "specialty");

-- CreateIndex
CREATE INDEX "DiagnosisCatalog_organizationId_isActive_idx" ON "DiagnosisCatalog"("organizationId", "isActive");

-- CreateIndex
CREATE INDEX "DiagnosisCatalog_organizationId_isNhisClaimable_idx" ON "DiagnosisCatalog"("organizationId", "isNhisClaimable");

-- CreateIndex
CREATE UNIQUE INDEX "DiagnosisCatalog_organizationId_code_codeSystem_key" ON "DiagnosisCatalog"("organizationId", "code", "codeSystem");

-- CreateIndex
CREATE INDEX "DiagnosisStatusHistory_diagnosisId_idx" ON "DiagnosisStatusHistory"("diagnosisId");

-- CreateIndex
CREATE INDEX "DiagnosisFavorite_userId_idx" ON "DiagnosisFavorite"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "DiagnosisFavorite_userId_catalogId_key" ON "DiagnosisFavorite"("userId", "catalogId");

-- CreateIndex
CREATE INDEX "Allergy_patientId_idx" ON "Allergy"("patientId");

-- CreateIndex
CREATE INDEX "MedicalHistory_patientId_idx" ON "MedicalHistory"("patientId");

-- CreateIndex
CREATE INDEX "SurgicalHistory_patientId_idx" ON "SurgicalHistory"("patientId");

-- CreateIndex
CREATE INDEX "FamilyHistory_patientId_idx" ON "FamilyHistory"("patientId");

-- CreateIndex
CREATE INDEX "SocialHistory_patientId_idx" ON "SocialHistory"("patientId");

-- CreateIndex
CREATE INDEX "Medication_organizationId_status_idx" ON "Medication"("organizationId", "status");

-- CreateIndex
CREATE INDEX "Medication_organizationId_genericName_idx" ON "Medication"("organizationId", "genericName");

-- CreateIndex
CREATE INDEX "Medication_organizationId_therapeuticClass_idx" ON "Medication"("organizationId", "therapeuticClass");

-- CreateIndex
CREATE INDEX "Medication_organizationId_medicationCategory_idx" ON "Medication"("organizationId", "medicationCategory");

-- CreateIndex
CREATE INDEX "Medication_barcode_idx" ON "Medication"("barcode");

-- CreateIndex
CREATE INDEX "Medication_nhisCode_idx" ON "Medication"("nhisCode");

-- CreateIndex
CREATE INDEX "MedicationInteraction_organizationId_isActive_idx" ON "MedicationInteraction"("organizationId", "isActive");

-- CreateIndex
CREATE INDEX "MedicationInteraction_medicationAId_idx" ON "MedicationInteraction"("medicationAId");

-- CreateIndex
CREATE INDEX "MedicationInteraction_medicationBId_idx" ON "MedicationInteraction"("medicationBId");

-- CreateIndex
CREATE INDEX "MedicationInteraction_therapeuticClassA_therapeuticClassB_idx" ON "MedicationInteraction"("therapeuticClassA", "therapeuticClassB");

-- CreateIndex
CREATE INDEX "Prescription_patientId_status_idx" ON "Prescription"("patientId", "status");

-- CreateIndex
CREATE INDEX "Prescription_facilityId_status_idx" ON "Prescription"("facilityId", "status");

-- CreateIndex
CREATE INDEX "Prescription_status_idx" ON "Prescription"("status");

-- CreateIndex
CREATE UNIQUE INDEX "Prescription_facilityId_prescriptionNumber_key" ON "Prescription"("facilityId", "prescriptionNumber");

-- CreateIndex
CREATE INDEX "MedicationAdministration_patientId_administeredAt_idx" ON "MedicationAdministration"("patientId", "administeredAt");

-- CreateIndex
CREATE INDEX "LaboratoryTest_organizationId_status_idx" ON "LaboratoryTest"("organizationId", "status");

-- CreateIndex
CREATE INDEX "LaboratoryTest_organizationId_category_idx" ON "LaboratoryTest"("organizationId", "category");

-- CreateIndex
CREATE INDEX "LaboratoryTest_organizationId_testType_idx" ON "LaboratoryTest"("organizationId", "testType");

-- CreateIndex
CREATE INDEX "LaboratoryTest_serviceId_idx" ON "LaboratoryTest"("serviceId");

-- CreateIndex
CREATE UNIQUE INDEX "LaboratoryTest_organizationId_code_key" ON "LaboratoryTest"("organizationId", "code");

-- CreateIndex
CREATE INDEX "LabTestAlias_alias_idx" ON "LabTestAlias"("alias");

-- CreateIndex
CREATE UNIQUE INDEX "LabTestAlias_laboratoryTestId_alias_key" ON "LabTestAlias"("laboratoryTestId", "alias");

-- CreateIndex
CREATE UNIQUE INDEX "LabTestCategory_organizationId_code_key" ON "LabTestCategory"("organizationId", "code");

-- CreateIndex
CREATE UNIQUE INDEX "LabTestCategory_organizationId_name_key" ON "LabTestCategory"("organizationId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "LabTestSpecimenType_organizationId_code_key" ON "LabTestSpecimenType"("organizationId", "code");

-- CreateIndex
CREATE UNIQUE INDEX "LabTestSpecimenType_organizationId_name_key" ON "LabTestSpecimenType"("organizationId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "LabTestUnit_organizationId_code_key" ON "LabTestUnit"("organizationId", "code");

-- CreateIndex
CREATE UNIQUE INDEX "LabTestUnit_organizationId_name_key" ON "LabTestUnit"("organizationId", "name");

-- CreateIndex
CREATE INDEX "LabTestSpecimenConfig_laboratoryTestId_idx" ON "LabTestSpecimenConfig"("laboratoryTestId");

-- CreateIndex
CREATE INDEX "LabTestSpecimenConfig_specimenType_idx" ON "LabTestSpecimenConfig"("specimenType");

-- CreateIndex
CREATE INDEX "LabTestComponent_laboratoryTestId_idx" ON "LabTestComponent"("laboratoryTestId");

-- CreateIndex
CREATE INDEX "LabTestPanelMember_panelTestId_idx" ON "LabTestPanelMember"("panelTestId");

-- CreateIndex
CREATE INDEX "LabTestPanelMember_componentTestId_idx" ON "LabTestPanelMember"("componentTestId");

-- CreateIndex
CREATE UNIQUE INDEX "LabTestPanelMember_panelTestId_componentTestId_key" ON "LabTestPanelMember"("panelTestId", "componentTestId");

-- CreateIndex
CREATE INDEX "LabTestReferenceRange_laboratoryTestId_idx" ON "LabTestReferenceRange"("laboratoryTestId");

-- CreateIndex
CREATE INDEX "LabTestReferenceRange_laboratoryTestId_sex_ageGroup_idx" ON "LabTestReferenceRange"("laboratoryTestId", "sex", "ageGroup");

-- CreateIndex
CREATE INDEX "LabTestReferenceRange_laboratoryTestId_effectiveFrom_effect_idx" ON "LabTestReferenceRange"("laboratoryTestId", "effectiveFrom", "effectiveTo");

-- CreateIndex
CREATE INDEX "LabTestCriticalValue_laboratoryTestId_idx" ON "LabTestCriticalValue"("laboratoryTestId");

-- CreateIndex
CREATE INDEX "LabTestResultOption_laboratoryTestId_idx" ON "LabTestResultOption"("laboratoryTestId");

-- CreateIndex
CREATE INDEX "LabTestFacilityAvailability_facilityId_idx" ON "LabTestFacilityAvailability"("facilityId");

-- CreateIndex
CREATE UNIQUE INDEX "LabTestFacilityAvailability_laboratoryTestId_facilityId_key" ON "LabTestFacilityAvailability"("laboratoryTestId", "facilityId");

-- CreateIndex
CREATE INDEX "LabTestVersion_laboratoryTestId_version_idx" ON "LabTestVersion"("laboratoryTestId", "version");

-- CreateIndex
CREATE UNIQUE INDEX "LabTestVersion_laboratoryTestId_version_key" ON "LabTestVersion"("laboratoryTestId", "version");

-- CreateIndex
CREATE INDEX "LabTestCatalogAudit_laboratoryTestId_createdAt_idx" ON "LabTestCatalogAudit"("laboratoryTestId", "createdAt");

-- CreateIndex
CREATE INDEX "LabTestCatalogAudit_organizationId_createdAt_idx" ON "LabTestCatalogAudit"("organizationId", "createdAt");

-- CreateIndex
CREATE INDEX "LabOrder_patientId_status_idx" ON "LabOrder"("patientId", "status");

-- CreateIndex
CREATE INDEX "LabOrder_facilityId_status_orderedAt_idx" ON "LabOrder"("facilityId", "status", "orderedAt");

-- CreateIndex
CREATE INDEX "LabOrder_facilityId_priority_orderedAt_idx" ON "LabOrder"("facilityId", "priority", "orderedAt");

-- CreateIndex
CREATE INDEX "LabOrder_orderingClinicianId_idx" ON "LabOrder"("orderingClinicianId");

-- CreateIndex
CREATE INDEX "LabOrder_departmentId_idx" ON "LabOrder"("departmentId");

-- CreateIndex
CREATE UNIQUE INDEX "LabOrder_facilityId_orderNumber_key" ON "LabOrder"("facilityId", "orderNumber");

-- CreateIndex
CREATE INDEX "LabSample_status_idx" ON "LabSample"("status");

-- CreateIndex
CREATE INDEX "LabSample_recollectFromId_idx" ON "LabSample"("recollectFromId");

-- CreateIndex
CREATE UNIQUE INDEX "LabSample_labOrderId_sampleNumber_key" ON "LabSample"("labOrderId", "sampleNumber");

-- CreateIndex
CREATE INDEX "LabResult_labOrderItemId_idx" ON "LabResult"("labOrderItemId");

-- CreateIndex
CREATE INDEX "LabResult_status_idx" ON "LabResult"("status");

-- CreateIndex
CREATE INDEX "LabResult_isCritical_idx" ON "LabResult"("isCritical");

-- CreateIndex
CREATE INDEX "LabResult_componentId_idx" ON "LabResult"("componentId");

-- CreateIndex
CREATE INDEX "ImagingOrder_patientId_status_idx" ON "ImagingOrder"("patientId", "status");

-- CreateIndex
CREATE INDEX "ImagingOrder_facilityId_status_orderedAt_idx" ON "ImagingOrder"("facilityId", "status", "orderedAt");

-- CreateIndex
CREATE INDEX "ImagingOrder_facilityId_modality_status_idx" ON "ImagingOrder"("facilityId", "modality", "status");

-- CreateIndex
CREATE INDEX "ImagingOrder_accessionNumber_idx" ON "ImagingOrder"("accessionNumber");

-- CreateIndex
CREATE INDEX "ImagingOrder_serviceId_idx" ON "ImagingOrder"("serviceId");

-- CreateIndex
CREATE INDEX "ImagingReport_imagingOrderId_isLatest_idx" ON "ImagingReport"("imagingOrderId", "isLatest");

-- CreateIndex
CREATE INDEX "ImagingReport_status_idx" ON "ImagingReport"("status");

-- CreateIndex
CREATE INDEX "ImagingReport_reportedById_idx" ON "ImagingReport"("reportedById");

-- CreateIndex
CREATE INDEX "ImagingReport_amendedFromId_idx" ON "ImagingReport"("amendedFromId");

-- CreateIndex
CREATE INDEX "Procedure_patientId_idx" ON "Procedure"("patientId");

-- CreateIndex
CREATE INDEX "Procedure_facilityId_status_idx" ON "Procedure"("facilityId", "status");

-- CreateIndex
CREATE INDEX "Procedure_procedureCatalogId_idx" ON "Procedure"("procedureCatalogId");

-- CreateIndex
CREATE INDEX "Procedure_serviceId_idx" ON "Procedure"("serviceId");

-- CreateIndex
CREATE INDEX "ProcedureCatalog_organizationId_status_idx" ON "ProcedureCatalog"("organizationId", "status");

-- CreateIndex
CREATE INDEX "ProcedureCatalog_organizationId_category_idx" ON "ProcedureCatalog"("organizationId", "category");

-- CreateIndex
CREATE INDEX "ProcedureCatalog_serviceId_idx" ON "ProcedureCatalog"("serviceId");

-- CreateIndex
CREATE UNIQUE INDEX "ProcedureCatalog_organizationId_code_key" ON "ProcedureCatalog"("organizationId", "code");

-- CreateIndex
CREATE INDEX "ProcedureCatalogFacilityAvailability_facilityId_idx" ON "ProcedureCatalogFacilityAvailability"("facilityId");

-- CreateIndex
CREATE UNIQUE INDEX "ProcedureCatalogFacilityAvailability_procedureCatalogId_fac_key" ON "ProcedureCatalogFacilityAvailability"("procedureCatalogId", "facilityId");

-- CreateIndex
CREATE INDEX "Admission_patientId_status_idx" ON "Admission"("patientId", "status");

-- CreateIndex
CREATE INDEX "Admission_facilityId_status_idx" ON "Admission"("facilityId", "status");

-- CreateIndex
CREATE INDEX "Admission_facilityId_admissionType_idx" ON "Admission"("facilityId", "admissionType");

-- CreateIndex
CREATE INDEX "Admission_status_admittedAt_idx" ON "Admission"("status", "admittedAt");

-- CreateIndex
CREATE INDEX "Admission_requestedWardId_idx" ON "Admission"("requestedWardId");

-- CreateIndex
CREATE UNIQUE INDEX "Admission_facilityId_admissionNumber_key" ON "Admission"("facilityId", "admissionNumber");

-- CreateIndex
CREATE INDEX "BedAssignment_bedId_status_idx" ON "BedAssignment"("bedId", "status");

-- CreateIndex
CREATE INDEX "BedAssignment_admissionId_idx" ON "BedAssignment"("admissionId");

-- CreateIndex
CREATE UNIQUE INDEX "PatientTransfer_transferNumber_key" ON "PatientTransfer"("transferNumber");

-- CreateIndex
CREATE INDEX "PatientTransfer_patientId_status_idx" ON "PatientTransfer"("patientId", "status");

-- CreateIndex
CREATE INDEX "PatientTransfer_fromFacilityId_status_idx" ON "PatientTransfer"("fromFacilityId", "status");

-- CreateIndex
CREATE INDEX "PatientTransfer_toFacilityId_status_idx" ON "PatientTransfer"("toFacilityId", "status");

-- CreateIndex
CREATE INDEX "PatientTransfer_transferType_status_idx" ON "PatientTransfer"("transferType", "status");

-- CreateIndex
CREATE INDEX "PatientTransfer_status_requestedAt_idx" ON "PatientTransfer"("status", "requestedAt");

-- CreateIndex
CREATE INDEX "PatientTransfer_priority_status_idx" ON "PatientTransfer"("priority", "status");

-- CreateIndex
CREATE INDEX "TransferChecklistItem_transferId_category_idx" ON "TransferChecklistItem"("transferId", "category");

-- CreateIndex
CREATE INDEX "TransferChecklistItem_transferId_status_idx" ON "TransferChecklistItem"("transferId", "status");

-- CreateIndex
CREATE INDEX "TransferCommunication_transferId_sentAt_idx" ON "TransferCommunication"("transferId", "sentAt");

-- CreateIndex
CREATE UNIQUE INDEX "DischargeRecord_dischargeNumber_key" ON "DischargeRecord"("dischargeNumber");

-- CreateIndex
CREATE INDEX "DischargeRecord_patientId_idx" ON "DischargeRecord"("patientId");

-- CreateIndex
CREATE INDEX "DischargeRecord_admissionId_idx" ON "DischargeRecord"("admissionId");

-- CreateIndex
CREATE INDEX "DischargeRecord_dischargedAt_idx" ON "DischargeRecord"("dischargedAt");

-- CreateIndex
CREATE INDEX "DischargeRecord_facilityId_status_idx" ON "DischargeRecord"("facilityId", "status");

-- CreateIndex
CREATE INDEX "DischargeRecord_status_dischargedAt_idx" ON "DischargeRecord"("status", "dischargedAt");

-- CreateIndex
CREATE INDEX "DischargeChecklistItem_dischargeId_category_idx" ON "DischargeChecklistItem"("dischargeId", "category");

-- CreateIndex
CREATE INDEX "DischargeChecklistItem_dischargeId_status_idx" ON "DischargeChecklistItem"("dischargeId", "status");

-- CreateIndex
CREATE INDEX "DischargeMedication_dischargeId_action_idx" ON "DischargeMedication"("dischargeId", "action");

-- CreateIndex
CREATE INDEX "BedReservation_bedId_status_idx" ON "BedReservation"("bedId", "status");

-- CreateIndex
CREATE INDEX "BedReservation_admissionId_idx" ON "BedReservation"("admissionId");

-- CreateIndex
CREATE INDEX "BedReservation_facilityId_status_idx" ON "BedReservation"("facilityId", "status");

-- CreateIndex
CREATE INDEX "BedReservation_patientId_idx" ON "BedReservation"("patientId");

-- CreateIndex
CREATE INDEX "BedCleaning_bedId_status_idx" ON "BedCleaning"("bedId", "status");

-- CreateIndex
CREATE INDEX "BedCleaning_facilityId_status_idx" ON "BedCleaning"("facilityId", "status");

-- CreateIndex
CREATE INDEX "BedMaintenance_bedId_status_idx" ON "BedMaintenance"("bedId", "status");

-- CreateIndex
CREATE INDEX "BedMaintenance_facilityId_status_idx" ON "BedMaintenance"("facilityId", "status");

-- CreateIndex
CREATE INDEX "BedBlock_bedId_status_idx" ON "BedBlock"("bedId", "status");

-- CreateIndex
CREATE INDEX "BedBlock_facilityId_status_idx" ON "BedBlock"("facilityId", "status");

-- CreateIndex
CREATE INDEX "ProgressNote_admissionId_authoredAt_idx" ON "ProgressNote"("admissionId", "authoredAt");

-- CreateIndex
CREATE INDEX "ProgressNote_patientId_idx" ON "ProgressNote"("patientId");

-- CreateIndex
CREATE INDEX "CareTeamMember_admissionId_status_idx" ON "CareTeamMember"("admissionId", "status");

-- CreateIndex
CREATE INDEX "CareTeamMember_userId_idx" ON "CareTeamMember"("userId");

-- CreateIndex
CREATE INDEX "NursingNote_patientId_createdAt_idx" ON "NursingNote"("patientId", "createdAt");

-- CreateIndex
CREATE INDEX "NursingNote_admissionId_idx" ON "NursingNote"("admissionId");

-- CreateIndex
CREATE INDEX "NursingNote_status_idx" ON "NursingNote"("status");

-- CreateIndex
CREATE INDEX "NursingNote_shift_idx" ON "NursingNote"("shift");

-- CreateIndex
CREATE INDEX "NursingNote_noteType_idx" ON "NursingNote"("noteType");

-- CreateIndex
CREATE INDEX "CarePlan_patientId_idx" ON "CarePlan"("patientId");

-- CreateIndex
CREATE INDEX "CarePlan_admissionId_idx" ON "CarePlan"("admissionId");

-- CreateIndex
CREATE INDEX "CarePlan_status_idx" ON "CarePlan"("status");

-- CreateIndex
CREATE INDEX "NursingHandover_patientId_handoverDate_idx" ON "NursingHandover"("patientId", "handoverDate");

-- CreateIndex
CREATE INDEX "NursingHandover_shiftType_idx" ON "NursingHandover"("shiftType");

-- CreateIndex
CREATE INDEX "NursingHandover_status_idx" ON "NursingHandover"("status");

-- CreateIndex
CREATE INDEX "NursingEscalation_patientId_idx" ON "NursingEscalation"("patientId");

-- CreateIndex
CREATE INDEX "NursingEscalation_status_idx" ON "NursingEscalation"("status");

-- CreateIndex
CREATE INDEX "NursingEscalation_priority_idx" ON "NursingEscalation"("priority");

-- CreateIndex
CREATE INDEX "NursingTask_patientId_status_idx" ON "NursingTask"("patientId", "status");

-- CreateIndex
CREATE INDEX "NursingTask_dueAt_idx" ON "NursingTask"("dueAt");

-- CreateIndex
CREATE INDEX "NursingTask_assignedToId_idx" ON "NursingTask"("assignedToId");

-- CreateIndex
CREATE INDEX "WoundAssessment_patientId_assessedAt_idx" ON "WoundAssessment"("patientId", "assessedAt");

-- CreateIndex
CREATE INDEX "WoundAssessment_admissionId_idx" ON "WoundAssessment"("admissionId");

-- CreateIndex
CREATE INDEX "RiskAssessment_patientId_assessmentType_idx" ON "RiskAssessment"("patientId", "assessmentType");

-- CreateIndex
CREATE INDEX "RiskAssessment_admissionId_idx" ON "RiskAssessment"("admissionId");

-- CreateIndex
CREATE INDEX "NursingIntervention_patientId_idx" ON "NursingIntervention"("patientId");

-- CreateIndex
CREATE INDEX "NursingIntervention_carePlanId_idx" ON "NursingIntervention"("carePlanId");

-- CreateIndex
CREATE INDEX "NursingIntervention_status_idx" ON "NursingIntervention"("status");

-- CreateIndex
CREATE UNIQUE INDEX "Referral_referralNumber_key" ON "Referral"("referralNumber");

-- CreateIndex
CREATE INDEX "Referral_patientIdFrom_status_idx" ON "Referral"("patientIdFrom", "status");

-- CreateIndex
CREATE INDEX "Referral_referringFacilityId_status_idx" ON "Referral"("referringFacilityId", "status");

-- CreateIndex
CREATE INDEX "Referral_receivingFacilityId_status_idx" ON "Referral"("receivingFacilityId", "status");

-- CreateIndex
CREATE INDEX "Referral_status_feedbackStatus_idx" ON "Referral"("status", "feedbackStatus");

-- CreateIndex
CREATE INDEX "Referral_urgency_status_idx" ON "Referral"("urgency", "status");

-- CreateIndex
CREATE INDEX "Referral_referralNumber_idx" ON "Referral"("referralNumber");

-- CreateIndex
CREATE INDEX "Referral_kind_toDepartmentCode_idx" ON "Referral"("kind", "toDepartmentCode");

-- CreateIndex
CREATE INDEX "Referral_kind_status_idx" ON "Referral"("kind", "status");

-- CreateIndex
CREATE INDEX "ReferralEvent_referralId_createdAt_idx" ON "ReferralEvent"("referralId", "createdAt");

-- CreateIndex
CREATE INDEX "ReferralEvent_eventType_idx" ON "ReferralEvent"("eventType");

-- CreateIndex
CREATE INDEX "ReferralFeedback_referralId_createdAt_idx" ON "ReferralFeedback"("referralId", "createdAt");

-- CreateIndex
CREATE INDEX "ReferralFeedback_feedbackType_idx" ON "ReferralFeedback"("feedbackType");

-- CreateIndex
CREATE INDEX "ReferralMessage_referralId_createdAt_idx" ON "ReferralMessage"("referralId", "createdAt");

-- CreateIndex
CREATE INDEX "ReferralMessage_direction_isRead_idx" ON "ReferralMessage"("direction", "isRead");

-- CreateIndex
CREATE INDEX "Immunization_patientId_administeredAt_idx" ON "Immunization"("patientId", "administeredAt");

-- CreateIndex
CREATE INDEX "Immunization_facilityId_administeredAt_idx" ON "Immunization"("facilityId", "administeredAt");

-- CreateIndex
CREATE INDEX "Immunization_status_idx" ON "Immunization"("status");

-- CreateIndex
CREATE INDEX "Immunization_vaccineCatalogId_idx" ON "Immunization"("vaccineCatalogId");

-- CreateIndex
CREATE INDEX "Immunization_batchId_idx" ON "Immunization"("batchId");

-- CreateIndex
CREATE INDEX "Immunization_seriesId_idx" ON "Immunization"("seriesId");

-- CreateIndex
CREATE INDEX "VaccineCatalog_organizationId_isActive_idx" ON "VaccineCatalog"("organizationId", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "VaccineCatalog_organizationId_code_key" ON "VaccineCatalog"("organizationId", "code");

-- CreateIndex
CREATE INDEX "VaccineScheduleDose_organizationId_isActive_idx" ON "VaccineScheduleDose"("organizationId", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "VaccineScheduleDose_vaccineCatalogId_doseNumber_key" ON "VaccineScheduleDose"("vaccineCatalogId", "doseNumber");

-- CreateIndex
CREATE INDEX "AEFI_immunizationId_idx" ON "AEFI"("immunizationId");

-- CreateIndex
CREATE INDEX "AEFI_patientId_reportedAt_idx" ON "AEFI"("patientId", "reportedAt");

-- CreateIndex
CREATE INDEX "AEFI_status_idx" ON "AEFI"("status");

-- CreateIndex
CREATE INDEX "AEFI_severity_idx" ON "AEFI"("severity");

-- CreateIndex
CREATE INDEX "VaccineWastage_facilityId_disposedAt_idx" ON "VaccineWastage"("facilityId", "disposedAt");

-- CreateIndex
CREATE INDEX "VaccineWastage_batchId_idx" ON "VaccineWastage"("batchId");

-- CreateIndex
CREATE INDEX "VaccineWastage_reason_idx" ON "VaccineWastage"("reason");

-- CreateIndex
CREATE INDEX "ColdChainAlert_facilityId_recordedAt_idx" ON "ColdChainAlert"("facilityId", "recordedAt");

-- CreateIndex
CREATE INDEX "ColdChainAlert_isExcursion_idx" ON "ColdChainAlert"("isExcursion");

-- CreateIndex
CREATE INDEX "AmbulanceVehicle_facilityId_status_idx" ON "AmbulanceVehicle"("facilityId", "status");

-- CreateIndex
CREATE INDEX "AmbulanceVehicle_organizationId_status_idx" ON "AmbulanceVehicle"("organizationId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "AmbulanceVehicle_organizationId_vehicleNumber_key" ON "AmbulanceVehicle"("organizationId", "vehicleNumber");

-- CreateIndex
CREATE INDEX "AmbulanceTrip_facilityId_status_idx" ON "AmbulanceTrip"("facilityId", "status");

-- CreateIndex
CREATE INDEX "AmbulanceTrip_patientId_idx" ON "AmbulanceTrip"("patientId");

-- CreateIndex
CREATE INDEX "AmbulanceTrip_vehicleId_idx" ON "AmbulanceTrip"("vehicleId");

-- CreateIndex
CREATE INDEX "AmbulanceTrip_status_idx" ON "AmbulanceTrip"("status");

-- CreateIndex
CREATE INDEX "AmbulanceTrip_priority_status_idx" ON "AmbulanceTrip"("priority", "status");

-- CreateIndex
CREATE UNIQUE INDEX "AmbulanceTrip_organizationId_tripNumber_key" ON "AmbulanceTrip"("organizationId", "tripNumber");

-- CreateIndex
CREATE INDEX "AmbulanceIncident_tripId_idx" ON "AmbulanceIncident"("tripId");

-- CreateIndex
CREATE INDEX "AmbulanceIncident_incidentType_idx" ON "AmbulanceIncident"("incidentType");

-- CreateIndex
CREATE INDEX "MaternityRecord_patientId_pregnancyStatus_idx" ON "MaternityRecord"("patientId", "pregnancyStatus");

-- CreateIndex
CREATE INDEX "MaternityRecord_facilityId_pregnancyStatus_idx" ON "MaternityRecord"("facilityId", "pregnancyStatus");

-- CreateIndex
CREATE INDEX "MaternityRecord_eddFinal_idx" ON "MaternityRecord"("eddFinal");

-- CreateIndex
CREATE INDEX "MaternityRecord_riskLevel_pregnancyStatus_idx" ON "MaternityRecord"("riskLevel", "pregnancyStatus");

-- CreateIndex
CREATE INDEX "NewbornRecord_motherPatientId_idx" ON "NewbornRecord"("motherPatientId");

-- CreateIndex
CREATE INDEX "NewbornRecord_deliveryRecordId_idx" ON "NewbornRecord"("deliveryRecordId");

-- CreateIndex
CREATE INDEX "AncVisit_maternityRecordId_visitDate_idx" ON "AncVisit"("maternityRecordId", "visitDate");

-- CreateIndex
CREATE INDEX "AncVisit_patientId_visitDate_idx" ON "AncVisit"("patientId", "visitDate");

-- CreateIndex
CREATE INDEX "AncVisit_facilityId_visitDate_idx" ON "AncVisit"("facilityId", "visitDate");

-- CreateIndex
CREATE UNIQUE INDEX "LaborAndDelivery_maternityRecordId_key" ON "LaborAndDelivery"("maternityRecordId");

-- CreateIndex
CREATE INDEX "LaborAndDelivery_maternityRecordId_idx" ON "LaborAndDelivery"("maternityRecordId");

-- CreateIndex
CREATE INDEX "LaborAndDelivery_patientId_deliveryDate_idx" ON "LaborAndDelivery"("patientId", "deliveryDate");

-- CreateIndex
CREATE INDEX "LaborAndDelivery_facilityId_deliveryDate_idx" ON "LaborAndDelivery"("facilityId", "deliveryDate");

-- CreateIndex
CREATE INDEX "PostnatalVisit_maternityRecordId_visitDate_idx" ON "PostnatalVisit"("maternityRecordId", "visitDate");

-- CreateIndex
CREATE INDEX "PostnatalVisit_patientId_visitDate_idx" ON "PostnatalVisit"("patientId", "visitDate");

-- CreateIndex
CREATE INDEX "Service_departmentId_idx" ON "Service"("departmentId");

-- CreateIndex
CREATE INDEX "Service_organizationId_status_idx" ON "Service"("organizationId", "status");

-- CreateIndex
CREATE INDEX "Service_organizationId_category_idx" ON "Service"("organizationId", "category");

-- CreateIndex
CREATE INDEX "Service_organizationId_serviceType_idx" ON "Service"("organizationId", "serviceType");

-- CreateIndex
CREATE UNIQUE INDEX "Service_organizationId_code_key" ON "Service"("organizationId", "code");

-- CreateIndex
CREATE INDEX "FacilityServicePrice_serviceId_idx" ON "FacilityServicePrice"("serviceId");

-- CreateIndex
CREATE INDEX "FacilityServicePrice_facilityId_idx" ON "FacilityServicePrice"("facilityId");

-- CreateIndex
CREATE UNIQUE INDEX "FacilityServicePrice_facilityId_serviceId_key" ON "FacilityServicePrice"("facilityId", "serviceId");

-- CreateIndex
CREATE INDEX "ServicePriceHistory_serviceId_effectiveDate_idx" ON "ServicePriceHistory"("serviceId", "effectiveDate");

-- CreateIndex
CREATE INDEX "ServicePriceHistory_organizationId_effectiveDate_idx" ON "ServicePriceHistory"("organizationId", "effectiveDate");

-- CreateIndex
CREATE INDEX "ServicePackage_organizationId_isActive_idx" ON "ServicePackage"("organizationId", "isActive");

-- CreateIndex
CREATE INDEX "ServicePackage_organizationId_status_idx" ON "ServicePackage"("organizationId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "ServicePackage_organizationId_code_key" ON "ServicePackage"("organizationId", "code");

-- CreateIndex
CREATE INDEX "ServicePackageItem_packageId_idx" ON "ServicePackageItem"("packageId");

-- CreateIndex
CREATE INDEX "ServicePackageItem_serviceId_idx" ON "ServicePackageItem"("serviceId");

-- CreateIndex
CREATE INDEX "Invoice_patientId_status_idx" ON "Invoice"("patientId", "status");

-- CreateIndex
CREATE INDEX "Invoice_facilityId_status_issuedAt_idx" ON "Invoice"("facilityId", "status", "issuedAt");

-- CreateIndex
CREATE INDEX "Invoice_status_dueAt_idx" ON "Invoice"("status", "dueAt");

-- CreateIndex
CREATE INDEX "Invoice_payerType_status_idx" ON "Invoice"("payerType", "status");

-- CreateIndex
CREATE INDEX "Invoice_invoiceType_status_idx" ON "Invoice"("invoiceType", "status");

-- CreateIndex
CREATE UNIQUE INDEX "Invoice_facilityId_invoiceNumber_key" ON "Invoice"("facilityId", "invoiceNumber");

-- CreateIndex
CREATE INDEX "InvoiceItem_invoiceId_idx" ON "InvoiceItem"("invoiceId");

-- CreateIndex
CREATE INDEX "Payment_patientId_receivedAt_idx" ON "Payment"("patientId", "receivedAt");

-- CreateIndex
CREATE INDEX "Payment_facilityId_receivedAt_idx" ON "Payment"("facilityId", "receivedAt");

-- CreateIndex
CREATE UNIQUE INDEX "Payment_facilityId_paymentNumber_key" ON "Payment"("facilityId", "paymentNumber");

-- CreateIndex
CREATE UNIQUE INDEX "Refund_refundNumber_key" ON "Refund"("refundNumber");

-- CreateIndex
CREATE INDEX "Refund_paymentId_status_idx" ON "Refund"("paymentId", "status");

-- CreateIndex
CREATE INDEX "Refund_invoiceId_status_idx" ON "Refund"("invoiceId", "status");

-- CreateIndex
CREATE INDEX "Refund_status_createdAt_idx" ON "Refund"("status", "createdAt");

-- CreateIndex
CREATE INDEX "Refund_facilityId_status_idx" ON "Refund"("facilityId", "status");

-- CreateIndex
CREATE INDEX "Refund_refundType_status_idx" ON "Refund"("refundType", "status");

-- CreateIndex
CREATE INDEX "Refund_refundMethod_status_idx" ON "Refund"("refundMethod", "status");

-- CreateIndex
CREATE INDEX "CreditNote_invoiceId_idx" ON "CreditNote"("invoiceId");

-- CreateIndex
CREATE INDEX "CreditNote_patientId_idx" ON "CreditNote"("patientId");

-- CreateIndex
CREATE INDEX "CreditNote_status_issuedAt_idx" ON "CreditNote"("status", "issuedAt");

-- CreateIndex
CREATE UNIQUE INDEX "CreditNote_facilityId_creditNoteNumber_key" ON "CreditNote"("facilityId", "creditNoteNumber");

-- CreateIndex
CREATE INDEX "InvoiceAdjustment_invoiceId_idx" ON "InvoiceAdjustment"("invoiceId");

-- CreateIndex
CREATE INDEX "InvoiceAdjustment_adjustmentType_idx" ON "InvoiceAdjustment"("adjustmentType");

-- CreateIndex
CREATE INDEX "InsuranceClaim_patientId_idx" ON "InsuranceClaim"("patientId");

-- CreateIndex
CREATE INDEX "InsuranceClaim_encounterId_idx" ON "InsuranceClaim"("encounterId");

-- CreateIndex
CREATE INDEX "InsuranceClaim_status_idx" ON "InsuranceClaim"("status");

-- CreateIndex
CREATE INDEX "InsuranceClaim_primaryDiagnosisCode_idx" ON "InsuranceClaim"("primaryDiagnosisCode");

-- CreateIndex
CREATE UNIQUE INDEX "InsuranceClaim_facilityId_claimNumber_key" ON "InsuranceClaim"("facilityId", "claimNumber");

-- CreateIndex
CREATE INDEX "ClaimDiagnosis_claimId_idx" ON "ClaimDiagnosis"("claimId");

-- CreateIndex
CREATE INDEX "ClaimDiagnosis_catalogId_idx" ON "ClaimDiagnosis"("catalogId");

-- CreateIndex
CREATE INDEX "ClaimItem_claimId_idx" ON "ClaimItem"("claimId");

-- CreateIndex
CREATE INDEX "ClaimItem_itemType_idx" ON "ClaimItem"("itemType");

-- CreateIndex
CREATE UNIQUE INDEX "ClaimBatch_batchNumber_key" ON "ClaimBatch"("batchNumber");

-- CreateIndex
CREATE INDEX "ClaimBatch_organizationId_facilityId_idx" ON "ClaimBatch"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "ClaimBatch_status_idx" ON "ClaimBatch"("status");

-- CreateIndex
CREATE INDEX "ClaimQuery_claimId_idx" ON "ClaimQuery"("claimId");

-- CreateIndex
CREATE INDEX "ClaimQuery_status_idx" ON "ClaimQuery"("status");

-- CreateIndex
CREATE INDEX "ClaimPayment_claimId_idx" ON "ClaimPayment"("claimId");

-- CreateIndex
CREATE INDEX "EligibilityVerification_patientId_idx" ON "EligibilityVerification"("patientId");

-- CreateIndex
CREATE INDEX "EligibilityVerification_organizationId_idx" ON "EligibilityVerification"("organizationId");

-- CreateIndex
CREATE INDEX "EligibilityVerification_verificationStatus_idx" ON "EligibilityVerification"("verificationStatus");

-- CreateIndex
CREATE INDEX "EligibilityVerification_encounterId_idx" ON "EligibilityVerification"("encounterId");

-- CreateIndex
CREATE INDEX "EligibilityVerification_patientInsuranceId_idx" ON "EligibilityVerification"("patientInsuranceId");

-- CreateIndex
CREATE INDEX "EligibilityVerification_facilityId_verificationDate_idx" ON "EligibilityVerification"("facilityId", "verificationDate");

-- CreateIndex
CREATE UNIQUE INDEX "EncounterCoverage_encounterId_key" ON "EncounterCoverage"("encounterId");

-- CreateIndex
CREATE INDEX "EncounterCoverage_organizationId_facilityId_idx" ON "EncounterCoverage"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "EncounterCoverage_encounterId_idx" ON "EncounterCoverage"("encounterId");

-- CreateIndex
CREATE INDEX "EncounterCoverage_payerType_idx" ON "EncounterCoverage"("payerType");

-- CreateIndex
CREATE INDEX "EncounterCoverage_patientInsuranceId_idx" ON "EncounterCoverage"("patientInsuranceId");

-- CreateIndex
CREATE UNIQUE INDEX "AttendanceVerification_encounterId_key" ON "AttendanceVerification"("encounterId");

-- CreateIndex
CREATE INDEX "AttendanceVerification_organizationId_facilityId_idx" ON "AttendanceVerification"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "AttendanceVerification_encounterId_idx" ON "AttendanceVerification"("encounterId");

-- CreateIndex
CREATE INDEX "AttendanceVerification_patientId_idx" ON "AttendanceVerification"("patientId");

-- CreateIndex
CREATE INDEX "AttendanceVerification_method_verificationStatus_idx" ON "AttendanceVerification"("method", "verificationStatus");

-- CreateIndex
CREATE INDEX "AttendanceVerification_codeHash_idx" ON "AttendanceVerification"("codeHash");

-- CreateIndex
CREATE INDEX "ClaimReadinessAssessment_organizationId_facilityId_idx" ON "ClaimReadinessAssessment"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "ClaimReadinessAssessment_encounterId_idx" ON "ClaimReadinessAssessment"("encounterId");

-- CreateIndex
CREATE INDEX "ClaimReadinessAssessment_status_idx" ON "ClaimReadinessAssessment"("status");

-- CreateIndex
CREATE INDEX "ClaimReadinessAssessment_evaluatedAt_idx" ON "ClaimReadinessAssessment"("evaluatedAt");

-- CreateIndex
CREATE INDEX "InventoryItem_itemType_status_idx" ON "InventoryItem"("itemType", "status");

-- CreateIndex
CREATE INDEX "InventoryItem_category_idx" ON "InventoryItem"("category");

-- CreateIndex
CREATE UNIQUE INDEX "InventoryItem_organizationId_sku_key" ON "InventoryItem"("organizationId", "sku");

-- CreateIndex
CREATE INDEX "FacilityInventory_facilityId_currentQuantity_idx" ON "FacilityInventory"("facilityId", "currentQuantity");

-- CreateIndex
CREATE UNIQUE INDEX "FacilityInventory_facilityId_inventoryItemId_key" ON "FacilityInventory"("facilityId", "inventoryItemId");

-- CreateIndex
CREATE INDEX "InventoryBatch_facilityInventoryId_expiryDate_idx" ON "InventoryBatch"("facilityInventoryId", "expiryDate");

-- CreateIndex
CREATE INDEX "InventoryBatch_status_expiryDate_idx" ON "InventoryBatch"("status", "expiryDate");

-- CreateIndex
CREATE INDEX "InventoryBatch_supplierId_idx" ON "InventoryBatch"("supplierId");

-- CreateIndex
CREATE INDEX "InventoryTransaction_facilityId_transactionAt_idx" ON "InventoryTransaction"("facilityId", "transactionAt");

-- CreateIndex
CREATE INDEX "InventoryTransaction_inventoryItemId_idx" ON "InventoryTransaction"("inventoryItemId");

-- CreateIndex
CREATE INDEX "InventoryTransaction_transactionType_transactionAt_idx" ON "InventoryTransaction"("transactionType", "transactionAt");

-- CreateIndex
CREATE INDEX "InventoryTransaction_batchId_idx" ON "InventoryTransaction"("batchId");

-- CreateIndex
CREATE INDEX "Supplier_organizationId_status_idx" ON "Supplier"("organizationId", "status");

-- CreateIndex
CREATE INDEX "Supplier_organizationId_category_idx" ON "Supplier"("organizationId", "category");

-- CreateIndex
CREATE INDEX "Supplier_organizationId_supplierType_idx" ON "Supplier"("organizationId", "supplierType");

-- CreateIndex
CREATE INDEX "Supplier_organizationId_isPreferred_idx" ON "Supplier"("organizationId", "isPreferred");

-- CreateIndex
CREATE INDEX "Supplier_organizationId_complianceStatus_idx" ON "Supplier"("organizationId", "complianceStatus");

-- CreateIndex
CREATE UNIQUE INDEX "Supplier_organizationId_code_key" ON "Supplier"("organizationId", "code");

-- CreateIndex
CREATE INDEX "SupplierContact_supplierId_isPrimary_idx" ON "SupplierContact"("supplierId", "isPrimary");

-- CreateIndex
CREATE INDEX "SupplierContact_supplierId_status_idx" ON "SupplierContact"("supplierId", "status");

-- CreateIndex
CREATE INDEX "SupplierDocument_supplierId_verificationStatus_idx" ON "SupplierDocument"("supplierId", "verificationStatus");

-- CreateIndex
CREATE INDEX "SupplierDocument_supplierId_expiryDate_idx" ON "SupplierDocument"("supplierId", "expiryDate");

-- CreateIndex
CREATE INDEX "SupplierProduct_supplierId_isPreferred_idx" ON "SupplierProduct"("supplierId", "isPreferred");

-- CreateIndex
CREATE INDEX "SupplierProduct_inventoryItemId_idx" ON "SupplierProduct"("inventoryItemId");

-- CreateIndex
CREATE UNIQUE INDEX "SupplierProduct_supplierId_inventoryItemId_key" ON "SupplierProduct"("supplierId", "inventoryItemId");

-- CreateIndex
CREATE INDEX "SupplierEvaluation_supplierId_evaluationPeriod_idx" ON "SupplierEvaluation"("supplierId", "evaluationPeriod");

-- CreateIndex
CREATE INDEX "SupplierEvaluation_supplierId_criteria_idx" ON "SupplierEvaluation"("supplierId", "criteria");

-- CreateIndex
CREATE INDEX "SupplierComplaint_supplierId_status_idx" ON "SupplierComplaint"("supplierId", "status");

-- CreateIndex
CREATE INDEX "SupplierComplaint_supplierId_severity_idx" ON "SupplierComplaint"("supplierId", "severity");

-- CreateIndex
CREATE INDEX "PurchaseOrder_supplierId_status_idx" ON "PurchaseOrder"("supplierId", "status");

-- CreateIndex
CREATE INDEX "PurchaseOrder_facilityId_status_idx" ON "PurchaseOrder"("facilityId", "status");

-- CreateIndex
CREATE INDEX "PurchaseOrder_status_idx" ON "PurchaseOrder"("status");

-- CreateIndex
CREATE INDEX "PurchaseOrder_priority_idx" ON "PurchaseOrder"("priority");

-- CreateIndex
CREATE INDEX "PurchaseOrder_expectedDeliveryDate_idx" ON "PurchaseOrder"("expectedDeliveryDate");

-- CreateIndex
CREATE UNIQUE INDEX "PurchaseOrder_facilityId_purchaseOrderNumber_key" ON "PurchaseOrder"("facilityId", "purchaseOrderNumber");

-- CreateIndex
CREATE INDEX "PurchaseOrderItem_purchaseOrderId_idx" ON "PurchaseOrderItem"("purchaseOrderId");

-- CreateIndex
CREATE INDEX "PurchaseOrderItem_inventoryItemId_idx" ON "PurchaseOrderItem"("inventoryItemId");

-- CreateIndex
CREATE INDEX "StockTransfer_fromFacilityId_status_idx" ON "StockTransfer"("fromFacilityId", "status");

-- CreateIndex
CREATE INDEX "StockTransfer_toFacilityId_status_idx" ON "StockTransfer"("toFacilityId", "status");

-- CreateIndex
CREATE INDEX "StockTransfer_status_createdAt_idx" ON "StockTransfer"("status", "createdAt");

-- CreateIndex
CREATE INDEX "StockTransfer_transferType_status_idx" ON "StockTransfer"("transferType", "status");

-- CreateIndex
CREATE INDEX "StockTransfer_priority_status_idx" ON "StockTransfer"("priority", "status");

-- CreateIndex
CREATE UNIQUE INDEX "StockTransfer_transferNumber_key" ON "StockTransfer"("transferNumber");

-- CreateIndex
CREATE INDEX "StockTransferItem_stockTransferId_idx" ON "StockTransferItem"("stockTransferId");

-- CreateIndex
CREATE INDEX "StockTransferItem_inventoryItemId_idx" ON "StockTransferItem"("inventoryItemId");

-- CreateIndex
CREATE INDEX "StockAdjustment_facilityId_status_idx" ON "StockAdjustment"("facilityId", "status");

-- CreateIndex
CREATE INDEX "StockAdjustment_inventoryItemId_idx" ON "StockAdjustment"("inventoryItemId");

-- CreateIndex
CREATE INDEX "StockAdjustment_adjustmentType_status_idx" ON "StockAdjustment"("adjustmentType", "status");

-- CreateIndex
CREATE UNIQUE INDEX "Equipment_organizationId_assetNumber_key" ON "Equipment"("organizationId", "assetNumber");

-- CreateIndex
CREATE INDEX "StaffShift_staffId_shiftDate_idx" ON "StaffShift"("staffId", "shiftDate");

-- CreateIndex
CREATE INDEX "StaffShift_facilityId_shiftDate_status_idx" ON "StaffShift"("facilityId", "shiftDate", "status");

-- CreateIndex
CREATE INDEX "StaffShift_departmentId_shiftDate_idx" ON "StaffShift"("departmentId", "shiftDate");

-- CreateIndex
CREATE INDEX "StaffShift_rosterId_idx" ON "StaffShift"("rosterId");

-- CreateIndex
CREATE INDEX "StaffShift_shiftTypeId_idx" ON "StaffShift"("shiftTypeId");

-- CreateIndex
CREATE INDEX "LeaveRecord_staffId_startDate_idx" ON "LeaveRecord"("staffId", "startDate");

-- CreateIndex
CREATE INDEX "LeaveRecord_facilityId_startDate_idx" ON "LeaveRecord"("facilityId", "startDate");

-- CreateIndex
CREATE INDEX "LeaveRecord_departmentId_startDate_idx" ON "LeaveRecord"("departmentId", "startDate");

-- CreateIndex
CREATE INDEX "LeaveRecord_status_startDate_idx" ON "LeaveRecord"("status", "startDate");

-- CreateIndex
CREATE INDEX "LeaveRecord_leaveType_idx" ON "LeaveRecord"("leaveType");

-- CreateIndex
CREATE INDEX "ShiftType_organizationId_active_idx" ON "ShiftType"("organizationId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "ShiftType_organizationId_code_key" ON "ShiftType"("organizationId", "code");

-- CreateIndex
CREATE INDEX "ShiftTemplate_facilityId_departmentId_idx" ON "ShiftTemplate"("facilityId", "departmentId");

-- CreateIndex
CREATE UNIQUE INDEX "ShiftTemplate_organizationId_code_key" ON "ShiftTemplate"("organizationId", "code");

-- CreateIndex
CREATE INDEX "Roster_facilityId_status_idx" ON "Roster"("facilityId", "status");

-- CreateIndex
CREATE INDEX "Roster_departmentId_startDate_idx" ON "Roster"("departmentId", "startDate");

-- CreateIndex
CREATE UNIQUE INDEX "RosterVersion_rosterId_versionNumber_key" ON "RosterVersion"("rosterId", "versionNumber");

-- CreateIndex
CREATE INDEX "ShiftSwap_organizationId_status_idx" ON "ShiftSwap"("organizationId", "status");

-- CreateIndex
CREATE INDEX "ShiftSwap_requesterStaffId_idx" ON "ShiftSwap"("requesterStaffId");

-- CreateIndex
CREATE INDEX "ShiftSwap_targetStaffId_idx" ON "ShiftSwap"("targetStaffId");

-- CreateIndex
CREATE INDEX "CoverageRequest_facilityId_status_idx" ON "CoverageRequest"("facilityId", "status");

-- CreateIndex
CREATE INDEX "CoverageRequest_departmentId_status_idx" ON "CoverageRequest"("departmentId", "status");

-- CreateIndex
CREATE INDEX "CoverageRequest_shiftDate_status_idx" ON "CoverageRequest"("shiftDate", "status");

-- CreateIndex
CREATE INDEX "StaffAvailability_facilityId_date_idx" ON "StaffAvailability"("facilityId", "date");

-- CreateIndex
CREATE UNIQUE INDEX "StaffAvailability_staffId_date_key" ON "StaffAvailability"("staffId", "date");

-- CreateIndex
CREATE UNIQUE INDEX "StaffPreference_staffId_key" ON "StaffPreference"("staffId");

-- CreateIndex
CREATE INDEX "OnCallSchedule_facilityId_startDate_status_idx" ON "OnCallSchedule"("facilityId", "startDate", "status");

-- CreateIndex
CREATE INDEX "OnCallSchedule_departmentId_startDate_idx" ON "OnCallSchedule"("departmentId", "startDate");

-- CreateIndex
CREATE INDEX "OnCallSchedule_staffId_startDate_idx" ON "OnCallSchedule"("staffId", "startDate");

-- CreateIndex
CREATE INDEX "LeaveType_organizationId_active_idx" ON "LeaveType"("organizationId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "LeaveType_organizationId_code_key" ON "LeaveType"("organizationId", "code");

-- CreateIndex
CREATE INDEX "LeavePolicy_organizationId_leaveTypeId_idx" ON "LeavePolicy"("organizationId", "leaveTypeId");

-- CreateIndex
CREATE INDEX "LeaveBalance_organizationId_leaveYear_idx" ON "LeaveBalance"("organizationId", "leaveYear");

-- CreateIndex
CREATE INDEX "LeaveBalance_staffId_idx" ON "LeaveBalance"("staffId");

-- CreateIndex
CREATE UNIQUE INDEX "LeaveBalance_staffId_leaveTypeId_leaveYear_key" ON "LeaveBalance"("staffId", "leaveTypeId", "leaveYear");

-- CreateIndex
CREATE INDEX "LeaveBalanceAdjustment_leaveBalanceId_createdAt_idx" ON "LeaveBalanceAdjustment"("leaveBalanceId", "createdAt");

-- CreateIndex
CREATE INDEX "LeaveBalanceAdjustment_staffId_createdAt_idx" ON "LeaveBalanceAdjustment"("staffId", "createdAt");

-- CreateIndex
CREATE INDEX "Holiday_organizationId_date_idx" ON "Holiday"("organizationId", "date");

-- CreateIndex
CREATE UNIQUE INDEX "Holiday_organizationId_date_name_key" ON "Holiday"("organizationId", "date", "name");

-- CreateIndex
CREATE INDEX "StaffingRequirement_facilityId_departmentId_shiftType_idx" ON "StaffingRequirement"("facilityId", "departmentId", "shiftType");

-- CreateIndex
CREATE INDEX "ShiftChangeRequest_organizationId_status_idx" ON "ShiftChangeRequest"("organizationId", "status");

-- CreateIndex
CREATE INDEX "ShiftChangeRequest_staffId_createdAt_idx" ON "ShiftChangeRequest"("staffId", "createdAt");

-- CreateIndex
CREATE INDEX "ShiftBreak_shiftId_idx" ON "ShiftBreak"("shiftId");

-- CreateIndex
CREATE INDEX "Document_patientId_idx" ON "Document"("patientId");

-- CreateIndex
CREATE INDEX "Consent_patientId_idx" ON "Consent"("patientId");

-- CreateIndex
CREATE INDEX "Task_assignedToId_status_idx" ON "Task"("assignedToId", "status");

-- CreateIndex
CREATE INDEX "Task_facilityId_status_idx" ON "Task"("facilityId", "status");

-- CreateIndex
CREATE INDEX "Notification_userId_readAt_idx" ON "Notification"("userId", "readAt");

-- CreateIndex
CREATE INDEX "AuditLog_userId_createdAt_idx" ON "AuditLog"("userId", "createdAt");

-- CreateIndex
CREATE INDEX "AuditLog_resourceType_resourceId_idx" ON "AuditLog"("resourceType", "resourceId");

-- CreateIndex
CREATE INDEX "AuditLog_facilityId_createdAt_idx" ON "AuditLog"("facilityId", "createdAt");

-- CreateIndex
CREATE INDEX "PatientAccessLog_patientId_accessedAt_idx" ON "PatientAccessLog"("patientId", "accessedAt");

-- CreateIndex
CREATE INDEX "BreakGlassEvent_patientId_startedAt_idx" ON "BreakGlassEvent"("patientId", "startedAt");

-- CreateIndex
CREATE UNIQUE INDEX "SystemSetting_organizationId_facilityId_settingKey_key" ON "SystemSetting"("organizationId", "facilityId", "settingKey");

-- CreateIndex
CREATE INDEX "StaffAttendance_facilityId_date_idx" ON "StaffAttendance"("facilityId", "date");

-- CreateIndex
CREATE INDEX "StaffAttendance_departmentId_date_idx" ON "StaffAttendance"("departmentId", "date");

-- CreateIndex
CREATE INDEX "StaffAttendance_staffId_date_idx" ON "StaffAttendance"("staffId", "date");

-- CreateIndex
CREATE INDEX "StaffAttendance_shiftId_idx" ON "StaffAttendance"("shiftId");

-- CreateIndex
CREATE INDEX "StaffAttendance_status_date_idx" ON "StaffAttendance"("status", "date");

-- CreateIndex
CREATE INDEX "StaffAttendance_periodId_idx" ON "StaffAttendance"("periodId");

-- CreateIndex
CREATE UNIQUE INDEX "StaffAttendance_staffId_date_key" ON "StaffAttendance"("staffId", "date");

-- CreateIndex
CREATE INDEX "AttendanceEvent_staffId_timestamp_idx" ON "AttendanceEvent"("staffId", "timestamp");

-- CreateIndex
CREATE INDEX "AttendanceEvent_facilityId_timestamp_idx" ON "AttendanceEvent"("facilityId", "timestamp");

-- CreateIndex
CREATE INDEX "AttendanceEvent_processingStatus_idx" ON "AttendanceEvent"("processingStatus");

-- CreateIndex
CREATE INDEX "AttendanceCorrection_organizationId_status_idx" ON "AttendanceCorrection"("organizationId", "status");

-- CreateIndex
CREATE INDEX "AttendanceCorrection_staffId_createdAt_idx" ON "AttendanceCorrection"("staffId", "createdAt");

-- CreateIndex
CREATE INDEX "AttendanceCorrection_attendanceId_idx" ON "AttendanceCorrection"("attendanceId");

-- CreateIndex
CREATE INDEX "AttendanceException_organizationId_status_idx" ON "AttendanceException"("organizationId", "status");

-- CreateIndex
CREATE INDEX "AttendanceException_facilityId_date_status_idx" ON "AttendanceException"("facilityId", "date", "status");

-- CreateIndex
CREATE INDEX "AttendanceException_staffId_date_idx" ON "AttendanceException"("staffId", "date");

-- CreateIndex
CREATE INDEX "AttendanceException_exceptionType_status_idx" ON "AttendanceException"("exceptionType", "status");

-- CreateIndex
CREATE INDEX "AttendancePolicy_organizationId_active_idx" ON "AttendancePolicy"("organizationId", "active");

-- CreateIndex
CREATE INDEX "AttendancePolicy_facilityId_departmentId_idx" ON "AttendancePolicy"("facilityId", "departmentId");

-- CreateIndex
CREATE INDEX "AttendancePeriod_organizationId_status_idx" ON "AttendancePeriod"("organizationId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "AttendancePeriod_organizationId_facilityId_startDate_endDat_key" ON "AttendancePeriod"("organizationId", "facilityId", "startDate", "endDate");

-- CreateIndex
CREATE INDEX "OvertimeRecord_organizationId_status_idx" ON "OvertimeRecord"("organizationId", "status");

-- CreateIndex
CREATE INDEX "OvertimeRecord_staffId_date_idx" ON "OvertimeRecord"("staffId", "date");

-- CreateIndex
CREATE INDEX "OvertimeRecord_facilityId_date_idx" ON "OvertimeRecord"("facilityId", "date");

-- CreateIndex
CREATE INDEX "OvertimeRecord_category_status_idx" ON "OvertimeRecord"("category", "status");

-- CreateIndex
CREATE INDEX "TrainingRecord_staffId_idx" ON "TrainingRecord"("staffId");

-- CreateIndex
CREATE INDEX "Certification_staffId_idx" ON "Certification"("staffId");

-- CreateIndex
CREATE INDEX "Certification_organizationId_status_idx" ON "Certification"("organizationId", "status");

-- CreateIndex
CREATE INDEX "Certification_expiryDate_idx" ON "Certification"("expiryDate");

-- CreateIndex
CREATE INDEX "Certification_facilityId_status_idx" ON "Certification"("facilityId", "status");

-- CreateIndex
CREATE INDEX "Certification_departmentId_idx" ON "Certification"("departmentId");

-- CreateIndex
CREATE INDEX "Certification_verificationStatus_idx" ON "Certification"("verificationStatus");

-- CreateIndex
CREATE INDEX "Certification_certificationTypeId_idx" ON "Certification"("certificationTypeId");

-- CreateIndex
CREATE INDEX "CertificationType_organizationId_active_idx" ON "CertificationType"("organizationId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "CertificationType_organizationId_code_key" ON "CertificationType"("organizationId", "code");

-- CreateIndex
CREATE INDEX "CertificationIssuer_organizationId_active_idx" ON "CertificationIssuer"("organizationId", "active");

-- CreateIndex
CREATE INDEX "CertificationRequirement_organizationId_idx" ON "CertificationRequirement"("organizationId");

-- CreateIndex
CREATE INDEX "CertificationRequirement_facilityId_departmentId_idx" ON "CertificationRequirement"("facilityId", "departmentId");

-- CreateIndex
CREATE INDEX "CertificationRequirement_certificationTypeId_idx" ON "CertificationRequirement"("certificationTypeId");

-- CreateIndex
CREATE INDEX "CertificationVerification_certificationId_createdAt_idx" ON "CertificationVerification"("certificationId", "createdAt");

-- CreateIndex
CREATE INDEX "CertificationRenewal_certificationId_idx" ON "CertificationRenewal"("certificationId");

-- CreateIndex
CREATE INDEX "CertificationRenewal_staffId_idx" ON "CertificationRenewal"("staffId");

-- CreateIndex
CREATE INDEX "CertificationStatusHistory_certificationId_createdAt_idx" ON "CertificationStatusHistory"("certificationId", "createdAt");

-- CreateIndex
CREATE INDEX "PayrollPeriod_organizationId_status_idx" ON "PayrollPeriod"("organizationId", "status");

-- CreateIndex
CREATE INDEX "PayrollPeriod_facilityId_status_idx" ON "PayrollPeriod"("facilityId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "PayrollPeriod_organizationId_facilityId_startDate_endDate_key" ON "PayrollPeriod"("organizationId", "facilityId", "startDate", "endDate");

-- CreateIndex
CREATE INDEX "PayrollRun_organizationId_status_idx" ON "PayrollRun"("organizationId", "status");

-- CreateIndex
CREATE INDEX "PayrollRun_staffId_payrollPeriodId_idx" ON "PayrollRun"("staffId", "payrollPeriodId");

-- CreateIndex
CREATE INDEX "PayrollRun_paymentStatus_idx" ON "PayrollRun"("paymentStatus");

-- CreateIndex
CREATE UNIQUE INDEX "PayrollRun_payrollPeriodId_staffId_key" ON "PayrollRun"("payrollPeriodId", "staffId");

-- CreateIndex
CREATE INDEX "PayrollItem_payrollRunId_idx" ON "PayrollItem"("payrollRunId");

-- CreateIndex
CREATE INDEX "PayrollItem_staffId_idx" ON "PayrollItem"("staffId");

-- CreateIndex
CREATE INDEX "SalaryStructure_organizationId_active_idx" ON "SalaryStructure"("organizationId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "SalaryStructure_organizationId_code_key" ON "SalaryStructure"("organizationId", "code");

-- CreateIndex
CREATE INDEX "CompensationComponent_salaryStructureId_idx" ON "CompensationComponent"("salaryStructureId");

-- CreateIndex
CREATE UNIQUE INDEX "StaffPayrollProfile_staffId_key" ON "StaffPayrollProfile"("staffId");

-- CreateIndex
CREATE INDEX "StaffPayrollProfile_organizationId_payrollStatus_idx" ON "StaffPayrollProfile"("organizationId", "payrollStatus");

-- CreateIndex
CREATE INDEX "StaffPayrollProfile_facilityId_idx" ON "StaffPayrollProfile"("facilityId");

-- CreateIndex
CREATE INDEX "Allowance_organizationId_active_idx" ON "Allowance"("organizationId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "Allowance_organizationId_code_key" ON "Allowance"("organizationId", "code");

-- CreateIndex
CREATE INDEX "Deduction_organizationId_active_idx" ON "Deduction"("organizationId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "Deduction_organizationId_code_key" ON "Deduction"("organizationId", "code");

-- CreateIndex
CREATE INDEX "StaffLoan_organizationId_status_idx" ON "StaffLoan"("organizationId", "status");

-- CreateIndex
CREATE INDEX "StaffLoan_staffId_status_idx" ON "StaffLoan"("staffId", "status");

-- CreateIndex
CREATE INDEX "SalaryAdvance_organizationId_status_idx" ON "SalaryAdvance"("organizationId", "status");

-- CreateIndex
CREATE INDEX "SalaryAdvance_staffId_status_idx" ON "SalaryAdvance"("staffId", "status");

-- CreateIndex
CREATE INDEX "PayrollAdjustment_organizationId_status_idx" ON "PayrollAdjustment"("organizationId", "status");

-- CreateIndex
CREATE INDEX "PayrollAdjustment_staffId_idx" ON "PayrollAdjustment"("staffId");

-- CreateIndex
CREATE INDEX "StatutoryRule_organizationId_active_idx" ON "StatutoryRule"("organizationId", "active");

-- CreateIndex
CREATE INDEX "StatutoryRule_ruleType_active_idx" ON "StatutoryRule"("ruleType", "active");

-- CreateIndex
CREATE UNIQUE INDEX "StatutoryRule_organizationId_code_key" ON "StatutoryRule"("organizationId", "code");

-- CreateIndex
CREATE INDEX "CostCenter_organizationId_active_idx" ON "CostCenter"("organizationId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "CostCenter_organizationId_code_key" ON "CostCenter"("organizationId", "code");

-- CreateIndex
CREATE INDEX "TrainingProgram_organizationId_status_idx" ON "TrainingProgram"("organizationId", "status");

-- CreateIndex
CREATE INDEX "TrainingProgram_facilityId_departmentId_idx" ON "TrainingProgram"("facilityId", "departmentId");

-- CreateIndex
CREATE UNIQUE INDEX "TrainingProgram_organizationId_code_key" ON "TrainingProgram"("organizationId", "code");

-- CreateIndex
CREATE INDEX "TrainingProvider_organizationId_active_idx" ON "TrainingProvider"("organizationId", "active");

-- CreateIndex
CREATE UNIQUE INDEX "Trainer_staffId_key" ON "Trainer"("staffId");

-- CreateIndex
CREATE INDEX "Trainer_organizationId_status_idx" ON "Trainer"("organizationId", "status");

-- CreateIndex
CREATE INDEX "Trainer_staffId_idx" ON "Trainer"("staffId");

-- CreateIndex
CREATE INDEX "TrainingSession_organizationId_sessionDate_idx" ON "TrainingSession"("organizationId", "sessionDate");

-- CreateIndex
CREATE INDEX "TrainingSession_programId_idx" ON "TrainingSession"("programId");

-- CreateIndex
CREATE INDEX "TrainingSession_facilityId_sessionDate_idx" ON "TrainingSession"("facilityId", "sessionDate");

-- CreateIndex
CREATE INDEX "TrainingEnrollment_organizationId_status_idx" ON "TrainingEnrollment"("organizationId", "status");

-- CreateIndex
CREATE INDEX "TrainingEnrollment_staffId_status_idx" ON "TrainingEnrollment"("staffId", "status");

-- CreateIndex
CREATE INDEX "TrainingEnrollment_sessionId_status_idx" ON "TrainingEnrollment"("sessionId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "TrainingEnrollment_staffId_sessionId_key" ON "TrainingEnrollment"("staffId", "sessionId");

-- CreateIndex
CREATE UNIQUE INDEX "TrainingAttendance_enrollmentId_key" ON "TrainingAttendance"("enrollmentId");

-- CreateIndex
CREATE INDEX "TrainingAttendance_staffId_sessionId_idx" ON "TrainingAttendance"("staffId", "sessionId");

-- CreateIndex
CREATE INDEX "TrainingAttendance_organizationId_status_idx" ON "TrainingAttendance"("organizationId", "status");

-- CreateIndex
CREATE INDEX "TrainingAssessment_organizationId_programId_idx" ON "TrainingAssessment"("organizationId", "programId");

-- CreateIndex
CREATE INDEX "TrainingAssessmentResult_organizationId_staffId_idx" ON "TrainingAssessmentResult"("organizationId", "staffId");

-- CreateIndex
CREATE INDEX "TrainingAssessmentResult_assessmentId_idx" ON "TrainingAssessmentResult"("assessmentId");

-- CreateIndex
CREATE UNIQUE INDEX "TrainingCertificate_certificateNumber_key" ON "TrainingCertificate"("certificateNumber");

-- CreateIndex
CREATE UNIQUE INDEX "TrainingCertificate_verificationCode_key" ON "TrainingCertificate"("verificationCode");

-- CreateIndex
CREATE INDEX "TrainingCertificate_organizationId_status_idx" ON "TrainingCertificate"("organizationId", "status");

-- CreateIndex
CREATE INDEX "TrainingCertificate_staffId_idx" ON "TrainingCertificate"("staffId");

-- CreateIndex
CREATE INDEX "TrainingCertificate_expiryDate_idx" ON "TrainingCertificate"("expiryDate");

-- CreateIndex
CREATE INDEX "TrainingCertificate_programId_idx" ON "TrainingCertificate"("programId");

-- CreateIndex
CREATE INDEX "TrainingRequirement_organizationId_idx" ON "TrainingRequirement"("organizationId");

-- CreateIndex
CREATE INDEX "TrainingRequirement_facilityId_departmentId_idx" ON "TrainingRequirement"("facilityId", "departmentId");

-- CreateIndex
CREATE INDEX "TrainingRequest_organizationId_status_idx" ON "TrainingRequest"("organizationId", "status");

-- CreateIndex
CREATE INDEX "TrainingRequest_facilityId_departmentId_idx" ON "TrainingRequest"("facilityId", "departmentId");

-- CreateIndex
CREATE INDEX "TrainingPlan_organizationId_year_idx" ON "TrainingPlan"("organizationId", "year");

-- CreateIndex
CREATE INDEX "TrainingPlan_facilityId_departmentId_idx" ON "TrainingPlan"("facilityId", "departmentId");

-- CreateIndex
CREATE INDEX "TrainingEvaluation_organizationId_programId_idx" ON "TrainingEvaluation"("organizationId", "programId");

-- CreateIndex
CREATE INDEX "TrainingEvaluation_staffId_idx" ON "TrainingEvaluation"("staffId");

-- CreateIndex
CREATE UNIQUE INDEX "TrainingCompetency_organizationId_name_key" ON "TrainingCompetency"("organizationId", "name");

-- CreateIndex
CREATE INDEX "StaffCompetency_organizationId_level_idx" ON "StaffCompetency"("organizationId", "level");

-- CreateIndex
CREATE INDEX "StaffCompetency_staffId_idx" ON "StaffCompetency"("staffId");

-- CreateIndex
CREATE UNIQUE INDEX "StaffCompetency_staffId_competencyId_key" ON "StaffCompetency"("staffId", "competencyId");

-- CreateIndex
CREATE INDEX "CPDRecord_organizationId_staffId_idx" ON "CPDRecord"("organizationId", "staffId");

-- CreateIndex
CREATE INDEX "CPDRecord_staffId_activityDate_idx" ON "CPDRecord"("staffId", "activityDate");

-- CreateIndex
CREATE INDEX "ExternalTrainingRecord_organizationId_staffId_idx" ON "ExternalTrainingRecord"("organizationId", "staffId");

-- CreateIndex
CREATE INDEX "ExternalTrainingRecord_staffId_trainingDate_idx" ON "ExternalTrainingRecord"("staffId", "trainingDate");

-- CreateIndex
CREATE INDEX "IncidentReport_facilityId_createdAt_idx" ON "IncidentReport"("facilityId", "createdAt");

-- CreateIndex
CREATE INDEX "ShiftHandover_facilityId_handoverDate_idx" ON "ShiftHandover"("facilityId", "handoverDate");

-- CreateIndex
CREATE INDEX "WardRound_facilityId_roundDate_idx" ON "WardRound"("facilityId", "roundDate");

-- CreateIndex
CREATE INDEX "WardRound_facilityId_status_idx" ON "WardRound"("facilityId", "status");

-- CreateIndex
CREATE INDEX "WardRound_wardId_roundDate_idx" ON "WardRound"("wardId", "roundDate");

-- CreateIndex
CREATE INDEX "WardRound_status_roundDate_idx" ON "WardRound"("status", "roundDate");

-- CreateIndex
CREATE INDEX "WardRoundPatient_wardRoundId_idx" ON "WardRoundPatient"("wardRoundId");

-- CreateIndex
CREATE INDEX "WardRoundPatient_patientId_idx" ON "WardRoundPatient"("patientId");

-- CreateIndex
CREATE INDEX "WardRoundPatient_reviewStatus_idx" ON "WardRoundPatient"("reviewStatus");

-- CreateIndex
CREATE INDEX "WardRoundNote_wardRoundId_idx" ON "WardRoundNote"("wardRoundId");

-- CreateIndex
CREATE INDEX "WardRoundNote_patientId_idx" ON "WardRoundNote"("patientId");

-- CreateIndex
CREATE INDEX "WardRoundNote_status_idx" ON "WardRoundNote"("status");

-- CreateIndex
CREATE INDEX "WardRoundAction_wardRoundId_idx" ON "WardRoundAction"("wardRoundId");

-- CreateIndex
CREATE INDEX "WardRoundAction_patientId_idx" ON "WardRoundAction"("patientId");

-- CreateIndex
CREATE INDEX "WardRoundAction_status_idx" ON "WardRoundAction"("status");

-- CreateIndex
CREATE INDEX "WardRoundAction_assignedToId_idx" ON "WardRoundAction"("assignedToId");

-- CreateIndex
CREATE INDEX "WardRoundParticipant_wardRoundId_idx" ON "WardRoundParticipant"("wardRoundId");

-- CreateIndex
CREATE INDEX "WardRoundParticipant_userId_idx" ON "WardRoundParticipant"("userId");

-- CreateIndex
CREATE INDEX "IntakeOutputEntry_patientId_eventAt_idx" ON "IntakeOutputEntry"("patientId", "eventAt");

-- CreateIndex
CREATE INDEX "IntakeOutputEntry_patientId_recordedAt_idx" ON "IntakeOutputEntry"("patientId", "recordedAt");

-- CreateIndex
CREATE INDEX "IntakeOutputEntry_admissionId_eventAt_idx" ON "IntakeOutputEntry"("admissionId", "eventAt");

-- CreateIndex
CREATE INDEX "IntakeOutputEntry_facilityId_eventAt_idx" ON "IntakeOutputEntry"("facilityId", "eventAt");

-- CreateIndex
CREATE INDEX "IntakeOutputEntry_status_idx" ON "IntakeOutputEntry"("status");

-- CreateIndex
CREATE INDEX "IntakeOutputEntry_category_idx" ON "IntakeOutputEntry"("category");

-- CreateIndex
CREATE INDEX "IntakeOutputEntry_entryType_eventAt_idx" ON "IntakeOutputEntry"("entryType", "eventAt");

-- CreateIndex
CREATE INDEX "IntakeOutputMonitoringPeriod_facilityId_status_idx" ON "IntakeOutputMonitoringPeriod"("facilityId", "status");

-- CreateIndex
CREATE INDEX "IntakeOutputMonitoringPeriod_patientId_status_idx" ON "IntakeOutputMonitoringPeriod"("patientId", "status");

-- CreateIndex
CREATE INDEX "IntakeOutputMonitoringPeriod_admissionId_idx" ON "IntakeOutputMonitoringPeriod"("admissionId");

-- CreateIndex
CREATE INDEX "IntakeOutputAlertConfig_facilityId_active_idx" ON "IntakeOutputAlertConfig"("facilityId", "active");

-- CreateIndex
CREATE INDEX "IntakeOutputAlertConfig_code_idx" ON "IntakeOutputAlertConfig"("code");

-- CreateIndex
CREATE INDEX "IntakeOutputAlert_facilityId_status_idx" ON "IntakeOutputAlert"("facilityId", "status");

-- CreateIndex
CREATE INDEX "IntakeOutputAlert_patientId_status_idx" ON "IntakeOutputAlert"("patientId", "status");

-- CreateIndex
CREATE INDEX "IntakeOutputAlert_code_status_idx" ON "IntakeOutputAlert"("code", "status");

-- CreateIndex
CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON "Account"("provider", "providerAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "Session"("sessionToken");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON "VerificationToken"("identifier", "token");

-- CreateIndex
CREATE UNIQUE INDEX "MortuaryAdmission_admissionNumber_key" ON "MortuaryAdmission"("admissionNumber");

-- CreateIndex
CREATE UNIQUE INDEX "MortuaryAdmission_bodyTag_key" ON "MortuaryAdmission"("bodyTag");

-- CreateIndex
CREATE INDEX "MortuaryAdmission_organizationId_facilityId_idx" ON "MortuaryAdmission"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "MortuaryAdmission_patientId_idx" ON "MortuaryAdmission"("patientId");

-- CreateIndex
CREATE INDEX "MortuaryAdmission_admissionStatus_idx" ON "MortuaryAdmission"("admissionStatus");

-- CreateIndex
CREATE UNIQUE INDEX "BloodDonor_donorNumber_key" ON "BloodDonor"("donorNumber");

-- CreateIndex
CREATE INDEX "BloodDonor_organizationId_facilityId_idx" ON "BloodDonor"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "BloodDonor_bloodGroup_idx" ON "BloodDonor"("bloodGroup");

-- CreateIndex
CREATE UNIQUE INDEX "BloodUnit_unitNumber_key" ON "BloodUnit"("unitNumber");

-- CreateIndex
CREATE INDEX "BloodUnit_organizationId_facilityId_idx" ON "BloodUnit"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "BloodUnit_status_idx" ON "BloodUnit"("status");

-- CreateIndex
CREATE INDEX "BloodUnit_bloodGroup_idx" ON "BloodUnit"("bloodGroup");

-- CreateIndex
CREATE INDEX "BloodUnit_expiryDate_idx" ON "BloodUnit"("expiryDate");

-- CreateIndex
CREATE UNIQUE INDEX "BloodTransfusion_transfusionNumber_key" ON "BloodTransfusion"("transfusionNumber");

-- CreateIndex
CREATE INDEX "BloodTransfusion_organizationId_facilityId_idx" ON "BloodTransfusion"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "BloodTransfusion_patientId_idx" ON "BloodTransfusion"("patientId");

-- CreateIndex
CREATE UNIQUE INDEX "TheatreCase_caseNumber_key" ON "TheatreCase"("caseNumber");

-- CreateIndex
CREATE INDEX "TheatreCase_organizationId_facilityId_idx" ON "TheatreCase"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "TheatreCase_patientId_idx" ON "TheatreCase"("patientId");

-- CreateIndex
CREATE INDEX "TheatreCase_status_idx" ON "TheatreCase"("status");

-- CreateIndex
CREATE INDEX "TheatreCase_scheduledStart_idx" ON "TheatreCase"("scheduledStart");

-- CreateIndex
CREATE UNIQUE INDEX "CriticalCareAdmission_admissionNumber_key" ON "CriticalCareAdmission"("admissionNumber");

-- CreateIndex
CREATE INDEX "CriticalCareAdmission_organizationId_facilityId_idx" ON "CriticalCareAdmission"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "CriticalCareAdmission_patientId_idx" ON "CriticalCareAdmission"("patientId");

-- CreateIndex
CREATE INDEX "CriticalCareAdmission_unitType_status_idx" ON "CriticalCareAdmission"("unitType", "status");

-- CreateIndex
CREATE UNIQUE INDEX "SpecialtyEncounter_encounterNumber_key" ON "SpecialtyEncounter"("encounterNumber");

-- CreateIndex
CREATE INDEX "SpecialtyEncounter_organizationId_facilityId_idx" ON "SpecialtyEncounter"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "SpecialtyEncounter_departmentCode_idx" ON "SpecialtyEncounter"("departmentCode");

-- CreateIndex
CREATE INDEX "SpecialtyEncounter_patientId_idx" ON "SpecialtyEncounter"("patientId");

-- CreateIndex
CREATE INDEX "SpecialtyEncounter_status_idx" ON "SpecialtyEncounter"("status");

-- CreateIndex
CREATE INDEX "SpecialtyClin_organizationId_facilityId_idx" ON "SpecialtyClin"("organizationId", "facilityId");

-- CreateIndex
CREATE UNIQUE INDEX "SpecialtyClin_organizationId_code_key" ON "SpecialtyClin"("organizationId", "code");

-- CreateIndex
CREATE UNIQUE INDEX "SpecialtyAppointment_appointmentNumber_key" ON "SpecialtyAppointment"("appointmentNumber");

-- CreateIndex
CREATE INDEX "SpecialtyAppointment_organizationId_facilityId_idx" ON "SpecialtyAppointment"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "SpecialtyAppointment_departmentCode_appointmentDate_idx" ON "SpecialtyAppointment"("departmentCode", "appointmentDate");

-- CreateIndex
CREATE INDEX "SpecialtyAppointment_patientId_idx" ON "SpecialtyAppointment"("patientId");

-- CreateIndex
CREATE INDEX "SpecialtyAppointment_status_idx" ON "SpecialtyAppointment"("status");

-- CreateIndex
CREATE INDEX "SpecialtyAppointment_clinicId_idx" ON "SpecialtyAppointment"("clinicId");

-- CreateIndex
CREATE INDEX "SpecialtyProcedure_organizationId_specialtyEncounterId_idx" ON "SpecialtyProcedure"("organizationId", "specialtyEncounterId");

-- CreateIndex
CREATE INDEX "SpecialtyProcedure_status_idx" ON "SpecialtyProcedure"("status");

-- CreateIndex
CREATE INDEX "SpecialtyClinicalNote_specialtyEncounterId_idx" ON "SpecialtyClinicalNote"("specialtyEncounterId");

-- CreateIndex
CREATE INDEX "SpecialtyClinicalNote_organizationId_idx" ON "SpecialtyClinicalNote"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "SpecialtyReferral_referralNumber_key" ON "SpecialtyReferral"("referralNumber");

-- CreateIndex
CREATE INDEX "SpecialtyReferral_organizationId_toDepartmentCode_idx" ON "SpecialtyReferral"("organizationId", "toDepartmentCode");

-- CreateIndex
CREATE INDEX "SpecialtyReferral_status_idx" ON "SpecialtyReferral"("status");

-- CreateIndex
CREATE INDEX "SpecialtyReferral_patientId_idx" ON "SpecialtyReferral"("patientId");

-- CreateIndex
CREATE UNIQUE INDEX "ServiceRequest_requestNumber_key" ON "ServiceRequest"("requestNumber");

-- CreateIndex
CREATE INDEX "ServiceRequest_organizationId_facilityId_idx" ON "ServiceRequest"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "ServiceRequest_serviceType_status_idx" ON "ServiceRequest"("serviceType", "status");

-- CreateIndex
CREATE INDEX "ServiceRequest_patientId_idx" ON "ServiceRequest"("patientId");

-- CreateIndex
CREATE INDEX "ServiceRequest_departmentCode_idx" ON "ServiceRequest"("departmentCode");

-- CreateIndex
CREATE UNIQUE INDEX "PatientFeedback_feedbackNumber_key" ON "PatientFeedback"("feedbackNumber");

-- CreateIndex
CREATE INDEX "PatientFeedback_organizationId_facilityId_idx" ON "PatientFeedback"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "PatientFeedback_feedbackType_status_idx" ON "PatientFeedback"("feedbackType", "status");

-- CreateIndex
CREATE INDEX "PatientFeedback_patientId_idx" ON "PatientFeedback"("patientId");

-- CreateIndex
CREATE UNIQUE INDEX "QualityIndicator_indicatorCode_key" ON "QualityIndicator"("indicatorCode");

-- CreateIndex
CREATE INDEX "QualityIndicator_organizationId_facilityId_idx" ON "QualityIndicator"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "QualityIndicator_category_idx" ON "QualityIndicator"("category");

-- CreateIndex
CREATE INDEX "QualityIndicatorValue_indicatorId_periodStart_idx" ON "QualityIndicatorValue"("indicatorId", "periodStart");

-- CreateIndex
CREATE UNIQUE INDEX "RiskRegister_riskNumber_key" ON "RiskRegister"("riskNumber");

-- CreateIndex
CREATE INDEX "RiskRegister_organizationId_facilityId_idx" ON "RiskRegister"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "RiskRegister_status_idx" ON "RiskRegister"("status");

-- CreateIndex
CREATE INDEX "RiskRegister_riskCategory_idx" ON "RiskRegister"("riskCategory");

-- CreateIndex
CREATE UNIQUE INDEX "LegalCase_caseNumber_key" ON "LegalCase"("caseNumber");

-- CreateIndex
CREATE INDEX "LegalCase_organizationId_facilityId_idx" ON "LegalCase"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "LegalCase_caseType_status_idx" ON "LegalCase"("caseType", "status");

-- CreateIndex
CREATE INDEX "LegalCase_courtDate_idx" ON "LegalCase"("courtDate");

-- CreateIndex
CREATE UNIQUE INDEX "ResearchStudy_studyNumber_key" ON "ResearchStudy"("studyNumber");

-- CreateIndex
CREATE INDEX "ResearchStudy_organizationId_facilityId_idx" ON "ResearchStudy"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "ResearchStudy_status_idx" ON "ResearchStudy"("status");

-- CreateIndex
CREATE UNIQUE INDEX "ResearchParticipant_participantCode_key" ON "ResearchParticipant"("participantCode");

-- CreateIndex
CREATE INDEX "ResearchParticipant_studyId_idx" ON "ResearchParticipant"("studyId");

-- CreateIndex
CREATE INDEX "ResearchParticipant_patientId_idx" ON "ResearchParticipant"("patientId");

-- CreateIndex
CREATE UNIQUE INDEX "PRActivity_activityNumber_key" ON "PRActivity"("activityNumber");

-- CreateIndex
CREATE INDEX "PRActivity_organizationId_facilityId_idx" ON "PRActivity"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "PRActivity_activityType_status_idx" ON "PRActivity"("activityType", "status");

-- CreateIndex
CREATE UNIQUE INDEX "ITTicket_ticketNumber_key" ON "ITTicket"("ticketNumber");

-- CreateIndex
CREATE INDEX "ITTicket_organizationId_facilityId_idx" ON "ITTicket"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "ITTicket_ticketType_status_idx" ON "ITTicket"("ticketType", "status");

-- CreateIndex
CREATE INDEX "ITTicket_priority_idx" ON "ITTicket"("priority");

-- CreateIndex
CREATE INDEX "CodingRecord_organizationId_facilityId_idx" ON "CodingRecord"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "CodingRecord_encounterId_idx" ON "CodingRecord"("encounterId");

-- CreateIndex
CREATE INDEX "CodingRecord_patientId_idx" ON "CodingRecord"("patientId");

-- CreateIndex
CREATE INDEX "CodingRecord_claimStatus_idx" ON "CodingRecord"("claimStatus");

-- CreateIndex
CREATE UNIQUE INDEX "CommunityOutreach_eventNumber_key" ON "CommunityOutreach"("eventNumber");

-- CreateIndex
CREATE INDEX "CommunityOutreach_organizationId_facilityId_idx" ON "CommunityOutreach"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "CommunityOutreach_eventType_status_idx" ON "CommunityOutreach"("eventType", "status");

-- CreateIndex
CREATE INDEX "CommunityOutreach_startDate_idx" ON "CommunityOutreach"("startDate");

-- CreateIndex
CREATE UNIQUE INDEX "HomeCareVisit_visitNumber_key" ON "HomeCareVisit"("visitNumber");

-- CreateIndex
CREATE INDEX "HomeCareVisit_organizationId_facilityId_idx" ON "HomeCareVisit"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "HomeCareVisit_patientId_idx" ON "HomeCareVisit"("patientId");

-- CreateIndex
CREATE INDEX "HomeCareVisit_status_scheduledAt_idx" ON "HomeCareVisit"("status", "scheduledAt");

-- CreateIndex
CREATE UNIQUE INDEX "HistopathologySpecimen_specimenNumber_key" ON "HistopathologySpecimen"("specimenNumber");

-- CreateIndex
CREATE INDEX "HistopathologySpecimen_organizationId_facilityId_idx" ON "HistopathologySpecimen"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "HistopathologySpecimen_patientId_idx" ON "HistopathologySpecimen"("patientId");

-- CreateIndex
CREATE INDEX "HistopathologySpecimen_status_idx" ON "HistopathologySpecimen"("status");

-- CreateIndex
CREATE UNIQUE INDEX "RecoveryRoomRecord_recordNumber_key" ON "RecoveryRoomRecord"("recordNumber");

-- CreateIndex
CREATE INDEX "RecoveryRoomRecord_organizationId_facilityId_idx" ON "RecoveryRoomRecord"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "RecoveryRoomRecord_patientId_idx" ON "RecoveryRoomRecord"("patientId");

-- CreateIndex
CREATE INDEX "RecoveryRoomRecord_status_idx" ON "RecoveryRoomRecord"("status");

-- CreateIndex
CREATE UNIQUE INDEX "AuditFinding_findingNumber_key" ON "AuditFinding"("findingNumber");

-- CreateIndex
CREATE INDEX "AuditFinding_organizationId_facilityId_idx" ON "AuditFinding"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "AuditFinding_auditType_status_idx" ON "AuditFinding"("auditType", "status");

-- CreateIndex
CREATE INDEX "AuditFinding_severity_idx" ON "AuditFinding"("severity");

-- CreateIndex
CREATE INDEX "ITTicketComment_ticketId_createdAt_idx" ON "ITTicketComment"("ticketId", "createdAt");

-- CreateIndex
CREATE INDEX "ITTicketAttachment_ticketId_idx" ON "ITTicketAttachment"("ticketId");

-- CreateIndex
CREATE INDEX "KnowledgeBaseArticle_organizationId_status_idx" ON "KnowledgeBaseArticle"("organizationId", "status");

-- CreateIndex
CREATE INDEX "KnowledgeBaseArticle_category_idx" ON "KnowledgeBaseArticle"("category");

-- CreateIndex
CREATE UNIQUE INDEX "ITAsset_assetTag_key" ON "ITAsset"("assetTag");

-- CreateIndex
CREATE INDEX "ITAsset_organizationId_facilityId_idx" ON "ITAsset"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "ITAsset_assetType_status_idx" ON "ITAsset"("assetType", "status");

-- CreateIndex
CREATE UNIQUE INDEX "ITTicketAssetLink_ticketId_assetId_key" ON "ITTicketAssetLink"("ticketId", "assetId");

-- CreateIndex
CREATE INDEX "SLAPolicy_organizationId_isActive_idx" ON "SLAPolicy"("organizationId", "isActive");

-- CreateIndex
CREATE INDEX "MaintenanceSchedule_organizationId_facilityId_idx" ON "MaintenanceSchedule"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "MaintenanceSchedule_status_scheduledDate_idx" ON "MaintenanceSchedule"("status", "scheduledDate");

-- CreateIndex
CREATE INDEX "FacilityInspection_organizationId_facilityId_idx" ON "FacilityInspection"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "FacilityInspection_inspectionType_status_idx" ON "FacilityInspection"("inspectionType", "status");

-- CreateIndex
CREATE UNIQUE INDEX "RecordRequest_requestNumber_key" ON "RecordRequest"("requestNumber");

-- CreateIndex
CREATE INDEX "RecordRequest_organizationId_facilityId_idx" ON "RecordRequest"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "RecordRequest_status_idx" ON "RecordRequest"("status");

-- CreateIndex
CREATE INDEX "RecordRequest_patientId_idx" ON "RecordRequest"("patientId");

-- CreateIndex
CREATE INDEX "RecordMovement_patientId_movedAt_idx" ON "RecordMovement"("patientId", "movedAt");

-- CreateIndex
CREATE INDEX "RecordMovement_recordRequestId_idx" ON "RecordMovement"("recordRequestId");

-- CreateIndex
CREATE INDEX "RecordAmendment_organizationId_status_idx" ON "RecordAmendment"("organizationId", "status");

-- CreateIndex
CREATE INDEX "RecordAmendment_patientId_idx" ON "RecordAmendment"("patientId");

-- CreateIndex
CREATE INDEX "MortuaryStorage_organizationId_facilityId_idx" ON "MortuaryStorage"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "MortuaryStorage_status_idx" ON "MortuaryStorage"("status");

-- CreateIndex
CREATE INDEX "MortuaryMovement_mortuaryAdmissionId_movedAt_idx" ON "MortuaryMovement"("mortuaryAdmissionId", "movedAt");

-- CreateIndex
CREATE INDEX "MortuaryViewing_organizationId_facilityId_idx" ON "MortuaryViewing"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "MortuaryViewing_mortuaryAdmissionId_idx" ON "MortuaryViewing"("mortuaryAdmissionId");

-- CreateIndex
CREATE INDEX "MortuaryViewing_status_idx" ON "MortuaryViewing"("status");

-- CreateIndex
CREATE INDEX "MortuaryProperty_mortuaryAdmissionId_idx" ON "MortuaryProperty"("mortuaryAdmissionId");

-- CreateIndex
CREATE UNIQUE INDEX "BloodDonation_donationNumber_key" ON "BloodDonation"("donationNumber");

-- CreateIndex
CREATE INDEX "BloodDonation_organizationId_facilityId_idx" ON "BloodDonation"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "BloodDonation_donorId_idx" ON "BloodDonation"("donorId");

-- CreateIndex
CREATE INDEX "BloodDonation_status_idx" ON "BloodDonation"("status");

-- CreateIndex
CREATE UNIQUE INDEX "BloodCrossmatch_crossmatchNumber_key" ON "BloodCrossmatch"("crossmatchNumber");

-- CreateIndex
CREATE INDEX "BloodCrossmatch_organizationId_facilityId_idx" ON "BloodCrossmatch"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "BloodCrossmatch_patientId_idx" ON "BloodCrossmatch"("patientId");

-- CreateIndex
CREATE INDEX "BloodCrossmatch_crossmatchResult_idx" ON "BloodCrossmatch"("crossmatchResult");

-- CreateIndex
CREATE UNIQUE INDEX "NhiaClaimExport_claimNumber_key" ON "NhiaClaimExport"("claimNumber");

-- CreateIndex
CREATE INDEX "NhiaClaimExport_organizationId_facilityId_idx" ON "NhiaClaimExport"("organizationId", "facilityId");

-- CreateIndex
CREATE INDEX "NhiaClaimExport_encounterId_idx" ON "NhiaClaimExport"("encounterId");

-- CreateIndex
CREATE INDEX "NhiaClaimExport_patientId_idx" ON "NhiaClaimExport"("patientId");

-- CreateIndex
CREATE INDEX "NhiaClaimExport_status_idx" ON "NhiaClaimExport"("status");

-- CreateIndex
CREATE INDEX "NhiaClaimExport_submissionPeriod_idx" ON "NhiaClaimExport"("submissionPeriod");

-- CreateIndex
CREATE INDEX "NhiaClaimExport_generatedAt_idx" ON "NhiaClaimExport"("generatedAt");

-- AddForeignKey
ALTER TABLE "Facility" ADD CONSTRAINT "Facility_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Department" ADD CONSTRAINT "Department_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Unit" ADD CONSTRAINT "Unit_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ward" ADD CONSTRAINT "Ward_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ward" ADD CONSTRAINT "Ward_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Room" ADD CONSTRAINT "Room_wardId_fkey" FOREIGN KEY ("wardId") REFERENCES "Ward"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bed" ADD CONSTRAINT "Bed_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bed" ADD CONSTRAINT "Bed_wardId_fkey" FOREIGN KEY ("wardId") REFERENCES "Ward"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bed" ADD CONSTRAINT "Bed_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Room"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Staff" ADD CONSTRAINT "Staff_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Staff" ADD CONSTRAINT "Staff_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Staff" ADD CONSTRAINT "Staff_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Staff" ADD CONSTRAINT "Staff_supervisorId_fkey" FOREIGN KEY ("supervisorId") REFERENCES "Staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Staff" ADD CONSTRAINT "Staff_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffAssignment" ADD CONSTRAINT "StaffAssignment_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffAssignment" ADD CONSTRAINT "StaffAssignment_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffAssignment" ADD CONSTRAINT "StaffAssignment_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffAssignment" ADD CONSTRAINT "StaffAssignment_authorizedById_fkey" FOREIGN KEY ("authorizedById") REFERENCES "Staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffCredential" ADD CONSTRAINT "StaffCredential_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffCredential" ADD CONSTRAINT "StaffCredential_verifiedById_fkey" FOREIGN KEY ("verifiedById") REFERENCES "Staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffStatusHistory" ADD CONSTRAINT "StaffStatusHistory_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffStatusHistory" ADD CONSTRAINT "StaffStatusHistory_authorizedById_fkey" FOREIGN KEY ("authorizedById") REFERENCES "Staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffDocument" ADD CONSTRAINT "StaffDocument_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffDocument" ADD CONSTRAINT "StaffDocument_verifiedById_fkey" FOREIGN KEY ("verifiedById") REFERENCES "Staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffFacility" ADD CONSTRAINT "StaffFacility_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffFacility" ADD CONSTRAINT "StaffFacility_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffFacility" ADD CONSTRAINT "StaffFacility_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffFacility" ADD CONSTRAINT "StaffFacility_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "Unit"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Role" ADD CONSTRAINT "Role_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RolePermission" ADD CONSTRAINT "RolePermission_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RolePermission" ADD CONSTRAINT "RolePermission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES "Permission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserRole" ADD CONSTRAINT "UserRole_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserRole" ADD CONSTRAINT "UserRole_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserRole" ADD CONSTRAINT "UserRole_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserRole" ADD CONSTRAINT "UserRole_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Patient" ADD CONSTRAINT "Patient_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientIdentifier" ADD CONSTRAINT "PatientIdentifier_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientContact" ADD CONSTRAINT "PatientContact_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmergencyContact" ADD CONSTRAINT "EmergencyContact_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NextOfKin" ADD CONSTRAINT "NextOfKin_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InsuranceProvider" ADD CONSTRAINT "InsuranceProvider_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InsurancePlan" ADD CONSTRAINT "InsurancePlan_insuranceProviderId_fkey" FOREIGN KEY ("insuranceProviderId") REFERENCES "InsuranceProvider"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlanServiceCoverage" ADD CONSTRAINT "PlanServiceCoverage_insurancePlanId_fkey" FOREIGN KEY ("insurancePlanId") REFERENCES "InsurancePlan"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlanBenefit" ADD CONSTRAINT "PlanBenefit_insurancePlanId_fkey" FOREIGN KEY ("insurancePlanId") REFERENCES "InsurancePlan"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProviderContact" ADD CONSTRAINT "ProviderContact_insuranceProviderId_fkey" FOREIGN KEY ("insuranceProviderId") REFERENCES "InsuranceProvider"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProviderFacilityRelationship" ADD CONSTRAINT "ProviderFacilityRelationship_insuranceProviderId_fkey" FOREIGN KEY ("insuranceProviderId") REFERENCES "InsuranceProvider"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InsuranceAuthorization" ADD CONSTRAINT "InsuranceAuthorization_insuranceProviderId_fkey" FOREIGN KEY ("insuranceProviderId") REFERENCES "InsuranceProvider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InsuranceAuthorization" ADD CONSTRAINT "InsuranceAuthorization_insurancePlanId_fkey" FOREIGN KEY ("insurancePlanId") REFERENCES "InsurancePlan"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InsuranceAuthorization" ADD CONSTRAINT "InsuranceAuthorization_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InsuranceAuthorization" ADD CONSTRAINT "InsuranceAuthorization_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "Service"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientInsurance" ADD CONSTRAINT "PatientInsurance_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientInsurance" ADD CONSTRAINT "PatientInsurance_insuranceProviderId_fkey" FOREIGN KEY ("insuranceProviderId") REFERENCES "InsuranceProvider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Encounter" ADD CONSTRAINT "Encounter_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Encounter" ADD CONSTRAINT "Encounter_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Encounter" ADD CONSTRAINT "Encounter_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Encounter" ADD CONSTRAINT "Encounter_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Encounter" ADD CONSTRAINT "Encounter_cancelledById_fkey" FOREIGN KEY ("cancelledById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "Unit"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WaitingList" ADD CONSTRAINT "WaitingList_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AppointmentHistory" ADD CONSTRAINT "AppointmentHistory_appointmentId_fkey" FOREIGN KEY ("appointmentId") REFERENCES "Appointment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Queue" ADD CONSTRAINT "Queue_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Queue" ADD CONSTRAINT "Queue_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Queue" ADD CONSTRAINT "Queue_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "Unit"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QueueEntry" ADD CONSTRAINT "QueueEntry_queueId_fkey" FOREIGN KEY ("queueId") REFERENCES "Queue"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QueueEntry" ADD CONSTRAINT "QueueEntry_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QueueEntry" ADD CONSTRAINT "QueueEntry_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TriageRecord" ADD CONSTRAINT "TriageRecord_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TriageRecord" ADD CONSTRAINT "TriageRecord_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TriageRecord" ADD CONSTRAINT "TriageRecord_recordedById_fkey" FOREIGN KEY ("recordedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VitalSign" ADD CONSTRAINT "VitalSign_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VitalSign" ADD CONSTRAINT "VitalSign_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VitalSign" ADD CONSTRAINT "VitalSign_recordedById_fkey" FOREIGN KEY ("recordedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consultation" ADD CONSTRAINT "Consultation_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consultation" ADD CONSTRAINT "Consultation_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consultation" ADD CONSTRAINT "Consultation_clinicianId_fkey" FOREIGN KEY ("clinicianId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Diagnosis" ADD CONSTRAINT "Diagnosis_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Diagnosis" ADD CONSTRAINT "Diagnosis_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Diagnosis" ADD CONSTRAINT "Diagnosis_catalogId_fkey" FOREIGN KEY ("catalogId") REFERENCES "DiagnosisCatalog"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DiagnosisStatusHistory" ADD CONSTRAINT "DiagnosisStatusHistory_diagnosisId_fkey" FOREIGN KEY ("diagnosisId") REFERENCES "Diagnosis"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DiagnosisFavorite" ADD CONSTRAINT "DiagnosisFavorite_catalogId_fkey" FOREIGN KEY ("catalogId") REFERENCES "DiagnosisCatalog"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Allergy" ADD CONSTRAINT "Allergy_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Allergy" ADD CONSTRAINT "Allergy_recordedById_fkey" FOREIGN KEY ("recordedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MedicalHistory" ADD CONSTRAINT "MedicalHistory_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SurgicalHistory" ADD CONSTRAINT "SurgicalHistory_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FamilyHistory" ADD CONSTRAINT "FamilyHistory_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SocialHistory" ADD CONSTRAINT "SocialHistory_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Medication" ADD CONSTRAINT "Medication_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Medication" ADD CONSTRAINT "Medication_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Medication" ADD CONSTRAINT "Medication_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MedicationInteraction" ADD CONSTRAINT "MedicationInteraction_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MedicationInteraction" ADD CONSTRAINT "MedicationInteraction_medicationAId_fkey" FOREIGN KEY ("medicationAId") REFERENCES "Medication"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MedicationInteraction" ADD CONSTRAINT "MedicationInteraction_medicationBId_fkey" FOREIGN KEY ("medicationBId") REFERENCES "Medication"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Prescription" ADD CONSTRAINT "Prescription_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Prescription" ADD CONSTRAINT "Prescription_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Prescription" ADD CONSTRAINT "Prescription_prescriberId_fkey" FOREIGN KEY ("prescriberId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Prescription" ADD CONSTRAINT "Prescription_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PrescriptionItem" ADD CONSTRAINT "PrescriptionItem_prescriptionId_fkey" FOREIGN KEY ("prescriptionId") REFERENCES "Prescription"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PrescriptionItem" ADD CONSTRAINT "PrescriptionItem_medicationId_fkey" FOREIGN KEY ("medicationId") REFERENCES "Medication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MedicationAdministration" ADD CONSTRAINT "MedicationAdministration_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MedicationAdministration" ADD CONSTRAINT "MedicationAdministration_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MedicationAdministration" ADD CONSTRAINT "MedicationAdministration_prescriptionItemId_fkey" FOREIGN KEY ("prescriptionItemId") REFERENCES "PrescriptionItem"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MedicationAdministration" ADD CONSTRAINT "MedicationAdministration_medicationId_fkey" FOREIGN KEY ("medicationId") REFERENCES "Medication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MedicationAdministration" ADD CONSTRAINT "MedicationAdministration_administeredById_fkey" FOREIGN KEY ("administeredById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LaboratoryTest" ADD CONSTRAINT "LaboratoryTest_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabTestAlias" ADD CONSTRAINT "LabTestAlias_laboratoryTestId_fkey" FOREIGN KEY ("laboratoryTestId") REFERENCES "LaboratoryTest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabTestSpecimenConfig" ADD CONSTRAINT "LabTestSpecimenConfig_laboratoryTestId_fkey" FOREIGN KEY ("laboratoryTestId") REFERENCES "LaboratoryTest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabTestComponent" ADD CONSTRAINT "LabTestComponent_laboratoryTestId_fkey" FOREIGN KEY ("laboratoryTestId") REFERENCES "LaboratoryTest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabTestPanelMember" ADD CONSTRAINT "LabTestPanelMember_panelTestId_fkey" FOREIGN KEY ("panelTestId") REFERENCES "LaboratoryTest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabTestPanelMember" ADD CONSTRAINT "LabTestPanelMember_componentTestId_fkey" FOREIGN KEY ("componentTestId") REFERENCES "LaboratoryTest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabTestReferenceRange" ADD CONSTRAINT "LabTestReferenceRange_laboratoryTestId_fkey" FOREIGN KEY ("laboratoryTestId") REFERENCES "LaboratoryTest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabTestCriticalValue" ADD CONSTRAINT "LabTestCriticalValue_laboratoryTestId_fkey" FOREIGN KEY ("laboratoryTestId") REFERENCES "LaboratoryTest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabTestResultOption" ADD CONSTRAINT "LabTestResultOption_laboratoryTestId_fkey" FOREIGN KEY ("laboratoryTestId") REFERENCES "LaboratoryTest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabTestFacilityAvailability" ADD CONSTRAINT "LabTestFacilityAvailability_laboratoryTestId_fkey" FOREIGN KEY ("laboratoryTestId") REFERENCES "LaboratoryTest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabTestVersion" ADD CONSTRAINT "LabTestVersion_laboratoryTestId_fkey" FOREIGN KEY ("laboratoryTestId") REFERENCES "LaboratoryTest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabTestCatalogAudit" ADD CONSTRAINT "LabTestCatalogAudit_laboratoryTestId_fkey" FOREIGN KEY ("laboratoryTestId") REFERENCES "LaboratoryTest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabOrder" ADD CONSTRAINT "LabOrder_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabOrder" ADD CONSTRAINT "LabOrder_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabOrder" ADD CONSTRAINT "LabOrder_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabOrder" ADD CONSTRAINT "LabOrder_orderingClinicianId_fkey" FOREIGN KEY ("orderingClinicianId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabOrderItem" ADD CONSTRAINT "LabOrderItem_labOrderId_fkey" FOREIGN KEY ("labOrderId") REFERENCES "LabOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabOrderItem" ADD CONSTRAINT "LabOrderItem_laboratoryTestId_fkey" FOREIGN KEY ("laboratoryTestId") REFERENCES "LaboratoryTest"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabSample" ADD CONSTRAINT "LabSample_labOrderId_fkey" FOREIGN KEY ("labOrderId") REFERENCES "LabOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabResult" ADD CONSTRAINT "LabResult_labOrderItemId_fkey" FOREIGN KEY ("labOrderItemId") REFERENCES "LabOrderItem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImagingOrder" ADD CONSTRAINT "ImagingOrder_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImagingOrder" ADD CONSTRAINT "ImagingOrder_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImagingOrder" ADD CONSTRAINT "ImagingOrder_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImagingOrder" ADD CONSTRAINT "ImagingOrder_orderingClinicianId_fkey" FOREIGN KEY ("orderingClinicianId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImagingReport" ADD CONSTRAINT "ImagingReport_imagingOrderId_fkey" FOREIGN KEY ("imagingOrderId") REFERENCES "ImagingOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Procedure" ADD CONSTRAINT "Procedure_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Procedure" ADD CONSTRAINT "Procedure_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Procedure" ADD CONSTRAINT "Procedure_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Procedure" ADD CONSTRAINT "Procedure_performedById_fkey" FOREIGN KEY ("performedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProcedureCatalogFacilityAvailability" ADD CONSTRAINT "ProcedureCatalogFacilityAvailability_procedureCatalogId_fkey" FOREIGN KEY ("procedureCatalogId") REFERENCES "ProcedureCatalog"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Admission" ADD CONSTRAINT "Admission_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Admission" ADD CONSTRAINT "Admission_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Admission" ADD CONSTRAINT "Admission_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Admission" ADD CONSTRAINT "Admission_admittedById_fkey" FOREIGN KEY ("admittedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BedAssignment" ADD CONSTRAINT "BedAssignment_admissionId_fkey" FOREIGN KEY ("admissionId") REFERENCES "Admission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BedAssignment" ADD CONSTRAINT "BedAssignment_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BedAssignment" ADD CONSTRAINT "BedAssignment_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BedAssignment" ADD CONSTRAINT "BedAssignment_wardId_fkey" FOREIGN KEY ("wardId") REFERENCES "Ward"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BedAssignment" ADD CONSTRAINT "BedAssignment_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Room"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BedAssignment" ADD CONSTRAINT "BedAssignment_bedId_fkey" FOREIGN KEY ("bedId") REFERENCES "Bed"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientTransfer" ADD CONSTRAINT "PatientTransfer_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientTransfer" ADD CONSTRAINT "PatientTransfer_admissionId_fkey" FOREIGN KEY ("admissionId") REFERENCES "Admission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientTransfer" ADD CONSTRAINT "PatientTransfer_fromFacilityId_fkey" FOREIGN KEY ("fromFacilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientTransfer" ADD CONSTRAINT "PatientTransfer_toFacilityId_fkey" FOREIGN KEY ("toFacilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientTransfer" ADD CONSTRAINT "PatientTransfer_requestedById_fkey" FOREIGN KEY ("requestedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientTransfer" ADD CONSTRAINT "PatientTransfer_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientTransfer" ADD CONSTRAINT "PatientTransfer_acceptedById_fkey" FOREIGN KEY ("acceptedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientTransfer" ADD CONSTRAINT "PatientTransfer_rejectedById_fkey" FOREIGN KEY ("rejectedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientTransfer" ADD CONSTRAINT "PatientTransfer_departedById_fkey" FOREIGN KEY ("departedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientTransfer" ADD CONSTRAINT "PatientTransfer_arrivedById_fkey" FOREIGN KEY ("arrivedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientTransfer" ADD CONSTRAINT "PatientTransfer_completedById_fkey" FOREIGN KEY ("completedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientTransfer" ADD CONSTRAINT "PatientTransfer_cancelledById_fkey" FOREIGN KEY ("cancelledById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientTransfer" ADD CONSTRAINT "PatientTransfer_amendedById_fkey" FOREIGN KEY ("amendedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransferChecklistItem" ADD CONSTRAINT "TransferChecklistItem_transferId_fkey" FOREIGN KEY ("transferId") REFERENCES "PatientTransfer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransferCommunication" ADD CONSTRAINT "TransferCommunication_transferId_fkey" FOREIGN KEY ("transferId") REFERENCES "PatientTransfer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeRecord" ADD CONSTRAINT "DischargeRecord_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeRecord" ADD CONSTRAINT "DischargeRecord_admissionId_fkey" FOREIGN KEY ("admissionId") REFERENCES "Admission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeRecord" ADD CONSTRAINT "DischargeRecord_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeRecord" ADD CONSTRAINT "DischargeRecord_dischargedById_fkey" FOREIGN KEY ("dischargedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeRecord" ADD CONSTRAINT "DischargeRecord_clinicalClearedById_fkey" FOREIGN KEY ("clinicalClearedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeRecord" ADD CONSTRAINT "DischargeRecord_nursingClearedById_fkey" FOREIGN KEY ("nursingClearedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeRecord" ADD CONSTRAINT "DischargeRecord_financialClearedById_fkey" FOREIGN KEY ("financialClearedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeRecord" ADD CONSTRAINT "DischargeRecord_pharmacyClearedById_fkey" FOREIGN KEY ("pharmacyClearedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeRecord" ADD CONSTRAINT "DischargeRecord_amendedById_fkey" FOREIGN KEY ("amendedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeRecord" ADD CONSTRAINT "DischargeRecord_requestedById_fkey" FOREIGN KEY ("requestedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeRecord" ADD CONSTRAINT "DischargeRecord_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeRecord" ADD CONSTRAINT "DischargeRecord_cancelledById_fkey" FOREIGN KEY ("cancelledById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeRecord" ADD CONSTRAINT "DischargeRecord_finalizedById_fkey" FOREIGN KEY ("finalizedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeChecklistItem" ADD CONSTRAINT "DischargeChecklistItem_dischargeId_fkey" FOREIGN KEY ("dischargeId") REFERENCES "DischargeRecord"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeMedication" ADD CONSTRAINT "DischargeMedication_dischargeId_fkey" FOREIGN KEY ("dischargeId") REFERENCES "DischargeRecord"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BedReservation" ADD CONSTRAINT "BedReservation_admissionId_fkey" FOREIGN KEY ("admissionId") REFERENCES "Admission"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BedReservation" ADD CONSTRAINT "BedReservation_bedId_fkey" FOREIGN KEY ("bedId") REFERENCES "Bed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BedCleaning" ADD CONSTRAINT "BedCleaning_bedId_fkey" FOREIGN KEY ("bedId") REFERENCES "Bed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BedMaintenance" ADD CONSTRAINT "BedMaintenance_bedId_fkey" FOREIGN KEY ("bedId") REFERENCES "Bed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BedBlock" ADD CONSTRAINT "BedBlock_bedId_fkey" FOREIGN KEY ("bedId") REFERENCES "Bed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProgressNote" ADD CONSTRAINT "ProgressNote_admissionId_fkey" FOREIGN KEY ("admissionId") REFERENCES "Admission"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CareTeamMember" ADD CONSTRAINT "CareTeamMember_admissionId_fkey" FOREIGN KEY ("admissionId") REFERENCES "Admission"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NursingNote" ADD CONSTRAINT "NursingNote_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NursingNote" ADD CONSTRAINT "NursingNote_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NursingNote" ADD CONSTRAINT "NursingNote_admissionId_fkey" FOREIGN KEY ("admissionId") REFERENCES "Admission"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NursingNote" ADD CONSTRAINT "NursingNote_nurseId_fkey" FOREIGN KEY ("nurseId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CarePlan" ADD CONSTRAINT "CarePlan_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CarePlan" ADD CONSTRAINT "CarePlan_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CarePlan" ADD CONSTRAINT "CarePlan_admissionId_fkey" FOREIGN KEY ("admissionId") REFERENCES "Admission"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CarePlan" ADD CONSTRAINT "CarePlan_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NursingIntervention" ADD CONSTRAINT "NursingIntervention_carePlanId_fkey" FOREIGN KEY ("carePlanId") REFERENCES "CarePlan"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Referral" ADD CONSTRAINT "Referral_patientIdFrom_fkey" FOREIGN KEY ("patientIdFrom") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Referral" ADD CONSTRAINT "Referral_patientIdTo_fkey" FOREIGN KEY ("patientIdTo") REFERENCES "Patient"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Referral" ADD CONSTRAINT "Referral_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Referral" ADD CONSTRAINT "Referral_referringFacilityId_fkey" FOREIGN KEY ("referringFacilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Referral" ADD CONSTRAINT "Referral_receivingFacilityId_fkey" FOREIGN KEY ("receivingFacilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Referral" ADD CONSTRAINT "Referral_referringStaffId_fkey" FOREIGN KEY ("referringStaffId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Referral" ADD CONSTRAINT "Referral_receivingStaffId_fkey" FOREIGN KEY ("receivingStaffId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Referral" ADD CONSTRAINT "Referral_primaryDiagnosisId_fkey" FOREIGN KEY ("primaryDiagnosisId") REFERENCES "Diagnosis"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReferralEvent" ADD CONSTRAINT "ReferralEvent_referralId_fkey" FOREIGN KEY ("referralId") REFERENCES "Referral"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReferralEvent" ADD CONSTRAINT "ReferralEvent_actorUserId_fkey" FOREIGN KEY ("actorUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReferralFeedback" ADD CONSTRAINT "ReferralFeedback_referralId_fkey" FOREIGN KEY ("referralId") REFERENCES "Referral"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReferralFeedback" ADD CONSTRAINT "ReferralFeedback_authorUserId_fkey" FOREIGN KEY ("authorUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReferralMessage" ADD CONSTRAINT "ReferralMessage_referralId_fkey" FOREIGN KEY ("referralId") REFERENCES "Referral"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReferralMessage" ADD CONSTRAINT "ReferralMessage_senderUserId_fkey" FOREIGN KEY ("senderUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Immunization" ADD CONSTRAINT "Immunization_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Immunization" ADD CONSTRAINT "Immunization_vaccineCatalogId_fkey" FOREIGN KEY ("vaccineCatalogId") REFERENCES "VaccineCatalog"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Immunization" ADD CONSTRAINT "Immunization_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Immunization" ADD CONSTRAINT "Immunization_administeredById_fkey" FOREIGN KEY ("administeredById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VaccineCatalog" ADD CONSTRAINT "VaccineCatalog_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VaccineCatalog" ADD CONSTRAINT "VaccineCatalog_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "Service"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VaccineScheduleDose" ADD CONSTRAINT "VaccineScheduleDose_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VaccineScheduleDose" ADD CONSTRAINT "VaccineScheduleDose_vaccineCatalogId_fkey" FOREIGN KEY ("vaccineCatalogId") REFERENCES "VaccineCatalog"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AEFI" ADD CONSTRAINT "AEFI_immunizationId_fkey" FOREIGN KEY ("immunizationId") REFERENCES "Immunization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AEFI" ADD CONSTRAINT "AEFI_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AEFI" ADD CONSTRAINT "AEFI_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AEFI" ADD CONSTRAINT "AEFI_reportedById_fkey" FOREIGN KEY ("reportedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AEFI" ADD CONSTRAINT "AEFI_reviewedById_fkey" FOREIGN KEY ("reviewedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VaccineWastage" ADD CONSTRAINT "VaccineWastage_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VaccineWastage" ADD CONSTRAINT "VaccineWastage_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VaccineWastage" ADD CONSTRAINT "VaccineWastage_disposedById_fkey" FOREIGN KEY ("disposedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ColdChainAlert" ADD CONSTRAINT "ColdChainAlert_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ColdChainAlert" ADD CONSTRAINT "ColdChainAlert_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ColdChainAlert" ADD CONSTRAINT "ColdChainAlert_recordedById_fkey" FOREIGN KEY ("recordedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ColdChainAlert" ADD CONSTRAINT "ColdChainAlert_acknowledgedById_fkey" FOREIGN KEY ("acknowledgedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AmbulanceVehicle" ADD CONSTRAINT "AmbulanceVehicle_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AmbulanceVehicle" ADD CONSTRAINT "AmbulanceVehicle_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AmbulanceVehicle" ADD CONSTRAINT "AmbulanceVehicle_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AmbulanceTrip" ADD CONSTRAINT "AmbulanceTrip_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AmbulanceTrip" ADD CONSTRAINT "AmbulanceTrip_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AmbulanceTrip" ADD CONSTRAINT "AmbulanceTrip_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AmbulanceTrip" ADD CONSTRAINT "AmbulanceTrip_vehicleId_fkey" FOREIGN KEY ("vehicleId") REFERENCES "AmbulanceVehicle"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AmbulanceTrip" ADD CONSTRAINT "AmbulanceTrip_requestedById_fkey" FOREIGN KEY ("requestedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AmbulanceIncident" ADD CONSTRAINT "AmbulanceIncident_tripId_fkey" FOREIGN KEY ("tripId") REFERENCES "AmbulanceTrip"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MaternityRecord" ADD CONSTRAINT "MaternityRecord_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MaternityRecord" ADD CONSTRAINT "MaternityRecord_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MaternityRecord" ADD CONSTRAINT "MaternityRecord_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MaternityRecord" ADD CONSTRAINT "MaternityRecord_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NewbornRecord" ADD CONSTRAINT "NewbornRecord_motherPatientId_fkey" FOREIGN KEY ("motherPatientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NewbornRecord" ADD CONSTRAINT "NewbornRecord_deliveryRecordId_fkey" FOREIGN KEY ("deliveryRecordId") REFERENCES "MaternityRecord"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AncVisit" ADD CONSTRAINT "AncVisit_maternityRecordId_fkey" FOREIGN KEY ("maternityRecordId") REFERENCES "MaternityRecord"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AncVisit" ADD CONSTRAINT "AncVisit_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AncVisit" ADD CONSTRAINT "AncVisit_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AncVisit" ADD CONSTRAINT "AncVisit_recordedById_fkey" FOREIGN KEY ("recordedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LaborAndDelivery" ADD CONSTRAINT "LaborAndDelivery_maternityRecordId_fkey" FOREIGN KEY ("maternityRecordId") REFERENCES "MaternityRecord"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LaborAndDelivery" ADD CONSTRAINT "LaborAndDelivery_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LaborAndDelivery" ADD CONSTRAINT "LaborAndDelivery_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LaborAndDelivery" ADD CONSTRAINT "LaborAndDelivery_attendingClinicianId_fkey" FOREIGN KEY ("attendingClinicianId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LaborAndDelivery" ADD CONSTRAINT "LaborAndDelivery_attendingMidwifeId_fkey" FOREIGN KEY ("attendingMidwifeId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostnatalVisit" ADD CONSTRAINT "PostnatalVisit_maternityRecordId_fkey" FOREIGN KEY ("maternityRecordId") REFERENCES "MaternityRecord"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostnatalVisit" ADD CONSTRAINT "PostnatalVisit_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostnatalVisit" ADD CONSTRAINT "PostnatalVisit_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostnatalVisit" ADD CONSTRAINT "PostnatalVisit_recordedById_fkey" FOREIGN KEY ("recordedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Service" ADD CONSTRAINT "Service_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Service" ADD CONSTRAINT "Service_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Service" ADD CONSTRAINT "Service_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "Unit"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Service" ADD CONSTRAINT "Service_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Service" ADD CONSTRAINT "Service_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FacilityServicePrice" ADD CONSTRAINT "FacilityServicePrice_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FacilityServicePrice" ADD CONSTRAINT "FacilityServicePrice_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "Service"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServicePriceHistory" ADD CONSTRAINT "ServicePriceHistory_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "Service"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServicePriceHistory" ADD CONSTRAINT "ServicePriceHistory_changedById_fkey" FOREIGN KEY ("changedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServicePackage" ADD CONSTRAINT "ServicePackage_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServicePackage" ADD CONSTRAINT "ServicePackage_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServicePackageItem" ADD CONSTRAINT "ServicePackageItem_packageId_fkey" FOREIGN KEY ("packageId") REFERENCES "ServicePackage"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServicePackageItem" ADD CONSTRAINT "ServicePackageItem_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "Service"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_reviewedById_fkey" FOREIGN KEY ("reviewedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_issuedById_fkey" FOREIGN KEY ("issuedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_voidedById_fkey" FOREIGN KEY ("voidedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_cancelledById_fkey" FOREIGN KEY ("cancelledById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_writtenOffById_fkey" FOREIGN KEY ("writtenOffById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_discountApprovedById_fkey" FOREIGN KEY ("discountApprovedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InvoiceItem" ADD CONSTRAINT "InvoiceItem_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InvoiceItem" ADD CONSTRAINT "InvoiceItem_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "Service"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_receivedById_fkey" FOREIGN KEY ("receivedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_paymentId_fkey" FOREIGN KEY ("paymentId") REFERENCES "Payment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_requestedById_fkey" FOREIGN KEY ("requestedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_reviewedById_fkey" FOREIGN KEY ("reviewedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_rejectedById_fkey" FOREIGN KEY ("rejectedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_processedById_fkey" FOREIGN KEY ("processedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_cancelledById_fkey" FOREIGN KEY ("cancelledById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_reversedById_fkey" FOREIGN KEY ("reversedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_verifiedById_fkey" FOREIGN KEY ("verifiedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CreditNote" ADD CONSTRAINT "CreditNote_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CreditNote" ADD CONSTRAINT "CreditNote_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CreditNote" ADD CONSTRAINT "CreditNote_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CreditNote" ADD CONSTRAINT "CreditNote_issuedById_fkey" FOREIGN KEY ("issuedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InvoiceAdjustment" ADD CONSTRAINT "InvoiceAdjustment_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InvoiceAdjustment" ADD CONSTRAINT "InvoiceAdjustment_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InsuranceClaim" ADD CONSTRAINT "InsuranceClaim_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InsuranceClaim" ADD CONSTRAINT "InsuranceClaim_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InsuranceClaim" ADD CONSTRAINT "InsuranceClaim_insuranceProviderId_fkey" FOREIGN KEY ("insuranceProviderId") REFERENCES "InsuranceProvider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InsuranceClaim" ADD CONSTRAINT "InsuranceClaim_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InsuranceClaim" ADD CONSTRAINT "InsuranceClaim_batchId_fkey" FOREIGN KEY ("batchId") REFERENCES "ClaimBatch"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClaimDiagnosis" ADD CONSTRAINT "ClaimDiagnosis_claimId_fkey" FOREIGN KEY ("claimId") REFERENCES "InsuranceClaim"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClaimDiagnosis" ADD CONSTRAINT "ClaimDiagnosis_catalogId_fkey" FOREIGN KEY ("catalogId") REFERENCES "DiagnosisCatalog"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClaimItem" ADD CONSTRAINT "ClaimItem_claimId_fkey" FOREIGN KEY ("claimId") REFERENCES "InsuranceClaim"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClaimQuery" ADD CONSTRAINT "ClaimQuery_claimId_fkey" FOREIGN KEY ("claimId") REFERENCES "InsuranceClaim"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClaimPayment" ADD CONSTRAINT "ClaimPayment_claimId_fkey" FOREIGN KEY ("claimId") REFERENCES "InsuranceClaim"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EligibilityVerification" ADD CONSTRAINT "EligibilityVerification_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EligibilityVerification" ADD CONSTRAINT "EligibilityVerification_insuranceProviderId_fkey" FOREIGN KEY ("insuranceProviderId") REFERENCES "InsuranceProvider"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EligibilityVerification" ADD CONSTRAINT "EligibilityVerification_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EncounterCoverage" ADD CONSTRAINT "EncounterCoverage_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceVerification" ADD CONSTRAINT "AttendanceVerification_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClaimReadinessAssessment" ADD CONSTRAINT "ClaimReadinessAssessment_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryItem" ADD CONSTRAINT "InventoryItem_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryItem" ADD CONSTRAINT "InventoryItem_medicationId_fkey" FOREIGN KEY ("medicationId") REFERENCES "Medication"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryItem" ADD CONSTRAINT "InventoryItem_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FacilityInventory" ADD CONSTRAINT "FacilityInventory_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FacilityInventory" ADD CONSTRAINT "FacilityInventory_inventoryItemId_fkey" FOREIGN KEY ("inventoryItemId") REFERENCES "InventoryItem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryBatch" ADD CONSTRAINT "InventoryBatch_facilityInventoryId_fkey" FOREIGN KEY ("facilityInventoryId") REFERENCES "FacilityInventory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryBatch" ADD CONSTRAINT "InventoryBatch_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES "Supplier"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryTransaction" ADD CONSTRAINT "InventoryTransaction_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryTransaction" ADD CONSTRAINT "InventoryTransaction_inventoryItemId_fkey" FOREIGN KEY ("inventoryItemId") REFERENCES "InventoryItem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryTransaction" ADD CONSTRAINT "InventoryTransaction_batchId_fkey" FOREIGN KEY ("batchId") REFERENCES "InventoryBatch"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryTransaction" ADD CONSTRAINT "InventoryTransaction_performedById_fkey" FOREIGN KEY ("performedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Supplier" ADD CONSTRAINT "Supplier_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Supplier" ADD CONSTRAINT "Supplier_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Supplier" ADD CONSTRAINT "Supplier_verifiedById_fkey" FOREIGN KEY ("verifiedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Supplier" ADD CONSTRAINT "Supplier_suspendedById_fkey" FOREIGN KEY ("suspendedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Supplier" ADD CONSTRAINT "Supplier_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierContact" ADD CONSTRAINT "SupplierContact_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES "Supplier"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierDocument" ADD CONSTRAINT "SupplierDocument_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES "Supplier"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierDocument" ADD CONSTRAINT "SupplierDocument_verifiedById_fkey" FOREIGN KEY ("verifiedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierProduct" ADD CONSTRAINT "SupplierProduct_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES "Supplier"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierProduct" ADD CONSTRAINT "SupplierProduct_inventoryItemId_fkey" FOREIGN KEY ("inventoryItemId") REFERENCES "InventoryItem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierEvaluation" ADD CONSTRAINT "SupplierEvaluation_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES "Supplier"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierEvaluation" ADD CONSTRAINT "SupplierEvaluation_evaluatedById_fkey" FOREIGN KEY ("evaluatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierEvaluation" ADD CONSTRAINT "SupplierEvaluation_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierComplaint" ADD CONSTRAINT "SupplierComplaint_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES "Supplier"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierComplaint" ADD CONSTRAINT "SupplierComplaint_resolvedById_fkey" FOREIGN KEY ("resolvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierComplaint" ADD CONSTRAINT "SupplierComplaint_purchaseOrderId_fkey" FOREIGN KEY ("purchaseOrderId") REFERENCES "PurchaseOrder"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierComplaint" ADD CONSTRAINT "SupplierComplaint_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseOrder" ADD CONSTRAINT "PurchaseOrder_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseOrder" ADD CONSTRAINT "PurchaseOrder_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES "Supplier"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseOrder" ADD CONSTRAINT "PurchaseOrder_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseOrder" ADD CONSTRAINT "PurchaseOrder_sentById_fkey" FOREIGN KEY ("sentById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseOrder" ADD CONSTRAINT "PurchaseOrder_acknowledgedById_fkey" FOREIGN KEY ("acknowledgedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseOrder" ADD CONSTRAINT "PurchaseOrder_requestedById_fkey" FOREIGN KEY ("requestedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseOrder" ADD CONSTRAINT "PurchaseOrder_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseOrder" ADD CONSTRAINT "PurchaseOrder_rejectedById_fkey" FOREIGN KEY ("rejectedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseOrder" ADD CONSTRAINT "PurchaseOrder_heldById_fkey" FOREIGN KEY ("heldById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseOrder" ADD CONSTRAINT "PurchaseOrder_closedById_fkey" FOREIGN KEY ("closedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseOrder" ADD CONSTRAINT "PurchaseOrder_cancelledById_fkey" FOREIGN KEY ("cancelledById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseOrderItem" ADD CONSTRAINT "PurchaseOrderItem_purchaseOrderId_fkey" FOREIGN KEY ("purchaseOrderId") REFERENCES "PurchaseOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseOrderItem" ADD CONSTRAINT "PurchaseOrderItem_inventoryItemId_fkey" FOREIGN KEY ("inventoryItemId") REFERENCES "InventoryItem"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GoodsReceived" ADD CONSTRAINT "GoodsReceived_purchaseOrderId_fkey" FOREIGN KEY ("purchaseOrderId") REFERENCES "PurchaseOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GoodsReceived" ADD CONSTRAINT "GoodsReceived_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GoodsReceived" ADD CONSTRAINT "GoodsReceived_receivedById_fkey" FOREIGN KEY ("receivedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTransfer" ADD CONSTRAINT "StockTransfer_fromFacilityId_fkey" FOREIGN KEY ("fromFacilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTransfer" ADD CONSTRAINT "StockTransfer_toFacilityId_fkey" FOREIGN KEY ("toFacilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTransfer" ADD CONSTRAINT "StockTransfer_requestedById_fkey" FOREIGN KEY ("requestedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTransfer" ADD CONSTRAINT "StockTransfer_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTransfer" ADD CONSTRAINT "StockTransfer_rejectedById_fkey" FOREIGN KEY ("rejectedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTransfer" ADD CONSTRAINT "StockTransfer_preparedById_fkey" FOREIGN KEY ("preparedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTransfer" ADD CONSTRAINT "StockTransfer_dispatchedById_fkey" FOREIGN KEY ("dispatchedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTransfer" ADD CONSTRAINT "StockTransfer_receivedById_fkey" FOREIGN KEY ("receivedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTransfer" ADD CONSTRAINT "StockTransfer_verifiedById_fkey" FOREIGN KEY ("verifiedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTransfer" ADD CONSTRAINT "StockTransfer_cancelledById_fkey" FOREIGN KEY ("cancelledById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTransfer" ADD CONSTRAINT "StockTransfer_heldById_fkey" FOREIGN KEY ("heldById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTransferItem" ADD CONSTRAINT "StockTransferItem_stockTransferId_fkey" FOREIGN KEY ("stockTransferId") REFERENCES "StockTransfer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTransferItem" ADD CONSTRAINT "StockTransferItem_inventoryItemId_fkey" FOREIGN KEY ("inventoryItemId") REFERENCES "InventoryItem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockAdjustment" ADD CONSTRAINT "StockAdjustment_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockAdjustment" ADD CONSTRAINT "StockAdjustment_inventoryItemId_fkey" FOREIGN KEY ("inventoryItemId") REFERENCES "InventoryItem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockAdjustment" ADD CONSTRAINT "StockAdjustment_requestedById_fkey" FOREIGN KEY ("requestedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockAdjustment" ADD CONSTRAINT "StockAdjustment_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquipmentMaintenance" ADD CONSTRAINT "EquipmentMaintenance_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquipmentMaintenance" ADD CONSTRAINT "EquipmentMaintenance_performedById_fkey" FOREIGN KEY ("performedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffShift" ADD CONSTRAINT "StaffShift_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffShift" ADD CONSTRAINT "StaffShift_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffShift" ADD CONSTRAINT "StaffShift_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffShift" ADD CONSTRAINT "StaffShift_shiftTypeId_fkey" FOREIGN KEY ("shiftTypeId") REFERENCES "ShiftType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffShift" ADD CONSTRAINT "StaffShift_rosterId_fkey" FOREIGN KEY ("rosterId") REFERENCES "Roster"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffShift" ADD CONSTRAINT "StaffShift_supervisorId_fkey" FOREIGN KEY ("supervisorId") REFERENCES "Staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveRecord" ADD CONSTRAINT "LeaveRecord_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveRecord" ADD CONSTRAINT "LeaveRecord_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveRecord" ADD CONSTRAINT "LeaveRecord_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveRecord" ADD CONSTRAINT "LeaveRecord_leaveTypeId_fkey" FOREIGN KEY ("leaveTypeId") REFERENCES "LeaveType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveRecord" ADD CONSTRAINT "LeaveRecord_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveRecord" ADD CONSTRAINT "LeaveRecord_extendedFromId_fkey" FOREIGN KEY ("extendedFromId") REFERENCES "LeaveRecord"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftType" ADD CONSTRAINT "ShiftType_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftType" ADD CONSTRAINT "ShiftType_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftTemplate" ADD CONSTRAINT "ShiftTemplate_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftTemplate" ADD CONSTRAINT "ShiftTemplate_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftTemplate" ADD CONSTRAINT "ShiftTemplate_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftTemplate" ADD CONSTRAINT "ShiftTemplate_shiftTypeId_fkey" FOREIGN KEY ("shiftTypeId") REFERENCES "ShiftType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Roster" ADD CONSTRAINT "Roster_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Roster" ADD CONSTRAINT "Roster_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Roster" ADD CONSTRAINT "Roster_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Roster" ADD CONSTRAINT "Roster_lockedById_fkey" FOREIGN KEY ("lockedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Roster" ADD CONSTRAINT "Roster_publishedById_fkey" FOREIGN KEY ("publishedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RosterVersion" ADD CONSTRAINT "RosterVersion_rosterId_fkey" FOREIGN KEY ("rosterId") REFERENCES "Roster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RosterVersion" ADD CONSTRAINT "RosterVersion_changedById_fkey" FOREIGN KEY ("changedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftSwap" ADD CONSTRAINT "ShiftSwap_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftSwap" ADD CONSTRAINT "ShiftSwap_requesterStaffId_fkey" FOREIGN KEY ("requesterStaffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftSwap" ADD CONSTRAINT "ShiftSwap_targetStaffId_fkey" FOREIGN KEY ("targetStaffId") REFERENCES "Staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftSwap" ADD CONSTRAINT "ShiftSwap_requesterShiftId_fkey" FOREIGN KEY ("requesterShiftId") REFERENCES "StaffShift"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftSwap" ADD CONSTRAINT "ShiftSwap_targetShiftId_fkey" FOREIGN KEY ("targetShiftId") REFERENCES "StaffShift"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftSwap" ADD CONSTRAINT "ShiftSwap_supervisorApprovedById_fkey" FOREIGN KEY ("supervisorApprovedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoverageRequest" ADD CONSTRAINT "CoverageRequest_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoverageRequest" ADD CONSTRAINT "CoverageRequest_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoverageRequest" ADD CONSTRAINT "CoverageRequest_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoverageRequest" ADD CONSTRAINT "CoverageRequest_shiftId_fkey" FOREIGN KEY ("shiftId") REFERENCES "StaffShift"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoverageRequest" ADD CONSTRAINT "CoverageRequest_originalStaffId_fkey" FOREIGN KEY ("originalStaffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoverageRequest" ADD CONSTRAINT "CoverageRequest_replacementStaffId_fkey" FOREIGN KEY ("replacementStaffId") REFERENCES "Staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoverageRequest" ADD CONSTRAINT "CoverageRequest_assignedById_fkey" FOREIGN KEY ("assignedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffAvailability" ADD CONSTRAINT "StaffAvailability_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffAvailability" ADD CONSTRAINT "StaffAvailability_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffPreference" ADD CONSTRAINT "StaffPreference_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OnCallSchedule" ADD CONSTRAINT "OnCallSchedule_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OnCallSchedule" ADD CONSTRAINT "OnCallSchedule_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OnCallSchedule" ADD CONSTRAINT "OnCallSchedule_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OnCallSchedule" ADD CONSTRAINT "OnCallSchedule_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveType" ADD CONSTRAINT "LeaveType_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveType" ADD CONSTRAINT "LeaveType_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeavePolicy" ADD CONSTRAINT "LeavePolicy_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeavePolicy" ADD CONSTRAINT "LeavePolicy_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeavePolicy" ADD CONSTRAINT "LeavePolicy_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeavePolicy" ADD CONSTRAINT "LeavePolicy_leaveTypeId_fkey" FOREIGN KEY ("leaveTypeId") REFERENCES "LeaveType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveBalance" ADD CONSTRAINT "LeaveBalance_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveBalance" ADD CONSTRAINT "LeaveBalance_leaveTypeId_fkey" FOREIGN KEY ("leaveTypeId") REFERENCES "LeaveType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveBalance" ADD CONSTRAINT "LeaveBalance_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveBalance" ADD CONSTRAINT "LeaveBalance_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveBalanceAdjustment" ADD CONSTRAINT "LeaveBalanceAdjustment_leaveBalanceId_fkey" FOREIGN KEY ("leaveBalanceId") REFERENCES "LeaveBalance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveBalanceAdjustment" ADD CONSTRAINT "LeaveBalanceAdjustment_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaveBalanceAdjustment" ADD CONSTRAINT "LeaveBalanceAdjustment_authorizedById_fkey" FOREIGN KEY ("authorizedById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Holiday" ADD CONSTRAINT "Holiday_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Holiday" ADD CONSTRAINT "Holiday_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffingRequirement" ADD CONSTRAINT "StaffingRequirement_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffingRequirement" ADD CONSTRAINT "StaffingRequirement_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffingRequirement" ADD CONSTRAINT "StaffingRequirement_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftChangeRequest" ADD CONSTRAINT "ShiftChangeRequest_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftChangeRequest" ADD CONSTRAINT "ShiftChangeRequest_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftChangeRequest" ADD CONSTRAINT "ShiftChangeRequest_originalShiftId_fkey" FOREIGN KEY ("originalShiftId") REFERENCES "StaffShift"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftChangeRequest" ADD CONSTRAINT "ShiftChangeRequest_reviewedById_fkey" FOREIGN KEY ("reviewedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftBreak" ADD CONSTRAINT "ShiftBreak_shiftId_fkey" FOREIGN KEY ("shiftId") REFERENCES "StaffShift"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_uploadedById_fkey" FOREIGN KEY ("uploadedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consent" ADD CONSTRAINT "Consent_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consent" ADD CONSTRAINT "Consent_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consent" ADD CONSTRAINT "Consent_recordedById_fkey" FOREIGN KEY ("recordedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_assignedToId_fkey" FOREIGN KEY ("assignedToId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AuditLog" ADD CONSTRAINT "AuditLog_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AuditLog" ADD CONSTRAINT "AuditLog_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AuditLog" ADD CONSTRAINT "AuditLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientAccessLog" ADD CONSTRAINT "PatientAccessLog_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientAccessLog" ADD CONSTRAINT "PatientAccessLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientAccessLog" ADD CONSTRAINT "PatientAccessLog_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BreakGlassEvent" ADD CONSTRAINT "BreakGlassEvent_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BreakGlassEvent" ADD CONSTRAINT "BreakGlassEvent_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BreakGlassEvent" ADD CONSTRAINT "BreakGlassEvent_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SystemSetting" ADD CONSTRAINT "SystemSetting_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SystemSetting" ADD CONSTRAINT "SystemSetting_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SystemSetting" ADD CONSTRAINT "SystemSetting_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientMergeEvent" ADD CONSTRAINT "PatientMergeEvent_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientMergeEvent" ADD CONSTRAINT "PatientMergeEvent_sourcePatientId_fkey" FOREIGN KEY ("sourcePatientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientMergeEvent" ADD CONSTRAINT "PatientMergeEvent_targetPatientId_fkey" FOREIGN KEY ("targetPatientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientMergeEvent" ADD CONSTRAINT "PatientMergeEvent_mergedById_fkey" FOREIGN KEY ("mergedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PatientMergeEvent" ADD CONSTRAINT "PatientMergeEvent_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffAttendance" ADD CONSTRAINT "StaffAttendance_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffAttendance" ADD CONSTRAINT "StaffAttendance_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffAttendance" ADD CONSTRAINT "StaffAttendance_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffAttendance" ADD CONSTRAINT "StaffAttendance_shiftId_fkey" FOREIGN KEY ("shiftId") REFERENCES "StaffShift"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffAttendance" ADD CONSTRAINT "StaffAttendance_manualEntryById_fkey" FOREIGN KEY ("manualEntryById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceEvent" ADD CONSTRAINT "AttendanceEvent_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceEvent" ADD CONSTRAINT "AttendanceEvent_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceEvent" ADD CONSTRAINT "AttendanceEvent_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceEvent" ADD CONSTRAINT "AttendanceEvent_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceCorrection" ADD CONSTRAINT "AttendanceCorrection_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceCorrection" ADD CONSTRAINT "AttendanceCorrection_attendanceId_fkey" FOREIGN KEY ("attendanceId") REFERENCES "StaffAttendance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceCorrection" ADD CONSTRAINT "AttendanceCorrection_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceCorrection" ADD CONSTRAINT "AttendanceCorrection_reviewedById_fkey" FOREIGN KEY ("reviewedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceException" ADD CONSTRAINT "AttendanceException_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceException" ADD CONSTRAINT "AttendanceException_attendanceId_fkey" FOREIGN KEY ("attendanceId") REFERENCES "StaffAttendance"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceException" ADD CONSTRAINT "AttendanceException_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceException" ADD CONSTRAINT "AttendanceException_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceException" ADD CONSTRAINT "AttendanceException_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendanceException" ADD CONSTRAINT "AttendanceException_resolvedById_fkey" FOREIGN KEY ("resolvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendancePolicy" ADD CONSTRAINT "AttendancePolicy_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendancePolicy" ADD CONSTRAINT "AttendancePolicy_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendancePolicy" ADD CONSTRAINT "AttendancePolicy_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendancePeriod" ADD CONSTRAINT "AttendancePeriod_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendancePeriod" ADD CONSTRAINT "AttendancePeriod_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendancePeriod" ADD CONSTRAINT "AttendancePeriod_lockedById_fkey" FOREIGN KEY ("lockedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttendancePeriod" ADD CONSTRAINT "AttendancePeriod_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OvertimeRecord" ADD CONSTRAINT "OvertimeRecord_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OvertimeRecord" ADD CONSTRAINT "OvertimeRecord_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OvertimeRecord" ADD CONSTRAINT "OvertimeRecord_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OvertimeRecord" ADD CONSTRAINT "OvertimeRecord_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OvertimeRecord" ADD CONSTRAINT "OvertimeRecord_attendanceId_fkey" FOREIGN KEY ("attendanceId") REFERENCES "StaffAttendance"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OvertimeRecord" ADD CONSTRAINT "OvertimeRecord_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingRecord" ADD CONSTRAINT "TrainingRecord_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingRecord" ADD CONSTRAINT "TrainingRecord_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certification" ADD CONSTRAINT "Certification_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certification" ADD CONSTRAINT "Certification_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certification" ADD CONSTRAINT "Certification_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certification" ADD CONSTRAINT "Certification_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certification" ADD CONSTRAINT "Certification_certificationTypeId_fkey" FOREIGN KEY ("certificationTypeId") REFERENCES "CertificationType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certification" ADD CONSTRAINT "Certification_issuerId_fkey" FOREIGN KEY ("issuerId") REFERENCES "CertificationIssuer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certification" ADD CONSTRAINT "Certification_verifiedById_fkey" FOREIGN KEY ("verifiedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationType" ADD CONSTRAINT "CertificationType_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationIssuer" ADD CONSTRAINT "CertificationIssuer_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationRequirement" ADD CONSTRAINT "CertificationRequirement_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationRequirement" ADD CONSTRAINT "CertificationRequirement_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationRequirement" ADD CONSTRAINT "CertificationRequirement_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationRequirement" ADD CONSTRAINT "CertificationRequirement_certificationTypeId_fkey" FOREIGN KEY ("certificationTypeId") REFERENCES "CertificationType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationVerification" ADD CONSTRAINT "CertificationVerification_certificationId_fkey" FOREIGN KEY ("certificationId") REFERENCES "Certification"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationVerification" ADD CONSTRAINT "CertificationVerification_verifiedById_fkey" FOREIGN KEY ("verifiedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationRenewal" ADD CONSTRAINT "CertificationRenewal_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationRenewal" ADD CONSTRAINT "CertificationRenewal_certificationId_fkey" FOREIGN KEY ("certificationId") REFERENCES "Certification"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationRenewal" ADD CONSTRAINT "CertificationRenewal_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationStatusHistory" ADD CONSTRAINT "CertificationStatusHistory_certificationId_fkey" FOREIGN KEY ("certificationId") REFERENCES "Certification"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationStatusHistory" ADD CONSTRAINT "CertificationStatusHistory_changedById_fkey" FOREIGN KEY ("changedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollPeriod" ADD CONSTRAINT "PayrollPeriod_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollPeriod" ADD CONSTRAINT "PayrollPeriod_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollPeriod" ADD CONSTRAINT "PayrollPeriod_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollPeriod" ADD CONSTRAINT "PayrollPeriod_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollRun" ADD CONSTRAINT "PayrollRun_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollRun" ADD CONSTRAINT "PayrollRun_payrollPeriodId_fkey" FOREIGN KEY ("payrollPeriodId") REFERENCES "PayrollPeriod"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollRun" ADD CONSTRAINT "PayrollRun_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollRun" ADD CONSTRAINT "PayrollRun_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollRun" ADD CONSTRAINT "PayrollRun_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollItem" ADD CONSTRAINT "PayrollItem_payrollRunId_fkey" FOREIGN KEY ("payrollRunId") REFERENCES "PayrollRun"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollItem" ADD CONSTRAINT "PayrollItem_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SalaryStructure" ADD CONSTRAINT "SalaryStructure_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SalaryStructure" ADD CONSTRAINT "SalaryStructure_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompensationComponent" ADD CONSTRAINT "CompensationComponent_salaryStructureId_fkey" FOREIGN KEY ("salaryStructureId") REFERENCES "SalaryStructure"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffPayrollProfile" ADD CONSTRAINT "StaffPayrollProfile_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffPayrollProfile" ADD CONSTRAINT "StaffPayrollProfile_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffPayrollProfile" ADD CONSTRAINT "StaffPayrollProfile_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffPayrollProfile" ADD CONSTRAINT "StaffPayrollProfile_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffPayrollProfile" ADD CONSTRAINT "StaffPayrollProfile_salaryStructureId_fkey" FOREIGN KEY ("salaryStructureId") REFERENCES "SalaryStructure"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Allowance" ADD CONSTRAINT "Allowance_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Allowance" ADD CONSTRAINT "Allowance_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Allowance" ADD CONSTRAINT "Allowance_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Deduction" ADD CONSTRAINT "Deduction_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Deduction" ADD CONSTRAINT "Deduction_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Deduction" ADD CONSTRAINT "Deduction_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffLoan" ADD CONSTRAINT "StaffLoan_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffLoan" ADD CONSTRAINT "StaffLoan_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SalaryAdvance" ADD CONSTRAINT "SalaryAdvance_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SalaryAdvance" ADD CONSTRAINT "SalaryAdvance_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollAdjustment" ADD CONSTRAINT "PayrollAdjustment_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollAdjustment" ADD CONSTRAINT "PayrollAdjustment_payrollRunId_fkey" FOREIGN KEY ("payrollRunId") REFERENCES "PayrollRun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollAdjustment" ADD CONSTRAINT "PayrollAdjustment_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StatutoryRule" ADD CONSTRAINT "StatutoryRule_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StatutoryRule" ADD CONSTRAINT "StatutoryRule_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CostCenter" ADD CONSTRAINT "CostCenter_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CostCenter" ADD CONSTRAINT "CostCenter_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CostCenter" ADD CONSTRAINT "CostCenter_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingProgram" ADD CONSTRAINT "TrainingProgram_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingProgram" ADD CONSTRAINT "TrainingProgram_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingProgram" ADD CONSTRAINT "TrainingProgram_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingProgram" ADD CONSTRAINT "TrainingProgram_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES "TrainingProvider"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingProgram" ADD CONSTRAINT "TrainingProgram_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "Trainer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingProvider" ADD CONSTRAINT "TrainingProvider_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trainer" ADD CONSTRAINT "Trainer_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trainer" ADD CONSTRAINT "Trainer_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingSession" ADD CONSTRAINT "TrainingSession_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingSession" ADD CONSTRAINT "TrainingSession_programId_fkey" FOREIGN KEY ("programId") REFERENCES "TrainingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingSession" ADD CONSTRAINT "TrainingSession_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingSession" ADD CONSTRAINT "TrainingSession_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingSession" ADD CONSTRAINT "TrainingSession_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "Trainer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingEnrollment" ADD CONSTRAINT "TrainingEnrollment_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingEnrollment" ADD CONSTRAINT "TrainingEnrollment_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingEnrollment" ADD CONSTRAINT "TrainingEnrollment_programId_fkey" FOREIGN KEY ("programId") REFERENCES "TrainingProgram"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingEnrollment" ADD CONSTRAINT "TrainingEnrollment_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "TrainingSession"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingAttendance" ADD CONSTRAINT "TrainingAttendance_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingAttendance" ADD CONSTRAINT "TrainingAttendance_enrollmentId_fkey" FOREIGN KEY ("enrollmentId") REFERENCES "TrainingEnrollment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingAttendance" ADD CONSTRAINT "TrainingAttendance_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingAttendance" ADD CONSTRAINT "TrainingAttendance_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "TrainingSession"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingAssessment" ADD CONSTRAINT "TrainingAssessment_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingAssessment" ADD CONSTRAINT "TrainingAssessment_programId_fkey" FOREIGN KEY ("programId") REFERENCES "TrainingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingAssessmentResult" ADD CONSTRAINT "TrainingAssessmentResult_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingAssessmentResult" ADD CONSTRAINT "TrainingAssessmentResult_assessmentId_fkey" FOREIGN KEY ("assessmentId") REFERENCES "TrainingAssessment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingAssessmentResult" ADD CONSTRAINT "TrainingAssessmentResult_enrollmentId_fkey" FOREIGN KEY ("enrollmentId") REFERENCES "TrainingEnrollment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingAssessmentResult" ADD CONSTRAINT "TrainingAssessmentResult_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingAssessmentResult" ADD CONSTRAINT "TrainingAssessmentResult_assessorId_fkey" FOREIGN KEY ("assessorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingCertificate" ADD CONSTRAINT "TrainingCertificate_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingCertificate" ADD CONSTRAINT "TrainingCertificate_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingCertificate" ADD CONSTRAINT "TrainingCertificate_programId_fkey" FOREIGN KEY ("programId") REFERENCES "TrainingProgram"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingCertificate" ADD CONSTRAINT "TrainingCertificate_enrollmentId_fkey" FOREIGN KEY ("enrollmentId") REFERENCES "TrainingEnrollment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingRequirement" ADD CONSTRAINT "TrainingRequirement_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingRequirement" ADD CONSTRAINT "TrainingRequirement_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingRequirement" ADD CONSTRAINT "TrainingRequirement_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingRequirement" ADD CONSTRAINT "TrainingRequirement_programId_fkey" FOREIGN KEY ("programId") REFERENCES "TrainingProgram"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingRequest" ADD CONSTRAINT "TrainingRequest_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingRequest" ADD CONSTRAINT "TrainingRequest_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingRequest" ADD CONSTRAINT "TrainingRequest_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingRequest" ADD CONSTRAINT "TrainingRequest_programId_fkey" FOREIGN KEY ("programId") REFERENCES "TrainingProgram"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingPlan" ADD CONSTRAINT "TrainingPlan_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingPlan" ADD CONSTRAINT "TrainingPlan_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingPlan" ADD CONSTRAINT "TrainingPlan_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingPlan" ADD CONSTRAINT "TrainingPlan_programId_fkey" FOREIGN KEY ("programId") REFERENCES "TrainingProgram"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingEvaluation" ADD CONSTRAINT "TrainingEvaluation_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingEvaluation" ADD CONSTRAINT "TrainingEvaluation_programId_fkey" FOREIGN KEY ("programId") REFERENCES "TrainingProgram"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingEvaluation" ADD CONSTRAINT "TrainingEvaluation_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrainingCompetency" ADD CONSTRAINT "TrainingCompetency_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffCompetency" ADD CONSTRAINT "StaffCompetency_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffCompetency" ADD CONSTRAINT "StaffCompetency_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffCompetency" ADD CONSTRAINT "StaffCompetency_competencyId_fkey" FOREIGN KEY ("competencyId") REFERENCES "TrainingCompetency"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffCompetency" ADD CONSTRAINT "StaffCompetency_assessorId_fkey" FOREIGN KEY ("assessorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CPDRecord" ADD CONSTRAINT "CPDRecord_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CPDRecord" ADD CONSTRAINT "CPDRecord_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExternalTrainingRecord" ADD CONSTRAINT "ExternalTrainingRecord_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExternalTrainingRecord" ADD CONSTRAINT "ExternalTrainingRecord_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExternalTrainingRecord" ADD CONSTRAINT "ExternalTrainingRecord_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES "TrainingProvider"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IncidentReport" ADD CONSTRAINT "IncidentReport_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IncidentReport" ADD CONSTRAINT "IncidentReport_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IncidentReport" ADD CONSTRAINT "IncidentReport_reportedById_fkey" FOREIGN KEY ("reportedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftHandover" ADD CONSTRAINT "ShiftHandover_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftHandover" ADD CONSTRAINT "ShiftHandover_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftHandover" ADD CONSTRAINT "ShiftHandover_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftHandover" ADD CONSTRAINT "ShiftHandover_outgoingStaffId_fkey" FOREIGN KEY ("outgoingStaffId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShiftHandover" ADD CONSTRAINT "ShiftHandover_incomingStaffId_fkey" FOREIGN KEY ("incomingStaffId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WardRound" ADD CONSTRAINT "WardRound_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WardRound" ADD CONSTRAINT "WardRound_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WardRound" ADD CONSTRAINT "WardRound_wardId_fkey" FOREIGN KEY ("wardId") REFERENCES "Ward"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WardRound" ADD CONSTRAINT "WardRound_consultantId_fkey" FOREIGN KEY ("consultantId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WardRound" ADD CONSTRAINT "WardRound_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WardRoundPatient" ADD CONSTRAINT "WardRoundPatient_wardRoundId_fkey" FOREIGN KEY ("wardRoundId") REFERENCES "WardRound"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WardRoundPatient" ADD CONSTRAINT "WardRoundPatient_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WardRoundNote" ADD CONSTRAINT "WardRoundNote_wardRoundId_fkey" FOREIGN KEY ("wardRoundId") REFERENCES "WardRound"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WardRoundNote" ADD CONSTRAINT "WardRoundNote_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WardRoundAction" ADD CONSTRAINT "WardRoundAction_wardRoundId_fkey" FOREIGN KEY ("wardRoundId") REFERENCES "WardRound"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WardRoundAction" ADD CONSTRAINT "WardRoundAction_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WardRoundParticipant" ADD CONSTRAINT "WardRoundParticipant_wardRoundId_fkey" FOREIGN KEY ("wardRoundId") REFERENCES "WardRound"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputEntry" ADD CONSTRAINT "IntakeOutputEntry_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputEntry" ADD CONSTRAINT "IntakeOutputEntry_encounterId_fkey" FOREIGN KEY ("encounterId") REFERENCES "Encounter"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputEntry" ADD CONSTRAINT "IntakeOutputEntry_admissionId_fkey" FOREIGN KEY ("admissionId") REFERENCES "Admission"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputEntry" ADD CONSTRAINT "IntakeOutputEntry_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputEntry" ADD CONSTRAINT "IntakeOutputEntry_recordedById_fkey" FOREIGN KEY ("recordedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputEntry" ADD CONSTRAINT "IntakeOutputEntry_verifiedById_fkey" FOREIGN KEY ("verifiedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputEntry" ADD CONSTRAINT "IntakeOutputEntry_amendedById_fkey" FOREIGN KEY ("amendedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputEntry" ADD CONSTRAINT "IntakeOutputEntry_monitoringPeriodId_fkey" FOREIGN KEY ("monitoringPeriodId") REFERENCES "IntakeOutputMonitoringPeriod"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputMonitoringPeriod" ADD CONSTRAINT "IntakeOutputMonitoringPeriod_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputMonitoringPeriod" ADD CONSTRAINT "IntakeOutputMonitoringPeriod_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputMonitoringPeriod" ADD CONSTRAINT "IntakeOutputMonitoringPeriod_admissionId_fkey" FOREIGN KEY ("admissionId") REFERENCES "Admission"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputMonitoringPeriod" ADD CONSTRAINT "IntakeOutputMonitoringPeriod_wardId_fkey" FOREIGN KEY ("wardId") REFERENCES "Ward"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputAlertConfig" ADD CONSTRAINT "IntakeOutputAlertConfig_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputAlertConfig" ADD CONSTRAINT "IntakeOutputAlertConfig_wardId_fkey" FOREIGN KEY ("wardId") REFERENCES "Ward"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputAlert" ADD CONSTRAINT "IntakeOutputAlert_facilityId_fkey" FOREIGN KEY ("facilityId") REFERENCES "Facility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputAlert" ADD CONSTRAINT "IntakeOutputAlert_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputAlert" ADD CONSTRAINT "IntakeOutputAlert_configId_fkey" FOREIGN KEY ("configId") REFERENCES "IntakeOutputAlertConfig"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IntakeOutputAlert" ADD CONSTRAINT "IntakeOutputAlert_acknowledgedById_fkey" FOREIGN KEY ("acknowledgedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BloodUnit" ADD CONSTRAINT "BloodUnit_donorId_fkey" FOREIGN KEY ("donorId") REFERENCES "BloodDonor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BloodTransfusion" ADD CONSTRAINT "BloodTransfusion_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "BloodUnit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpecialtyProcedure" ADD CONSTRAINT "SpecialtyProcedure_specialtyEncounterId_fkey" FOREIGN KEY ("specialtyEncounterId") REFERENCES "SpecialtyEncounter"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpecialtyClinicalNote" ADD CONSTRAINT "SpecialtyClinicalNote_specialtyEncounterId_fkey" FOREIGN KEY ("specialtyEncounterId") REFERENCES "SpecialtyEncounter"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QualityIndicatorValue" ADD CONSTRAINT "QualityIndicatorValue_indicatorId_fkey" FOREIGN KEY ("indicatorId") REFERENCES "QualityIndicator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResearchParticipant" ADD CONSTRAINT "ResearchParticipant_studyId_fkey" FOREIGN KEY ("studyId") REFERENCES "ResearchStudy"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ITTicketComment" ADD CONSTRAINT "ITTicketComment_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES "ITTicket"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ITTicketAttachment" ADD CONSTRAINT "ITTicketAttachment_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES "ITTicket"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ITTicketAssetLink" ADD CONSTRAINT "ITTicketAssetLink_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES "ITTicket"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ITTicketAssetLink" ADD CONSTRAINT "ITTicketAssetLink_assetId_fkey" FOREIGN KEY ("assetId") REFERENCES "ITAsset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecordMovement" ADD CONSTRAINT "RecordMovement_recordRequestId_fkey" FOREIGN KEY ("recordRequestId") REFERENCES "RecordRequest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MortuaryMovement" ADD CONSTRAINT "MortuaryMovement_mortuaryAdmissionId_fkey" FOREIGN KEY ("mortuaryAdmissionId") REFERENCES "MortuaryAdmission"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MortuaryViewing" ADD CONSTRAINT "MortuaryViewing_mortuaryAdmissionId_fkey" FOREIGN KEY ("mortuaryAdmissionId") REFERENCES "MortuaryAdmission"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MortuaryProperty" ADD CONSTRAINT "MortuaryProperty_mortuaryAdmissionId_fkey" FOREIGN KEY ("mortuaryAdmissionId") REFERENCES "MortuaryAdmission"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BloodDonation" ADD CONSTRAINT "BloodDonation_donorId_fkey" FOREIGN KEY ("donorId") REFERENCES "BloodDonor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BloodCrossmatch" ADD CONSTRAINT "BloodCrossmatch_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "BloodUnit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

