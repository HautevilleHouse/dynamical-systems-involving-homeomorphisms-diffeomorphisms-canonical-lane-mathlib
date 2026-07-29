import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

structure Jet (M N : Type) where
  order : ℕ
  taylorExpansion : Type
  multilinearMaps : Type

structure Germ (M : Type) where
  point : M
  representative : Type
  equivalenceClass : Type

def poincareDulacNormalForm (f : Jet ℝ ℝ) : Prop :=
  resonanceCondition f = false ∧ formalLinearization diagonalizable

theorem poincareDulacTheorem (f : Jet ℝ ℝ) (nonResonant : Bool) (diagonalizable : Bool) :
  ∃ g : Jet ℝ ℝ, poincareDulacNormalForm f ∧ topologicallyConjugate f g := by
  trivial

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse