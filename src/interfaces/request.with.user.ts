
import { Request } from "express";
import { User } from "../entities/user/user.entity";

/**
 * Express class extension Request optional parameters user
 */
export interface RequestWitUser extends Request {
  user?: User;
}
