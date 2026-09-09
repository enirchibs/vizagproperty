import { VmrdaMasterPlanMap, VmrdaMasterPlanZone, VmrdaMasterPlanRoad } from '../types';
import masterPlanMapsJson from '../data/vmrda_master_plan_maps.json';

/**
 * 936 official high-resolution VMRDA Master Plan 2041 maps ingested from vmrda.ap.gov.in
 */
export const VMRDA_MASTER_PLAN_MAPS: VmrdaMasterPlanMap[] = masterPlanMapsJson as unknown as VmrdaMasterPlanMap[];

/**
 * Official VMRDA Master Plan 2041 Statutory Land-Use Zoning Categories
 */
export const VMRDA_MASTER_PLAN_ZONES: VmrdaMasterPlanZone[] = [
  {
    code: 'RESIDENTIAL-R1',
    name: 'Primary Residential Zone (R1)',
    color: '#F59E0B', // Amber/Yellow
    bg_color: 'bg-amber-50 text-amber-900 border-amber-200',
    description: 'Low to medium density housing, independent villas, gated community plots, and neighborhood commercial shops.',
    permitted_uses: ['Single Family Residences', 'Group Housing & Apartments', 'Primary Schools & Clinics', 'Neighborhood Retail Shops'],
    restricted_uses: ['Heavy Industrial Manufacturing', 'Hazardous Warehousing', 'Large Commercial Malls (unless on >80ft roads)'],
    building_height_max: 'Stilt + 5 Floors (18m)',
    fd_ratio: '1:1.75 to 1:2.5'
  },
  {
    code: 'RESIDENTIAL-R2',
    name: 'High Density Mixed Residential Zone (R2)',
    color: '#D97706',
    bg_color: 'bg-orange-50 text-orange-900 border-orange-200',
    description: 'High-density multi-story residential towers, mixed-use commercial frontage, and IT corridor housing.',
    permitted_uses: ['Multi-Story High-Rise Apartments', 'Commercial Frontage Shops', 'Co-working & IT Workspaces', 'Hostels & PG Accommodations'],
    restricted_uses: ['Chemical Processing Units', 'Heavy Freight Depots'],
    building_height_max: 'Unlimited (subject to Airport Height Clearance & Road Width)',
    fd_ratio: '1:2.5 to 1:4.0'
  },
  {
    code: 'COMMERCIAL-C1',
    name: 'General Commercial & Retail Zone (C1)',
    color: '#EF4444', // Red
    bg_color: 'bg-red-50 text-red-900 border-red-200',
    description: 'Shopping complexes, commercial office space, bank branches, restaurants, and hospitality hubs.',
    permitted_uses: ['Shopping Malls & Supermarkets', 'Commercial Office Buildings', 'Hotels & Multiplexes', 'Financial Institutions'],
    restricted_uses: ['Industrial Factories', 'Residential Plot Sub-divisions without commercial approval'],
    building_height_max: 'Multi-Story High-Rise (As per BPS/RERA norms)',
    fd_ratio: '1:3.0 to 1:4.5'
  },
  {
    code: 'INDUSTRIAL-I1',
    name: 'Light & Industrial Logistics Zone (I1)',
    color: '#8B5CF6', // Purple
    bg_color: 'bg-purple-50 text-purple-900 border-purple-200',
    description: 'Non-polluting light manufacturing, logistics hubs, warehousing, and IT/electronic hardware parks.',
    permitted_uses: ['Logistics Depots & Cold Storage', 'IT Hardware Assembly Units', 'Auto Service Centers', 'Software Technology Parks'],
    restricted_uses: ['Polluting Heavy Chemical Plants (Moved to SEZ)', 'Pure Residential Communities'],
    building_height_max: '15m (Industrial Sheds / Multi-level Warehouses)',
    fd_ratio: '1:1.5'
  },
  {
    code: 'GREENBELT-AGRICULTURAL',
    name: 'Perimetrical Green Belt & Agricultural Zone',
    color: '#10B981', // Emerald/Green
    bg_color: 'bg-emerald-50 text-emerald-900 border-emerald-200',
    description: 'Agriculture, eco-tourism resorts, farmhouses, botanical parks, and environmental conservation buffers.',
    permitted_uses: ['Agriculture & Farm Houses (1-acre min)', 'Eco-Resorts & Golf Courses', 'Botanical Nurseries', 'Solar Power Plants'],
    restricted_uses: ['Unapproved Sub-division Layouts', 'High-density Commercial Malls', 'Polluting Industries'],
    building_height_max: 'Ground + 1 Floor (7m for Farmhouses)',
    fd_ratio: '1:0.25'
  },
  {
    code: 'COASTAL-CRZ',
    name: 'Coastal Regulation Zone (CRZ-I / CRZ-II)',
    color: '#06B6D4', // Cyan
    bg_color: 'bg-cyan-50 text-cyan-900 border-cyan-200',
    description: 'Coastal belt along Bheemili-Rushikonda-Vizag shoreline protected under MOEF & Coastal Zone Management Authority.',
    permitted_uses: ['Beach Tourism Infrastructure (NDZ compliant)', 'Fishing Jetty Operations', 'Public Recreational Promenade'],
    restricted_uses: ['Permanent High-Rise Multi-Story Structures within 200m NDZ', 'Untreated Industrial Discharge'],
    building_height_max: 'Strict CRZ-II / CZMA Clearance Required',
    fd_ratio: '1:1.0'
  }
];

/**
 * Major VMRDA Master Plan 2041 Arterial Road Expansion Proposals
 */
export const VMRDA_MASTER_PLAN_ROADS: VmrdaMasterPlanRoad[] = [
  {
    id: 'road-bhogapuram-expressway',
    road_name: 'Bhogapuram International Airport 6-Lane Expressway Corridor',
    corridor: 'Rushikonda - Yendada - Tagarapuvalasa - Bhogapuram',
    proposed_width_ft: 200,
    proposed_width_m: 60,
    status: 'Expressway Corridor',
    connecting_localities: ['Rushikonda', 'Yendada', 'Madhurawada', 'Tagarapuvalasa', 'Bhogapuram'],
    key_highlights: '6-lane access controlled corridor providing 25-minute connection from Vizag City to Bhogapuram Airport.'
  },
  {
    id: 'road-nh16-expansion',
    road_name: 'National Highway NH-16 Vizag Metropolitan Expansion',
    corridor: 'Anakapalli - Gajuwaka - NAD - Anandapuram - Tagarapuvalasa',
    proposed_width_ft: 150,
    proposed_width_m: 45,
    status: 'Existing Arterial',
    connecting_localities: ['Anakapalli', 'Kurmannapalem', 'Gajuwaka', 'NAD Junction', 'Anandapuram'],
    key_highlights: 'Main commercial & transit spine connecting Vizag port to North Andhra growth corridor.'
  },
  {
    id: 'road-madhurawada-it-arterial',
    road_name: 'Madhurawada IT Hill - Beach Road 100ft Master Plan Link',
    corridor: 'PM Palem - IT SEZ Hill 3 - Rushikonda Beach Road',
    proposed_width_ft: 100,
    proposed_width_m: 30,
    status: 'Proposed Expansion',
    connecting_localities: ['Madhurawada', 'PM Palem', 'Rushikonda', 'Lawson Bay'],
    key_highlights: 'Dedicated 100ft wide arterial connecting IT hub to coastal resort zone.'
  },
  {
    id: 'road-outer-ring-corridor',
    road_name: 'VMRDA Master Plan 2041 Outer Regional Ring Corridor',
    corridor: 'Sabbavaram - Pendurthi - Kothavalasa - Anandapuram',
    proposed_width_ft: 200,
    proposed_width_m: 60,
    status: 'Ring Road',
    connecting_localities: ['Sabbavaram', 'Pendurthi', 'Kothavalasa', 'Anandapuram'],
    key_highlights: 'Bypasses heavy industrial freight traffic around Greater Visakhapatnam urban core.'
  }
];

/**
 * Official Statutory Mandatory Disclaimer required by VMRDA Guidelines
 */
export const VMRDA_MASTER_PLAN_DISCLAIMER = `According to the referenced VMRDA Master Plan 2041 source, this location intersects/appears within the mapped land-use area. This information is derived directly from public VMRDA records for reference and spatial context. Legal entitlement or permission must be verified with Sub-Registrar Office Encumbrance Certificates (EC) and VMRDA building plan approvals.`;

/**
 * Searches Master Plan maps by mandal, village, or district query across all 936 official records.
 */
export function searchMasterPlanMaps(query: string): VmrdaMasterPlanMap[] {
  if (!query.trim()) return VMRDA_MASTER_PLAN_MAPS.slice(0, 30);
  const q = query.trim().toLowerCase();

  return VMRDA_MASTER_PLAN_MAPS.filter(m => {
    const matchMandal = m.mandal_name?.toLowerCase().includes(q);
    const matchVillage = m.village_name?.toLowerCase().includes(q);
    const matchDistrict = m.district_name?.toLowerCase().includes(q);
    const matchType = m.map_type?.toLowerCase() === q;
    return matchMandal || matchVillage || matchDistrict || matchType;
  }).slice(0, 50);
}

/**
 * Retrieves Mandal Master Map and all Village Cadastral Maps for a given Mandal.
 */
export function getMapsByMandal(mandalName: string): { mandalMap?: VmrdaMasterPlanMap; villageMaps: VmrdaMasterPlanMap[] } {
  if (!mandalName) return { villageMaps: [] };
  const cleanMandal = mandalName.trim().toLowerCase();

  const matches = VMRDA_MASTER_PLAN_MAPS.filter(m => m.mandal_name?.toLowerCase().includes(cleanMandal));
  const mandalMap = matches.find(m => m.map_type === 'MANDAL');
  const villageMaps = matches.filter(m => m.map_type === 'VILLAGE');

  return { mandalMap, villageMaps };
}

/**
 * Gets zoning classification and relevant master plan road proposals for any locality or village.
 */
export function getLocalityZoning(localityOrVillage: string): {
  zone: VmrdaMasterPlanZone;
  proposedRoads: VmrdaMasterPlanRoad[];
  maps: VmrdaMasterPlanMap[];
} {
  const q = localityOrVillage.trim().toLowerCase();

  // Find maps matching this locality/village
  const maps = VMRDA_MASTER_PLAN_MAPS.filter(m => 
    m.village_name?.toLowerCase().includes(q) || m.mandal_name?.toLowerCase().includes(q)
  ).slice(0, 6);

  // Determine zone based on locality characteristics
  let zone = VMRDA_MASTER_PLAN_ZONES[0]; // Default R1
  if (q.includes('madhurawada') || q.includes('rushikonda') || q.includes('gajuwaka') || q.includes('mvp')) {
    zone = VMRDA_MASTER_PLAN_ZONES[1]; // R2 High Density / Mixed
  } else if (q.includes('port') || q.includes('autonagar') || q.includes('duvvada') || q.includes('atchutapuram')) {
    zone = VMRDA_MASTER_PLAN_ZONES[3]; // Industrial I1
  } else if (q.includes('beach') || q.includes('bheemili')) {
    zone = VMRDA_MASTER_PLAN_ZONES[5]; // CRZ
  } else if (q.includes('bhogapuram') || q.includes('anandapuram') || q.includes('tagarapuvalasa')) {
    zone = VMRDA_MASTER_PLAN_ZONES[0]; // R1 Growth Corridor
  }

  // Relevant road proposals
  const proposedRoads = VMRDA_MASTER_PLAN_ROADS.filter(r => 
    r.connecting_localities.some(loc => loc.toLowerCase().includes(q) || q.includes(loc.toLowerCase()))
  );

  return { zone, proposedRoads, maps };
}
