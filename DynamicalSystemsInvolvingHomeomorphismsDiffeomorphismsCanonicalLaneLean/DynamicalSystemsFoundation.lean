import DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

structure DynamicalSystemsPackage where
  phaseSpace : Type u
  time : Type v
  flowMap : time → phaseSpace → phaseSpace
  homeomorphism : Prop
  diffeomorphism : Prop
  smoothStructure : Prop

structure DynamicalSystemsEvidence (D : DynamicalSystemsPackage) where
  homeomorphismClosed : D.homeomorphism
  diffeomorphismClosed : D.diffeomorphism
  smoothStructureClosed : D.smoothStructure

def DynamicalSystemsClosed (D : DynamicalSystemsPackage) : Prop :=
  D.homeomorphism ∧ D.diffeomorphism ∧ D.smoothStructure

theorem dynamical_systems_closed_from_evidence (D : DynamicalSystemsPackage)
    (E : DynamicalSystemsEvidence D) : DynamicalSystemsClosed D := by
  exact And.intro E.homeomorphismClosed
    (And.intro E.diffeomorphismClosed E.smoothStructureClosed)

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse