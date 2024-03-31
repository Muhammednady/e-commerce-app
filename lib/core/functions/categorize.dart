// Apple iPhone 12 Pro Max 256GB 6 GB RAM, Pacific Blue
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Apple MacBook Pro
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): JBL Xtreme 2 Portable Waterproof Bluetooth Speaker - Blue JBLXTREME2BLUAM
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Samsung 65 Inch Smart TV 4K Ultra HD Curved - UA65RU7300RXUM
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Nikon FX-format D750 - 24.3 MP, SLR Camera 24-120mm Lens, Black
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Kingston A400 Internal SSD 2.5" 240GB SATA 3 - SA400S37/240G
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Stark Iron Kettlebell, 24 KG
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Face Protection Mask, 50 Count - Light Blue with Elastic and Braces
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Xiaomi Redmi 10 Dual SIM Mobile- 6.53 Inch FHD , 64GB, 4GB RAM, 4G LTE - Carbon Gray
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Nike Flex Essential Mesh Training Shoes For Women - White
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Nike Men's NSW Tee Icon Futura, Black(Black/White010), Medium
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Evony Surgical Mask with Soft Elastic Ears, 50 Pieces
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Xiaomi Mi Smart Band 5 - Black
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Winter High Collar Pullover - Camel
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Sony Pulse 3D Wireless Gaming Headset for PlayStation 5
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): M-33 Live Stream 360 Degree Rotated LED Ring Light 33 cm With Mobile Phone Holder And 2.1 Meter Stand - Black & White
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Xiaomi Mi Motion Activated Night Light 2 - White
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Sony WI-C200 Wireless Headphones - Black
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Front Patch Pocket Long Sleeve Shirt - Dark Olive
// I/flutter ( 1219): ++++++++++++++++++++++++++++++++++++++
// I/flutter ( 1219): Fashion Solid Color Collage Collar Men Jacket
//==============================================================================
//['apple','sony' , 'samsung' , 'xiaomi','kingston','Holder','Nikon']
// "id": 44,
// "name": "electrionic devices",
// "image": "https://student.valuxapps.com/storage/uploads/categories/16893929290QVM1.modern-devices-isometric-icons-collection-with-sixteen-isolated-images-computers-periphereals-variou.jpeg"
// },
// {  ['mask']
// "id": 43,
// "name": "Prevent Corona",
// "image": "https://student.valuxapps.com/storage/uploads/categories/1630142480dvQxx.3658058.jpg"
// },
// {  ['Nike' , 'kettlebell']
// "id": 42,
// "name": "sports",
// "image": "https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg"
// },
// {   ['waterproof' , 'motion']
// "id": 40,
// "name": "Lighting",
// "image": "https://student.valuxapps.com/storage/uploads/categories/16445230161CiW8.Light bulb-amico.png"
// },
// {  ['pullover' , 'shirt' , 'Jacket']
// "id": 46,
// "name": "Clothes",
// "image": "https://student.valuxapps.com/storage/uploads/categories/1644527120pTGA7.clothes.png"

int detectCategory(String name) {

  List<String> list = ['apple', 'sony', 'samsung', 'xiaomi', 'kingston', 'holder', 'nikon'];
  for(int i = 0; i <list.length ; i++){
    if(name.toLowerCase().contains(list[i])){
      return 44;
    }
  }

   if (name.toLowerCase().contains('mask')) {
    return 43;
  } else if (name.toLowerCase().contains('nike') |
      name.toLowerCase().contains('kettlebell')) {
    return 42;
  } else if (name.toLowerCase().contains('waterproof') |
      name.toLowerCase().contains('motion')) {
    return 40;
  } else if (name.toLowerCase().contains('pullover') |
      name.toLowerCase().contains('shirt') |
      name.toLowerCase().contains('Jacket')) {
    return 46;
  }else{


     return 0;
  }
}
