import { useState } from 'react'
import { Link } from 'react-router-dom'

type Tab = 'buy' | 'rent'

interface KeywordGroup {
  title: string
  links: { label: string; href: string }[]
}

const buyGroups: KeywordGroup[] = [
  {
    title: 'Popular Property Searches',
    links: [
      { label: 'Property in Vizag', href: '/search?listing_type=sale' },
      { label: 'Property in Visakhapatnam', href: '/search?listing_type=sale' },
      { label: 'Residential Property in Vizag', href: '/residential-property-in-vizag' },
      { label: 'Property for Sale in Vizag', href: '/search?listing_type=sale' },
      { label: 'Property for Sale in Visakhapatnam', href: '/search?listing_type=sale' },
      { label: 'Villas in Vizag', href: '/villas-in-vizag' },
      { label: 'Villas for Sale in Vizag', href: '/villas-in-vizag' },
      { label: 'VMRDA Plots in Vizag', href: '/vmrda-plots' },
      { label: 'VMRDA Approved Plots Vizag', href: '/vmrda-approved-plots-vizag' },
      { label: 'Gated Community Plots Vizag', href: '/gated-community-plots-vizag' },
      { label: 'New Projects in Vizag', href: '/search?listing_type=sale' },
      { label: 'Ready to Move Flats in Vizag', href: '/flats-for-sale-in-vizag' },
      { label: 'Resale Property in Vizag', href: '/search?listing_type=sale' },
      { label: 'Budget Homes in Visakhapatnam', href: '/search?listing_type=sale' },
    ],
  },
  {
    title: 'Flats / Apartments for Sale',
    links: [
      { label: 'Flats for Sale in Vizag', href: '/flats-for-sale-in-vizag' },
      { label: 'Flats for Sale in Visakhapatnam', href: '/flats-for-sale-in-vizag' },
      { label: 'Apartments for Sale in Vizag', href: '/flats-for-sale-in-vizag' },
      { label: '1 BHK Flats in Vizag', href: '/search?property_type=1bhk&listing_type=sale' },
      { label: '2 BHK Flats in Vizag', href: '/search?property_type=2bhk&listing_type=sale' },
      { label: '3 BHK Flats in Vizag', href: '/search?property_type=3bhk&listing_type=sale' },
      { label: '4 BHK Flats in Vizag', href: '/search?property_type=4bhk&listing_type=sale' },
      { label: '1 BHK Flats in Visakhapatnam', href: '/search?property_type=1bhk&listing_type=sale' },
      { label: '2 BHK Flats in Visakhapatnam', href: '/search?property_type=2bhk&listing_type=sale' },
      { label: '3 BHK Flats in Visakhapatnam', href: '/search?property_type=3bhk&listing_type=sale' },
      { label: 'Luxury Flats in Vizag', href: '/flats-for-sale-in-vizag' },
      { label: 'Sea View Flats in Vizag', href: '/search?listing_type=sale' },
      { label: 'Affordable Flats in Vizag', href: '/flats-for-sale-in-vizag' },
    ],
  },
  {
    title: 'Plots for Sale',
    links: [
      { label: 'Plots in Vizag', href: '/vmrda-plots' },
      { label: 'Plots in Visakhapatnam', href: '/vmrda-plots' },
      { label: 'Plots for Sale in Vizag', href: '/vmrda-plots' },
      { label: 'Vizag Plots', href: '/vmrda-plots' },
      { label: 'Visakhapatnam Plots', href: '/vmrda-plots' },
      { label: 'VMRDA Plots', href: '/vmrda-plots' },
      { label: 'Open Plots in Vizag', href: '/search?property_type=plot&listing_type=sale' },
      { label: 'Residential Plots in Vizag', href: '/vmrda-plots' },
      { label: 'Gated Community Plots', href: '/gated-community-plots-vizag' },
      { label: 'NA Plots in Vizag', href: '/search?property_type=plot&listing_type=sale' },
      { label: 'Plots Near Bheemunipatnam', href: '/search?locality=bheemunipatnam&property_type=plot' },
      { label: 'Farm Land in Vizag', href: '/search?property_type=plot&listing_type=sale' },
      { label: 'Commercial Plots in Vizag', href: '/search?category=commercial&property_type=plot' },
    ],
  },
  {
    title: 'Flats for Sale by Locality',
    links: [
      { label: 'Flats in Madhurawada', href: '/search?locality=madhurawada&listing_type=sale' },
      { label: 'Flats in MVP Colony', href: '/search?locality=mvp-colony&listing_type=sale' },
      { label: 'Flats in Yendada', href: '/search?locality=yendada&listing_type=sale' },
      { label: 'Flats in Rushikonda', href: '/search?locality=rushikonda&listing_type=sale' },
      { label: 'Flats in Seethammadhara', href: '/search?locality=seethammadhara&listing_type=sale' },
      { label: 'Flats in Kommadi', href: '/search?locality=kommadi&listing_type=sale' },
      { label: 'Flats in PM Palem', href: '/search?locality=pm-palem&listing_type=sale' },
      { label: 'Flats in Gajuwaka', href: '/search?locality=gajuwaka&listing_type=sale' },
      { label: 'Flats in Waltair', href: '/search?locality=waltair&listing_type=sale' },
      { label: 'Flats in Siripuram', href: '/search?locality=siripuram&listing_type=sale' },
      { label: 'Flats in Dwaraka Nagar', href: '/search?locality=dwaraka-nagar&listing_type=sale' },
      { label: 'Flats in Bhimili', href: '/search?locality=bhimili&listing_type=sale' },
      { label: 'Flats in Pendurthi', href: '/search?locality=pendurthi&listing_type=sale' },
      { label: 'Flats in Tagarapuvalasa', href: '/search?locality=tagarapuvalasa&listing_type=sale' },
    ],
  },
  {
    title: 'Plots for Sale by Locality',
    links: [
      { label: 'Plots in Madhurawada', href: '/search?locality=madhurawada&property_type=plot' },
      { label: 'Plots in Kommadi', href: '/search?locality=kommadi&property_type=plot' },
      { label: 'Plots in Yendada', href: '/search?locality=yendada&property_type=plot' },
      { label: 'Plots in Bheemunipatnam', href: '/search?locality=bheemunipatnam&property_type=plot' },
      { label: 'Plots in Rushikonda', href: '/search?locality=rushikonda&property_type=plot' },
      { label: 'Plots in Pendurthi', href: '/search?locality=pendurthi&property_type=plot' },
      { label: 'Plots in Tagarapuvalasa', href: '/search?locality=tagarapuvalasa&property_type=plot' },
      { label: 'Plots in Gajuwaka', href: '/gajuwaka' },
      { label: 'Plots in Atchutapuram', href: '/search?locality=atchutapuram&property_type=plot' },
      { label: 'Plots in Anakapalle', href: '/search?locality=anakapalle&property_type=plot' },
      { label: 'Plots in Bheemili', href: '/search?locality=bheemili&property_type=plot' },
      { label: 'Plots in Duvvada', href: '/search?locality=duvvada&property_type=plot' },
      { label: 'Plots in MVP Colony', href: '/search?locality=mvp-colony&property_type=plot' },
      { label: 'Plots in PM Palem', href: '/pm-palem' },
    ],
  },
  {
    title: 'Villas & Houses for Sale',
    links: [
      { label: 'Villas in Vizag', href: '/villas-in-vizag' },
      { label: 'Villas in Visakhapatnam', href: '/villas-in-vizag' },
      { label: 'Independent Houses in Vizag', href: '/search?property_type=independent_house&listing_type=sale' },
      { label: 'Duplex Houses in Vizag', href: '/search?property_type=duplex&listing_type=sale' },
      { label: 'Row Houses in Vizag', href: '/search?property_type=row_house&listing_type=sale' },
      { label: 'Beach Villas in Vizag', href: '/villas-in-vizag' },
      { label: 'Luxury Villas in Vizag', href: '/villas-in-vizag' },
      { label: 'Villas in Rushikonda', href: '/search?locality=rushikonda&property_type=villa' },
      { label: 'Villas in Yendada', href: '/yendada' },
      { label: 'Villas in Bheemunipatnam', href: '/search?locality=bheemunipatnam&property_type=villa' },
      { label: 'Villas in Madhurawada', href: '/madhurawada' },
      { label: 'Villas Near Beach Road', href: '/search?locality=beach-road&property_type=villa' },
    ],
  },
  {
    title: 'Property by Area / Locality',
    links: [
      { label: 'Property in Madhurawada', href: '/madhurawada' },
      { label: 'Property in Yendada', href: '/yendada' },
      { label: 'Property in MVP Colony', href: '/mvp-colony' },
      { label: 'Property in PM Palem', href: '/pm-palem' },
      { label: 'Property in Gajuwaka', href: '/gajuwaka' },
      { label: 'Property in Rushikonda', href: '/search?locality=rushikonda&listing_type=sale' },
      { label: 'Property in Bheemunipatnam', href: '/search?locality=bheemunipatnam&listing_type=sale' },
      { label: 'Property in Seethammadhara', href: '/search?locality=seethammadhara&listing_type=sale' },
      { label: 'Property in Kommadi', href: '/search?locality=kommadi&listing_type=sale' },
      { label: 'Property in Waltair', href: '/search?locality=waltair&listing_type=sale' },
      { label: 'Property in Dwaraka Nagar', href: '/search?locality=dwaraka-nagar&listing_type=sale' },
      { label: 'Property in Pendurthi', href: '/search?locality=pendurthi&listing_type=sale' },
      { label: 'Property in Tagarapuvalasa', href: '/search?locality=tagarapuvalasa&listing_type=sale' },
      { label: 'Property in Atchutapuram', href: '/search?locality=atchutapuram&listing_type=sale' },
      { label: 'Property in Gopalapatnam', href: '/search?locality=gopalapatnam&listing_type=sale' },
      { label: 'Property in Marripalem', href: '/search?locality=marripalem&listing_type=sale' },
      { label: 'Property in Ukkunagaram', href: '/search?locality=ukkunagaram&listing_type=sale' },
      { label: 'Property in NAD Junction', href: '/search?locality=nad-junction&listing_type=sale' },
    ],
  },
  {
    title: 'Commercial Property',
    links: [
      { label: 'Commercial Property in Vizag', href: '/search?category=commercial&listing_type=sale' },
      { label: 'Commercial Property in Visakhapatnam', href: '/search?category=commercial&listing_type=sale' },
      { label: 'Office Space in Vizag', href: '/search?property_type=office&listing_type=sale' },
      { label: 'Shop for Sale in Vizag', href: '/search?property_type=shop&listing_type=sale' },
      { label: 'Warehouse in Vizag', href: '/search?property_type=warehouse&listing_type=sale' },
      { label: 'Industrial Land in Vizag', href: '/search?category=commercial&property_type=industrial' },
      { label: 'Showroom for Sale in Vizag', href: '/search?property_type=showroom&listing_type=sale' },
      { label: 'Commercial Land in Vizag', href: '/search?category=commercial&property_type=plot' },
    ],
  },
]

const rentGroups: KeywordGroup[] = [
  {
    title: 'Popular Rental Searches',
    links: [
      { label: 'Property for Rent in Vizag', href: '/search?listing_type=rent' },
      { label: 'Property for Rent in Visakhapatnam', href: '/search?listing_type=rent' },
      { label: 'Flats for Rent in Vizag', href: '/flats-for-rent-vizag' },
      { label: 'Flats for Rent in Visakhapatnam', href: '/flats-for-rent-vizag' },
      { label: 'House for Rent in Vizag', href: '/search?property_type=house&listing_type=rent' },
      { label: 'PG in Vizag', href: '/pg-hostels-in-vizag' },
      { label: 'Hostel in Vizag', href: '/pg-hostels-in-vizag' },
      { label: 'PG Accommodation in Visakhapatnam', href: '/pg-hostels-in-vizag' },
      { label: 'Furnished Flats in Vizag', href: '/search?listing_type=rent' },
      { label: 'Bachelor Accommodation Vizag', href: '/pg-hostels-in-vizag' },
      { label: 'Student Accommodation Vizag', href: '/pg-hostels-in-vizag' },
    ],
  },
  {
    title: 'Flats for Rent by BHK',
    links: [
      { label: '1 BHK for Rent in Vizag', href: '/search?property_type=1bhk&listing_type=rent' },
      { label: '2 BHK for Rent in Vizag', href: '/search?property_type=2bhk&listing_type=rent' },
      { label: '3 BHK for Rent in Vizag', href: '/search?property_type=3bhk&listing_type=rent' },
      { label: '4 BHK for Rent in Vizag', href: '/search?property_type=4bhk&listing_type=rent' },
      { label: '1 BHK for Rent in Visakhapatnam', href: '/search?property_type=1bhk&listing_type=rent' },
      { label: '2 BHK for Rent in Visakhapatnam', href: '/search?property_type=2bhk&listing_type=rent' },
      { label: '3 BHK for Rent in Visakhapatnam', href: '/search?property_type=3bhk&listing_type=rent' },
      { label: 'Studio Apartments for Rent Vizag', href: '/search?listing_type=rent' },
    ],
  },
  {
    title: 'Flats for Rent by Locality',
    links: [
      { label: 'Flats for Rent in Madhurawada', href: '/search?locality=madhurawada&listing_type=rent' },
      { label: 'Flats for Rent in MVP Colony', href: '/search?locality=mvp-colony&listing_type=rent' },
      { label: 'Flats for Rent in Yendada', href: '/search?locality=yendada&listing_type=rent' },
      { label: 'Flats for Rent in Seethammadhara', href: '/search?locality=seethammadhara&listing_type=rent' },
      { label: 'Flats for Rent in Waltair', href: '/search?locality=waltair&listing_type=rent' },
      { label: 'Flats for Rent in Gajuwaka', href: '/search?locality=gajuwaka&listing_type=rent' },
      { label: 'Flats for Rent in PM Palem', href: '/search?locality=pm-palem&listing_type=rent' },
      { label: 'Flats for Rent in Rushikonda', href: '/search?locality=rushikonda&listing_type=rent' },
      { label: 'Flats for Rent in Dwaraka Nagar', href: '/search?locality=dwaraka-nagar&listing_type=rent' },
      { label: 'Flats for Rent in Pendurthi', href: '/search?locality=pendurthi&listing_type=rent' },
      { label: 'Flats for Rent in Kommadi', href: '/search?locality=kommadi&listing_type=rent' },
      { label: 'Flats for Rent in Siripuram', href: '/search?locality=siripuram&listing_type=rent' },
    ],
  },
  {
    title: 'Office / Commercial for Rent',
    links: [
      { label: 'Office Space for Rent in Vizag', href: '/search?property_type=office&listing_type=rent' },
      { label: 'Shop for Rent in Vizag', href: '/search?property_type=shop&listing_type=rent' },
      { label: 'Warehouse for Rent in Vizag', href: '/search?property_type=warehouse&listing_type=rent' },
      { label: 'Showroom for Rent in Vizag', href: '/search?property_type=showroom&listing_type=rent' },
      { label: 'Commercial Space in Visakhapatnam', href: '/search?category=commercial&listing_type=rent' },
    ],
  },
]

export function SeoKeywordsSection() {
  const [activeTab, setActiveTab] = useState<Tab>('buy')
  const groups = activeTab === 'buy' ? buyGroups : rentGroups

  return (
    <section className="bg-gray-50 border-t border-gray-200 py-10 px-4">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <h2 className="text-xl font-bold text-gray-800 mb-1">
          Property Options in Vizag &amp; Visakhapatnam
        </h2>
        <div className="w-16 h-1 bg-primary-600 rounded mb-4" />

        {/* Buy / Rent Tabs */}
        <div className="flex gap-0 border-b border-gray-300 mb-6">
          <button
            onClick={() => setActiveTab('buy')}
            className={`px-6 py-2.5 text-sm font-semibold border-b-2 transition-colors ${
              activeTab === 'buy'
                ? 'border-primary-600 text-primary-700'
                : 'border-transparent text-gray-500 hover:text-gray-700'
            }`}
          >
            Buy
          </button>
          <button
            onClick={() => setActiveTab('rent')}
            className={`px-6 py-2.5 text-sm font-semibold border-b-2 transition-colors ${
              activeTab === 'rent'
                ? 'border-primary-600 text-primary-700'
                : 'border-transparent text-gray-500 hover:text-gray-700'
            }`}
          >
            Rent
          </button>
        </div>

        {/* Keyword Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-x-8 gap-y-6">
          {groups.map((group) => (
            <div key={group.title}>
              <h3 className="text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">
                {group.title}
              </h3>
              <ul className="space-y-1">
                {group.links.map((link) => (
                  <li key={link.label}>
                    <Link
                      to={link.href}
                      className="text-sm text-blue-700 hover:text-blue-900 hover:underline transition-colors"
                    >
                      {link.label}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        {/* Bottom note */}
        <p className="mt-8 text-xs text-gray-400 text-center">
          © VizagProperty.co.in — Trusted Visakhapatnam Real Estate Platform
        </p>
      </div>
    </section>
  )
}
