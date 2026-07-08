export interface PriceDataPoint {
  year: string;
  price: number;
}

export interface LocalityMarketData {
  id: string;
  name: string;
  type: 'residential_apartment' | 'residential_plot' | 'commercial';
  currentAvgPricePerSqft: number;
  yoyGrowth: number; // Percentage growth year over year
  rentalYield: number; // Percentage
  description: string;
  historicalData: PriceDataPoint[];
}

// Sample Market Data for Top Vizag Localities
export const marketTrendsData: Record<string, LocalityMarketData> = {
  'madhurawada-apartments': {
    id: 'madhurawada-apartments',
    name: 'Madhurawada',
    type: 'residential_apartment',
    currentAvgPricePerSqft: 5200,
    yoyGrowth: 8.5,
    rentalYield: 3.2,
    description: 'Madhurawada is Vizag\'s fastest-growing IT corridor, driving consistent residential demand from tech professionals.',
    historicalData: [
      { year: '2021', price: 4100 },
      { year: '2022', price: 4400 },
      { year: '2023', price: 4800 },
      { year: '2024', price: 5200 },
    ]
  },
  'mvp-colony-apartments': {
    id: 'mvp-colony-apartments',
    name: 'MVP Colony',
    type: 'residential_apartment',
    currentAvgPricePerSqft: 8500,
    yoyGrowth: 6.2,
    rentalYield: 2.8,
    description: 'MVP Colony remains a premium, established residential hub with high demand and limited new supply, ensuring steady appreciation.',
    historicalData: [
      { year: '2021', price: 7200 },
      { year: '2022', price: 7600 },
      { year: '2023', price: 8000 },
      { year: '2024', price: 8500 },
    ]
  },
  'yendada-apartments': {
    id: 'yendada-apartments',
    name: 'Yendada',
    type: 'residential_apartment',
    currentAvgPricePerSqft: 6800,
    yoyGrowth: 11.5,
    rentalYield: 3.5,
    description: 'Yendada offers a perfect blend of sea views and highway connectivity, making it a highly sought-after premium micro-market.',
    historicalData: [
      { year: '2021', price: 4800 },
      { year: '2022', price: 5400 },
      { year: '2023', price: 6100 },
      { year: '2024', price: 6800 },
    ]
  },
  'bhogapuram-plots': {
    id: 'bhogapuram-plots',
    name: 'Bhogapuram',
    type: 'residential_plot',
    currentAvgPricePerSqft: 2200, // Price per sq.yard usually, converting to sqft equivalent for consistency
    yoyGrowth: 22.0,
    rentalYield: 0,
    description: 'The upcoming International Airport has turned Bhogapuram into Vizag\'s hottest investment destination for plots.',
    historicalData: [
      { year: '2021', price: 900 },
      { year: '2022', price: 1200 },
      { year: '2023', price: 1800 },
      { year: '2024', price: 2200 },
    ]
  },
  'seethammadhara-apartments': {
    id: 'seethammadhara-apartments',
    name: 'Seethammadhara',
    type: 'residential_apartment',
    currentAvgPricePerSqft: 7500,
    yoyGrowth: 5.5,
    rentalYield: 2.5,
    description: 'A serene and posh locality in the heart of the city, preferred by business families and senior executives.',
    historicalData: [
      { year: '2021', price: 6400 },
      { year: '2022', price: 6700 },
      { year: '2023', price: 7100 },
      { year: '2024', price: 7500 },
    ]
  }
};

export const getAllLocalities = () => Object.values(marketTrendsData);

export const getValuation = (localityId: string, areaSqft: number, propertyAgeYears: number = 0) => {
  const data = marketTrendsData[localityId];
  if (!data) return null;

  // Base calculation
  let estimatedValue = data.currentAvgPricePerSqft * areaSqft;

  // Depreciation based on property age (approx 1% per year, max 20%)
  if (propertyAgeYears > 0 && data.type !== 'residential_plot') {
    const depreciation = Math.min(propertyAgeYears * 0.01, 0.20);
    estimatedValue = estimatedValue * (1 - depreciation);
  }

  // Range +/- 5%
  const lowerBound = Math.round(estimatedValue * 0.95);
  const upperBound = Math.round(estimatedValue * 1.05);

  return {
    estimatedValue: Math.round(estimatedValue),
    lowerBound,
    upperBound,
    avgPricePerSqft: data.currentAvgPricePerSqft
  };
};
