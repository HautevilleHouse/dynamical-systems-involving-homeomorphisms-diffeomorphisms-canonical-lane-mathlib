import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

structure SingularityModelsPackage where
  blowupSequenceExists : Prop
  ancientSolutionLimit : Prop
  kappaSolutionClassification : Prop
  neckOrCapModel : Prop

structure SingularityModelsEvidence (Q : SingularityModelsPackage) where
  blowupSequenceExistsClosed : Q.blowupSequenceExists
  ancientSolutionLimitClosed : Q.ancientSolutionLimit
  kappaSolutionClassificationClosed : Q.kappaSolutionClassification
  neckOrCapModelClosed : Q.neckOrCapModel

def SingularityModelsClosed (Q : SingularityModelsPackage) : Prop :=
  Q.blowupSequenceExists ∧ Q.ancientSolutionLimit ∧
  Q.kappaSolutionClassification ∧ Q.neckOrCapModel

theorem singularity_models_closed_from_evidence (Q : SingularityModelsPackage)
    (E : SingularityModelsEvidence Q) : SingularityModelsClosed Q := by
  exact And.intro E.blowupSequenceExistsClosed
    (And.intro E.ancientSolutionLimitClosed
      (And.intro E.kappaSolutionClassificationClosed E.neckOrCapModelClosed))

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse