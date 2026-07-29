import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

structure DynamicalEndgameState where
  object : DynamicalAdmittedObject

def dynamicalProjection : DynamicalEndgameState → DynamicalEndgameState := id

theorem dynamical_projection_idempotent (x : DynamicalEndgameState) :
    dynamicalProjection (dynamicalProjection x) = dynamicalProjection x := rfl

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse