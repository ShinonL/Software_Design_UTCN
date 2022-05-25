import { HealthReferenceModel } from "./health-reference.model";

export interface PetTypeModel {
    id?: string,
    type?: string,
    healthReferences?: HealthReferenceModel[]
}