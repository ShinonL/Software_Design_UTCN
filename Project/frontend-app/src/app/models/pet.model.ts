import { AppointmentModel } from "./appointment.model";
import { PetTypeModel } from "./pet-type.model";
import { UserModel } from "./user.model";

export interface PetModel {
    id?: string,
    name: string,
    age: number,
    petType: PetTypeModel,
    appointments?: AppointmentModel[],
    user?: UserModel
}