import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Image } from "./image.entity";
import { S3Service } from "./s3.service";

@Injectable()
export class ImageService {
  constructor(
    @InjectRepository(Image) private imageRepository: Repository<Image>,
    private s3Service: S3Service,
  ) {}

  async getAll(id: number, entityType: string) {
    const result = await this.imageRepository.find({ where: { entity_id: id, entity_type: entityType } });
    return result;
  }

  async upload(entityId: number, entityType: string, file: Express.Multer.File) {
    const { url, key } = await this.saveToBucket(entityId, entityType, file);
    const newImage = this.imageRepository.create({
      entity_id: entityId,
      entity_type: entityType,
      image_url: url,
      key: key,
    });
    const result = await this.imageRepository.save(newImage);
    return result;
  }
  async delete(key: string) {
    const bucketDelete = await this.deleteFromBucket(key);
    const dbDelete = await this.imageRepository.delete({ key: key });

    return {
      deleted_from_db: (dbDelete.affected ?? 0) > 0,
      deleted_from_bucket: bucketDelete ? true : false,
    };
  }

  //---------- private methods ----------
  private saveToBucket(id: number, type: string, file: Express.Multer.File) {
    return this.s3Service.uploadImage(id, type, file);
  }

  private deleteFromBucket(key: string) {
    return this.s3Service.deleteImage(key);
  }
}
