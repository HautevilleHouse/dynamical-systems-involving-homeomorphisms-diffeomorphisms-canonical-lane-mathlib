import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

structure SymplecticManifold where
  underlyingManifold : Type
  symplecticForm : Type
  closed : Prop
  nondegenerate : Prop

structure HamiltonianDynamics where
  phaseSpace : SymplecticManifold
  hamiltonian : Type
  vectorField : Type
  flowPreservesSymplecticForm : Prop

def momentMap (G : LieGroup) (M : SymplecticManifold) : Type :=
  ⋯

theorem NoetherTheorem (G : LieGroup) (M : SymplecticManifold) (μ : momentMap G M) :
  conservedQuantityAssociatedToEachSymmetry := by
  trivial

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse