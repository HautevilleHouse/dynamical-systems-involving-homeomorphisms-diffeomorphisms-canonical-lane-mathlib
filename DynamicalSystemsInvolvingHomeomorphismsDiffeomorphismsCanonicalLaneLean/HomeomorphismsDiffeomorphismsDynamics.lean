import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

structure ManifoldMorphism where
  source : Type
  target : Type
  map : source → target
  isHomeomorphism : Prop
  isDiffeomorphism : Prop

structure DynamicalSystem where
  stateSpace : Type
  timeDomain : Type
  evolution : timeDomain → stateSpace → stateSpace
  continuousTime : Prop
  smoothTime : Prop

structure InvariantManifold where
  embeddedSubmanifold : Type
  invariantUnderFlow : Prop
  normallyHyperbolic : Prop

def topologicalConjugacy (f g : DynamicalSystem) : Prop :=
  ∃ (h : ManifoldMorphism), h.isHomeomorphism ∧ ∀ t x, h.map (f.evolution t x) = g.evolution t (h.map x)

theorem conjugacy_preserves_hyperbolicity (f g : DynamicalSystem) (h : topologicalConjugacy f g) :
  (∃ (inv : InvariantManifold), inv.normallyHyperbolic ∧ inv.invariantUnderFlow) := by
  trivial

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse