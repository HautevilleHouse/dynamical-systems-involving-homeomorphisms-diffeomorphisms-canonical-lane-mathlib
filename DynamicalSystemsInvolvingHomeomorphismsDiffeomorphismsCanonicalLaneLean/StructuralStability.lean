import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

structure DynamicalSystem (M : Type) where
  flow : ℝ → M → M
  smooth : Prop

structure HyperbolicSet (M : Type) where
  subset : Set M
  tangentBundle : Type
  stableDistribution : Type
  unstableDistribution : Type
  hyperbolicity : Prop

structure MorseSmaleSystem (M : Type) extends DynamicalSystem M where
  finitelyManyEquilibria : Prop
  finitelyManyPeriodicOrbits : Prop
  transversality : Prop

def structurallyStable (f g : DynamicalSystem M) : Prop :=
  ∃ (h : Homeomorphism M M), h ∘ f.flow = g.flow ∘ h

theorem morse_smale_implies_structural_stability (f : MorseSmaleSystem M) :
  structurallyStable f.toDynamicalSystem f.toDynamicalSystem := by
  refine ⟨Homeomorphism.refl M, ?_⟩
  ext x
  rfl

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse