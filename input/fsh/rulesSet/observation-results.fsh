/* Profile: ObservationResultsEu
Parent: Observation
Id: Observation-results-eu-lab
Title:    "Observation Results"
Description: "This profile constrains the Observation resource to represent various types of results and associated observations in a patient summary. This is the base profile from which the other results profiles are derived."
* ^experimental = false
* ^purpose = "This profile constrains the Observation resource to represent various types of results and associated observations in a patient summary." */
// * ^publisher = "HL7 Europe"
// * ^copyright = "HL7 Europe"

RuleSet: ObservationResultsEu
// * insert SetFmmandStatusRule ( 0, draft )
// * status = #final (exactly) // is this still true ?
* status ^short = "Status of this observation (e.g. preliminary, final,...)"
* category only $CodeableConcept-uv-ips
* code only $CodeableConcept-uv-ips
// * code MS
* subject 1..
* subject only Reference(Patient or PatientEu or Group or Device or Location)
* subject.reference 1..
* effective[x] 1..
* effective[x] only dateTime or Period
* effective[x].extension contains $SD-data-absent-reason named data-absent-reason 0..1
* effective[x].extension[data-absent-reason] ^short = "effective[x] absence reason"
* effective[x].extension[data-absent-reason] ^definition = "Provides a reason why the effectiveTime is missing."
* performer only Reference(PractitionerEu or PractitionerRoleEu or $Organization-uv-ips or CareTeam or PatientEu or RelatedPerson)
// * value[x] MS
// removed circular reference
// * hasMember only Reference(ObservationResultsEu or Observation or QuestionnaireResponse or MolecularSequence)
* hasMember only Reference(Observation or QuestionnaireResponse or MolecularSequence)
* component ^short = "Laboratory result"

RuleSet: ObservationResultsValueEu
//* value[x]
* value[x] ^slicing.discriminator.type = #type
* value[x] ^slicing.discriminator.path = "$this"
* value[x] ^slicing.rules = #closed
* valueString only string
// * valueString MS
* valueString ^sliceName = "valueString"
//* valueRange only $Range-uv-ips
* valueRange only Range-eu-lab
* valueRange ^sliceName = "valueRange"
//* valueRatio only $Ratio-uv-ips
* valueRatio only Ratio-eu-lab
* valueRatio ^sliceName = "valueRatio"
* valueTime only time
* valueTime ^sliceName = "valueTime"
* valueDateTime only dateTime
* valueDateTime ^sliceName = "valueDateTime"
* valuePeriod only Period
* valuePeriod ^sliceName = "valuePeriod"
// * valueQuantity only $Quantity-uv-ips
* valueQuantity only Quantity-eu-lab
// * valueQuantity MS
* valueQuantity ^sliceName = "valueQuantity"
* valueCodeableConcept only $CodeableConcept-uv-ips
// * valueCodeableConcept MS
* valueCodeableConcept from $results-coded-values-laboratory-uv-ips (preferred)
* valueCodeableConcept ^sliceName = "valueCodeableConcept"
* valueCodeableConcept ^binding.extension[0].extension[0].url = "purpose"
* valueCodeableConcept ^binding.extension[=].extension[=].valueCode = #candidate
* valueCodeableConcept ^binding.extension[=].extension[+].url = "valueSet"
* valueCodeableConcept ^binding.extension[=].extension[=].valueCanonical = "http://hl7.org/fhir/uv/ips/ValueSet/results-blood-group-snomed-ct-ips-free-set"
* valueCodeableConcept ^binding.extension[=].extension[+].url = "documentation"
* valueCodeableConcept ^binding.extension[=].extension[=].valueMarkdown = "Additional conformance binding to a blood group findings value set for laboratory result values from the SNOMED CT IPS free set for use globally (in SNOMED member and non-member jurisdictions)."
* valueCodeableConcept ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* valueCodeableConcept ^binding.extension[+].extension[0].url = "purpose"
* valueCodeableConcept ^binding.extension[=].extension[=].valueCode = #candidate
* valueCodeableConcept ^binding.extension[=].extension[+].url = "valueSet"
* valueCodeableConcept ^binding.extension[=].extension[=].valueCanonical = "http://hl7.org/fhir/uv/ips/ValueSet/results-presence-absence-snomed-ct-ips-free-set"
* valueCodeableConcept ^binding.extension[=].extension[+].url = "documentation"
* valueCodeableConcept ^binding.extension[=].extension[=].valueMarkdown = "Additional conformance binding to a presence and absence findings (qualifier values) value set for laboratory result values from the SNOMED CT IPS free set for use globally (in SNOMED member and non-member jurisdictions)."
* valueCodeableConcept ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* valueCodeableConcept ^binding.extension[+].extension[0].url = "purpose"
* valueCodeableConcept ^binding.extension[=].extension[=].valueCode = #candidate
* valueCodeableConcept ^binding.extension[=].extension[+].url = "valueSet"
* valueCodeableConcept ^binding.extension[=].extension[=].valueCanonical = "http://hl7.org/fhir/uv/ips/ValueSet/results-microorganism-snomed-ct-ips-free-set"
* valueCodeableConcept ^binding.extension[=].extension[+].url = "documentation"
* valueCodeableConcept ^binding.extension[=].extension[=].valueMarkdown = "Additional conformance binding to a microorganisms value set for laboratory result values from the SNOMED CT IPS free set for use globally (in SNOMED member and non-member jurisdictions)."
* valueCodeableConcept ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
