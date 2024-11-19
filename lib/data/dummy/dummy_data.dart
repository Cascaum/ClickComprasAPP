import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/category_model.dart';
import '../../features/shop/models/product_attribute_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../features/shop/models/product_variation_model.dart';
import '../../routes/routes.dart';
import '../../utils/constants/image_strings.dart';
import '../repositories/user/user_model.dart';

class TDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.promoBanner1, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImages.promoBanner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.promoBanner3, targetScreen: TRoutes.favourites, active: true),
    BannerModel(imageUrl: TImages.promoBanner4, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImages.promoBanner2, targetScreen: TRoutes.settings, active: true),
    BannerModel(imageUrl: TImages.promoBanner3, targetScreen: TRoutes.userAddress, active: true),
    BannerModel(imageUrl: TImages.promoBanner4, targetScreen: TRoutes.checkout, active: false),
  ];

  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: TImages.sportIcon, name: 'Esportes', isFeatured: true),
    CategoryModel(id: '5', image: TImages.furnitureIcon, name: 'Móveis', isFeatured: true),
    CategoryModel(id: '2', image: TImages.electronicsIcon, name: 'Eletrônicos', isFeatured: true),
    CategoryModel(id: '3', image: TImages.clothIcon, name: 'Roupas', isFeatured: true),
    CategoryModel(id: '4', image: TImages.animalIcon, name: 'Animais', isFeatured: true),
    CategoryModel(id: '6', image: TImages.shoeIcon, name: 'Calçados', isFeatured: true),
    CategoryModel(id: '7', image: TImages.cosmeticsIcon, name: 'Cosméticos', isFeatured: true),
    CategoryModel(id: '14', image: TImages.jewelryIcon, name: 'Joias', isFeatured: true),

    /// Subcategorias
    CategoryModel(id: '8', image: TImages.sportIcon, name: 'Tênis Esportivos', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: TImages.sportIcon, name: 'Agasalhos', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: TImages.sportIcon, name: 'Equipamentos Esportivos', parentId: '1', isFeatured: false),

    // Móveis
    CategoryModel(id: '11', image: TImages.furnitureIcon, name: 'Móveis para Quarto', parentId: '5', isFeatured: false),
    CategoryModel(id: '12', image: TImages.furnitureIcon, name: 'Móveis para Cozinha', parentId: '5', isFeatured: false),
    CategoryModel(id: '13', image: TImages.furnitureIcon, name: 'Móveis para Escritório', parentId: '5', isFeatured: false),

    // Eletrônicos
    CategoryModel(id: '14', image: TImages.electronicsIcon, name: 'Notebook', parentId: '2', isFeatured: false),
    CategoryModel(id: '15', image: TImages.electronicsIcon, name: 'Celular', parentId: '2', isFeatured: false),

    CategoryModel(id: '16', image: TImages.clothIcon, name: 'Camisetas', parentId: '3', isFeatured: false),
  ];

  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(
        id: '1',
        image: TImages.NikeLogo,
        name: 'Nike',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        TImages.productImage1,
        TImages.productImage23,
        TImages.productImage21,
        TImages.productImage9
      ],
      salePrice: 38,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 38', 'EU 32', 'EU 34'])
      ],
        productVariations: [
          ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'}, // ProductVariationModel
          ),
          ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: TImages.productImage23,
            attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
          ), // ProductVariationModel
          ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: TImages.productImage23,
            attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
          ), // ProductVariationModel
          ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: TImages.productImage1,
            attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
          ),
          ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: TImages.productImage21,
            attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
          ), // ProductVariationModel
          ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: TImages.productImage21,
            attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
          ), // ProductVariationModel// ProductVariationModel
        ],
      productType: 'ProductType.variable',
    ),

    ProductModel(
      id: '002',
      title: 'Celular Iphone 12',
      stock: 120,
      price: 2700,
      isFeatured: true,
      thumbnail: TImages.productImage73,
      description: 'Celular Iphone 12',
      brand: BrandModel(
        id: '2',
        image: TImages.appleLogo,
        name: 'Iphone',
        productsCount: 100,
        isFeatured: true,
      ),
      images: [
        TImages.productImage73, // black
        TImages.productImage70, // red
        TImages.productImage72, // green
      ],
      salePrice: 50,
      sku: 'ABR4532',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['128 GB', '256 GB', '64 GB'])
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 30,
          price: 2800,
          salePrice: 200,
          image: TImages.productImage72,
          description: 'Celular verde Iphone.',
          attributeValues: {'Color': 'Green', 'Size': '264 GB'}, // ProductVariationModel
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 2700,
          image: TImages.productImage73,
          attributeValues: {'Color': 'Black', 'Size': '128 GB'},
        ), // ProductVariationModel
        ProductVariationModel(
          id: '3',
          stock: 10,
          price: 2650,
          image: TImages.productImage73,
          attributeValues: {'Color': 'Black', 'Size': '256 GB'},
        ), // ProductVariationModel
        ProductVariationModel(
          id: '4',
          stock: 20,
          price: 2680,
          image: TImages.productImage72,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 20,
          price: 2700,
          image: TImages.productImage70,
          attributeValues: {'Color': 'Red', 'Size': '256 GB'},
        ), // ProductVariationModel
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 2470,
          image: TImages.productImage71,
          attributeValues: {'Color': 'Red', 'Size': '64 GB'},
        ), // ProductVariationModel// ProductVariationModel
      ],
      productType: 'ProductType.variable',
    ),
  ];
}
