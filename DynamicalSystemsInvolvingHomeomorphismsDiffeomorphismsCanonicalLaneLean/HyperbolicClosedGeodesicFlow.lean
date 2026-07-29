import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

/-!
# Hyperbolic Closed Geodesic Flow Package
-/

structure RiemannianMetric (M : SmoothManifold) where
  innerProduct : (x : M.carrier) → TangentBundle M → TangentBundle M → ℝ
  smooth : Prop
  positiveDefinite : Prop

structure GeodesicFlow (M : SmoothManifold) (g : RiemannianMetric M) where
  flowMap : ℝ → M.carrier → M.carrier
  geodesicEquation : Prop
  complete : Prop

structure HyperbolicStructure (M : SmoothManifold) (g : RiemannianMetric M) where
  sectionalCurvatureNegative : Prop
  strictlyNegative : Prop
  uniformNegativity : Prop

structure AnosovProperty (M : SmoothManifold) (g : RiemannianMetric M) (G : GeodesicFlow M g) where
  hyperbolicSplitting : Prop
  uniformContractionExpansion : Prop
  stableUnstableDistributions : Prop

structure HyperbolicClosedGeodesicFlowPackage (M : SmoothManifold) (g : RiemannianMetric M)
    (G : GeodesicFlow M g) (H : HyperbolicStructure M g) (A : AnosovProperty M g G) where
  closedOrbitsDense : Prop
  topologicalTransitivity : Prop
  mixing : Prop
  entropyPositive : Prop
  periodicOrbitsCountable : Prop

structure HyperbolicClosedGeodesicFlowEvidence {M : SmoothManifold} {g : RiemannianMetric M}
    {G : GeodesicFlow M g} {H : HyperbolicStructure M g} {A : AnosovProperty M g G}
    (P : HyperbolicClosedGeodesicFlowPackage M g G H A) where
  closedOrbitsDenseClosed : P.closedOrbitsDense
  topologicalTransitivityClosed : P.topologicalTransitivity
  mixingClosed : P.mixing
  entropyPositiveClosed : P.entropyPositive
  periodicOrbitsCountableClosed : P.periodicOrbitsCountable

def HyperbolicClosedGeodesicFlowClosed {M : SmoothManifold} {g : RiemannianMetric M}
    {G : GeodesicFlow M g} {H : HyperbolicStructure M g} {A : AnosovProperty M g G}
    (P : HyperbolicClosedGeodesicFlowPackage M g G H A) : Prop :=
  P.closedOrbitsDense ∧ P.topologicalTransitivity ∧ P.mixing ∧
  P.entropyPositive ∧ P.periodicOrbitsCountable

theorem hyperbolic_closed_geodesic_flow_closed_from_evidence
    {M : SmoothManifold} {g : RiemannianMetric M} {G : GeodesicFlow M g}
    {H : HyperbolicStructure M g} {A : AnosovProperty M g G}
    (P : HyperbolicClosedGeodesicFlowPackage M g G H A)
    (E : HyperbolicClosedGeodesicFlowEvidence P) :
    HyperbolicClosedGeodesicFlowClosed P := by
  exact And.intro E.closedOrbitsDenseClosed
    (And.intro E.topologicalTransitivityClosed
      (And.intro E.mixingClosed
        (And.intro E.entropyPositiveClosed E.periodicOrbitsCountableClosed)))

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse