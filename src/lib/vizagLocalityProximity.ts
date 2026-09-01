/**
 * Vizag Locality Proximity & Geographical Clustering Engine
 * Maps every locality in Visakhapatnam to its adjacent/nearby localities
 * based on Google Maps spatial proximity.
 */

export interface LocalityCluster {
  primaryKeywords: string[]
  nearbyKeywords: string[]
}

export const VIZAG_LOCALITY_CLUSTERS: LocalityCluster[] = [
  {
    // Madhurawada / IT SEZ Zone
    primaryKeywords: ['madhurawada', 'madhurwada', 'car shed', 'it sez', 'tech park', 'midhilapuri', 'command'],
    nearbyKeywords: ['pm palem', 'yendada', 'boyapalem', 'gambheeram', 'rushikonda', 'commissary', 'cricket stadium', 'mvp colony']
  },
  {
    // MVP Colony & Urban Core
    primaryKeywords: ['mvp colony', 'mvp', 'sector 1', 'sector 2', 'sector 3', 'sector 4', 'sector 5', 'sector 6', 'sector 7', 'sector 8', 'sector 9', 'sector 10', 'sector 11', 'sector 12', 'asilmetta'],
    nearbyKeywords: ['seethammadhara', 'venkoji palem', 'isukathota', 'lawsons bay', 'beach road', 'dwaraka nagar', 'muralinagar', 'pedawaltair', 'siripuram', 'madhurawada']
  },
  {
    // Seethammadhara & Central Residential
    primaryKeywords: ['seethammadhara', 'sithammadhara', 'muralinagar', 'resapu vanipalem', 'narasimha nagar', 'tpt colony'],
    nearbyKeywords: ['mvp colony', 'dwaraka nagar', 'cbm compound', 'akkayyapalem', 'pedawaltair', 'siripuram', 'venkoji palem']
  },
  {
    // Dwaraka Nagar / Commercial Hub
    primaryKeywords: ['dwaraka nagar', 'dwarakanagar', 'rtc complex', 'sampath vinayaka', 'diamond park', 'cbm compound'],
    nearbyKeywords: ['seethammadhara', 'siripuram', 'akkayyapalem', 'ram nagar', 'waltair uplands', 'dabagardens', 'mvp colony']
  },
  {
    // Gajuwaka Industrial Belt
    primaryKeywords: ['gajuwaka', 'old gajuwaka', 'new gajuwaka', 'steel plant', 'vsp', 'autonagar', 'kurmannapalem'],
    nearbyKeywords: ['sheela nagar', 'duvvada', 'vadlapudi', 'aganamudi', 'bhavanipuram', 'lankelapalem', 'kancharapalem']
  },
  {
    // PM Palem Educational & Sports Hub
    primaryKeywords: ['pm palem', 'pampalem', 'cricket stadium', 'boyapalem'],
    nearbyKeywords: ['madhurawada', 'yendada', 'mvp colony', 'gambheeram', 'rushikonda']
  },
  {
    // Rushikonda Beach & IT Corridor
    primaryKeywords: ['rushikonda', 'rishikonda', 'gitam', 'gitam university', 'hill no 1', 'hill no 2', 'hill no 3'],
    nearbyKeywords: ['yendada', 'madhurawada', 'pm palem', 'lawsons bay', 'mvp colony', 'bheemili']
  },
  {
    // Yendada Residential Belt
    primaryKeywords: ['yendada', 'endada'],
    nearbyKeywords: ['rushikonda', 'madhurawada', 'pm palem', 'mvp colony', 'lawsons bay', 'health city']
  },
  {
    // Kurmannapalem & Steel Plant Township
    primaryKeywords: ['kurmannapalem', 'steel plant', 'steelplant', 'desapatrunipalem', 'vadlapudi'],
    nearbyKeywords: ['gajuwaka', 'duvvada', 'aganamudi', 'lankelapalem', 'sheela nagar']
  },
  {
    // Duvvada VSEZ & Railway Zone
    primaryKeywords: ['duvvada', 'vsez', 'vignan'],
    nearbyKeywords: ['kurmannapalem', 'gajuwaka', 'aganamudi', 'sheela nagar', 'lankelapalem']
  },
  {
    // Akkayyapalem & Railway Colony Zone
    primaryKeywords: ['akkayyapalem', 'railway new colony', 'thatichetlapalem', 'dondaparthy'],
    nearbyKeywords: ['dwaraka nagar', 'seethammadhara', 'cbm compound', 'kancharapalem', 'muralinagar']
  },
  {
    // Kancharapalem & Marripalem Corridor
    primaryKeywords: ['kancharapalem', 'marripalem', '108 feet road'],
    nearbyKeywords: ['nad junction', 'muralinagar', 'thatichetlapalem', 'sheela nagar', 'gajuwaka', 'akkayyapalem']
  },
  {
    // NAD Junction & Airport Zone
    primaryKeywords: ['nad junction', 'nad', 'gopalapatnam', 'airport', 'marripalem', 'simhachalam road'],
    nearbyKeywords: ['muralinagar', 'kancharapalem', 'sheela nagar', 'pendurthi', 'sujatha nagar', 'vazragiri']
  },
  {
    // Pendurthi & Western Suburbs
    primaryKeywords: ['pendurthi', 'sujatha nagar', 'chinamushidivada', 'pinagadi'],
    nearbyKeywords: ['simhachalam', 'gopalapatnam', 'nad junction', 'vepagunta', 'vadamadapalem']
  },
  {
    // Simhachalam & Temple Zone
    primaryKeywords: ['simhachalam', 'adivivaram', 'hawa mahal'],
    nearbyKeywords: ['gopalapatnam', 'pendurthi', 'nad junction', 'sujatha nagar', 'hanumanthawaka']
  },
  {
    // Arilova & Health City Zone
    primaryKeywords: ['arilova', 'health city', 'chinagadhili', 'hanumanthawaka'],
    nearbyKeywords: ['venkoji palem', 'seethammadhara', 'mvp colony', 'yendada', 'madhurawada']
  },
  {
    // Siripuram & Beach Road Core
    primaryKeywords: ['siripuram', 'waltair uplands', 'ram nagar', 'pandurangapuram', 'beach road', 'pedawaltair', 'lawsons bay'],
    nearbyKeywords: ['mvp colony', 'dwaraka nagar', 'seethammadhara', 'cbm compound']
  },
  {
    // Bhogapuram International Airport Zone
    primaryKeywords: ['bhogapuram', 'bogapuram', 'tagarapuvalasa', 'tuni', 'bheemunipatnam', 'bheemili'],
    nearbyKeywords: ['tagarapuvalasa', 'anandapuram', 'boyapalem', 'gambheeram', 'madhurawada', 'rushikonda']
  },
  {
    // Anandapuram Junction Zone
    primaryKeywords: ['anandapuram', 'gambheeram', 'boyapalem'],
    nearbyKeywords: ['madhurawada', 'bhogapuram', 'tagarapuvalasa', 'pm palem']
  }
]

