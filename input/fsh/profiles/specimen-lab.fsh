Profile: SpecimenEu
Parent: Specimen
Id: Specimen-eu-lab
Title: "Specimen: Laboratory"
Description: """This profile defines how to represent Specimens in HL7 FHIR for the purpose of this guide."""
* ^status = #draft
// * ^publisher = "HL7 Europe"
// * ^copyright = "HL7 Europe"
* insert SetFmmandStatusRule ( 1, draft )
* . ^short = "Laboratory Specimen"
* . ^definition = "Laboratory specimen"

/*
* extension contains $specimen-feature-type-r5 named SpecimenFeatureTypeR5 0..*
* extension[SpecimenFeatureTypeR5].valueCodeableConcept
*/
* subject only Reference ( PatientEuLab or PatientAnimalEu or Group  or Device or Substance or Location)

* type from LabSpecimenTypesEuVs (preferred)
* type 1..1

//=== COMMENTED UNTIL https://chat.fhir.org/#narrow/stream/215610-shorthand/topic/Issue.20with.20Specimen.2Ecollection.2Edevice.20R5.20extension IS NOT RESOLVED
/*
* collection.extension contains $specimen-collection-device-r5 named SpecimenCollectionDeviceR5 0..1
* collection.extension[SpecimenCollectionDeviceR5]
*/
* collection.bodySite from http://hl7.org/fhir/ValueSet/body-site (preferred)
//=== COMMENTED UNTIL https://chat.fhir.org/#narrow/stream/215610-shorthand/topic/Issue.20with.20Specimen.2Ecollection.2Edevice.20R5.20extension IS NOT RESOLVED
/*
* collection.bodySite.extension contains $specimen-collection-body-site-r5 named SpecimenCollectionBodySiteR5 0..1
* collection.bodySite.extension[SpecimenCollectionBodySiteR5].valueCodeableReference only CodeableReference(BodyStructureEuLab)
*/

* processing.additive only Reference(Substance or SpecimenAdditiveSubstance)
* container.type from LabSpecimenContainerEu (preferred)

// ----------------------------------------

Profile: SpecimenAdditiveSubstance
Parent: Substance
Id: specimen-additive-substance-eu-lab
Title: "Substance: Specimen Additive Substance"
Description: """This profile defines how to represent Specimen Additive Substances in HL7 FHIR for the purpose of this guide."""
* code from LabSpecimenAdditiveEu (preferred)

Profile: BodyStructureEuLab
Parent: BodyStructure
Id: body-structure-eu-lab
Title: "Body structure: Laboratory"
Description: """This profile defines how to represent Body Structure in HL7 FHIR for the purpose of this guide."""
* morphology from http://hl7.org/fhir/ValueSet/bodystructure-code (preferred)
* location from http://hl7.org/fhir/ValueSet/body-site (preferred)
* locationQualifier from LabLateralityEuVs (extensible)
* image 0..0