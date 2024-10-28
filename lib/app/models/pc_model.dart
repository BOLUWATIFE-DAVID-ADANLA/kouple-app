class PcModel {
  final String name;
  final String imageUrl;
  final Map<String, String> parts;
  final num? buildCost;
  final String youtubeUrl;

  PcModel(
      this.name, this.buildCost, this.imageUrl, this.parts, this.youtubeUrl);
}

List<PcModel> pcModels = [
  PcModel(
      "Gaming PC",
      1878.83,
      "assets/images/pc1.jpg",
      {
        "CPU": "AMD Ryzen 7 7700X 4.5 GHz 8-Core",
        "GPU": "Gigabyte GAMING OC GeForce RTX 4070 Ti SUPER 16 GB",
        'Storage':
            'Samsung 990 EVO 2 TB M.2-2280 PCIe 5.0 X2 NVME Solid State Drive',
        "RAM": "Corsair 16GB DDR4",
        "Motherboard": "ASUS ROG Strix Z490-E",
        "Power Supply":
            "Corsair RM850x 850 W 80+ Gold Certified Fully Modular ATX Power Supply",
        "Case": "Lian Li A3-mATX MicroATX Mini Tower Case",
        'CPU Cooler': "Asus ROG RYUO III 360 ARGB 70.07 CFM Liquid",
        'Video Card':
            "Gigabyte GAMING OC GeForce RTX 4070 Ti SUPER 16 GB Video Card",
        'Case Fan': 'ARCTIC P12 Max 81.04 CFM 120 mm'
      },
      "https://youtube.com/watch?v=exampleGamingPC"),
  PcModel(
      "Longan",
      800.00,
      "assets/images/pc2.jpg",
      {
        "CPU": "AMD Ryzen 7 7800X3D 4.2 GHz 8 Core",
        "Integrated Graphics": "Sapphire PULSE Radeon RX 7900 XT 20 GB",
        "RAM": "Corsair Vengeance 32 GB (2 x 16 GB) DDR5-6000 CL30",
        "Motherboard": "Asus ROG STRIX B650E-I GAMING WIFI Mini ITX AM5",
        "Power Supply":
            "Corsair SF750 (2024) 750 W 80+ Platinum Certified Fully Modular SFX",
        "Case": "Thermaltake Versa H15",
        'Storage':
            'Kingston Fury Renegade 1 TB M.2-2280 PCIe 4.0 X4 NVME Solid State Drive'
      },
      "https://youtube.com/watch?v=exampleOfficePC"),
  PcModel(
      "AM4 4K Couch Gaming PC",
      1200.00,
      "assets/images/pc3.jpg",
      {
        "CPU": "AMD Ryzen 7 3700X",
        "GPU": "NVIDIA GeForce GTX 1660",
        "RAM": "G.Skill 16GB DDR4",
        "Motherboard": "Gigabyte B450 AORUS M",
        "Power Supply": "Cooler Master 650W",
        "Case": "Phanteks Eclipse P400",
        "Capture Card": "Elgato HD60 S"
      },
      "https://youtube.com/watch?v=exampleStreamingPC"),
  PcModel(
      "First Budget 1440p Build",
      400.00,
      "assets/images/pc4.jpg",
      {
        "CPU": "Intel Core i3",
        "Integrated Graphics": "Intel UHD Graphics 610",
        "RAM": "Crucial 4GB DDR4",
        "Mini Motherboard": "ASRock H310CM",
        "Power Supply": "be quiet! 300W",
        "Mini Case": "InWin Chopin"
      },
      "https://youtube.com/watch?v=exampleMiniPC"),
  PcModel(
      "Cad Machine LianLi Vision",
      2500.00,
      "assets/images/pc5.jpg",
      {
        "CPU": "AMD Ryzen 9 5950X",
        "GPU": "NVIDIA Quadro RTX 5000",
        "RAM": "Corsair 64GB DDR4",
        "Motherboard": "ASUS Pro WS X570-ACE",
        "Power Supply": "Corsair 850W",
        "Case": "Fractal Design Define R6"
      },
      "https://youtube.com/watch?v=workstationPC"),
  PcModel(
      "NCASE M2 - Grater VGPU Build",
      600.00,
      "assets/images/pc6.jpg",
      {
        "CPU": "AMD Ryzen 3 3200G",
        "GPU": "Radeon RX 570",
        "RAM": "Team T-Force 8GB DDR4",
        "Motherboard": "ASRock B450M-HDV",
        "Power Supply": "Thermaltake 500W",
        "Case": "Cooler Master Q300L"
      },
      "https://youtube.com/watch?v=budgetGamingPC"),
  PcModel(
      "Mini-ITX Build v6.0",
      700.00,
      "assets/images/pc7.jpg",
      {
        "CPU": "Intel Core i5-10400",
        "RAM": "Crucial 16GB DDR4",
        "Motherboard": "Gigabyte B460M DS3H",
        "Power Supply": "EVGA 400W",
        "Case": "SilverStone ML05",
        "Storage": "Western Digital 4TB NAS"
      },
      "https://youtube.com/watch?v=mediaServerBuild"),
  PcModel(
      "Lian Li A4-H2O Dan 7600X x 7800XT Hellhound",
      1200.00,
      "assets/images/pc8.jpg",
      {
        "CPU": "Intel Core i7-11700K",
        "GPU": "NVIDIA GeForce RTX 3060",
        "RAM": "Kingston Fury 16GB DDR4",
        "Motherboard": "MSI MPG B560I GAMING EDGE WIFI",
        "Power Supply": "Corsair SF600",
        "Case": "NZXT H1"
      },
      "https://youtube.com/watch?v=compactGamingRig"),
  PcModel(
      "X570 R7 5800X3D",
      4000.00,
      "assets/images/pc9.jpg",
      {
        "CPU": "Intel Xeon E-2288G",
        "RAM": "Crucial 128GB ECC DDR4",
        "Motherboard": "Supermicro X11SCH-F",
        "Power Supply": "Seasonic 1000W",
        "Case": "Supermicro 2U Rackmount",
        "Storage": "Seagate IronWolf Pro 8TB"
      },
      "https://youtube.com/watch?v=highPerformanceserver"),
  PcModel(
      "Fractal Terra ITX AM5",
      500.00,
      "assets/images/pc10.jpg",
      {
        "CPU": "AMD Athlon 3000G",
        "Integrated Graphics": "Radeon Vega 3",
        "RAM": "Corsair 8GB DDR4",
        "Motherboard": "ASRock A320M",
        "Power Supply": "be quiet! 300W",
        "Case": "Antec VSK2000-U3"
      },
      "https://youtube.com/watch?v=htpcBuild"),
  PcModel(
      "Fractal Terra ITX AM5",
      3500.00,
      "assets/images/pc11.jpg",
      {
        "CPU": "AMD Threadripper 3970X",
        "GPU": "NVIDIA RTX A5000",
        "RAM": "G.Skill 128GB DDR4",
        "Motherboard": "ASUS ROG Zenith II Extreme",
        "Power Supply": "Cooler Master 1200W",
        "Case": "Phanteks Enthoo Luxe 2"
      },
      "https://youtube.com/watch?v=renderingPC"),
  PcModel(
      "NZXT White Gaming Build",
      300.00,
      "assets/images/pc12.jpg",
      {
        "CPU": "Intel Pentium Gold G6400",
        "Integrated Graphics": "Intel UHD Graphics 610",
        "RAM": "Crucial 4GB DDR4",
        "Motherboard": "Gigabyte H410N",
        "Power Supply": "Thermaltake 200W",
        "Case": "Cooler Master Elite 110"
      },
      "https://youtube.com/watch?v=portableMiniPC"),
  PcModel(
      "Sparkling Seafoam Green Mini-ITX ",
      400.00,
      "assets/images/pc13.jpg",
      {
        "CPU": "Intel Celeron G5925",
        "Integrated Graphics": "Intel UHD Graphics 610",
        "RAM": "Kingston 4GB DDR4",
        "Motherboard": "ASRock H410M-HDV",
        "Power Supply": "FSP 250W",
        "Case": "Thermaltake Core V1"
      },
      "https://youtube.com/watch?v=budgetOfficePC"),
  PcModel(
      "Structural ITX",
      900.00,
      "assets/images/pc14.jpg",
      {
        "CPU": "Intel Core i5-10600",
        "GPU": "NVIDIA Quadro P620",
        "RAM": "Corsair 16GB DDR4",
        "Motherboard": "MSI B460M PRO-VDH WIFI",
        "Power Supply": "be quiet! 450W",
        "Case": "SilverStone SG13"
      },
      "https://youtube.com/watch?v=smallFormFactorPC"),
  PcModel(
      "Full White Build",
      600.00,
      "assets/images/pc15.jpg",
      {
        "CPU": "AMD Ryzen 3 2200G",
        "Integrated Graphics": "Radeon Vega 8",
        "RAM": "G.Skill 8GB DDR4",
        "Motherboard": "ASUS PRIME A320M-K",
        "Power Supply": "Thermaltake 300W",
        "Case": "Thermaltake Versa H17"
      },
      "https://youtube.com/watch?v=officeMiniPC"),
  PcModel(
      "Budget Ultra 4K Gaming",
      1500.00,
      "assets/images/pc16.jpg",
      {
        "CPU": "AMD Ryzen 5 5600X",
        "GPU": "NVIDIA GeForce GTX 1660 Super",
        "RAM": "Corsair 16GB DDR4",
        "Motherboard": "MSI B450 TOMAHAWK MAX",
        "Power Supply": "Cooler Master 650W",
        "Case": "Corsair Carbide Series SPEC-05"
      },
      "https://youtube.com/watch?v=affordable4kPC"),
  PcModel(
      "Starter Streaming PC",
      1700.00,
      "assets/images/pc17.jpg",
      {
        "CPU": "AMD Ryzen 7 5800X",
        "GPU": "NVIDIA GeForce RTX 3060 Ti",
        "RAM": "G.Skill 16GB DDR4",
        "Motherboard": "ASRock X570 Phantom Gaming 4",
        "Power Supply": "Thermaltake Smart 700W",
        "Case": "NZXT H510"
      },
      "https://youtube.com/watch?v=starterStreamingPC"),
  PcModel(
      "Compact Ultimate Gaming PC",
      2000.00,
      "assets/images/pc18.jpg",
      {
        "CPU": "Intel Core i7-10700K",
        "GPU": "NVIDIA GeForce RTX 3070",
        "RAM": "TeamGroup 16GB DDR4",
        "Motherboard": "ASRock Z490 Phantom Gaming 4",
        "Power Supply": "Cooler Master 750W",
        "Case": "Thermaltake Core P1"
      },
      "https://youtube.com/watch?v=ultimateCompactGamingPC"),
  PcModel(
      "Professional Developer Machine",
      2800.00,
      "assets/images/pc19.jpg",
      {
        "CPU": "AMD Ryzen 9 3900X",
        "GPU": "NVIDIA Quadro P2000",
        "RAM": "Corsair Vengeance 32GB DDR4",
        "Motherboard": "ASUS TUF X570-PLUS",
        "Power Supply": "be quiet! 850W",
        "Case": "Corsair Crystal 570X RGB"
      },
      "https://youtube.com/watch?v=proDevPC"),
];
