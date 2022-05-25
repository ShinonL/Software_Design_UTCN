import { FacilityModel } from "./facility.model";
import { ResultModel } from "./result.model";

export interface AppointmentModel {
    id?: string,
    dateTime: Date,
    appointmentState: string,
    facilities: FacilityModel[],
    results?: ResultModel[],
    toDecline: boolean,
    petId?: string
}