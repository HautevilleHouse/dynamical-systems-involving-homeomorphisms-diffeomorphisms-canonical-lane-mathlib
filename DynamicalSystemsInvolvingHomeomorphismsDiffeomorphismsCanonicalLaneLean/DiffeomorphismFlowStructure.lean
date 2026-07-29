import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean

/-!
# Diffeomorphism Flow Structure Package
-/

structure SmoothManifold where
  carrier : Type u
  topology : TopologicalSpace carrier
  smoothAtlas : Type v
  smoothStructure : Prop

structure TangentBundle (M : SmoothManifold) where
  fiber : M.carrier → Type w
  projection : (x : M.carrier) → (fiber x) → M.carrier
  localTrivialization : Prop

diffeomorphism_structure diffeomorphism_structure hausdorff_second_countable hausdorff_second_countable
structure Diffeomorphism (M N : SmoothManifold) where
  toFun : M.carrier → N.carrier
  smooth : Prop
  invertibleSmooth : Prop
  smoothInverse : Prop
    
structure FlowDomain (M : SmoothManifold) where
  timeSet : Type v
  topology : TopologicalSpace timeSet
  additiveGroup : AddGroup timeSet
  continuousAddition : ContinuousAdd timeSet

structure Flow (M : SmoothManifold) (D : FlowDomain M) where
  flowMap : D.timeSet → M.carrier → M.carrier
  groupLaw : ∀ t s x, flowMap (t + s) x = flowMap t (flowMap s x)
  identity : ∀ x, flowMap 0 x = x
  smoothInTime : Prop
  smoothInSpace : Prop

structure DiffeomorphismFlowStructurePackage (M : SmoothManifold) (D : FlowDomain M) (F : Flow M D) where
  generator : TangentBundle M
  exponentialMapDefined : Prop
  oneParameterSubgroup : Prop
  linearizationAtFixedPoint : Prop
  structuralStability : Prop

structure DiffeomorphismFlowStructureEvidence {M : SmoothManifold} {D : FlowDomain M} {F : Flow M D}
    (P : DiffeomorphismFlowStructurePackage M D F) where
  generatorClosed : P.generator
  exponentialMapDefinedClosed : P.exponentialMapDefined
  oneParameterSubgroupClosed : P.oneParameterSubgroup
  linearizationAtFixedPointClosed : P.linearizationAtFixedPoint
  structuralStabilityClosed : P.structuralStability

def DiffeomorphismFlowStructureClosed {M : SmoothManifold} {D : FlowDomain M} {F : Flow M D}
    (P : DiffeomorphismFlowStructurePackage M D F) : Prop :=
  P.generator ∧ P.exponentialMapDefined ∧ P.oneParameterSubgroup ∧
  P.linearizationAtFixedPoint ∧ P.structuralStability

theorem diffeomorphism_flow_structure_closed_from_evidence
    {M : SmoothManifold} {D : FlowDomain M} {F : Flow M D}
    (P : DiffeomorphismFlowStructurePackage M D F) (E : DiffeomorphismFlowStructureEvidence P) :
    DiffeomorphismFlowStructureClosed P := by
  exact And.intro E.generatorClosed
    (And.intro E.exponentialMapDefinedClosed
      (And.intro E.oneParameterSubgroupClosed
        (And.intro E.linearizationAtFixedPointClosed E.structuralStabilityClosed)))

end DynamicalSystemsInvolvingHomeomorphismsDiffeomorphismsCanonicalLaneLean
end HautevilleHouse