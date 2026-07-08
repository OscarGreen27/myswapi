import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { User } from "./user.entity";
import { Repository } from "typeorm";
import { UserRegistrationDto } from "./user-registration.dto";
import { ConfigService } from "@nestjs/config";
import * as bcrypt from "bcrypt";

/**
 *service for working with the user entity
 */
@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User) private userRepository: Repository<User>,
    private readonly configService: ConfigService,
  ) {}
  /**
   * function finds user by name
   * @param userName user name
   * @returns user entity if id match, null if not
   */
  async findOne(userName: string): Promise<User | null> {
    return await this.userRepository.findOne({ where: { userName: userName } });
  }

  /**
   * the function checks if the username exists in the database
   * @param userName user name
   * @returns true if user name exist, false if not
   */
  async itUserExist(userName: string): Promise<boolean> {
    return await this.userRepository.exists({ where: { userName } });
  }

  /**
   * The function creates a new record in the users table.
   * @param newUserData object with new user name and password
   * @returns true if new user added to database, undefined if not
   */
  async addNewUser(newUserData: UserRegistrationDto) {
    const salt = await bcrypt.genSalt(Number(this.configService.get("SALT")));
    const hash = await bcrypt.hash(newUserData.password, salt);
    const saved = await this.userRepository.save({
      userName: newUserData.userName,
      password: hash,
    });
    if (saved) {
      return true;
    }
  }
}
