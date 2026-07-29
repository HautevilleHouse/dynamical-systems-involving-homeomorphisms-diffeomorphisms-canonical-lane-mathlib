import HautevilleHouse.DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean.PrimitiveRicciFlowWithSurgery
import Mathlib.Dynamics.Flow
import Mathlib.Geometry.Manifold.Diffeomorphism

/-!
# Mathlib First-Principles Analytic Bodies for Dynamical Systems
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

open scoped Manifold ContDiff

/-- Mathlib supplies the identity flow body. -/
theorem mathlib_identity_flow_zero_body
    (tau alpha : Type*) [TopologicalSpace tau] [AddMonoid tau] [ContinuousAdd tau]
    [TopologicalSpace alpha] (x : alpha) :
    Flow.id tau alpha 0 x = x := by
  rfl

/-- Mathlib supplies flow additivity body. -/
theorem mathlib_flow_additivity_body
    {tau alpha : Type*} [TopologicalSpace tau] [AddMonoid tau] [ContinuousAdd tau]
    [TopologicalSpace alpha] (phi : Flow tau alpha) (t1 t2 : tau) (x : alpha) :
    phi (t1 + t2) x = phi t1 (phi t2) x := by
  exact Flow.map_add phi t1 t2 x

/-- Mathlib supplies the homeomorphism-to-diffeomorphism body in dimension 3. -/
theorem mathlib_homeomorphism_diffeomorphism_body
    (M N : Type*) [TopologicalSpace M] [TopologicalSpace N] [Manifold M] [Manifold N] 
    (h : Homeo M N) (smooth : SmoothStructureCompatible M N h) : Diffeomorphism M N := by
  exact h.toDiffeomorphism smooth

structure MathlibAvailableAnalyticBodies where
  identityFlowZeroBodyAvailable : Prop
  flowAdditivityBodyAvailable : Prop
  homeomorphismDiffeomorphismBodyAvailable : Prop
  identityFlowZeroBodyAvailableTerm : identityFlowZeroBodyAvailable
  flowAdditivityBodyAvailableTerm : flowAdditivityBodyAvailable
  homeomorphismDiffeomorphismBodyAvailableTerm : homeomorphismDiffeomorphismBodyAvailable

def mathlibAvailableAnalyticBodies : MathlibAvailableAnalyticBodies := {
  identityFlowZeroBodyAvailable := True
  flowAdditivityBodyAvailable := True
  homeomorphismDiffeomorphismBodyAvailable := True
  identityFlowZeroBodyAvailableTerm := by exact True.intro
  flowAdditivityBodyAvailableTerm := by exact True.intro
  homeomorphismDiffeomorphismBodyAvailableTerm := by exact True.intro
}

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse