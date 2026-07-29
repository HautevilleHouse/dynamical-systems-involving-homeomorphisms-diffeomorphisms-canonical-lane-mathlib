import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

structure DynamicalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DynamicalAdmittedObject where
  space : DynamicalSpace
  manifoldProperty : Prop
  dynamicalSystem : Prop
  homeomorphismExists : Prop
  diffeomorphismExists : Prop
  conclusion : homeomorphismExists ∨ diffeomorphismExists

def DynamicalWitnessClosed (O : DynamicalAdmittedObject) : Prop :=
  O.homeomorphismExists ∨ O.diffeomorphismExists

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse