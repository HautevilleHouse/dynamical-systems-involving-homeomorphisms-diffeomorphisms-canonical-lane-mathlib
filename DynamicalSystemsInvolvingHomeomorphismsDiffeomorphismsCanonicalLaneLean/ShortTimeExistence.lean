import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean.RiemannianCurvature

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

structure ShortTimeExistencePackage {G : RiemannianCurvaturePackage} where
  initialMetricRegular : Prop
  parabolicWellPosedness : Prop
  localExistenceInterval : Prop
  uniquenessOnOverlap : Prop
  smoothDependence : Prop

structure ShortTimeExistenceEvidence {G : RiemannianCurvaturePackage}
    (S : ShortTimeExistencePackage G) where
  initialMetricRegularClosed : S.initialMetricRegular
  parabolicWellPosednessClosed : S.parabolicWellPosedness
  localExistenceIntervalClosed : S.localExistenceInterval
  uniquenessOnOverlapClosed : S.uniquenessOnOverlap
  smoothDependenceClosed : S.smoothDependence

def ShortTimeExistenceClosed {G : RiemannianCurvaturePackage}
    (S : ShortTimeExistencePackage G) : Prop :=
  S.initialMetricRegular ∧
  S.parabolicWellPosedness ∧
  S.localExistenceInterval ∧
  S.uniquenessOnOverlap ∧
  S.smoothDependence

theorem short_time_existence_closed_from_evidence
    {G : RiemannianCurvaturePackage} (S : ShortTimeExistencePackage G)
    (E : ShortTimeExistenceEvidence S) : ShortTimeExistenceClosed S := by
  exact And.intro E.initialMetricRegularClosed
    (And.intro E.parabolicWellPosednessClosed
      (And.intro E.localExistenceIntervalClosed
        (And.intro E.uniquenessOnOverlapClosed E.smoothDependenceClosed)))

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse