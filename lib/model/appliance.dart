class Appliance {
  String? name;
  int? quantity;
  double? wattage;
  bool selected;

  Appliance({
    this.name,
    this.quantity,
    this.wattage,
    this.selected = false,
  }

  );
}


List<Appliance> appliances  = [
  // Air Conditioners
  Appliance(name: "Air conditioner 1HP", quantity: 1, wattage: 1200), // Range: 900W - 1500W
  Appliance(name: "Air conditioner 1.5HP", quantity: 1, wattage: 1500), // Range: 1200W - 1800W
  Appliance(name: "Air conditioner 2HP", quantity: 1, wattage: 1800), // Range: 1600W - 2200W

  // Cooling & Fans
  Appliance(name: "Ceiling Fan", quantity: 1, wattage: 75), // Range: 60W - 80W
  Appliance(name: "Standing Fan", quantity: 1, wattage: 75), // Range: 60W - 85W
  Appliance(name: "Refrigerator", quantity: 1, wattage: 600), // Range: 400W - 800W
  Appliance(name: "Freezer", quantity: 1, wattage: 500), // Range: 400W - 700W

  // Cooking & Heating Appliances
  Appliance(name: "Electric Kettle", quantity: 1, wattage: 1500), // Range: 1000W - 2000W
  Appliance(name: "Microwave Oven", quantity: 1, wattage: 1400), // Range: 1200W - 1600W
  Appliance(name: "Electric Cooker with Oven", quantity: 1, wattage: 2500), // Range: 2000W - 3000W
  Appliance(name: "Hot Plate", quantity: 1, wattage: 1500), // Range: 1000W - 2000W
  Appliance(name: "Toaster", quantity: 1, wattage: 1000), // Range: 800W - 1500W
  Appliance(name: "Blender", quantity: 1, wattage: 350), // Range: 250W - 500W
  Appliance(name: "Electric Iron", quantity: 1, wattage: 1200), // Range: 1000W - 1500W
  Appliance(name: "Washing Machine", quantity: 1, wattage: 1000), // Range: 800W - 1200W

  // Entertainment & Electronics
  Appliance(name: "Laptop", quantity: 1, wattage: 65), // Range: 50W - 100W
  Appliance(name: "Television - 32\"", quantity: 1, wattage: 70), // Range: 60W - 90W
  Appliance(name: "Television - 42\"", quantity: 1, wattage: 120), // Range: 100W - 150W
  Appliance(name: "Television - 55\"", quantity: 1, wattage: 180), // Range: 150W - 220W
  Appliance(name: "Television - 65\"", quantity: 1, wattage: 250), // Range: 200W - 300W
  Appliance(name: "Home Theatre System", quantity: 1, wattage: 250), // Range: 200W - 350W
  Appliance(name: "Radio", quantity: 1, wattage: 50), // Range: 30W - 70W

  // Lighting
  Appliance(name: "LED Bulb (9W)", quantity: 1, wattage: 9),
  Appliance(name: "LED Bulb (12W)", quantity: 1, wattage: 12),
  Appliance(name: "Fluorescent Tube (36W)", quantity: 1, wattage: 36),
  Appliance(name: "Incandescent Bulb (100W)", quantity: 1, wattage: 100),

  // Miscellaneous
  Appliance(name: "Phone Charger", quantity: 1, wattage: 5), // Range: 2W - 10W
  Appliance(name: "Sewing Machine", quantity: 1, wattage: 100), // Range: 70W - 150W
  Appliance(name: "Vacuum Cleaner - High Power", quantity: 1, wattage: 1800), // Range: 1500W - 2200W
  Appliance(name: "Pumping Machine (0.5HP - 1HP)", quantity: 1, wattage: 1000), // Range: 800W - 1200W
  Appliance(name: "Water Heater (15L - 50L)", quantity: 1, wattage: 2000), // Range: 1500W - 2500W
];
