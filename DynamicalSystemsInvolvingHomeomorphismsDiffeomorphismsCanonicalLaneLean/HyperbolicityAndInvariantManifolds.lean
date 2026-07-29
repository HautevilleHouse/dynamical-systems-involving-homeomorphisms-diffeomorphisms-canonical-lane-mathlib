import DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean.DynamicalSystemsFoundation

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

structure HyperbolicityPackage {D : DynamicalSystemsPackage} where
  hyperbolicSet : Prop
  stableManifold : Prop
  unstableManifold : Prop
  invariantFoliation : Prop

structure HyperbolicityEvidence {D : DynamicalSystemsPackage}
    (H : HyperbolicityPackage D) where
  hyperbolicSetClosed : H.hyperbolicSet
  stableManifoldClosed : H.stableManifold
  unstableManifoldClosed : H.unstableManifold
  invariantFoliationClosed : H.invariantFoliation

def HyperbolicityClosed {D : DynamicalSystemsPackage}
    (H : HyperbolicityPackage D) : Prop :=
  H.hyperbolicSet ∧ H.stableManifold ∧ H.unstableManifold ∧ H.invariantFoliation

theorem hyperbolicity_closed_from_evidence {D : DynamicalSystemsPackage}
    (H : HyperbolicityPackage D) (E : HyperbolicityEvidence H) :
    HyperbolicityClosed H := by
  exact And.intro E.hyperbolicSetClosed
    (And.intro E.stableManifoldClosed
      (And.intro E.unstableManifoldClosed E.invariantFoliationClosed))

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse