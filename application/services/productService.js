const Product = require('../models/productModel');

class ProductService {
  static async getAllProducts() {
    return await Product.find();
  }

  static async getProductById(id) {
    return await Product.findById(id);
  }

  static async createProduct(productData) {
    const product = new Product(productData);
    return await product.save();
  }

  static async updateProduct(id, productData) {
    return await Product.findByIdAndUpdate(id, productData, { new: true });
  }

  static async deleteProduct(id) {
    return await Product.findByIdAndDelete(id);
  }
}

module.exports = ProductService;