/**
 * Returns nearby keywords for a given area query
 */
export function getNearbyLocalityKeywords(queryStr: string): string[] {
  if (!queryStr) return []
  const clean = queryStr.toLowerCase().trim()

  const nearbySet = new Set<string>()

  for (const cluster of VIZAG_LOCALITY_CLUSTERS) {
    const isPrimaryMatch = cluster.primaryKeywords.some(kw => clean.includes(kw) || kw.includes(clean))
    if (isPrimaryMatch) {
      cluster.nearbyKeywords.forEach(nk => nearbySet.add(nk))
    }
  }

  // Fallback defaults for general Vizag areas if no specific cluster matched
  if (nearbySet.size === 0) {
    ['madhurawada', 'mvp colony', 'pm palem', 'yendada', 'gajuwaka', 'seethammadhara'].forEach(k => nearbySet.add(k))
  }

  return Array.from(nearbySet)
}

/**
 * Calculates dynamic spatial proximity score for a property given a search query.
 * Score 1 = Exact typed area match
 * Score 2 = Nearby adjacent area match
 * Score 3 = Other remaining Vizag areas
 */
export function getDynamicAreaScore(property: any, queryStr: string): number {
  if (!queryStr || queryStr.trim().length < 2) return 3

  const clean = queryStr.toLowerCase().trim()
  const locObj = Array.isArray(property.localities) ? property.localities[0] : property.localities
  const locName = ((locObj?.name) || property.location || property.locality_name || '').toLowerCase()
  const title = (property.title || '').toLowerCase()
  const desc = (property.description || '').toLowerCase()

  // 1. Direct typed area match
  if (locName.includes(clean) || title.includes(clean) || desc.includes(clean)) {
    return 1
  }

  // 2. Nearby adjacent area match
  const nearbyKeywords = getNearbyLocalityKeywords(clean)
  const isNearby = nearbyKeywords.some(kw => locName.includes(kw) || title.includes(kw) || desc.includes(kw))
  if (isNearby) {
    return 2
  }

  // 3. All other Vizag areas
  return 3
}
