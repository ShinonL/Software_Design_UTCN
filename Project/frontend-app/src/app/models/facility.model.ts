import { ReviewModel } from "./review.model";

export interface FacilityModel {
    id?: string,
    name?: string,
    description?: string,
    price?: number,
    score?: number,
    noAppointments?: number,
    appointmentIds?: string[],
    reviews?: ReviewModel[]
}