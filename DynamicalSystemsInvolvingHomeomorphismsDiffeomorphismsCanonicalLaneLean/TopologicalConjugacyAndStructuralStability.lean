import DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean.HyperbolicityAndInvariantManifolds

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

structure TopologicalConjugacyPackage {D : DynamicalSystemsPackage} where
  conjugateSystem : DynamicalSystemsPackage
  conjugacyHomeomorphism : Prop
  conjugacyDiffeomorphism : Prop
  structuralStability : Prop

structure TopologicalConjugacyEvidence {D : DynamicalSystemsPackage}
    (T : TopologicalConjugacyPackage D) where
  conjugacyHomeomorphismClosed : T.conjugacyHomeomorphism
  conjugacyDiffeomorphismClosed : T.conjugacyDiffeomorphism
  structuralStabilityClosed : T.structuralStability

def TopologicalConjugacyClosed {D : DynamicalSystemsPackage}
    (T : TopologicalConjugacyPackage D) : Prop :=
  T.conjugacyHomeomorphism ∧ T.conjugacyDiffeomorphism ∧ T.structuralStability

theorem topological_conjugacy_closed_from_evidence {D : DynamicalSystemsPackage}
    (T : TopologicalConjugacyPackage D) (E : TopologicalConjugacyEvidence T) :
    TopologicalConjugacyClosed T := by
  exact And.intro E.conjugacyHomeomorphismClosed
    (And.intro E.conjugacyDiffeomorphismClosed E.structuralStabilityClosed)

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse